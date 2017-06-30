StackLight1Q1 = {}

function StackLight1Q1.init()
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Stop, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Stop, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Stop, nil )
	
end

function StackLight1Q1.info()
	return 'Button registration for StackLight1 Q1 Stop (Switch to active state) and Q1 Start (Switch back to resolved state) Remove script afterwards '
end

function StackLight1Q1.finalize() 
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Start, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Start, nil )
	ZGPDriver.zgpSendCommand(34, StackLight1.Q1Start, nil )
	
end
