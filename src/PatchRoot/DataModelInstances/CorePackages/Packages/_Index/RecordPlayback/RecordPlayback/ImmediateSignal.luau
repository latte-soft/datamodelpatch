local v0 = {};
local v1 = {
    __index = v0
};
local v2 = {
    new = function()
        return (setmetatable({
            _callbacks = {}
        }, v1));
    end
};
v0.fire = function(v3, ...)
    for _, v5 in v3._callbacks, nil, nil do
        v5(...);
    end;
end;
v0.connect = function(v6, v7)
    table.insert(v6._callbacks, v7);
    local v8 = true;
    return function()
        if not v8 then
            error("Attempt to disconnect an already disconnected connection");
        end;
        v8 = false;
        local v9 = table.find(v6._callbacks, v7);
        if v9 ~= nil then
            table.remove(v6._callbacks, v9);
        end;
    end;
end;
return v2;
