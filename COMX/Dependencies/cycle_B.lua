 
cycle_B = {} -- Define table with same name as file

cycle_B.b=5;

function cycle_B.init() 
	engine.log('debug', 'Script B')   
end

function cycle_B.callAToB() 
	engine.log('debug', 'Script A called by B')   
end

-- Mon script
function cycle_B.finalize()
	engine.log('debug', 'FINALIZE B')   
	cycle_C.callBToC() 
end

function cycle_B.info()
	--This function is called when attempting to load another file with the same name
	info = 'Scrit B with cycle'
	return info
end
