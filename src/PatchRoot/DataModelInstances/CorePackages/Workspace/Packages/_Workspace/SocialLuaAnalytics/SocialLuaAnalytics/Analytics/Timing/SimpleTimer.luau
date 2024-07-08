local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(script.Parent.Parent.Logger);
local l_GetFFlagSocialLuaAnalyticsAddTimestamp_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialLuaAnalyticsAddTimestamp;
local function _(v3, v4)
    return (v3.UnixTimestampMillis - v4.UnixTimestampMillis) / 1000;
end;
return function(v6)
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = not not v6 and v6.timeoutThreshold or nil;
    local v12 = not not v6 and v6.onReachingThreshold or nil;
    local function _()
        if not v7 or not v8 then
            return -1;
        else
            return v8 - v7;
        end;
    end;
    local function v15()
        local v14 = nil;
        if not v7 or v8 then
            if v7 then
                v1:warning("Timer has been already stopped");
            else
                v1:warning("Timer has not been started yet");
            end;
        else
            v14 = os.clock();
        end;
        if not v7 or not v14 then
            return -1;
        else
            return v14 - v7;
        end;
    end;
    local function _()
        if v10 then
            task.cancel(v10);
        end;
    end;
    local function v17()
        v7 = nil;
        v8 = nil;
        if v10 then
            task.cancel(v10);
        end;
    end;
    local function _()
        if v11 and v12 then
            local l_v12_0 = v12;
            v10 = task.delay(v11, function()
                v10 = nil;
                l_v12_0();
            end);
            return ;
        else
            return ;
        end;
    end;
    return {
        start = function(v20)
            if v7 then
                v1:warning("Timer has been already started");
            else
                v7 = os.clock();
                if l_GetFFlagSocialLuaAnalyticsAddTimestamp_0() then
                    v9 = v20 or DateTime.now();
                    if v20 then
                        v7 = (v9.UnixTimestampMillis - DateTime.now().UnixTimestampMillis) / 1000;
                    end;
                end;
                if v11 then
                    if v12 then
                        local l_v12_1 = v12;
                        v10 = task.delay(v11, function()
                            v10 = nil;
                            l_v12_1();
                        end);
                        return ;
                    else
                        return ;
                    end;
                end;
            end;
        end, 
        getStartTimestamp = function()
            if v9 then
                return v9;
            else
                v1:warning("Timer has not been started yet");
                return nil;
            end;
        end, 
        stop = function()
            if v10 then
                task.cancel(v10);
            end;
            if not v7 or v8 then
                if v7 then
                    v1:warning("Timer has been already stopped");
                else
                    v1:warning("Timer has not been started yet");
                end;
            else
                v8 = os.clock();
            end;
            if not v7 or not v8 then
                return -1;
            else
                return v8 - v7;
            end;
        end, 
        clear = v17, 
        getTime = v15
    };
end;
