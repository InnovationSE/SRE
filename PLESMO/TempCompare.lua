
TempCompare = {} -- Define table with same name as file

function TempCompare.init() 
	
TempCompare.query('Subscribe Device usage:Temperature and  loc:Stallman with unit == C and with value > 22 every 00:00:10', 'TempCompare','compareTemperature')	
	
end

function TempCompare.compareTemperature(...)
	TempCompare.StallmanAvg = 0;
	TempCompare.FloorAvg = 0;
	
	--Get avg temp in Stallman
	 local argT = {n=select('#',...),...}
	-- arg.n is the real size
		for i = 1,argT.n do
			TempCompare.StallmanAvg = TempCompare.StallmanAvg +Rule.getMeasurementValue(argT[i], 'Temp');
		end
		
		--Stallman Average
		TempCompare.StallmanAvg = TempCompare.StallmanAvg / argT.n
		
		--All devices on Floor_1
		TempCompare.resources = {TempCompare.query('Search Device usage:Temperature and  @loc:T3')	}
		
		
		--Get avg temp on whole floor
			if #TempCompare.resources ~= 0 then	
				for i = 1, #TempCompare.resources do
					TempCompare.FloorAvg = TempCompare.FloorAvg +Rule.getMeasurementValue(TempCompare.resources[i], 'Temp');
				end
			TempCompare.FloorAvg = TempCompare.FloorAvg / #TempCompare.resources
			end		
		
	
		local message = 'Stallman temperature equal to: '..TempCompare.StallmanAvg.. ' deg C while average on floor is: '..TempCompare.FloorAvg..' deg C'
		RSP.sendAlarm('Multiple Resources', 'Temp', message)
	
	
		--Clear variables
		TempCompare.StallmanAvg = 0;
		TempCompare.FloorAvg = 0;
		TempCompare.resources = nil;

	
end

-- Delegate function to simplify syntax 
function TempCompare.query(...)	
	return Rule.query('TempCompare', ...) 	
end

-- Delegate function to simplify syntax 
function TempCompare.subscribe(...)	
	Rule.subscribe('TempCompare', ...) 	
end

-- Delegate function to simplify syntax 
function TempCompare.unSubscribe(...)	
	Rule.unSubscribe('TempCompare', ...) 	
end

function TempCompare.info()
	info = 'Compares Stallman lab temperature to surroundings if temperature is higher than 22 degrees'
	--print(info)
	return info
end

function TempCompare.finalize()
	print( 'Script TempCompare removed' )
end









