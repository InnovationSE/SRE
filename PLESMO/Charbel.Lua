YourScript = {}
YourScript.counter = 0
function YourScript.init()
	SRE.subscribe('@incr[Resource-3] Temp = true', 'logIncreaseFunction') 
	SRE.subscribe('[Resource-3] Temp > 35', 'fireWarningFunction') 
	SRE.timer('YourScript', 'changeLight', 0, 1, -1 )
end

function YourScript.fireWarningFunction()
	currentTemperature = SRE.getVariableValue('Resource-3', 'Temp')
	SRE.sendRSPAlarm('Resource-3', 'Temp', currentTemperature .. ' reached warning threashold')
	resources = SRE.query('search Device usage:HVAC_Control and isLocatedIn:Room002')
	if #resources ~= 0 then	
		SRE.setVariableValue(resources[0], 'Temp_Threshold', 25);
	end
end

function YourScript.logIncreaseFunction()
	print( 'Temperature of Resource_3 Increased')
end

function YourScript.changeLight(...) 
	if YourScript.counter == 0 then 
	StackLight.setEconomic() 
	YourScript.counter = 1
	elseif YourScript.counter == 1 then 
	StackLight.setActive() 
	YourScript.counter = 0
	end 
end

function YourScript.info()
	return 'You script main purpose description'
end


function YourScript.finalize() 
	SRE.unsubscribe('@incr[Resource-3] Temp = true', 'logIncreaseFunction') 
	SRE.unsubscribe('[Resource-3] Temp > 35', 'fireWarningFunction') 
end
