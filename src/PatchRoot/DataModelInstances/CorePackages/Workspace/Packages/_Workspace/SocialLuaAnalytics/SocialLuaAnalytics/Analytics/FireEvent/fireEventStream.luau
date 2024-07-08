local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_llama_0 = v0.llama;
local _ = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.toStringAdditionalArgs);
local v4 = require(script.Parent.getEventInfo);
local v5 = require(script.Parent.optionallyLog);
local l_compose_0 = v0.SocialLibraries.RoduxTools.compose;
local v7 = require(script.Parent.Parent.Parent.Utils.isEnum);
local function _(v8)
    return l_llama_0.Dictionary.map(v8 or {}, function(v9)
        if not v7(v9) then
            return v9;
        else
            return v9.rawValue();
        end;
    end);
end;
local function v16(v11, v12)
    if v11 and v12 then
        return l_llama_0.Dictionary.map(v11, function(v13, v14)
            local v15 = v12[v14];
            if not v15 then
                return l_llama_0.None;
            elseif type(v15) == "function" then
                return (v15(v13));
            else
                return v13;
            end;
        end);
    else
        return {};
    end;
end;
local function v18(v17)
    return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", v17.context, v17.eventType, v3(v17.additionalInfo));
end;
local function v22(v19, v20)
    return function(v21)
        if not v20 then
            v19:setRBXEventStream(v21.context, v21.eventType, v21.additionalInfo);
            return v21;
        else
            v19:sendEventDeferred(v21.context, v21.eventType, v21.additionalInfo);
            return v21;
        end;
    end;
end;
return function(v23)
    local v24 = v4(v23.eventList);
    return function(v25, v26)
        local v27 = v24(v25);
        local _ = v22;
        local l_l_compose_0_0 = l_compose_0;
        local v30 = v5(v23.loggerImpl, v18);
        local l_eventStreamImpl_0 = v23.eventStreamImpl;
        local l_shouldUseSendEventDeferred_0 = v23.shouldUseSendEventDeferred;
        l_l_compose_0_0(v30, function(v33)
            if not l_shouldUseSendEventDeferred_0 then
                l_eventStreamImpl_0:setRBXEventStream(v33.context, v33.eventType, v33.additionalInfo);
                return v33;
            else
                l_eventStreamImpl_0:sendEventDeferred(v33.context, v33.eventType, v33.additionalInfo);
                return v33;
            end;
        end)({
            context = v27.context, 
            eventType = v27.eventType, 
            additionalInfo = l_llama_0.Dictionary.join(v23.infoForAllEvents or {}, l_llama_0.Dictionary.map(v27.additionalInfo or {}, function(v34)
                if not v7(v34) then
                    return v34;
                else
                    return v34.rawValue();
                end;
            end), v16(v26, v27.formatRulesForAdditionalInfo))
        });
        return v25, v26;
    end;
end;
