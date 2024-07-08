local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.SimpleTimer);
local v3 = require(script.Parent.Parent.Logger);
local l_GetFFlagSocialLuaAnalyticsAddTimestamp_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialLuaAnalyticsAddTimestamp;
return function(v5)
    local v6 = {};
    local function _(v7)
        if v6[v7] then
            v6[v7].clear();
            v6[v7] = nil;
            return ;
        else
            v3:warning("(Clear) Timer with this key doesn't exist: " .. tostring(v7));
            return ;
        end;
    end;
    local function _(v9, v10)
        if not v10 then
            return nil;
        else
            return function()
                local l_v9_0 = v9;
                if v6[l_v9_0] then
                    v6[l_v9_0].clear();
                    v6[l_v9_0] = nil;
                else
                    v3:warning("(Clear) Timer with this key doesn't exist: " .. tostring(l_v9_0));
                end;
                v10();
            end;
        end;
    end;
    local function v21(v13)
        local v14 = v13 or l_HttpService_0:GenerateGUID(false);
        if v6[v14] then
            v3:warning("(Start) Timer with this key already exists: " .. tostring(v14));
            return v14;
        else
            local l_v6_0 = v6;
            local l_v2_0 = v2;
            local v17 = {
                timeoutThreshold = not not v5 and v5.timeoutThreshold or nil
            };
            local v18;
            if v5 then
                local l_onReachingThreshold_0 = v5.onReachingThreshold;
                v18 = if not l_onReachingThreshold_0 then nil else function()
                    local l_v14_0 = v14;
                    if v6[l_v14_0] then
                        v6[l_v14_0].clear();
                        v6[l_v14_0] = nil;
                    else
                        v3:warning("(Clear) Timer with this key doesn't exist: " .. tostring(l_v14_0));
                    end;
                    l_onReachingThreshold_0();
                end;
                if v18 then
                    goto label0;
                end;
            end;
            v18 = nil;
            ::label0::;
            v17.onReachingThreshold = v18;
            l_v6_0[v14] = l_v2_0(v17);
            return v14;
        end;
    end;
    return {
        start = function(v22, v23)
            local v24 = v21(v22);
            if not l_GetFFlagSocialLuaAnalyticsAddTimestamp_0() then
                v6[v24].start();
                return v24;
            else
                v6[v24].start(v23);
                return v24;
            end;
        end, 
        stop = function(v25)
            if v6[v25] then
                local v26 = v6[v25].stop();
                if v6[v25] then
                    v6[v25].clear();
                    v6[v25] = nil;
                    return v26;
                else
                    v3:warning("(Clear) Timer with this key doesn't exist: " .. tostring(v25));
                    return v26;
                end;
            else
                v3:warning("(Stop) Timer with this key doesn't exist: " .. tostring(v25));
                return -1;
            end;
        end, 
        getTime = function(v27)
            if v6[v27] then
                return v6[v27].getTime();
            else
                v3:warning("(getTime) Timer with this key doesn't exist: " .. tostring(v27));
                return -1;
            end;
        end, 
        getStartTimestamp = function(v28)
            if v6[v28] then
                return v6[v28].getStartTimestamp();
            else
                v3:warning("(startTimeStamp) Timer with this key doesn't exist: " .. tostring(v28));
                return nil;
            end;
        end
    };
end;
