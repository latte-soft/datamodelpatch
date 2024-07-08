local _ = require(script.Parent.NavigationTypes);
local function _(v1, v2, v3, v4)
    local v5 = {
        key = v1, 
        routeName = v1, 
        params = v2, 
        isTransitioning = v4
    };
    if v3 ~= nil then
        v5.routes = v3;
        v5.index = #v3;
    end;
    return v5;
end;
return {
    createMockStackState = function(v7, v8)
        local v9 = {
            key = v7, 
            routeName = v7, 
            params = nil, 
            isTransitioning = false
        };
        if v8 ~= nil then
            v9.routes = v8;
            v9.index = #v8;
        end;
        return v9;
    end, 
    createMockSwitchState = function(v10, v11)
        local v12 = {
            key = v10, 
            routeName = v10, 
            params = nil, 
            isTransitioning = nil
        };
        if v11 ~= nil then
            v12.routes = v11;
            v12.index = #v11;
        end;
        return v12;
    end, 
    createMockScreenState = function(v13, v14)
        return {
            key = v13, 
            routeName = v13, 
            params = v14, 
            isTransitioning = nil
        };
    end
};
