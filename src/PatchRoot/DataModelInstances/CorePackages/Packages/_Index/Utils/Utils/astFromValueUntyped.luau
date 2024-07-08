local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_Error_0 = v1.Error;
local l_Number_0 = v1.Number;
local l_Object_0 = v1.Object;
local v9 = require(l_Parent_0.LuauRegExp);
local v10 = nil;
local function _(v11)
    local l_status_0, l_result_0 = pcall(function()
        local v12 = tonumber(v11);
        if not (not l_Number_0.isNaN(v12) and v12 ~= math.huge) or v12 == -math.huge then
            return false;
        else
            return true;
        end;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return false;
    end;
end;
local function v16(v17)
    if v17 == l_Object_0.None then
        return {
            kind = l_Kind_0.NULL
        };
    elseif v17 == nil then
        return nil;
    elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v17)) then
        if typeof(v17) == "table" then
            local v18 = {};
            for v19 in v17, nil, nil do
                local v20 = v16(v17[tostring(v19)]);
                if l_Boolean_0.toJSBoolean(v20) then
                    table.insert(v18, {
                        kind = l_Kind_0.OBJECT_FIELD, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v19
                        }, 
                        value = v20
                    });
                end;
            end;
            return {
                kind = l_Kind_0.OBJECT, 
                fields = v18
            };
        elseif typeof(v17) == "boolean" then
            return {
                kind = l_Kind_0.BOOLEAN, 
                value = v17
            };
        else
            local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
            local v22 = false;
            if typeof(v17) == "number" then
                local l_status_1, l_result_1 = pcall(function()
                    local v23 = tonumber(v17);
                    if not (not l_Number_0.isNaN(v23) and v23 ~= math.huge) or v23 == -math.huge then
                        return false;
                    else
                        return true;
                    end;
                end);
                v22 = if l_status_1 then l_result_1 else false;
            end;
            if not l_toJSBoolean_0(v22) then
                if typeof(v17) == "string" then
                    return {
                        kind = l_Kind_0.STRING, 
                        value = v17
                    };
                else
                    error(l_Error_0.new(("Cannot convert value to AST: %s."):format((tostring(v17)))));
                    return ;
                end;
            else
                l_toJSBoolean_0 = tostring(v17);
                if not l_Boolean_0.toJSBoolean(v10:test(l_toJSBoolean_0)) then
                    return {
                        kind = l_Kind_0.FLOAT, 
                        value = l_toJSBoolean_0
                    };
                else
                    return {
                        kind = l_Kind_0.INT, 
                        value = l_toJSBoolean_0
                    };
                end;
            end;
        end;
    else
        local v26 = {};
        for _, v28 in v17, nil, nil do
            local v29 = v16(v28);
            if v29 ~= nil then
                table.insert(v26, v29);
            end;
        end;
        return {
            kind = l_Kind_0.LIST, 
            values = v26
        };
    end;
end;
v4.astFromValueUntyped = v16;
v10 = v9("^-?(?:0|[1-9][0-9]*)$");
return v4;
