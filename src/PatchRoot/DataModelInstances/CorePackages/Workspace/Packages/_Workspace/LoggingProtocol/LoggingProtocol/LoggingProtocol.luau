local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_MessageBus_0 = require(l_Parent_1.MessageBus).MessageBus;
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.ArgCheck);
local _ = require(l_Parent_0.LoggingProtocolTypes);
local l_callOnce_0 = require(l_Parent_1.AppCommonLib).callOnce;
game:DefineFastFlag("EnableTelemetryProtocol", false);
getDomainName = function()
    if not game:GetFastFlag("EnableTelemetryProtocol") then
        return "Logging";
    else
        return "Telemetry";
    end;
end;
local v7 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat", 
    Counter = "RobloxTelemetryCounter", 
    Stats = "RobloxTelemetryStat"
};
local v8 = {
    TelemetryBackends = v7, 
    StandardizedFields = {
        addPlaceId = "addPlaceId", 
        addUniverseId = "addUniverseId", 
        addPlaceInstanceId = "addPlaceInstanceId", 
        addSessionId = "addSessionId", 
        addOsInfo = "addOSInfo"
    }, 
    LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventWithTimestamp"), 
        validateParams = v3.strictInterface({
            eventName = v3.string, 
            timestamp = v3.optional(v3.number), 
            metadata = v3.optional(v3.keys(v3.string))
        })
    }, 
    GET_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "getTimestamp"), 
        validateParams = v3.table
    }, 
    LOG_EVENT_FROM_LUA_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventFromLua"), 
        validateParams = v3.interface({
            eventType = v3.string, 
            config = v3.optional(v3.strictInterface({
                eventName = v3.string, 
                backends = v3.array(v3.valueOf(v7)), 
                throttlingPercentage = v3.optional(v3.number), 
                lastUpdated = v3.optional(v3.array(v3.integer)), 
                description = v3.optional(v3.string), 
                links = v3.optional(v3.string)
            })), 
            data = v3.optional(v3.table)
        })
    }
};
v8.__index = v8;
v8.new = function(v9)
    local v10 = {
        messageBus = v9 or l_MessageBus_0
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.logEventWithTimestamp = function(v11, v12, v13, v14)
    v4.isType(v12, "string", "eventName");
    v4.isType(v13, "number", "timestamp");
    v11.messageBus.call(v11.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, {
        eventName = v12, 
        timestamp = v13, 
        metadata = v14
    });
end;
v8.logEvent = function(v15, v16, v17)
    v4.isType(v16, "string", "eventName");
    v15:logEventWithTimestamp(v16, 0, v17);
end;
v8.logEventOnce = function(v18, v19, v20)
    v4.isType(v19, "string", "eventName");
    l_callOnce_0(string.format("logging_protocol_key-%s", v19), function()
        v18:logEvent(v19, v20);
    end);
end;
v8.getTimestamp = function(v21)
    return v21.messageBus.call(v21.GET_TIMESTAMP_DESCRIPTOR, {});
end;
v8.logRobloxTelemetryCounter = function(v22, v23, v24, v25)
    v22.messageBus.call(v22.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
        eventType = "RobloxTelemetryCounter", 
        config = v23, 
        data = if not v24 then if v25 then {
            customFields = v25
        } else nil else {
            incrementValue = v24, 
            customFields = v25
        }
    });
end;
v8.logRobloxTelemetryStat = function(v26, v27, v28, v29)
    v26.messageBus.call(v26.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
        eventType = "RobloxTelemetryStat", 
        config = v27, 
        data = {
            statValue = v28, 
            customFields = v29
        }
    });
end;
v8.logRobloxTelemetryEvent = function(v30, v31, v32, v33, v34)
    v30.messageBus.call(v30.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
        eventType = "RobloxTelemetry", 
        config = v31, 
        data = {
            standardizedFields = v32, 
            customFields = v33, 
            eventContext = v34
        }
    });
end;
v8.logEphemeralCounterEvent = function(v35, v36, v37)
    v35.messageBus.call(v35.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
        eventType = "EphemeralCounter", 
        config = v36, 
        data = if not v37 then nil else {
            incrementValue = v37
        }
    });
end;
v8.logEphemeralStatEvent = function(v38, v39, v40)
    v38.messageBus.call(v38.LOG_EVENT_FROM_LUA_DESCRIPTOR, {
        eventType = "EphemeralStat", 
        config = v39, 
        data = {
            statValue = v40
        }
    });
end;
v8.default = v8.new();
return v8;
