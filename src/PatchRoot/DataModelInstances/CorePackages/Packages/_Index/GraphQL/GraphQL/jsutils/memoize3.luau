local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local v1 = {};
local function _(v2)
    if v2 == nil then
        return v1;
    else
        return v2;
    end;
end;
local function _()
    return (setmetatable({}, {
        __mode = "kv"
    }));
end;
return {
    memoize3 = function(v5)
        local v6 = nil;
        return function(v7, v8, v9)
            local v10 = if v7 == nil then v1 else v7;
            local v11 = if v8 == nil then v1 else v8;
            local v12 = if v9 == nil then v1 else v9;
            if not v6 then
                v6 = setmetatable({}, {
                    __mode = "kv"
                });
            end;
            local v13 = v6[v10];
            local v14 = nil;
            if not v13 then
                v13 = setmetatable({}, {
                    __mode = "kv"
                });
                v6[v10] = v13;
            else
                v14 = v13[v11];
                if v14 then
                    local v15 = v14[v12];
                    if v15 ~= nil then
                        if v15 == v1 then
                            return nil;
                        else
                            return v15;
                        end;
                    end;
                end;
            end;
            if not v14 then
                v14 = setmetatable({}, {
                    __mode = "kv"
                });
                v13[v11] = v14;
            end;
            local v16 = v5(v7, v8, v9);
            v14[v12] = if v16 == nil then v1 else v16;
            return v16;
        end;
    end
};
