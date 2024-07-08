local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialStopwatch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Timers_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Timing.Timers;
local _ = require(l_script_FirstAncestor_0.Events);
local v5 = require(l_script_FirstAncestor_0.EventModes);
local v6 = require(l_script_FirstAncestor_0.EventRegister);
local v7 = require(l_Parent_0.LoggingProtocol);
local v8 = require(l_script_FirstAncestor_0.StopwatchTelemetryConfig);
local _ = require(script.Parent.Types);
return function()
    local v10 = {};
    local v11 = l_Timers_0();
    local l_default_0 = v7.default;
    local function _(v13)
        local v14 = v6[v13];
        if not v14 then
            error("Event not registered: " .. v13);
        end;
        return v14;
    end;
    local function v20(v16, v17)
        local v18 = v6[v16];
        if not v18 then
            error("Event not registered: " .. v16);
        end;
        local l_v18_0 = v18;
        v18 = v10[v16];
        if not v18 then
            l_default_0:logRobloxTelemetryEvent(v8, {
                l_default_0.StandardizedFields.addOsInfo
            }, {
                eventName = ("%*%*%*"):format("FailedOn", v17, v16), 
                count = 1
            });
            if l_v18_0.mode == v5.Strict then
                error((("Cannot %* an event that has not been started: %*"):format(v17, v16)));
            end;
        end;
        if not v18 or not v11.getStartTimestamp(v18) then
            return nil;
        else
            return {
                startTime = v11.getStartTimestamp(v18), 
                id = v18, 
                timeElapsed = v11.getTime(v18)
            };
        end;
    end;
    local _ = function(v21)
        return function(v22)
            local v23 = {};
            if type(v22) == "string" then
                v23[v22] = v20(v22, v21);
                return v23;
            else
                for _, v25 in v22, nil, nil do
                    v23[v25] = v20(v25, v21);
                end;
                return v23;
            end;
        end;
    end;
    local v27 = "Get";
    local l_v27_0 = v27 --[[ copy: 7 -> 9 ]];
    local function v33(v29)
        local v30 = {};
        if type(v29) == "string" then
            v30[v29] = v20(v29, l_v27_0);
            return v30;
        else
            for _, v32 in v29, nil, nil do
                v30[v32] = v20(v32, l_v27_0);
            end;
            return v30;
        end;
    end;
    local v34 = "Stop";
    v27 = function(v35)
        local v36 = {};
        if type(v35) == "string" then
            v36[v35] = v20(v35, v34);
            return v36;
        else
            for _, v38 in v35, nil, nil do
                v36[v38] = v20(v38, v34);
            end;
            return v36;
        end;
    end;
    return {
        start = function(v39, v40)
            local v41 = v6[v39];
            if not v41 then
                error("Event not registered: " .. v39);
            end;
            local l_v41_0 = v41;
            v41 = v11.start(l_HttpService_0:GenerateGUID(false), v40);
            if v10[v39] then
                l_default_0:logRobloxTelemetryEvent(v8, {
                    l_default_0.StandardizedFields.addOsInfo
                }, {
                    eventName = ("%*%*%*"):format("FailedOn", "Start", v39), 
                    count = 1
                });
                if l_v41_0.mode == v5.Strict then
                    error("Cannot start event twice: " .. v39);
                end;
            end;
            v10[v39] = v41;
            return {
                startTime = v11.getStartTimestamp(v41), 
                id = v41
            };
        end, 
        get = v33, 
        stop = function(v43)
            local v44 = v27(v43);
            if type(v43) == "string" then
                v10[v43] = nil;
                return v44;
            else
                for _, v46 in v43, nil, nil do
                    v10[v46] = nil;
                end;
                return v44;
            end;
        end, 
        _unsafeClearEventLog = function()
            v10 = {};
        end
    };
end;
