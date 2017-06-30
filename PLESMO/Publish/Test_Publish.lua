
Test_Publish = {} -- Define table with same name as file

function Test_Publish.init()

--local items = {'Resource-1', 'Resource-2', 'Resource-3', 'Resource-4'}
--print( items[3] )  -- output: "Resource-3"
--engine.publish('Test_Publish', items, 'IA', 5, 10)

--local resourceIdsList ={Test_Publish.query('Search Device usage:Energy with value < 12000 and with value > 0')}
--engine.publish('Test_Publish', resourceIdsList, 'IA', 5, 10)

--local resourceIdsList ={Test_Publish.query('Search Device usage:Energy with value > 12000')}
--engine.publish('Test_Publish', resourceIdsList, 'IA', 5, 10)

--engine.collect('Test_Publish', 'Resource-1', nil , '*/1 8-20 * * *')
-- engine.collect('Test_Publish', 'Resource-1', 'Resource-1.IA' , '*/1 8-20 * * *')
engine.collect('Test_Publish', 'Resource-1', 'Resource-1.IA' , '*/1 8-20 * * *')

end
--engine.publish('Test_Publish', 'Resource-1', 'IA', 5, 10)

-- Delegate function to simplify syntax 
function Test_Publish.query(...)	
	return engine.query('Test_Publish', ...) 	
end


function Test_Publish.info()
	info = 'Test to Publish Topology and measurments to RSP !'
	return info
end

function Test_Publish.finalize()
	print( 'Script Test_Publish removed' )
end









