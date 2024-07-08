local l_llama_0 = require(script.Parent.Parent.Parent.dependencies).llama;
local _ = require(script.Parent.Types);
local v2 = require(script.Parent.toStringAdditionalArgs);
local v3 = require(script.Parent.getEventInfo);
local v4 = require(script.Parent.optionallyLog);
local v5 = require(script.Parent.Parent.Parent.RoduxTools.compose);
local v6 = require(script.Parent.Parent.Parent.Utils.isEnum);
local function _(v7)
    return l_llama_0.Dictionary.map(v7 or {}, function(v8)
        if not v6(v8) then
            return v8;
        else
            return v8.rawValue();
        end;
    end);
end;
local function v15(v10, v11)
    if v10 and v11 then
        return l_llama_0.Dictionary.map(v10, function(v12, v13)
            local v14 = v11[v13];
            if not v14 then
                return l_llama_0.None;
            elseif type(v14) == "function" then
                return (v14(v12));
            else
                return v12;
            end;
        end);
    else
        return {};
    end;
end;
local function v17(v16)
    return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", v16.context, v16.eventType, v2(v16.additionalInfo));
end;
local function _(v18)
    return function(v19)
        v18:setRBXEventStream(v19.context, v19.eventType, v19.additionalInfo);
        return v19;
    end;
end;
return function(v21)
    local v22 = v3(v21.eventList);
    return function(v23, v24)
        local v25 = v22(v23);
        local l_v5_0 = v5;
        local v27 = v4(v21.loggerImpl, v17);
        local l_eventStreamImpl_0 = v21.eventStreamImpl;
        l_v5_0(v27, function(v29)
            l_eventStreamImpl_0:setRBXEventStream(v29.context, v29.eventType, v29.additionalInfo);
            return v29;
        end)({
            context = v25.context.rawValue(), 
            eventType = v25.eventType.rawValue(), 
            additionalInfo = l_llama_0.Dictionary.join(v21.infoForAllEvents or {}, l_llama_0.Dictionary.map(v25.additionalInfo or {}, function(v30)
                if not v6(v30) then
                    return v30;
                else
                    return v30.rawValue();
                end;
            end), v15(v24, v25.formatRulesForAdditionalInfo))
        });
        return v23, v24;
    end;
end;
