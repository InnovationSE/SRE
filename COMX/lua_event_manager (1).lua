lua_event_manager = {}

lua_event_manager.tableOfDevices = {}
lua_event_manager.tableOfOptimized = {}

function lua_event_manager.init()
	engine.log('info', '[lua_event_manager.init] Start EVENT MANAGER')
	eventDevices = lua_event_spec.getEventDevices()
	for deviceType, params in pairs(eventDevices) do
		engine.log('info', '[lua_event_manager.init] Start Subscription of '..deviceType)
		lua_event_manager.subscribe('@existType['..deviceType..']', 'lua_event_manager', 'onNewDevice')	
	end
end

function lua_event_manager.info()
	return 'FIO Rule Manager'
end

function lua_event_manager.subscribe(...)
	engine.subscribe(lua_event_manager, ...) 
end

function lua_event_manager.unsubscribe(...)
	engine.unsubscribe(lua_event_manager, ...) 
end

function lua_event_manager.onNewDevice(deviceId, deviceType, created)
	engine.log('info', '[lua_event_manager.onNewDevice] deviceType: ', deviceType)
	
	if created then
		engine.log('info', '[lua_event_manager.onNewDevice] deviceId: ', deviceId, ' is available')
		lua_event_manager.tableOfDevices[deviceId] = deviceType
		lua_event_manager.subscribeMeasurements(deviceId, deviceType)
	else
		engine.log('info', '[lua_event_manager.onNewDevice] deviceId: ', deviceId, ' is gone')
		lua_event_manager.tableOfDevices[deviceId] = nil
		lua_event_manager.unsubscribeDevice(deviceId, deviceType)
	end
	
end

function lua_event_manager.onChangeValue(deviceId, capability, deviceType)
	engine.log('debug', '[lua_event_manager.onChangeValue] Device: '.. deviceId, ' is available')
	engine.log('debug', '[lua_event_manager.onChangeValue] Device Type: '.. deviceType, ' is available')
	engine.log('debug', '[lua_event_manager.onChangeValue] Capability: '.. capability, ' is available')
	engine.log('debug', '[lua_event_manager.onChangeValue] Value: '.. engine.getMeasurementValue(deviceId,capability))

	--  OPTIMISATION PART --
	for measurementOpt  in pairs(lua_event_manager.tableOfOptimized) do
		if measurementOpt == capability then
			for i,measurement in pairs(lua_event_manager.tableOfOptimized[measurementOpt]) do
				engine.getMeasurementValue(deviceId,measurement)
			end
		end

	end

	engine.sendEvent(lua_event_manager.generateEvent(deviceId,deviceType,capability,"false"))
end

function lua_event_manager.subscribeMeasurements(deviceId, deviceType) 
	measurements = lua_event_spec.getMeasurements(deviceType)
	for capability, param in pairs(measurements) do
		--  INIT EVENT --
		engine.sendEvent(lua_event_manager.generateEvent(deviceId,deviceType,capability,"true"))
		engine.log('info', '[lua_event_manager.subscribeMeasurements] Start subscription of '..capability)

		--   OPTIMIZATION PART --
		tableOM = lua_event_spec.getOptimizedMeasurement(deviceType,capability)
		if tableOM ~= nil then
			for i,measurement in pairs(tableOM) do				
				if lua_event_manager.tableOfOptimized[measurement] == nil then 
					lua_event_manager.tableOfOptimized[measurement] = {}
				end
				table.insert(lua_event_manager.tableOfOptimized[measurement],capability)
			end
		end

		pollingPeriod = lua_event_spec.getPollingPeriod(deviceType,capability)
		lua_event_manager.subscribe('@change[' .. deviceId .. ']'..capability, 'lua_event_manager', 'onChangeValue', deviceId, capability, deviceType,pollingPeriod)
	end

end

function lua_event_manager.generateEvent(deviceId,deviceType,capability,initEvent)
	engine.log('info', '[lua_event_manager.generateEvent] '..capability)
	event = {}
	event['deviceId'] = deviceId
	event['deviceType'] = deviceType
	event['measurementId'] = capability
	event['value'] = engine.getMeasurementValue(deviceId,capability)
	event['severity']=lua_event_spec.getSeverity(deviceType,capability)
	event['deliveryPriority']=lua_event_spec.getDeliveryPriority(deviceType,capability)
	event['complexity']=lua_event_spec.getComplexity(deviceType,capability)	
	event['eventType']=lua_event_spec.getEventType(deviceType,capability)	
	if event['complexity'] == "complex" then
		contextValue = {}
		for i,measurement in pairs(lua_event_spec.getContext(deviceType,capability)) do
			value = nil
			value = engine.getMeasurementValue(deviceId,measurement)
			contextValue[measurement]=value
		end
		event['context']=contextValue
	end
	event['initEvent']=initEvent

	return event
end

function lua_event_manager.unsubscribeMeasurements(deviceId, deviceType) 
	measurements = lua_event_spec.getMeasurements(deviceType)
	for measurement in pairs(measurements) do
		engine.log('info', '[lua_event_manager.unsubscribeMeasurements] Stop subscription of '..measurement)
		lua_event_manager.unsubscribe('@change[' .. deviceId .. ']'..measurement, 'lua_event_manager', 'onChangeValue', deviceId, measurement, deviceType)
	end
end

function lua_event_manager.finalize()
	engine.log('info', '[lua_event_manager.finalize] Stop EVENT MANAGER')
	
	eventDevices = lua_event_spec.getEventDevices()
	for deviceType, params in pairs(eventDevices) do
		engine.log('info', '[lua_event_manager.finalize] Stop Subscription of '..deviceType)
		lua_event_manager.unsubscribe('@existType['..deviceType..']')	
	end

	for deviceId, deviceType in pairs(lua_event_manager.tableOfDevices) do
		lua_event_manager.unsubscribeMeasurements(deviceId, deviceType) 
	end
end