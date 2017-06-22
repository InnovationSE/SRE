test_1 = {}

function test_1.init() 
	print( 'Script test_1 initialized' )
	test_1.test()
end

function test_1.test()
	print( 'Function test called' )	
end


function test_1.info()
	info = 'Gets the average active energy consumption for all devices'
	print(info)
	return info
end

function test_1.finalize()
	print( 'Script test_1 removed' )
end
