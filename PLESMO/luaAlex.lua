
luaAlex = {} -- Define table with same name as file

function luaAlex.init() 

print( 'Scrit Write in Modbus Register ')
Rule.setMeasurementValue('M258-1', 'customId_130_0', 1);
--x = Rule.getMeasurementValue('Resource-4', 'customId_StatusVert_3');
--print(x)
--Rule.setMeasurementValue('Resource-4', 'customId_131_1', 2);
end

function luaAlex.finalize()

print( 'Finalize ')


end



function luaAlex.info()
	--This function is called when attempting to load another file with the same name
	info = 'Scrit Write in Modbus Register'
	return info
end



