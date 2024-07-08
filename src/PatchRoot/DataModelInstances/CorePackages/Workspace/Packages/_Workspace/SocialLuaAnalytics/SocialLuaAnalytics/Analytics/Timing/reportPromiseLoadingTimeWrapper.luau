local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_EventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).EventTypes;
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(script.Parent.Timers);
local l_FFlagAutoSearchLoadingTimeEvent_0 = require(l_Parent_0.SharedFlags).FFlagAutoSearchLoadingTimeEvent;
return function(v8, v9, v10)
    return function(...)
        local v11 = {
            ...
        };
        local v12 = v6();
        local v13 = v12.start();
        local function v18(v14, v15)
            if not (not v10 or not v10.fireEvent) then
                local v16 = v12.stop(v13);
                local v17 = v9(unpack(v11)) or {};
                v10.fireEvent(l_EventTypes_0.LoadingTime, {
                    fetch = v17.fetch, 
                    nextPage = v17.nextPage, 
                    status = v14, 
                    result = if not l_FFlagAutoSearchLoadingTimeEvent_0 then nil else v15
                }, v16);
            end;
        end;
        return v8(...):andThen(function(v19)
            pcall(function()
                if not l_FFlagAutoSearchLoadingTimeEvent_0 then
                    v18(l_RetrievalStatus_0.Done);
                    return ;
                else
                    v18(l_RetrievalStatus_0.Done, v19);
                    return ;
                end;
            end);
            return v19;
        end):catch(function(v20)
            pcall(function()
                v18(l_RetrievalStatus_0.Failed);
            end);
            return v2.reject(v20);
        end);
    end;
end;
