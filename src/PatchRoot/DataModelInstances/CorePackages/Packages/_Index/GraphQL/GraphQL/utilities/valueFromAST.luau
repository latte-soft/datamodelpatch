local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.jsutils.ObjMap);
local l_keyMap_0 = require(l_Parent_0.jsutils.keyMap).keyMap;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v7 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v7.isLeafType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isListType_0 = v7.isListType;
local l_isNonNullType_0 = v7.isNonNullType;
local v12 = require(l_Parent_0.luaUtils.null);
local v13 = nil;
local function v14(v15, v16, v17)
    if v15 then
        if v15.kind == l_Kind_0.VARIABLE then
            local l_value_0 = v15.name.value;
            if not (v17 ~= nil) or v17[l_value_0] == nil then
                return ;
            else
                local v19 = v17[l_value_0];
                if not (v19 == v12) or not l_isNonNullType_0(v16) then
                    return v19;
                else
                    return ;
                end;
            end;
        elseif not l_isNonNullType_0(v16) then
            if v15.kind == l_Kind_0.NULL then
                return v12;
            elseif not l_isListType_0(v16) then
                if not l_isInputObjectType_0(v16) then
                    if not l_isLeafType_0(v16) then
                        l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v16));
                        return ;
                    else
                        local v20 = nil;
                        if pcall(function()
                            v20 = v16:parseLiteral(v15, v17);
                        end) then
                            if v20 == nil then
                                return ;
                            else
                                return v20;
                            end;
                        else
                            return ;
                        end;
                    end;
                elseif v15.kind ~= l_Kind_0.OBJECT then
                    return ;
                else
                    local v21 = {};
                    local v23 = l_keyMap_0(v15.fields, function(v22)
                        return v22.name.value;
                    end);
                    for _, v25 in ipairs(v16:getFields():values()) do
                        local v26 = v23[v25.name];
                        if v26 and not v13(v26.value, v17) then
                            local v27 = v14(v26.value, v25.type, v17);
                            if v27 == nil then
                                return ;
                            else
                                v21[v25.name] = v27;
                            end;
                        elseif v25.defaultValue ~= nil then
                            v21[v25.name] = v25.defaultValue;
                        elseif l_isNonNullType_0(v25.type) then
                            return ;
                        end;
                    end;
                    return v21;
                end;
            else
                local l_ofType_0 = v16.ofType;
                if v15.kind == l_Kind_0.LIST then
                    local v29 = {};
                    for _, v31 in ipairs(v15.values) do
                        if not v13(v31, v17) then
                            local v32 = v14(v31, l_ofType_0, v17);
                            if v32 == nil then
                                return ;
                            else
                                table.insert(v29, v32);
                            end;
                        elseif not l_isNonNullType_0(l_ofType_0) then
                            table.insert(v29, v12);
                        else
                            return ;
                        end;
                    end;
                    return v29;
                else
                    local v33 = v14(v15, l_ofType_0, v17);
                    if v33 == nil then
                        return ;
                    else
                        return {
                            v33
                        };
                    end;
                end;
            end;
        elseif v15.kind == l_Kind_0.NULL then
            return ;
        else
            return v14(v15, v16.ofType, v17);
        end;
    else
        return ;
    end;
end;
v13 = function(v34, v35)
    local v36 = false;
    if v34.kind == l_Kind_0.VARIABLE then
        v36 = true;
        if v35 ~= nil then
            v36 = v35[v34.name.value] == nil;
        end;
    end;
    return v36;
end;
return {
    valueFromAST = v14
};
