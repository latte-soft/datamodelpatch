local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.Promise);
local v3 = nil;
local v4 = nil;
local v20 = {
    mapAsyncIterator = function(v5, v6, v7)
        local v8 = nil;
        local v9 = nil;
        if typeof(v5["return"]) == "function" then
            v8 = v5["return"];
            v9 = function(v10)
                local function v11()
                    return v2.reject(v10);
                end;
                return v8(v5):andThen(v11, v11);
            end;
        end;
        local function v13(v12)
            if not l_Boolean_0.toJSBoolean(v12.done) then
                return (v3(v12.value, v6):andThen(v4, v9));
            else
                return v12;
            end;
        end;
        local v14 = nil;
        if v7 then
            v14 = function(v15)
                return v3(v15, v7):andThen(v4, v9);
            end;
        end;
        return {
            next = function(_)
                return v5:next():andThen(v13, v14);
            end, 
            ["return"] = function(_)
                if not l_Boolean_0.toJSBoolean(v8) then
                    return (v2.resolve({
                        value = nil, 
                        done = true
                    }));
                else
                    return (v8(v5):andThen(v13, v14));
                end;
            end, 
            throw = function(_, v19)
                if typeof(v5.throw) == "function" then
                    return v5.throw(v5, v19):andThen(v13, v14);
                else
                    return v2.reject(v19):catch(v9);
                end;
            end
        };
    end
};
v3 = function(v21, v22)
    return v2.new(function(v23)
        return v23(v22(v21));
    end);
end;
v4 = function(v24)
    return {
        value = v24, 
        done = false
    };
end;
return v20;
