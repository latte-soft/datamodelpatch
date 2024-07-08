local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Set_0 = v0.Set;
local l_Array_0 = v0.Array;
local l_dehydrate_0 = require(script.Parent.Parent.hydration).dehydrate;
local _ = require(script.Parent.Parent.devtools.views.Components.types);
local l_HttpService_0 = game:GetService("HttpService");
local v12 = {
    cleanForBridge = function(v6, v7, v8)
        v8 = v8 or {};
        if v6 ~= nil then
            local v9 = {};
            local v10 = {};
            return {
                data = l_dehydrate_0(v6, v9, v10, v8, v7), 
                cleaned = v9, 
                unserializable = v10
            };
        else
            return nil;
        end;
    end, 
    copyToClipboard = function(_)
    end
};
v12.copyWithDelete = function(v13, v14, v15)
    v15 = v15 or 1;
    local v16 = v14[v15];
    local v17 = table.clone(v13);
    if v15 == #v14 then
        if not l_Array_0.isArray(v17) then
            v17[v16] = nil;
            return v17;
        else
            l_Array_0.splice(v17, v16, 1);
            return v17;
        end;
    else
        v17[v16] = v12.copyWithDelete(v13[v16], v14, v15 + 1);
        return v17;
    end;
end;
v12.copyWithRename = function(v18, v19, v20, v21)
    v21 = v21 or 1;
    local v22 = v19[v21];
    local v23 = table.clone(v18);
    if v21 == #v19 then
        v23[v20[v21]] = v23[v22];
        if not l_Array_0.isArray(v23) then
            v23[v22] = nil;
            return v23;
        else
            l_Array_0.splice(v23, v22, 1);
            return v23;
        end;
    else
        v23[v22] = v12.copyWithRename(v18[v22], v19, v20, v21 + 1);
        return v23;
    end;
end;
v12.copyWithSet = function(v24, v25, v26, v27)
    v27 = v27 or 1;
    if #v25 < v27 then
        return v26;
    else
        local v28 = v25[v27];
        local v29 = table.clone(v24);
        v29[v28] = v12.copyWithSet(v24[v28], v25, v26, v27 + 1);
        return v29;
    end;
end;
v12.serializeToString = function(v30)
    local v31 = l_Set_0.new();
    return l_HttpService_0.JSONEncode(v30, function(_, v33)
        if typeof(v33) == "table" and v33 ~= nil then
            if not v31:has(v33) then
                v31:add(v33);
            else
                return ;
            end;
        end;
        return v33;
    end);
end;
return v12;
