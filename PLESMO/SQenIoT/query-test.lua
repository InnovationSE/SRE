
AvgStallManPower = {} -- Define table with same name as file

function AvgStallManPower.init() 
	AvgStallManPower.avg = 0;
	AvgStallManPower.count = 0;

	AvgStallManPower.resources = {engine.query('Search Device usage:Power')}

	if #AvgStallManPower.resources ~= 0 then	
		print('nrofRes', #AvgStallManPower.resources)
		AvgStallManPower.checkPower()
	end
end

function AvgStallManPower.checkPower()
	--Calculate sum
	for i=1, #AvgStallManPower.resources do
			AvgStallManPower.avg = AvgStallManPower.avg +engine.getMeasurementValue(AvgStallManPower.resources[i], 'WHr');
	end	

	AvgStallManPower.count = AvgStallManPower.count +1;
	
	--Calculate average
	if(AvgStallManPower.count > 0) then
	AvgStallManPower.avg = AvgStallManPower.avg/(AvgStallManPower.count * #AvgStallManPower.resources);
		local message = 'ActiveEnergy Calculated AVG is: '.. AvgStallManPower.avg .. ' Wh for: '.. #AvgStallManPower.resources .. ' Resources'
		print(message);	
	end

	AvgStallManPower.testAvg = {engine.query('AVG Variable PDM:ActiveEnergy with unit == Wh')};
	print('avg semantic query ' .. AvgStallManPower.testAvg[1]);
	if(AvgStallManPower.testAvg[1] == AvgStallManPower.avg) then
	print('Semantic Aggregation and Calucated avg are correct')
	else 	print('Semantic Aggregation and Calucated avg are NOT correct')
	end

	--Reset variables
	AvgStallManPower.count = 0
	AvgStallManPower.avg = 0
end


function AvgStallManPower.info()
	info = 'Gets the average active energy consumption for all devices'
	--print(info)
	return info
end

function AvgStallManPower.finalize()
	print( 'Script AvgStallManPower removed' )
end
