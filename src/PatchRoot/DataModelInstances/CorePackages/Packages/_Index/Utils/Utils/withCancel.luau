local l_Boolean_0 = require((nil).LuauPolyfill).Boolean;
local v1 = require((nil).Promise);
local v2 = {};
local _ = require((nil).Dev.JestGlobals).expect;
local l_memoize2_0 = require(script.Parent["memoize.js"]).memoize2;
local function v6(v5)
    return v1.resolve():andThen(function()
        return {
            value = v5, 
            done = true
        };
    end);
end;
local v9 = l_memoize2_0(function(v7, v8)
    return function(...)
        return Reflect:apply(v8, v7, {
            ...
        });
    end;
end);
local function v22(v10, v11)
    return Proxy.new(v10, {
        has = function(_, v13, v14)
            if v14 == "return" then
                return true;
            else
                return Reflect:has(v13, v14);
            end;
        end, 
        get = function(_, v16, v17, v18)
            local v19 = Reflect:get(v16, v17, v18);
            if v17 == "return" then
                local v20 = not not l_Boolean_0.toJSBoolean(v19) and v19 or v6;
                return function(v21)
                    return v1.resolve():andThen(function()
                        return Reflect:apply(v20, v16, {
                            (v11(v21):expect())
                        });
                    end);
                end;
            elseif typeof(v19) == "function" then
                return v9(v16, v19);
            else
                return v19;
            end;
        end
    });
end;
v2.getAsyncIteratorWithCancel = v22;
local function v30(v23, v24)
    return Proxy.new(v23, {
        get = function(_, v26, v27, v28)
            local v29 = Reflect:get(v26, v27, v28);
            if Symbol.asyncIterator == v27 then
                return function()
                    return v22(Reflect:apply(v29, v26, {}), v24);
                end;
            elseif typeof(v29) == "function" then
                return v9(v26, v29);
            else
                return v29;
            end;
        end
    });
end;
v2.getAsyncIterableWithCancel = v30;
v2.withCancel = v30;
return v2;
