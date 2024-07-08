local v0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React);
local v1 = require(script.Parent.useLoadingTimers);
return function(v2)
    local v3 = v1({});
    local v4 = v0.useRef("");
    local l_loading_0 = v2.loading;
    local l_error_0 = v2.error;
    v0.useEffect(function()
        if l_loading_0 then
            v4.current = v3.start(v2.timerKey);
        end;
        if not l_loading_0 and v4.current == v2.timerKey then
            local v7 = v3.stop(v2.timerKey);
            v4.current = "";
            if not l_error_0 then
                v2.onSuccess(v7, v2.timerKey);
            else
                v2.onError(v7, v2.timerKey);
                return ;
            end;
        end;
    end, {
        v2.timerKey, 
        l_loading_0, 
        l_error_0
    });
end;
