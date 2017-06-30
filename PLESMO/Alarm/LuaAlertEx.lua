function init()

	subscribe('@decr[Resource-3] Temp = true', 'firewarning')

end

function fireWarning()

	currentTemperature = getMeasurement('[Resource-3]', 'Temp')
	if(currentTemperature > 42) 
		DSP.sendAlarm('Resource-3', 'Temp', currentTemperature)
end		

function info()
	return 'Script Subscribing to possible fire condition'
end	

function finalize()
	print('Fire Condition Script Removed')
end	
