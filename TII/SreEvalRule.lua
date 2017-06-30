TemperatureControl = {}

function TemperatureControl.init()  
	local index = 1
	local nbRules = engine.getRuleParameter("NumberOfRules");      -- number of rules that must be generated  
	TemperatureControl.MaxTemperature = 1 
	TemperatureControl.MinTemperature = 40 
	TemperatureControl.query = {}
	TemperatureControl.cities = {"Grenoble", "Paris", "NewYork"}
	
	for i =1, 3 do
		for j=1, 10 do	
			for k=1, 3 do
				loc = "@loc:" .. TemperatureControl.cities[i] .. " and @loc:Floor" .. tostring(j) .. " and @loc:Room" .. tostring(k)
				TemperatureControl.query[index] = "Subscribe variable "..loc.." and usage:Temperature with value <" .. TemperatureControl.MinTemperature .. " or value > " .. TemperatureControl.MaxTemperature
				index = index + 1				
			end
		end
	end
	
	while nbRules > 0 do
		for i=1, math.min(nbRules, #TemperatureControl.query) do
			engine.query(TemperatureControl.query[i], "TemperatureControl", "Control", i)
			nbRules = nbRules - 1;
			if nbRules == 0 then
				break;
			end
		end
	end
end

--[[

The lines 11 - 19 generate a list of semantic queries to subscribe events on temperature sensors on different locations (90 in total).
The generated queries look like :
	Subscribe variable usage:Temperature and @loc:CityX and @loc:FloorY and @loc:RoomZ   
They use inference to target every room in our topology without having to use the static name of every room.

The lines 21-29 execute the generated queries to create the needed number of rules defined by 'nbRules'
The created rules monitor their corresponding temperature sensors, and whenever an event happens they execute the 'TemperatureControl.Control()' function. 
For our tests, we generate automatically events on the all monitored temperature sensors on predefined intervals (1ms, 10ms, 11ms, ...)
Then, we store the latency of each rule which is the time between the event happening and the call of 'TemperatureControl.Control()' by that rule.

Note that this script can be optimized by creating one single rule to manage the temperature in all buildings. To do that, we replace the lines 11 - 29 by:
	engine.query("Subscribe variable usage:Temperature","TemperatureControl", "Control");
]]



function TemperatureControl.Control(sensors, index)  
	local tempSensor		-- reference to the temperature sensor
	local location			-- will store the location of the temperature sensor
	local currentTemp		-- stores the temperature measurement
	local airconditionner	-- contains the air conditionner located nearby the temperature sensor
	local heater			-- contains the heater located nearby the temperature sensor
	local airconditionnerCurrentValue
	local heaterCurrentValue
	
	if (#sensors > 0) then 
		for i = 1, #sensors, 1 do 
			tempSensor = sensors[i]
			
			-- save the timestamp for the current sensor and rule
			engine.saveTimestampCall(tempSensor, index)	
			
			-- get the location of the current temperature sensor
			location = engine.getObjectTag(tempSensor, "loc")
			
			-- get the value of the temperature sensor
			currentTemp = engine.getCapability(tempSensor)

			-- Find the heater and air conditionner located nearby the current temperature sensor
			local airconditionner_query = "Search variable usage:AirConditionner and loc:".. location
			local heater_query = "Search variable usage:Heater and loc:".. location
			airconditionner = engine.query(airconditionner_query)[1]    
			heater = engine.query(heater_query)[1]						
			
			-- Switch On/Off the corresponding air conditionner 
			if currentTemp > TemperatureControl.MaxTemperature then					
				engine.setCapability(airconditionner, true) 	
			else
				engine.setCapability(airconditionner, false) 	
			end
			
			-- Switch on/Off the corresponding heater
			if currentTemp < TemperatureControl.MinTemperature then					
				engine.setCapability(heater, true) 
			else
				engine.setCapability(heater, false) 
			end
			
		end
	end
end

function TemperatureControl.info()  
	info = 'Stress test for SRE.\n'
	return info
end


function TemperatureControl.finalize()  
	print("Good bye!")
end
