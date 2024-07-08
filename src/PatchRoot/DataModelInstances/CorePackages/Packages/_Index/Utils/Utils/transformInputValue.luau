local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_getNullableType_0 = v5.getNullableType;
local l_isLeafType_0 = v5.isLeafType;
local l_isListType_0 = v5.isListType;
local l_isInputObjectType_0 = v5.isInputObjectType;
local _ = require(script.Parent.types);
local function v11(v12, v13, v14, v15)
    local v16 = if v14 ~= nil then v14 else nil;
    local v17 = if v15 ~= nil then v15 else nil;
    if v13 == nil then
        return v13;
    else
        local v18 = l_getNullableType_0(v12);
        if not l_Boolean_0.toJSBoolean(l_isLeafType_0(v18)) then
            if not l_Boolean_0.toJSBoolean(l_isListType_0(v18)) then
                if not l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v18)) then
                    return nil;
                else
                    local v19 = v18:getFields();
                    local v20 = {};
                    for v21 in v13, nil, nil do
                        local v22 = v19[tostring(v21)];
                        if v22 ~= nil then
                            v20[tostring(v21)] = v11(v22.type, v13[tostring(v21)], v16, v17);
                        end;
                    end;
                    if v17 ~= nil then
                        return (v17(v18, v20));
                    else
                        return v20;
                    end;
                end;
            else
                return l_Array_0.map(v13, function(v23)
                    return v11(v18.ofType, v23, v16, v17);
                end);
            end;
        elseif v16 ~= nil then
            return (v16(v18, v13));
        else
            return v13;
        end;
    end;
end;
v4.transformInputValue = v11;
v4.serializeInputValue = function(v24, v25)
    return v11(v24, v25, function(v26, v27)
        local l_status_0, l_result_0 = pcall(v26.serialize, v26, v27);
        if l_status_0 then
            return l_result_0;
        else
            return v27;
        end;
    end);
end;
v4.parseInputValue = function(v30, v31)
    return v11(v30, v31, function(v32, v33)
        local l_status_1, l_result_1 = pcall(v32.parseValue, v32, v33);
        if l_status_1 then
            return l_result_1;
        else
            return v33;
        end;
    end);
end;
v4.parseInputValueLiteral = function(v36, v37)
    return v11(v36, v37, function(v38, v39)
        return v38:parseLiteral(v39, {});
    end);
end;
return v4;
