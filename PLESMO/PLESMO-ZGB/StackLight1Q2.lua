StackLight1Q2 = {}

function StackLight1Q2.init()
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Stop, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Stop, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Stop, nil )
	
end

function StackLight1Q2.info()
	return 'Button registration for StackLight1 Q2 Stop (Switch to active state) and Q2 Start (Switch back to resolved state) Remove script afterwards '
end

function StackLight1Q2.finalize() 
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Start, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Start, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q2Start, nil )
	
end
