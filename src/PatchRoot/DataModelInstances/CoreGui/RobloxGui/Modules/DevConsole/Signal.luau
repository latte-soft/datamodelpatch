local v0 = require(script.Parent.Immutable);
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        _listeners = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.Connect = function(v3, v4)
    local v5 = {
        callback = v4, 
        isConnected = true
    };
    v3._listeners = v0.Append(v3._listeners, v5);
    return {
        Disconnect = function()
            v5.isConnected = false;
            v3._listeners = v0.RemoveValueFromList(v3._listeners, v5);
        end
    };
end;
v1.Fire = function(v6, ...)
    for _, v8 in ipairs(v6._listeners) do
        if v8.isConnected then
            v8.callback(...);
        end;
    end;
end;
return v1;
