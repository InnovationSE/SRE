lua_event_spec = {}
lua_event_spec.tableOfDevices = {}
lua_event_spec.tableOfMeasurementsCompactNSX = {}
lua_event_spec.tableOfMeasurementsMasterpact = {}
dP='deliveryPriority'
sv='severity'
cpl='complexity'
cxt='context'
opt='optimized'
evtType='eventType'
pp='pollingPeriod'

function lua_event_spec.init()
    lua_event_spec.populateTableMeasurementsCompactNSX()
    lua_event_spec.populateTableMeasurementsMasterpact()
end

function lua_event_spec.info()
    return 'EventSpecifications'
end

function lua_event_spec.getEventDevices()
    if lua_event_spec.tableOfDevices ~= nil 
        then return lua_event_spec.tableOfDevices
    else 
        engine.log('error', '[lua_event_spec.getDevices] No Event Devices ')
    end
end

function lua_event_spec.getMeasurements(pdmType)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil 
        then return lua_event_spec.tableOfDevices[pdmType]
    else 
        engine.log('error', '[lua_event_spec.getMeasurement] This Device is not supported')
    end
end

function lua_event_spec.getOptimizedMeasurement(pdmType)
    tableOfOptimized = {}
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        tableMeasurements = lua_event_spec.tableOfDevices[pdmType]
        for id in pairs(tableMeasurements) do
            optim = getOptimizedMeasurement(pdmType,id)
            if optim ~= nil then
                tableOfOptimized[id]=optim
            end
        end
        return tableOfOptimized
    end
end

