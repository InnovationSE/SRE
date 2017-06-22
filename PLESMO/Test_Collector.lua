
Test_Collector = {} -- Define table with same name as file

function Test_Collector.init()

Rule.collect('Test_Collector', 'Resource-1', 'Resource-1.Hz' , '*/1 8-20 * * *')

end

-- Delegate function to simplify syntax 
function Test_Collector.query(...)	
	return Rule.query('Test_Collector', ...) 	
end


function Test_Collector.info()
	info = 'Test to Publish Topology and measurments to RSP !'
	return info
end

function Test_Collector.finalize()
	print( 'Script Test_Collector removed' )
end









