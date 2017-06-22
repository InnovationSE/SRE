cron = {}

cron.variable = 0

function cron.init() 
	engine.log('info', 'cron.variable= ' .. cron.variable)
	cron.test()
end

function cron.test()
	cron.variable = cron.variable + 1
end


function cron.info()
	info = 'Test for Cron increments a simple variable'
	print(info)
	return info
end

function cron.finalize()
	print( 'Script cron removed' )
	cron.variable = 0
end
