local v0 = require(script.Parent.Symbols.Symbol);
local v1 = {};
local v2 = v0.named("ThunkTag");
v1.middleware = function(v3)
    v3 = v3 or {};
    return function(v4, v5)
        return function(v6)
            if v6[v2] == true then
                local v7 = {};
                for _, v9 in pairs(v6.requiredServices) do
                    local v10 = v3[v9];
                    if v10 == nil then
                        error(("Service with key %s is a dependency but was not provided"):format((tostring(v9))));
                    end;
                    v7[v9] = v10;
                end;
                return v6(v5, v7);
            else
                return v4(v6);
            end;
        end;
    end;
end;
v1.new = function(v11, v12, v13)
    assert(typeof(v11) == "string", "Bad arg #1: name must be a string");
    local v14 = true;
    if v12 ~= nil then
        v14 = typeof(v12) == "table";
    end;
    assert(v14, "Bad arg #2: requiredServices must be a table or nil");
    assert(typeof(v13) == "function", "Bad arg #3: onInvoke must be a function");
    return (setmetatable({
        [v2] = true, 
        type = v11, 
        requiredServices = v12 or {}
    }, {
        __call = function(_, ...)
            return v13(...);
        end
    }));
end;
v1.test = function(v16, v17, v18)
    local v19 = false;
    if typeof(v16) == "table" then
        v19 = v16[v2] == true;
    end;
    assert(v19, "Test Error - Bad arg #1: Must provide a valid thunk");
    if #v16.requiredServices > 0 then
        for _, v21 in ipairs(v16.requiredServices) do
            assert(v18[v21] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(v21));
        end;
    end;
    return v16(v17, v18);
end;
return v1;
