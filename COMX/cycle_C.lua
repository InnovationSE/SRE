 
cycle_C = {} -- Define table with same name as file

cycle_C.a=5;

function cycle_C.init() 
	engine.log('debug', 'Script C')   
	cycle_A.callCToA() 
end

function cycle_C.callBToC() 
	engine.log('debug', 'Script B called by C')   
end

-- Mon script
function cycle_C.finalize()
	engine.log('debug', 'FINALIZE C')   
end

function cycle_C.info()
	--This function is called when attempting to load another file with the same name
	info = 'Script C'
	return info
end
