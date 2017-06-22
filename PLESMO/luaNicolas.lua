
luaNicolas = {} -- Define table with same name as file

function luaNicolas .init() 

print( 'Scrit Write in Modbus Register ')
x = Rule.getMeasurementValue('Resource-1', 'LT_PTOC1_OpCntRs');
print(x);
end

function luaNicolas .finalize()

print( 'Finalize ')


end



function luaNicolas .info()
	--This function is called when attempting to load another file with the same name
	info = 'Scrit Write in Modbus Register'
	return info
end



