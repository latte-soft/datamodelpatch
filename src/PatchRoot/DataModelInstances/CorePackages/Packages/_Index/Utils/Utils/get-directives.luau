local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(l_Parent_0.GraphQL);
local l_getArgumentValues_0 = require(script.Parent.getArgumentValues).getArgumentValues;
local function v12(v8, v9)
    return (l_Array_0.reduce(if v9 ~= nil then v9 else {
        "directives"
    }, function(v10, v11)
        if not (v10 ~= l_Object_0.None) or v10 == nil then
            return nil;
        else
            return v10[v11];
        end;
    end, if typeof(v8) == "table" and v8.extensions then v8.extensions else l_Object_0.None));
end;
v5.getDirectivesInExtensions = v12;
local function v18(v13, v14)
    local v16 = l_Array_0.filter(v13, function(v15)
        return v15.name == v14;
    end);
    if #v16 == 0 then
        return nil;
    else
        return (l_Array_0.map(v16, function(v17)
            if v17.args ~= nil then
                return v17.args;
            else
                return {};
            end;
        end));
    end;
end;
local function v32(v19, v20, v21)
    local v24 = l_Array_0.reduce(if v21 ~= nil then v21 else {
        "directives"
    }, function(v22, v23)
        if not (v22 ~= l_Object_0.None) or v22 == nil then
            return nil;
        else
            return v22[v23];
        end;
    end, if typeof(v19) == "table" and v19.extensions then v19.extensions else l_Object_0.None);
    if v24 == nil then
        return nil;
    elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v24)) then
        local v25 = {};
        for _, v27 in l_Object_0.entries(v24) do
            local v28, v29 = table.unpack(v27, 1, 2);
            if not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v29)) then
                table.insert(v25, {
                    name = v28, 
                    args = v29
                });
            else
                for _, v31 in v29, nil, nil do
                    table.insert(v25, {
                        name = v28, 
                        args = v31
                    });
                end;
            end;
        end;
        return (v18(v25, v20));
    else
        return (v18(v24, v20));
    end;
end;
v5.getDirectiveInExtensions = v32;
v5.getDirectives = function(v33, v34, v35)
    local v36 = v12(v34, if v35 ~= nil then v35 else {
        "directives"
    });
    if v36 ~= nil and #v36 > 0 then
        return v36;
    else
        local v39 = l_Array_0.reduce(if not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v33) then v33 else v33.getDirectives) then {} else v33:getDirectives(), function(v37, v38)
            v37[tostring(v38.name)] = v38;
            return v37;
        end, {});
        local v40 = {};
        if l_Boolean_0.toJSBoolean(v34.astNode) then
            table.insert(v40, v34.astNode);
        end;
        if not (not (l_Array_0.indexOf(l_Object_0.keys(v34), "extensionASTNodes") ~= -1) or not l_Boolean_0.toJSBoolean(v34.extensionASTNodes)) then
            v40 = l_Array_0.concat({}, v40, v34.extensionASTNodes);
        end;
        local v41 = {};
        for _, v43 in v40, nil, nil do
            if l_Boolean_0.toJSBoolean(v43.directives) then
                for _, v45 in v43.directives, nil, nil do
                    local v46 = v39[tostring(v45.name.value)];
                    if l_Boolean_0.toJSBoolean(v46) then
                        table.insert(v41, {
                            name = v45.name.value, 
                            args = l_getArgumentValues_0(v46, v45)
                        });
                    end;
                end;
            end;
        end;
        return v41;
    end;
end;
v5.getDirective = function(v47, v48, v49, v50)
    local v51 = v32(v48, v49, if v50 ~= nil then v50 else {
        "directives"
    });
    if v51 ~= nil then
        return v51;
    else
        local v52 = if not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v47) then v47 else v47.getDirective) then nil else v47:getDirective(v49);
        if v52 == nil then
            return nil;
        else
            local v53 = {};
            if l_Boolean_0.toJSBoolean(v48.astNode) then
                table.insert(v53, v48.astNode);
            end;
            if not (not (l_Array_0.indexOf(l_Object_0.keys(v48), "extensionASTNodes") ~= -1) or not l_Boolean_0.toJSBoolean(v48.extensionASTNodes)) then
                v53 = l_Array_0.concat({}, v53, v48.extensionASTNodes);
            end;
            local v54 = {};
            for _, v56 in v53, nil, nil do
                if l_Boolean_0.toJSBoolean(v56.directives) then
                    for _, v58 in v56.directives, nil, nil do
                        if v58.name.value == v49 then
                            table.insert(v54, l_getArgumentValues_0(v52, v58));
                        end;
                    end;
                end;
            end;
            if l_Boolean_0.toJSBoolean(#v54) then
                return v54;
            else
                return nil;
            end;
        end;
    end;
end;
return v5;
