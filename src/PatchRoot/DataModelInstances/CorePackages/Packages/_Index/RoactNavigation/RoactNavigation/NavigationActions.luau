local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("BACK");
local v2 = v0("INIT");
local v3 = v0("NAVIGATE");
local v4 = v0("SET_PARAMS");
local v5 = {
    Back = v1, 
    Init = v2, 
    Navigate = v3, 
    SetParams = v4
};
setmetatable(v5, {
    __index = function(_, v7)
        error(("%q is not a valid member of NavigationActions"):format((tostring(v7))), 2);
    end
});
v5.back = function(v8)
    local v9 = v8 or {};
    return {
        type = v1, 
        key = v9.key, 
        immediate = v9.immediate
    };
end;
v5.init = function(v10)
    return {
        type = v2, 
        params = (v10 or {}).params
    };
end;
v5.navigate = function(v11)
    local v12 = v11 or {};
    return {
        type = v3, 
        routeName = v12.routeName, 
        params = v12.params, 
        action = v12.action, 
        key = v12.key
    };
end;
v5.setParams = function(v13)
    local v14 = v13 or {};
    return {
        type = v4, 
        preserveFocus = true, 
        key = v14.key, 
        params = v14.params
    };
end;
return v5;
