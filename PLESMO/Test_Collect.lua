
Test_Collect = {} -- Define table with same name as file

function Test_Collect.init()

--local items = {'Resource-1', 'Resource-2', 'Resource-3', 'Resource-4'}
--print( items[3] )  -- output: "Resource-3"
--Rule.publish('Test_Publish', items, 'IA', 5, 10)

--local resourceIdsList ={Test_Publish.query('Search Device usage:Energy with value < 12000 and with value > 0')}
--Rule.publish('Test_Publish', resourceIdsList, 'IA', 5, 10)

--local resourceIdsList ={Test_Publish.query('Search Device usage:Energy with value > 12000')}
--Rule.publish('Test_Publish', resourceIdsList, 'IA', 5, 10)

--Rule.collect('Test_Publish', 'Resource-1', nil , '*/1 8-20 * * *')
-- Rule.collect('Test_Publish', 'Resource-1', 'Resource-1.IA' , '*/1 8-20 * * *')
Rule.collect('Test_Collect', 'Resource-1', 'Resource-1.WHr' , '*/1 8-20 * * *')

end
--Rule.publish('Test_Publish', 'Resource-1', 'IA', 5, 10)

-- Delegate function to simplify syntax 
function Test_Collect.query(...)	
	return Rule.query('Test_Collect', ...) 	
end


function Test_Collect.info()
	info = 'Test to Publish Topology and measurments to RSP !'
	return info
end

function Test_Collect.finalize()
	print( 'Script Test_Collect removed' )
end









