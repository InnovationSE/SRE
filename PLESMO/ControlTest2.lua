ControlTest2 = {}
ControlTest2.counter = 0

function ControlTest2.init()

Rule.timer('ControlTest2', 'changeLight', 0, 1, -5 )
end

function ControlTest2.info()
	return 'Rules for illuminating stacklight'
end


function ControlTest2.changeLight(...) 
	if ControlTest2.counter == 0 then 
	StackLight.setEconomic('StackLight1') 
	ControlTest2.counter = 1
	elseif ControlTest2.counter == 1 then 
	StackLight.setActive('StackLight1') 
	ControlTest2.counter = 2
	elseif ControlTest2.counter == 2 then 
	StackLight.setWarning('StackLight1') 
	ControlTest2.counter = 3
	elseif ControlTest2.counter == 3 then 
	StackLight.setOff('StackLight1') 
	ControlTest2.counter = 0	
	end 
	
end


function ControlTest2.query(...) 
	return Rule.query('ControlTest2',...) 
end

function ControlTest2.finalize() 
end
