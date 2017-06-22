TEST_ENGINE_API_log = {}

function TEST_ENGINE_API_log.init()
	print('Start Log Sample')
	TEST_ENGINE_API_log.logEachLevel()
	TEST_ENGINE_API_log.logMessage()
	TEST_ENGINE_API_log.testReturn()
end

function TEST_ENGINE_API_log.info()
	return 'Log sample'
end

function TEST_ENGINE_API_log.logEachLevel()
	engine.log('debug', 'This is a log with level debug')
	engine.log('info',  'This is a log with info debug')
	engine.log('warn',  'This is a log with warn debug')
	engine.log('error', 'This is a log with error debug')
end

function TEST_ENGINE_API_log.logMessage()
	engine.log('debug', 1)
	engine.log('info',  2)
	engine.log('warn',  3)
	engine.log('error', 4)
	engine.log('debug', nil)
	engine.log('info',  nil)
	engine.log('warn',  nil)
	engine.log('error', nil)
end

function TEST_ENGINE_API_log.testReturn()
	ok = true

	result = engine.log('debug', 1)
	if result ~= 0 then
		ok = false
		print('Bad return for engine.log: 1')
	end

	result = engine.log('debg', 1)
	if result ~= -1 then
		ok = false
		engine.log('error', 'Bad return for engine.log: 0')
	end

	result = engine.log(nil, 1)
	if result ~= -1 then
		ok = false
		engine.log('error', 'Bad return for engine.log: nil')
	end

	if ok == true then
		engine.log('info', 'TEST_ENGINE_API_log.testReturn successful') 
	end

end

function TEST_ENGINE_API_log.finalize()
	print('Stop Log Sample')
end