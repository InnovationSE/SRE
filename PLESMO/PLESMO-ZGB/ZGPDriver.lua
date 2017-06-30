
ZGPDriver = {} 

function ZGPDriver.init() 
end


function ZGPDriver.info()
	info = 'Functionality to send instructions via the ZGPDriver'
	return info
end

function ZGPDriver.finalize()
	print( 'Script ZGPDriver removed' )
end

function ZGPDriver.start()
			
end

function ZGPDriver.stop()
			
end

function ZGPDriver.setRemoteChannel()
			
end

function ZGPDriver.getChannel()
			
end

function ZGPDriver.zgpSendCommand(commandID, sourceID, data)
engine.zgpSendCommand(commandID, sourceID, data)
print('Managed to call function from ZGP Driver! Channel is '..engine.zgpGetChannel())
end

function ZGPDriver.handleData(zgpType, sourceId, data, rssi)
	if (data == nil) then
	--	print('The zgp data is' ..zgpType.. sourceId.. rssi)
	else
	--	print('The zgp data is' ..zgpType.. sourceId.. data.. rssi)
	end


end

function ZGPDriver.toggleLight1(ZGPDriverId)
	print( 'Light 1 toggled for '.. ZGPDriverId )
		
end



function ZGPDriver.toggleLight2(ZGPDriverId)
	print( 'Light 2 toggled for '.. ZGPDriverId )
		
end









