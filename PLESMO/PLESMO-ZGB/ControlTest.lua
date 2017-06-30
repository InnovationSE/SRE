ControlTest = {}

function ControlTest.init()
--ControlTest.subscribe('([Resource-0]Temp < 28 and [Resource-1]Temp < 28 )', 'StackLight', 'setOff', 'StackLight1' )
--ControlTest.subscribe('([Resource-0]Temp > 28 and [Resource-1]Temp < 28 )', 'StackLight', 'setActive', 'StackLight1' )
--ControlTest.subscribe('([Resource-0]Temp > 28 and [Resource-1]Temp > 28 )', 'StackLight', 'setWarning', 'StackLight1' )
--ControlTest.subscribe('([Resource-0]Temp < 28 and [Resource-1]Temp > 28 )', 'StackLight', 'setEconomic', 'StackLight1' )

ControlTest.subscribe('@dt0p34[Resource-15]WHr < 0.416666667', 'StackLight', 'setOff', 'StackLight1' )
ControlTest.subscribe('@dt0p34[Resource-15]WHr = 0.416666667', 'StackLight', 'setWarning', 'StackLight1' )

end

function ControlTest.info()
	return 'engines for illuminating stacklight'
end

function ControlTest.subscribe(...) 
	 return engine.subscribe('ControlTest',...) 
end


function ControlTest.query(...) 
	return engine.query('ControlTest',...) 
end

function ControlTest.finalize() 
end
