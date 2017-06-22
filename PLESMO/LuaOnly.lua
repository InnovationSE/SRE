
LuaOnly = {} -- Define table with same name as file

function LuaOnly.init() 	
	LuaOnly.checkTemp()			
end

function LuaOnly.checkTemp()		
	--LuaOnly.temp = Rule.getMeasurementValue('Resource-1', 'Temp');			
	--if(LuaOnly.power ~= nil) then
	
	LuaOnly.avgTemp = LuaOnly.query('Avg variable usage:Temperature and @loc:Floor1  with unit == C')
	local message = 'Average temp is '..LuaOnly.avgTemp  .. ' C'
	
	--local message = 'Resource-1 Temp is: '..LuaOnly.power  .. ' Watt'
		
	RSP.sendAlarm('Resource-1', 'Temperature', message )
	
	
	
--end	
end

-- Delegate function to simplify syntax 
function LuaOnly.query(...)
	return Rule.query('LuaOnly', ...) 	
end

function LuaOnly.info()
	return 'Gets the instantaneous temperature value for Floor 1 '
end

function LuaOnly.finalize()
	print( 'Script LuaOnly stopped' )
end