function lua_event_spec.getOptimizedMeasurement(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[opt] ~= nil then
                return param[opt]
            else
                engine.log('error', '[getOptimizedMeasurement] This OptimizedMeasurement is nil')
            end
        else
            engine.log('error', '[getOptimizedMeasurement] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[getOptimizedMeasurement] This Device is not supported')
    end
end

function lua_event_spec.getContext(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[cxt] ~= nil then
                return param[cxt]
            else
                engine.log('error', '[lua_event_spec.getContext] This Context is null')
            end
        else
            engine.log('error', '[lua_event_spec.getContext] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getContext] This Device are not supported')
    end
end

function lua_event_spec.getComplexity(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[cpl] ~= nil then
                return param[cpl]
            else
                engine.log('error', '[lua_event_spec.getContext] This Complexity is null')
            end
        else
            engine.log('error', '[lua_event_spec.getContext] This Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getContext] This Device is not supported')
    end
end

function lua_event_spec.getSeverity(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[sv] ~= nil then
                return param[sv]
            else
                engine.log('error', '[lua_event_spec.getSeverity] This Severity is nil')
            end
        else
            engine.log('error', '[lua_event_spec.getSeverity] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getSeverity] This Device is not supported')
    end
end

function lua_event_spec.getDeliveryPriority(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[dP] ~= nil then
                return param[dP]
            else
                engine.log('error', '[lua_event_spec.getDeliveryPriority] This DeliveryPriority is nil')
            end
        else
            engine.log('error', '[lua_event_spec.getDeliveryPriority] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getDeliveryPriority] This Device is not supported')
    end
end

function lua_event_spec.getEventType(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[evtType] ~= nil then
                return param[evtType]
            else
                engine.log('error', '[lua_event_spec.getEventType] This Event Type is nil')
            end
        else
            engine.log('error', '[lua_event_spec.getEventType] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getEventType] This Device is not supported')
    end
end

function lua_event_spec.getPollingPeriod(pdmType,capabilityName)
    if lua_event_spec.tableOfDevices[pdmType] ~= nil then
        measurements = lua_event_spec.tableOfDevices[pdmType]
        if measurements[capabilityName] ~= nil then
            param = measurements[capabilityName] 
            if param[pp] ~= nil then
                return param[pp]
            else
                engine.log('error', '[lua_event_spec.getPollingPeriod] This Polling Period is nil')
            end
        else
            engine.log('error', '[lua_event_spec.getPollingPeriod] Those Measurements are not supported')
        end
    else 
        engine.log('error', '[lua_event_spec.getPollingPeriod] This Device is not supported')
    end
end

function lua_event_spec.populateTableMeasurementsCompactNSX()
    LPHD1_ArtgParam = {}   
    LPHD1_ArtgParam[dP]='High'
    LPHD1_ArtgParam[sv]='None'
    LPHD1_ArtgParam[evtType]='None'
    LPHD1_ArtgParam[pp]=86400000
    LPHD1_ArtgParam[cpl]='simple'
    LPHD1_ArtgParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_Artg']= LPHD1_ArtgParam
    
    LT_PTOC2_StrValCoefParam = {}   
    LT_PTOC2_StrValCoefParam[dP]='High'
    LT_PTOC2_StrValCoefParam[sv]='None'
    LT_PTOC2_StrValCoefParam[evtType]='None'
    LT_PTOC2_StrValCoefParam[pp]=86400000
    LT_PTOC2_StrValCoefParam[cpl]='simple'
    LT_PTOC2_StrValCoefParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC2_StrValCoef']= LT_PTOC2_StrValCoefParam
    
    LT_PTOC1_ModParam = {}   
    LT_PTOC1_ModParam[dP]='High'
    LT_PTOC1_ModParam[sv]='None'
    LT_PTOC1_ModParam[evtType]='None'
    LT_PTOC1_ModParam[pp]=86400000
    LT_PTOC1_ModParam[cpl]='simple'
    LT_PTOC1_ModParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC1_Mod']= LT_PTOC1_ModParam
    
    LT_PTOC1_StrValParam = {}   
    LT_PTOC1_StrValParam[dP]='High'
    LT_PTOC1_StrValParam[sv]='None'
    LT_PTOC1_StrValParam[evtType]='None'
    LT_PTOC1_StrValParam[pp]=86400000
    LT_PTOC1_StrValParam[cpl]='simple'
    LT_PTOC1_StrValParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC1_StrVal']= LT_PTOC1_StrValParam
    
    LT_PTOC1_OpDlTmParam = {}   
    LT_PTOC1_OpDlTmParam[dP]='High'
    LT_PTOC1_OpDlTmParam[sv]='None'
    LT_PTOC1_OpDlTmParam[evtType]='None'
    LT_PTOC1_OpDlTmParam[pp]=86400000
    LT_PTOC1_OpDlTmParam[cpl]='simple'
    LT_PTOC1_OpDlTmParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC1_OpDlTm']= LT_PTOC1_OpDlTmParam
    
    ST_PTOC1_ModParam = {}   
    ST_PTOC1_ModParam[dP]='High'
    ST_PTOC1_ModParam[sv]='None'
    ST_PTOC1_ModParam[evtType]='None'
    ST_PTOC1_ModParam[pp]=86400000
    ST_PTOC1_ModParam[cpl]='simple'
    ST_PTOC1_ModParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_Mod']= ST_PTOC1_ModParam
    
    ST_PTOC1_CrvParam = {}   
    ST_PTOC1_CrvParam[dP]='High'
    ST_PTOC1_CrvParam[sv]='None'
    ST_PTOC1_CrvParam[evtType]='None'
    ST_PTOC1_CrvParam[pp]=86400000
    ST_PTOC1_CrvParam[cpl]='simple'
    ST_PTOC1_CrvParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_Crv']= ST_PTOC1_CrvParam
    
    ST_PTOC1_StrValParam = {}   
    ST_PTOC1_StrValParam[dP]='High'
    ST_PTOC1_StrValParam[sv]='None'
    ST_PTOC1_StrValParam[evtType]='None'
    ST_PTOC1_StrValParam[pp]=86400000
    ST_PTOC1_StrValParam[cpl]='simple'
    ST_PTOC1_StrValParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_StrVal']= ST_PTOC1_StrValParam
    
    ST_PTOC1_OpDlTmParam = {}   
    ST_PTOC1_OpDlTmParam[dP]='High'
    ST_PTOC1_OpDlTmParam[sv]='None'
    ST_PTOC1_OpDlTmParam[evtType]='None'
    ST_PTOC1_OpDlTmParam[pp]=86400000
    ST_PTOC1_OpDlTmParam[cpl]='simple'
    ST_PTOC1_OpDlTmParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_OpDlTm']= ST_PTOC1_OpDlTmParam
    
    PIOC1_ModParam = {}   
    PIOC1_ModParam[dP]='High'
    PIOC1_ModParam[sv]='None'
    PIOC1_ModParam[evtType]='None'
    PIOC1_ModParam[pp]=86400000
    PIOC1_ModParam[cpl]='simple'
    PIOC1_ModParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['PIOC1_Mod']= PIOC1_ModParam
    
    PIOC1_StrValParam = {}   
    PIOC1_StrValParam[dP]='High'
    PIOC1_StrValParam[sv]='None'
    PIOC1_StrValParam[evtType]='None'
    PIOC1_StrValParam[pp]=86400000
    PIOC1_StrValParam[cpl]='simple'
    PIOC1_StrValParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['PIOC1_StrVal']= PIOC1_StrValParam
    
    G_PTOC1_ModParam = {}   
    G_PTOC1_ModParam[dP]='High'
    G_PTOC1_ModParam[sv]='None'
    G_PTOC1_ModParam[evtType]='None'
    G_PTOC1_ModParam[pp]=86400000
    G_PTOC1_ModParam[cpl]='simple'
    G_PTOC1_ModParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_Mod']= G_PTOC1_ModParam
    
    G_PTOC1_CrvParam = {}   
    G_PTOC1_CrvParam[dP]='High'
    G_PTOC1_CrvParam[sv]='None'
    G_PTOC1_CrvParam[evtType]='None'
    G_PTOC1_CrvParam[pp]=86400000
    G_PTOC1_CrvParam[cpl]='simple'
    G_PTOC1_CrvParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_Crv']= G_PTOC1_CrvParam
    
    G_PTOC1_StrValParam = {}   
    G_PTOC1_StrValParam[dP]='High'
    G_PTOC1_StrValParam[sv]='None'
    G_PTOC1_StrValParam[evtType]='None'
    G_PTOC1_StrValParam[pp]=86400000
    G_PTOC1_StrValParam[cpl]='simple'
    G_PTOC1_StrValParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_StrVal']= G_PTOC1_StrValParam
    
    G_PTOC1_OpDlTmParam = {}   
    G_PTOC1_OpDlTmParam[dP]='High'
    G_PTOC1_OpDlTmParam[sv]='None'
    G_PTOC1_OpDlTmParam[evtType]='None'
    G_PTOC1_OpDlTmParam[pp]=86400000
    G_PTOC1_OpDlTmParam[cpl]='simple'
    G_PTOC1_OpDlTmParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_OpDlTm']= G_PTOC1_OpDlTmParam
    
    LPHD1_PolesNumParam = {}   
    LPHD1_PolesNumParam[dP]='Low'
    LPHD1_PolesNumParam[sv]='None'
    LPHD1_PolesNumParam[evtType]='None'
    LPHD1_PolesNumParam[pp]=86400000
    LPHD1_PolesNumParam[cpl]='simple'
    LPHD1_PolesNumParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_PolesNum']= LPHD1_PolesNumParam
    
    LPHD1_VRtgParam = {}   
    LPHD1_VRtgParam[dP]='Low'
    LPHD1_VRtgParam[sv]='None'
    LPHD1_VRtgParam[evtType]='None'
    LPHD1_VRtgParam[pp]=86400000
    LPHD1_VRtgParam[cpl]='simple'
    LPHD1_VRtgParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_VRtg']= LPHD1_VRtgParam
    
    LPHD1_ProtectionTypeParam = {}   
    LPHD1_ProtectionTypeParam[dP]='Low'
    LPHD1_ProtectionTypeParam[sv]='None'
    LPHD1_ProtectionTypeParam[evtType]='None'
    LPHD1_ProtectionTypeParam[pp]=86400000
    LPHD1_ProtectionTypeParam[cpl]='simple'
    LPHD1_ProtectionTypeParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_ProtectionType']= LPHD1_ProtectionTypeParam
    
    LPHD1_SerNumParam = {}   
    LPHD1_SerNumParam[dP]='Low'
    LPHD1_SerNumParam[sv]='None'
    LPHD1_SerNumParam[evtType]='None'
    LPHD1_SerNumParam[pp]=86400000
    LPHD1_SerNumParam[cpl]='simple'
    LPHD1_SerNumParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_SerNum']= LPHD1_SerNumParam
    
    LPHD1_FwRevParam = {}   
    LPHD1_FwRevParam[dP]='Low'
    LPHD1_FwRevParam[sv]='None'
    LPHD1_FwRevParam[evtType]='None'
    LPHD1_FwRevParam[pp]=86400000
    LPHD1_FwRevParam[cpl]='simple'
    LPHD1_FwRevParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_FwRev']= LPHD1_FwRevParam
    
    LPHD1_HwRevParam = {}   
    LPHD1_HwRevParam[dP]='Low'
    LPHD1_HwRevParam[sv]='None'
    LPHD1_HwRevParam[evtType]='None'
    LPHD1_HwRevParam[pp]=86400000
    LPHD1_HwRevParam[cpl]='simple'
    LPHD1_HwRevParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_HwRev']= LPHD1_HwRevParam
    
    LPHD1_MeteringTypeParam = {}   
    LPHD1_MeteringTypeParam[dP]='Low'
    LPHD1_MeteringTypeParam[sv]='None'
    LPHD1_MeteringTypeParam[evtType]='None'
    LPHD1_MeteringTypeParam[pp]=86400000
    LPHD1_MeteringTypeParam[cpl]='simple'
    LPHD1_MeteringTypeParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_MeteringType']= LPHD1_MeteringTypeParam
    
    LPHD1_ApplicationTypeParam = {}   
    LPHD1_ApplicationTypeParam[dP]='Low'
    LPHD1_ApplicationTypeParam[sv]='None'
    LPHD1_ApplicationTypeParam[evtType]='None'
    LPHD1_ApplicationTypeParam[pp]=86400000
    LPHD1_ApplicationTypeParam[cpl]='simple'
    LPHD1_ApplicationTypeParam[opt]={'Maint_GLOG1_EntryEvtDT',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_ApplicationType']= LPHD1_ApplicationTypeParam
    
    Maint_GLOG1_EntryEvtDTParam = {}   
    Maint_GLOG1_EntryEvtDTParam[dP]='High'
    Maint_GLOG1_EntryEvtDTParam[sv]='None'
    Maint_GLOG1_EntryEvtDTParam[evtType]='None'
    Maint_GLOG1_EntryEvtDTParam[pp]=60000
    Maint_GLOG1_EntryEvtDTParam[cpl]='simple'
    Maint_GLOG1_EntryEvtDTParam[opt]={}
    lua_event_spec.tableOfMeasurementsCompactNSX['Maint_GLOG1_EntryEvtDT']= Maint_GLOG1_EntryEvtDTParam
    
    SCBR1_AccAbrParam = {}   
    SCBR1_AccAbrParam[dP]='Low'
    SCBR1_AccAbrParam[sv]='None'
    SCBR1_AccAbrParam[evtType]='None'
    SCBR1_AccAbrParam[pp]=86400000
    SCBR1_AccAbrParam[cpl]='simple'
    SCBR1_AccAbrParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['SCBR1_AccAbr']= SCBR1_AccAbrParam
    
    XCBR1_CBClsPosCntParam = {}   
    XCBR1_CBClsPosCntParam[dP]='High'
    XCBR1_CBClsPosCntParam[sv]='None'
    XCBR1_CBClsPosCntParam[evtType]='None'
    XCBR1_CBClsPosCntParam[pp]=15000
    XCBR1_CBClsPosCntParam[cpl]='simple'
    XCBR1_CBClsPosCntParam[opt]={}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_CBClsPosCnt']= XCBR1_CBClsPosCntParam
    
    XCBR1_CBTripCntRsParam = {}   
    XCBR1_CBTripCntRsParam[dP]='High'
    XCBR1_CBTripCntRsParam[sv]='None'
    XCBR1_CBTripCntRsParam[evtType]='None'
    XCBR1_CBTripCntRsParam[pp]=15000
    XCBR1_CBTripCntRsParam[cpl]='simple'
    XCBR1_CBTripCntRsParam[opt]={}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_CBTripCntRs']= XCBR1_CBTripCntRsParam
    
    XCBR1_CBElecTripCntRsParam = {}   
    XCBR1_CBElecTripCntRsParam[dP]='High'
    XCBR1_CBElecTripCntRsParam[sv]='None'
    XCBR1_CBElecTripCntRsParam[evtType]='None'
    XCBR1_CBElecTripCntRsParam[pp]=86400000
    XCBR1_CBElecTripCntRsParam[cpl]='simple'
    XCBR1_CBElecTripCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_CBElecTripCntRs']= XCBR1_CBElecTripCntRsParam
    
    LT_PTOC1_OpCntRsParam = {}   
    LT_PTOC1_OpCntRsParam[dP]='High'
    LT_PTOC1_OpCntRsParam[sv]='None'
    LT_PTOC1_OpCntRsParam[evtType]='None'
    LT_PTOC1_OpCntRsParam[pp]=86400000
    LT_PTOC1_OpCntRsParam[cpl]='simple'
    LT_PTOC1_OpCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC1_OpCntRs']= LT_PTOC1_OpCntRsParam
    
    ST_PTOC1_OpCntRsParam = {}   
    ST_PTOC1_OpCntRsParam[dP]='High'
    ST_PTOC1_OpCntRsParam[sv]='None'
    ST_PTOC1_OpCntRsParam[evtType]='None'
    ST_PTOC1_OpCntRsParam[pp]=86400000
    ST_PTOC1_OpCntRsParam[cpl]='simple'
    ST_PTOC1_OpCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_OpCntRs']= ST_PTOC1_OpCntRsParam
    
    PIOC1_OpCntRsParam = {}   
    PIOC1_OpCntRsParam[dP]='High'
    PIOC1_OpCntRsParam[sv]='None'
    PIOC1_OpCntRsParam[evtType]='None'
    PIOC1_OpCntRsParam[pp]=86400000
    PIOC1_OpCntRsParam[cpl]='simple'
    PIOC1_OpCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['PIOC1_OpCntRs']= PIOC1_OpCntRsParam
    
    G_PTOC1_OpCntRsParam = {}   
    G_PTOC1_OpCntRsParam[dP]='High'
    G_PTOC1_OpCntRsParam[sv]='None'
    G_PTOC1_OpCntRsParam[evtType]='None'
    G_PTOC1_OpCntRsParam[pp]=86400000
    G_PTOC1_OpCntRsParam[cpl]='simple'
    G_PTOC1_OpCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_OpCntRs']= G_PTOC1_OpCntRsParam
    
    EF_PTOC1_OpCntRsParam = {}   
    EF_PTOC1_OpCntRsParam[dP]='High'
    EF_PTOC1_OpCntRsParam[sv]='None'
    EF_PTOC1_OpCntRsParam[evtType]='None'
    EF_PTOC1_OpCntRsParam[pp]=86400000
    EF_PTOC1_OpCntRsParam[cpl]='simple'
    EF_PTOC1_OpCntRsParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['EF_PTOC1_OpCntRs']= EF_PTOC1_OpCntRsParam
    
    XCBR1_PosParam = {}   
    XCBR1_PosParam[dP]='High'
    XCBR1_PosParam[sv]='None'
    XCBR1_PosParam[evtType]='None'
    XCBR1_PosParam[pp]=86400000
    XCBR1_PosParam[cpl]='simple'
    XCBR1_PosParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_Pos']= XCBR1_PosParam
    
    XCBR1_CBTripIndParam = {}   
    XCBR1_CBTripIndParam[dP]='High'
    XCBR1_CBTripIndParam[sv]='High'
    XCBR1_CBTripIndParam[evtType]='Boolean1'
    XCBR1_CBTripIndParam[pp]=86400000
    XCBR1_CBTripIndParam[cpl]='complex'
    XCBR1_CBTripIndParamContext= {}      
	XCBR1_CBTripIndParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd',} 
    XCBR1_CBTripIndParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_CBTripInd']= XCBR1_CBTripIndParam
    
    XCBR1_CBElecTripIndParam = {}   
    XCBR1_CBElecTripIndParam[dP]='High'
    XCBR1_CBElecTripIndParam[sv]='High'
    XCBR1_CBElecTripIndParam[evtType]='Boolean1'
    XCBR1_CBElecTripIndParam[pp]=86400000
    XCBR1_CBElecTripIndParam[cpl]='simple'
    XCBR1_CBElecTripIndParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['XCBR1_CBElecTripInd']= XCBR1_CBElecTripIndParam
    
    LT_PTOC1_OpParam = {}   
    LT_PTOC1_OpParam[dP]='High'
    LT_PTOC1_OpParam[sv]='High'
    LT_PTOC1_OpParam[evtType]='Boolean1'
    LT_PTOC1_OpParam[pp]=86400000
    LT_PTOC1_OpParam[cpl]='complex'
    LT_PTOC1_OpParamContext= {}      
	LT_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','LT_PTOC1_OpCntRs','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin','SCBR1_AccAbr',} 
    LT_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC1_Op']= LT_PTOC1_OpParam
    
    ST_PTOC1_OpParam = {}   
    ST_PTOC1_OpParam[dP]='High'
    ST_PTOC1_OpParam[sv]='High'
    ST_PTOC1_OpParam[evtType]='Boolean1'
    ST_PTOC1_OpParam[pp]=86400000
    ST_PTOC1_OpParam[cpl]='complex'
    ST_PTOC1_OpParamContext= {}      
	ST_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','ST_PTOC1_OpCntRs','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin','SCBR1_AccAbr',} 
    ST_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['ST_PTOC1_Op']= ST_PTOC1_OpParam
    
    PIOC1_OpParam = {}   
    PIOC1_OpParam[dP]='High'
    PIOC1_OpParam[sv]='High'
    PIOC1_OpParam[evtType]='Boolean1'
    PIOC1_OpParam[pp]=86400000
    PIOC1_OpParam[cpl]='complex'
    PIOC1_OpParamContext= {}      
	PIOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','PIOC1_OpCntRs','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin','SCBR1_AccAbr',} 
    PIOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['PIOC1_Op']= PIOC1_OpParam
    
    G_PTOC1_OpParam = {}   
    G_PTOC1_OpParam[dP]='High'
    G_PTOC1_OpParam[sv]='High'
    G_PTOC1_OpParam[evtType]='Boolean1'
    G_PTOC1_OpParam[pp]=86400000
    G_PTOC1_OpParam[cpl]='complex'
    G_PTOC1_OpParamContext= {}      
	G_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','G_PTOC1_OpCntRs','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin','SCBR1_AccAbr',} 
    G_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC1_Op']= G_PTOC1_OpParam
    
    EF_PTOC1_OpParam = {}   
    EF_PTOC1_OpParam[dP]='High'
    EF_PTOC1_OpParam[sv]='High'
    EF_PTOC1_OpParam[evtType]='Boolean1'
    EF_PTOC1_OpParam[pp]=86400000
    EF_PTOC1_OpParam[cpl]='complex'
    EF_PTOC1_OpParamContext= {}      
	EF_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','EF_PTOC1_OpCntRs','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin','SCBR1_AccAbr',} 
    EF_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['EF_PTOC1_Op']= EF_PTOC1_OpParam
    
    PIOC2_OpParam = {}   
    PIOC2_OpParam[dP]='High'
    PIOC2_OpParam[sv]='High'
    PIOC2_OpParam[evtType]='Boolean1'
    PIOC2_OpParam[pp]=86400000
    PIOC2_OpParam[cpl]='complex'
    PIOC2_OpParamContext= {}      
	PIOC2_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd','Trip_GLOG1_EntryTripSwA','Trip_GLOG1_EntryTripOrigin',} 
    PIOC2_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['PIOC2_Op']= PIOC2_OpParam
    
    LPHD1_TripUnitFailParam = {}   
    LPHD1_TripUnitFailParam[dP]='High'
    LPHD1_TripUnitFailParam[sv]='High'
    LPHD1_TripUnitFailParam[evtType]='Boolean1'
    LPHD1_TripUnitFailParam[pp]=86400000
    LPHD1_TripUnitFailParam[cpl]='simple'
    LPHD1_TripUnitFailParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['LPHD1_TripUnitFail']= LPHD1_TripUnitFailParam
    
    Trip_GLOG1_EntryTripSwAParam = {}   
    Trip_GLOG1_EntryTripSwAParam[dP]='High'
    Trip_GLOG1_EntryTripSwAParam[sv]='Low'
    Trip_GLOG1_EntryTripSwAParam[evtType]='None'
    Trip_GLOG1_EntryTripSwAParam[pp]=86400000
    Trip_GLOG1_EntryTripSwAParam[cpl]='simple'
    Trip_GLOG1_EntryTripSwAParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['Trip_GLOG1_EntryTripSwA']= Trip_GLOG1_EntryTripSwAParam
    
    Trip_GLOG1_EntryTripOriginParam = {}   
    Trip_GLOG1_EntryTripOriginParam[dP]='High'
    Trip_GLOG1_EntryTripOriginParam[sv]='Low'
    Trip_GLOG1_EntryTripOriginParam[evtType]='None'
    Trip_GLOG1_EntryTripOriginParam[pp]=86400000
    Trip_GLOG1_EntryTripOriginParam[cpl]='simple'
    Trip_GLOG1_EntryTripOriginParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsCompactNSX['Trip_GLOG1_EntryTripOrigin']= Trip_GLOG1_EntryTripOriginParam
    
    LT_PTOC2_OpParam = {}   
    LT_PTOC2_OpParam[dP]='High'
    LT_PTOC2_OpParam[sv]='Low'
    LT_PTOC2_OpParam[evtType]='Boolean1'
    LT_PTOC2_OpParam[pp]=30000
    LT_PTOC2_OpParam[cpl]='simple'
    LT_PTOC2_OpParam[opt]={}
    lua_event_spec.tableOfMeasurementsCompactNSX['LT_PTOC2_Op']= LT_PTOC2_OpParam
    
    G_PTOC2_OpParam = {}   
    G_PTOC2_OpParam[dP]='High'
    G_PTOC2_OpParam[sv]='Low'
    G_PTOC2_OpParam[evtType]='Boolean1'
    G_PTOC2_OpParam[pp]=30000
    G_PTOC2_OpParam[cpl]='simple'
    G_PTOC2_OpParam[opt]={}
    lua_event_spec.tableOfMeasurementsCompactNSX['G_PTOC2_Op']= G_PTOC2_OpParam
    
    lua_event_spec.tableOfDevices['Compact NSX A'] = lua_event_spec.tableOfMeasurementsCompactNSX
    lua_event_spec.tableOfDevices['Compact NSX E'] = lua_event_spec.tableOfMeasurementsCompactNSX
end
function lua_event_spec.populateTableMeasurementsMasterpact()
    LPHD1_ArtgParam = {}   
    LPHD1_ArtgParam[dP]='High'
    LPHD1_ArtgParam[sv]='None'
    LPHD1_ArtgParam[evtType]='None'
    LPHD1_ArtgParam[pp]=86400000
    LPHD1_ArtgParam[cpl]='simple'
    LPHD1_ArtgParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_Artg']= LPHD1_ArtgParam
    
    LT_PTOC1_ModParam = {}   
    LT_PTOC1_ModParam[dP]='High'
    LT_PTOC1_ModParam[sv]='None'
    LT_PTOC1_ModParam[evtType]='None'
    LT_PTOC1_ModParam[pp]=86400000
    LT_PTOC1_ModParam[cpl]='simple'
    LT_PTOC1_ModParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LT_PTOC1_Mod']= LT_PTOC1_ModParam
    
    LT_PTOC1_StrValParam = {}   
    LT_PTOC1_StrValParam[dP]='High'
    LT_PTOC1_StrValParam[sv]='None'
    LT_PTOC1_StrValParam[evtType]='None'
    LT_PTOC1_StrValParam[pp]=86400000
    LT_PTOC1_StrValParam[cpl]='simple'
    LT_PTOC1_StrValParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LT_PTOC1_StrVal']= LT_PTOC1_StrValParam
    
    LT_PTOC1_OpDlTmParam = {}   
    LT_PTOC1_OpDlTmParam[dP]='High'
    LT_PTOC1_OpDlTmParam[sv]='None'
    LT_PTOC1_OpDlTmParam[evtType]='None'
    LT_PTOC1_OpDlTmParam[pp]=86400000
    LT_PTOC1_OpDlTmParam[cpl]='simple'
    LT_PTOC1_OpDlTmParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LT_PTOC1_OpDlTm']= LT_PTOC1_OpDlTmParam
    
    ST_PTOC1_ModParam = {}   
    ST_PTOC1_ModParam[dP]='High'
    ST_PTOC1_ModParam[sv]='None'
    ST_PTOC1_ModParam[evtType]='None'
    ST_PTOC1_ModParam[pp]=86400000
    ST_PTOC1_ModParam[cpl]='simple'
    ST_PTOC1_ModParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['ST_PTOC1_Mod']= ST_PTOC1_ModParam
    
    ST_PTOC1_CrvParam = {}   
    ST_PTOC1_CrvParam[dP]='High'
    ST_PTOC1_CrvParam[sv]='None'
    ST_PTOC1_CrvParam[evtType]='None'
    ST_PTOC1_CrvParam[pp]=86400000
    ST_PTOC1_CrvParam[cpl]='simple'
    ST_PTOC1_CrvParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['ST_PTOC1_Crv']= ST_PTOC1_CrvParam
    
    ST_PTOC1_StrValParam = {}   
    ST_PTOC1_StrValParam[dP]='High'
    ST_PTOC1_StrValParam[sv]='None'
    ST_PTOC1_StrValParam[evtType]='None'
    ST_PTOC1_StrValParam[pp]=86400000
    ST_PTOC1_StrValParam[cpl]='simple'
    ST_PTOC1_StrValParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['ST_PTOC1_StrVal']= ST_PTOC1_StrValParam
    
    ST_PTOC1_OpDlTmParam = {}   
    ST_PTOC1_OpDlTmParam[dP]='High'
    ST_PTOC1_OpDlTmParam[sv]='None'
    ST_PTOC1_OpDlTmParam[evtType]='None'
    ST_PTOC1_OpDlTmParam[pp]=86400000
    ST_PTOC1_OpDlTmParam[cpl]='simple'
    ST_PTOC1_OpDlTmParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['ST_PTOC1_OpDlTm']= ST_PTOC1_OpDlTmParam
    
    PIOC1_ModParam = {}   
    PIOC1_ModParam[dP]='High'
    PIOC1_ModParam[sv]='None'
    PIOC1_ModParam[evtType]='None'
    PIOC1_ModParam[pp]=86400000
    PIOC1_ModParam[cpl]='simple'
    PIOC1_ModParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['PIOC1_Mod']= PIOC1_ModParam
    
    PIOC1_StrValParam = {}   
    PIOC1_StrValParam[dP]='High'
    PIOC1_StrValParam[sv]='None'
    PIOC1_StrValParam[evtType]='None'
    PIOC1_StrValParam[pp]=86400000
    PIOC1_StrValParam[cpl]='simple'
    PIOC1_StrValParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['PIOC1_StrVal']= PIOC1_StrValParam
    
    G_PTOC1_ModParam = {}   
    G_PTOC1_ModParam[dP]='High'
    G_PTOC1_ModParam[sv]='None'
    G_PTOC1_ModParam[evtType]='None'
    G_PTOC1_ModParam[pp]=86400000
    G_PTOC1_ModParam[cpl]='simple'
    G_PTOC1_ModParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['G_PTOC1_Mod']= G_PTOC1_ModParam
    
    G_PTOC1_CrvParam = {}   
    G_PTOC1_CrvParam[dP]='High'
    G_PTOC1_CrvParam[sv]='None'
    G_PTOC1_CrvParam[evtType]='None'
    G_PTOC1_CrvParam[pp]=86400000
    G_PTOC1_CrvParam[cpl]='simple'
    G_PTOC1_CrvParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['G_PTOC1_Crv']= G_PTOC1_CrvParam
    
    G_PTOC1_StrValParam = {}   
    G_PTOC1_StrValParam[dP]='High'
    G_PTOC1_StrValParam[sv]='None'
    G_PTOC1_StrValParam[evtType]='None'
    G_PTOC1_StrValParam[pp]=86400000
    G_PTOC1_StrValParam[cpl]='simple'
    G_PTOC1_StrValParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['G_PTOC1_StrVal']= G_PTOC1_StrValParam
    
    G_PTOC1_OpDlTmParam = {}   
    G_PTOC1_OpDlTmParam[dP]='High'
    G_PTOC1_OpDlTmParam[sv]='None'
    G_PTOC1_OpDlTmParam[evtType]='None'
    G_PTOC1_OpDlTmParam[pp]=86400000
    G_PTOC1_OpDlTmParam[cpl]='simple'
    G_PTOC1_OpDlTmParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['G_PTOC1_OpDlTm']= G_PTOC1_OpDlTmParam
    
    EF_PTOC1_ModParam = {}   
    EF_PTOC1_ModParam[dP]='High'
    EF_PTOC1_ModParam[sv]='None'
    EF_PTOC1_ModParam[evtType]='None'
    EF_PTOC1_ModParam[pp]=86400000
    EF_PTOC1_ModParam[cpl]='simple'
    EF_PTOC1_ModParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['EF_PTOC1_Mod']= EF_PTOC1_ModParam
    
    EF_PTOC1_StrValParam = {}   
    EF_PTOC1_StrValParam[dP]='High'
    EF_PTOC1_StrValParam[sv]='None'
    EF_PTOC1_StrValParam[evtType]='None'
    EF_PTOC1_StrValParam[pp]=86400000
    EF_PTOC1_StrValParam[cpl]='simple'
    EF_PTOC1_StrValParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['EF_PTOC1_StrVal']= EF_PTOC1_StrValParam
    
    EF_PTOC1_OpDlTmParam = {}   
    EF_PTOC1_OpDlTmParam[dP]='High'
    EF_PTOC1_OpDlTmParam[sv]='None'
    EF_PTOC1_OpDlTmParam[evtType]='None'
    EF_PTOC1_OpDlTmParam[pp]=86400000
    EF_PTOC1_OpDlTmParam[cpl]='simple'
    EF_PTOC1_OpDlTmParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['EF_PTOC1_OpDlTm']= EF_PTOC1_OpDlTmParam
    
    LPHD1_VRtgParam = {}   
    LPHD1_VRtgParam[dP]='Low'
    LPHD1_VRtgParam[sv]='None'
    LPHD1_VRtgParam[evtType]='None'
    LPHD1_VRtgParam[pp]=86400000
    LPHD1_VRtgParam[cpl]='simple'
    LPHD1_VRtgParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_VRtg']= LPHD1_VRtgParam
    
    LPHD1_ProtectionTypeParam = {}   
    LPHD1_ProtectionTypeParam[dP]='Low'
    LPHD1_ProtectionTypeParam[sv]='None'
    LPHD1_ProtectionTypeParam[evtType]='None'
    LPHD1_ProtectionTypeParam[pp]=86400000
    LPHD1_ProtectionTypeParam[cpl]='simple'
    LPHD1_ProtectionTypeParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_ProtectionType']= LPHD1_ProtectionTypeParam
    
    LPHD1_SerNumParam = {}   
    LPHD1_SerNumParam[dP]='Low'
    LPHD1_SerNumParam[sv]='None'
    LPHD1_SerNumParam[evtType]='None'
    LPHD1_SerNumParam[pp]=86400000
    LPHD1_SerNumParam[cpl]='simple'
    LPHD1_SerNumParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_SerNum']= LPHD1_SerNumParam
    
    LPHD1_FwRevParam = {}   
    LPHD1_FwRevParam[dP]='Low'
    LPHD1_FwRevParam[sv]='None'
    LPHD1_FwRevParam[evtType]='None'
    LPHD1_FwRevParam[pp]=86400000
    LPHD1_FwRevParam[cpl]='simple'
    LPHD1_FwRevParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_FwRev']= LPHD1_FwRevParam
    
    LPHD1_MeteringTypeParam = {}   
    LPHD1_MeteringTypeParam[dP]='Low'
    LPHD1_MeteringTypeParam[sv]='None'
    LPHD1_MeteringTypeParam[evtType]='None'
    LPHD1_MeteringTypeParam[pp]=86400000
    LPHD1_MeteringTypeParam[cpl]='simple'
    LPHD1_MeteringTypeParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_MeteringType']= LPHD1_MeteringTypeParam
    
    LPHD1_BatCharRteParam = {}   
    LPHD1_BatCharRteParam[dP]='Low'
    LPHD1_BatCharRteParam[sv]='None'
    LPHD1_BatCharRteParam[evtType]='None'
    LPHD1_BatCharRteParam[pp]=86400000
    LPHD1_BatCharRteParam[cpl]='simple'
    LPHD1_BatCharRteParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_BatCharRte']= LPHD1_BatCharRteParam
    
    SCBR1_AccAbrPhsAParam = {}   
    SCBR1_AccAbrPhsAParam[dP]='Low'
    SCBR1_AccAbrPhsAParam[sv]='None'
    SCBR1_AccAbrPhsAParam[evtType]='None'
    SCBR1_AccAbrPhsAParam[pp]=86400000
    SCBR1_AccAbrPhsAParam[cpl]='simple'
    SCBR1_AccAbrPhsAParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['SCBR1_AccAbrPhsA']= SCBR1_AccAbrPhsAParam
    
    SCBR1_AccAbrPhsBParam = {}   
    SCBR1_AccAbrPhsBParam[dP]='Low'
    SCBR1_AccAbrPhsBParam[sv]='None'
    SCBR1_AccAbrPhsBParam[evtType]='None'
    SCBR1_AccAbrPhsBParam[pp]=86400000
    SCBR1_AccAbrPhsBParam[cpl]='simple'
    SCBR1_AccAbrPhsBParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['SCBR1_AccAbrPhsB']= SCBR1_AccAbrPhsBParam
    
    SCBR1_AccAbrPhsCParam = {}   
    SCBR1_AccAbrPhsCParam[dP]='Low'
    SCBR1_AccAbrPhsCParam[sv]='None'
    SCBR1_AccAbrPhsCParam[evtType]='None'
    SCBR1_AccAbrPhsCParam[pp]=86400000
    SCBR1_AccAbrPhsCParam[cpl]='simple'
    SCBR1_AccAbrPhsCParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['SCBR1_AccAbrPhsC']= SCBR1_AccAbrPhsCParam
    
    SCBR1_AccAbrNeutParam = {}   
    SCBR1_AccAbrNeutParam[dP]='Low'
    SCBR1_AccAbrNeutParam[sv]='None'
    SCBR1_AccAbrNeutParam[evtType]='None'
    SCBR1_AccAbrNeutParam[pp]=86400000
    SCBR1_AccAbrNeutParam[cpl]='simple'
    SCBR1_AccAbrNeutParam[opt]={'XCBR1_CBTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['SCBR1_AccAbrNeut']= SCBR1_AccAbrNeutParam
    
    XCBR1_CBClsPosCntParam = {}   
    XCBR1_CBClsPosCntParam[dP]='High'
    XCBR1_CBClsPosCntParam[sv]='None'
    XCBR1_CBClsPosCntParam[evtType]='None'
    XCBR1_CBClsPosCntParam[pp]=15000
    XCBR1_CBClsPosCntParam[cpl]='simple'
    XCBR1_CBClsPosCntParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_CBClsPosCnt']= XCBR1_CBClsPosCntParam
    
    XCBR1_CBTripCntRsParam = {}   
    XCBR1_CBTripCntRsParam[dP]='High'
    XCBR1_CBTripCntRsParam[sv]='None'
    XCBR1_CBTripCntRsParam[evtType]='None'
    XCBR1_CBTripCntRsParam[pp]=15000
    XCBR1_CBTripCntRsParam[cpl]='simple'
    XCBR1_CBTripCntRsParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_CBTripCntRs']= XCBR1_CBTripCntRsParam
    
    XCBR1_CBElecTripCntRsParam = {}   
    XCBR1_CBElecTripCntRsParam[dP]='High'
    XCBR1_CBElecTripCntRsParam[sv]='None'
    XCBR1_CBElecTripCntRsParam[evtType]='None'
    XCBR1_CBElecTripCntRsParam[pp]=15000
    XCBR1_CBElecTripCntRsParam[cpl]='simple'
    XCBR1_CBElecTripCntRsParam[opt]={}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_CBElecTripCntRs']= XCBR1_CBElecTripCntRsParam
    
    XCBR1_PosParam = {}   
    XCBR1_PosParam[dP]='High'
    XCBR1_PosParam[sv]='None'
    XCBR1_PosParam[evtType]='None'
    XCBR1_PosParam[pp]=86400000
    XCBR1_PosParam[cpl]='simple'
    XCBR1_PosParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_Pos']= XCBR1_PosParam
    
    XCBR1_CBTripIndParam = {}   
    XCBR1_CBTripIndParam[dP]='High'
    XCBR1_CBTripIndParam[sv]='High'
    XCBR1_CBTripIndParam[evtType]='Boolean1'
    XCBR1_CBTripIndParam[pp]=86400000
    XCBR1_CBTripIndParam[cpl]='complex'
    XCBR1_CBTripIndParamContext= {}      
	XCBR1_CBTripIndParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_Pos','XCBR1_CBTripInd',} 
    XCBR1_CBTripIndParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_CBTripInd']= XCBR1_CBTripIndParam
    
    XCBR1_CBElecTripIndParam = {}   
    XCBR1_CBElecTripIndParam[dP]='High'
    XCBR1_CBElecTripIndParam[sv]='High'
    XCBR1_CBElecTripIndParam[evtType]='Boolean1'
    XCBR1_CBElecTripIndParam[pp]=86400000
    XCBR1_CBElecTripIndParam[cpl]='complex'
    XCBR1_CBElecTripIndParamContext= {}      
	XCBR1_CBElecTripIndParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    XCBR1_CBElecTripIndParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['XCBR1_CBElecTripInd']= XCBR1_CBElecTripIndParam
    
    LT_PTOC1_OpParam = {}   
    LT_PTOC1_OpParam[dP]='High'
    LT_PTOC1_OpParam[sv]='High'
    LT_PTOC1_OpParam[evtType]='Boolean1'
    LT_PTOC1_OpParam[pp]=86400000
    LT_PTOC1_OpParam[cpl]='complex'
    LT_PTOC1_OpParamContext= {}      
	LT_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    LT_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['LT_PTOC1_Op']= LT_PTOC1_OpParam
    
    ST_PTOC1_OpParam = {}   
    ST_PTOC1_OpParam[dP]='High'
    ST_PTOC1_OpParam[sv]='High'
    ST_PTOC1_OpParam[evtType]='Boolean1'
    ST_PTOC1_OpParam[pp]=86400000
    ST_PTOC1_OpParam[cpl]='complex'
    ST_PTOC1_OpParamContext= {}      
	ST_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    ST_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['ST_PTOC1_Op']= ST_PTOC1_OpParam
    
    PIOC1_OpParam = {}   
    PIOC1_OpParam[dP]='High'
    PIOC1_OpParam[sv]='High'
    PIOC1_OpParam[evtType]='Boolean1'
    PIOC1_OpParam[pp]=86400000
    PIOC1_OpParam[cpl]='complex'
    PIOC1_OpParamContext= {}      
	PIOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    PIOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['PIOC1_Op']= PIOC1_OpParam
    
    G_PTOC1_OpParam = {}   
    G_PTOC1_OpParam[dP]='High'
    G_PTOC1_OpParam[sv]='High'
    G_PTOC1_OpParam[evtType]='Boolean1'
    G_PTOC1_OpParam[pp]=86400000
    G_PTOC1_OpParam[cpl]='complex'
    G_PTOC1_OpParamContext= {}      
	G_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    G_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['G_PTOC1_Op']= G_PTOC1_OpParam
    
    EF_PTOC1_OpParam = {}   
    EF_PTOC1_OpParam[dP]='High'
    EF_PTOC1_OpParam[sv]='High'
    EF_PTOC1_OpParam[evtType]='Boolean1'
    EF_PTOC1_OpParam[pp]=86400000
    EF_PTOC1_OpParam[cpl]='complex'
    EF_PTOC1_OpParamContext= {}      
	EF_PTOC1_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    EF_PTOC1_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['EF_PTOC1_Op']= EF_PTOC1_OpParam
    
    PIOC2_OpParam = {}   
    PIOC2_OpParam[dP]='High'
    PIOC2_OpParam[sv]='High'
    PIOC2_OpParam[evtType]='Boolean1'
    PIOC2_OpParam[pp]=86400000
    PIOC2_OpParam[cpl]='complex'
    PIOC2_OpParamContext= {}      
	PIOC2_OpParam[cxt]={'XCBR1_CBClsPosCnt','XCBR1_CBElecTripCntRs','XCBR1_Pos','XCBR1_CBElecTripInd',} 
    PIOC2_OpParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['PIOC2_Op']= PIOC2_OpParam
    
    LPHD1_TripUnitFailParam = {}   
    LPHD1_TripUnitFailParam[dP]='High'
    LPHD1_TripUnitFailParam[sv]='High'
    LPHD1_TripUnitFailParam[evtType]='Boolean1'
    LPHD1_TripUnitFailParam[pp]=86400000
    LPHD1_TripUnitFailParam[cpl]='simple'
    LPHD1_TripUnitFailParam[opt]={'XCBR1_CBClsPosCnt','XCBR1_CBTripCntRs','XCBR1_CBElecTripCntRs',}
    lua_event_spec.tableOfMeasurementsMasterpact['LPHD1_TripUnitFail']= LPHD1_TripUnitFailParam
    
    lua_event_spec.tableOfDevices['Masterpact A'] = lua_event_spec.tableOfMeasurementsMasterpact
    lua_event_spec.tableOfDevices['Masterpact E'] = lua_event_spec.tableOfMeasurementsMasterpact
    lua_event_spec.tableOfDevices['Masterpact H'] = lua_event_spec.tableOfMeasurementsMasterpact
    lua_event_spec.tableOfDevices['Masterpact P'] = lua_event_spec.tableOfMeasurementsMasterpact
end

function lua_event_spec.finalize() 	
end


