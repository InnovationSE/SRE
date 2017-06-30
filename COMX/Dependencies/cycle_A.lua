 
cycle_A = {} -- Define table with same name as file

cycle_A.a=5;

function cycle_A.init() 
	engine.log('debug', 'Script A')   
	cycle_B.callAToB() 
end

function cycle_A.callCToA() 
	engine.log('debug', 'Script A called by C')   
end

-- Mon script
function cycle_A.finalize()
	engine.log('debug', 'FINALIZE A')   
end

function cycle_A.info()
	--This function is called when attempting to load another file with the same name
	info = 'Scrit A with cycle'
	return info
end
