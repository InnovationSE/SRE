test_2 = {}

function test_2.init() 
	print( 'Script test_2 initialized' )
	test_1.test()
end

function test_2.info()
	info = 'Gets the average active energy consumption for all devices'
	print(info)
	return info
end

function test_2.finalize()
	print( 'Script test_2 removed' )
end
