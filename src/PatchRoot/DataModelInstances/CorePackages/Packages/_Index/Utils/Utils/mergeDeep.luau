local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_isSymbol_0 = require(l_Parent_0.Utils.jsHelpers).isSymbol;
local v7 = nil;
local function v8(v9, v10)
    local v11 = if v10 ~= nil then v10 else false;
    local v12 = if not l_Boolean_0.toJSBoolean(v9[1]) then {} else v9[1];
    local v13 = {};
    for _, v15 in v9, nil, nil do
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v17 = v7(v12);
        if l_toJSBoolean_0(if not l_Boolean_0.toJSBoolean(v17) then v17 else v7(v15)) then
            for v18 in v15, nil, nil do
                if not l_isSymbol_0(v18) then
                    if not l_Boolean_0.toJSBoolean(v7(v15[tostring(v18)])) then
                        l_Object_0.assign(v13, {
                            [tostring(v18)] = v15[tostring(v18)]
                        });
                    elseif l_Array_0.indexOf(l_Object_0.keys(v13), (tostring(v18))) == -1 then
                        l_Object_0.assign(v13, {
                            [tostring(v18)] = v15[tostring(v18)]
                        });
                    else
                        v13[v18] = v8({
                            v13[v18], 
                            v15[v18]
                        }, v11);
                    end;
                end;
            end;
        end;
    end;
    return v13;
end;
v5.mergeDeep = v8;
v7 = function(v19)
    local v20 = l_Boolean_0.toJSBoolean(v19);
    if v20 then
        v20 = false;
        if typeof(v19) == "table" then
            v20 = not (l_Array_0.isArray(v19) and #v19 > 0);
        end;
    end;
    return v20;
end;
return v5;
