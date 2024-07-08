local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = {};
local l_print_0 = require(l_Parent_0.GraphQL).print;
local _ = require(script.Parent["merge-typedefs_types"]);
local l_isSome_0 = require(l_Parent_0.Utils).isSome;
local v10 = nil;
local function v14(v11, v12)
    return l_Boolean_0.toJSBoolean(l_Array_0.find(v11, function(v13)
        return v13.name.value == v12.name.value;
    end));
end;
local function _(v15, v16)
    return l_Array_0.some(v16, function(v17)
        return v17.value == v15.value;
    end);
end;
local function v31(v19, v20)
    local v21 = l_Array_0.concat({}, v20);
    for _, v23 in v19, nil, nil do
        local v25 = l_Array_0.findIndex(v21, function(v24)
            return v24.name.value == v23.name.value;
        end);
        if v25 > -1 then
            local v26 = v21[v25];
            if v26.value.kind == "ListValue" then
                v26.value.values = v10(v26.value.values, v23.value.values, function(v27, v28)
                    local l_value_0 = v27.value;
                    return not l_Boolean_0.toJSBoolean(l_value_0) or not l_Array_0.some(v28, function(v30)
                        return v30.value == l_value_0;
                    end);
                end);
            else
                v26.value = v23.value;
            end;
        else
            table.insert(v21, v23);
        end;
    end;
    return v21;
end;
local function _(v32)
    return (l_Array_0.filter(l_Array_0.map(v32, function(v33, v34, v35)
        local v37 = l_Array_0.findIndex(v35, function(v36)
            return v36.name.value == v33.name.value;
        end);
        if v37 ~= v34 then
            v33.arguments = v31(v33.arguments, v35[v37].arguments);
            return nil;
        else
            return v33;
        end;
    end), l_isSome_0));
end;
v6.mergeDirectives = function(v39, v40, v41)
    local v42 = if v39 ~= nil then v39 else {};
    local v43 = if v40 ~= nil then v40 else {};
    local v44 = v41 and v41.reverseDirectives;
    local v45 = if not l_Boolean_0.toJSBoolean(v44) then v43 else v42;
    local v46 = if not l_Boolean_0.toJSBoolean(v44) then v42 else v43;
    local v52 = l_Array_0.filter(l_Array_0.map(l_Array_0.concat({}, v45), function(v47, v48, v49)
        local v51 = l_Array_0.findIndex(v49, function(v50)
            return v50.name.value == v47.name.value;
        end);
        if v51 ~= v48 then
            v47.arguments = v31(v47.arguments, v49[v51].arguments);
            return nil;
        else
            return v47;
        end;
    end), l_isSome_0);
    for _, v54 in v46, nil, nil do
        if not l_Boolean_0.toJSBoolean(v14(v52, v54)) then
            table.insert(v52, v54);
        else
            local v56 = l_Array_0.findIndex(v52, function(v55)
                return v55.name.value == v54.name.value;
            end);
            local v57 = v52[v56];
            v52[v56].arguments = v31(not not l_Boolean_0.toJSBoolean(v54.arguments) and v54.arguments or {}, not not l_Boolean_0.toJSBoolean(v57.arguments) and v57.arguments or {});
        end;
    end;
    return v52;
end;
local function v62(v58, v59)
    local v60 = l_print_0(l_Object_0.assign({}, v58, {
        description = l_Object_0.None
    }));
    local v61 = l_print_0(l_Object_0.assign({}, v59, {
        description = l_Object_0.None
    }));
    if not l_Boolean_0.toJSBoolean(v60:gsub("directive @w*d*", ""):gsub(" on .*$", "") == v61:gsub("directive @w*d*", ""):gsub(" on .*$", "")) then
        error(l_Error_0.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(v58.name.value), tostring(v61), (tostring(v60)))));
    end;
end;
v6.mergeDirective = function(v63, v64)
    if not v64 then
        return v63;
    else
        v62(v63, v64);
        return l_Object_0.assign({}, v63, {
            locations = l_Array_0.concat({}, v64.locations, l_Array_0.filter(v63.locations, function(v65)
                return not l_Array_0.some(v64.locations, function(v66)
                    return v66.value == v65.value;
                end);
            end))
        });
    end;
end;
v10 = function(v67, v68, v69)
    return l_Array_0.concat(v67, l_Array_0.filter(v68, function(v70)
        return v69(v70, v67);
    end));
end;
return v6;
