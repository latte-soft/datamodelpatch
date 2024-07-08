local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_String_0 = v1.String;
local v5 = {};
local l_mergeDeep_0 = require(l_Parent_0.Utils).mergeDeep;
local function v7(v8, v9)
    if not l_Boolean_0.toJSBoolean(v8) or l_Array_0.isArray(v8) and #v8 == 0 then
        return {};
    elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v8)) then
        if #v8 == 1 then
            if not l_Boolean_0.toJSBoolean(v8[1]) then
                return {};
            else
                return v8[1];
            end;
        else
            local v10 = {};
            for _, v12 in v8, nil, nil do
                if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v12)) then
                    v12 = v7(v12);
                end;
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local v14 = false;
                if typeof(v12) == "table" then
                    v14 = v12;
                end;
                if l_toJSBoolean_0(v14) then
                    table.insert(v10, v12);
                end;
            end;
            local v15 = l_mergeDeep_0(v10, true);
            if l_Boolean_0.toJSBoolean(if typeof(v9) == "table" then v9.exclusions else nil) then
                for _, v17 in v9.exclusions, nil, nil do
                    local v18, v19 = table.unpack(l_String_0.split(v17, "."), 1, 2);
                    if not l_Boolean_0.toJSBoolean(v19) or v19 == "*" then
                        v15[v18] = nil;
                    elseif l_Boolean_0.toJSBoolean(v15[v18]) then
                        v15[v18][v19] = nil;
                    end;
                end;
            end;
            return v15;
        end;
    else
        return v8;
    end;
end;
v5.mergeResolvers = v7;
return v5;
