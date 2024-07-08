local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v3 = require(script.Parent.useForwardRef);
return function(v4, v5, v6, ...)
    local v7 = l_Array_0.concat({}, ...);
    return v3(v4, (v1.useCallback(function(v8)
        local function v10()
            v5(table.unpack(l_Array_0.map(v7, function(v9)
                return v8[v9];
            end)));
        end;
        local v11 = nil;
        local function v13()
            if not v11 then
                v11 = task.defer(function()
                    v11 = nil;
                    v5(table.unpack(l_Array_0.map(v7, function(v12)
                        return v8[v12];
                    end)));
                end);
            end;
        end;
        local v15 = l_Array_0.map(v7, function(v14)
            return v8:GetPropertyChangedSignal(v14):Connect(if not v6 then v10 else v13);
        end);
        v5(table.unpack(l_Array_0.map(v7, function(v16)
            return v8[v16];
        end)));
        return function()
            for _, v18 in v15, nil, nil do
                v18:Disconnect();
            end;
            if v11 then
                task.cancel(v11);
            end;
        end;
    end, {
        v5, 
        table.concat(v7, ",")
    })));
end;
