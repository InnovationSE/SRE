
AvgStallManPower = {} -- Define table with same name as file

function AvgStallManPower.init() 
	AvgStallManPower.avg = 0;
	AvgStallManPower.count = 0;
	AvgStallManPower.resources = {AvgStallManPower.query('search Device usage:Power')}
	
	if #AvgStallManPower.resources ~= 0 then	
		print('nrofRes', #AvgStallManPower.resources)
		--Rule.timer('AvgStallManPower', 'checkPower', 0, 1, 10 )
		 AvgStallManPower.checkPower()
	end
end

function AvgStallManPower.checkPower()
	--Calculate sum
	for i=1, #AvgStallManPower.resources do
			AvgStallManPower.avg = AvgStallManPower.avg +engine.getMeasurementValue(AvgStallManPower.resources[i], 'WTtl');
	end	

	AvgStallManPower.count = AvgStallManPower.count +1;
	
	--Calculate average and send to RSP
	if(AvgStallManPower.count == 10) then
		print('average is', AvgStallManPower.avg/(10 * #AvgStallManPower.resources))
		local message = 'Stallman avg Power for last 10sec was: '..AvgStallManPower.avg/(10 * #AvgStallManPower.resources) .. ' Watt for: '.. #AvgStallManPower.resources .. ' Resources'
		RSP.sendEvent('Multiple Resources', 'Power', message )	
		
		--Reset variables
		AvgStallManPower.avg = 0
		AvgStallManPower.count = 0
		AvgStallManPower.resources = nil;
	
	end
end

-- Delegate function to simplify syntax 
function AvgStallManPower.query(...)	
	return engine.query('AvgStallManPower', ...) 	
end

-- Delegate function to simplify syntax 
function AvgStallManPower.subscribe(...)	
	engine.subscribe('AvgStallManPower', ...) 	
end

-- Delegate function to simplify syntax 
function AvgStallManPower.unSubscribe(...)	
	engine.unSubscribe('AvgStallManPower', ...) 	
end

function AvgStallManPower.info()
	info = 'Gets the average power consumption for all devices in Stallman measured over 10 seconds'
	--print(info)
	return info
end

function AvgStallManPower.finalize()
	print( 'Script AvgStallManPower removed' )
end









