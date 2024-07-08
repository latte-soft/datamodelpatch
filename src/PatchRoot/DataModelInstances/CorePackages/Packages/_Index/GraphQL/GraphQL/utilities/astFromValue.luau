local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Error_0 = v3.Error;
local l_Number_0 = v3.Number;
local v6 = require(l_Parent_1.RegExp);
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local l_isIteratableObject_0 = require(l_Parent_0.jsutils.isIteratableObject).isIteratableObject;
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_GraphQLID_0 = require(l_Parent_0.type.scalars).GraphQLID;
local v14 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v14.isLeafType;
local l_isEnumType_0 = v14.isEnumType;
local l_isInputObjectType_0 = v14.isInputObjectType;
local l_isListType_0 = v14.isListType;
local l_isNonNullType_0 = v14.isNonNullType;
local v20 = require(l_luaUtils_0.null);
local v21 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v21.isNillish;
local l_isNotNillish_0 = v21.isNotNillish;
local v24 = nil;
local function v25(v26, v27)
    if not l_isNonNullType_0(v27) then
        if v26 == v20 then
            return {
                kind = l_Kind_0.NULL
            };
        elseif v26 == nil then
            return v20;
        elseif not l_isListType_0(v27) then
            if not l_isInputObjectType_0(v27) then
                if l_isLeafType_0(v27) then
                    local v28 = v27:serialize(v26);
                    if not l_isNillish_0(v28) then
                        if typeof(v28) == "boolean" then
                            return {
                                kind = l_Kind_0.BOOLEAN, 
                                value = v28
                            };
                        elseif not (typeof(v28) == "number") or not l_Number_0.isFinite(v28) then
                            if typeof(v28) == "string" then
                                if not l_isEnumType_0(v27) then
                                    if not (v27 == l_GraphQLID_0) or not v24:test(v28) then
                                        return {
                                            kind = l_Kind_0.STRING, 
                                            value = v28
                                        };
                                    else
                                        return {
                                            kind = l_Kind_0.INT, 
                                            value = v28
                                        };
                                    end;
                                else
                                    return {
                                        kind = l_Kind_0.ENUM, 
                                        value = v28
                                    };
                                end;
                            else
                                error(l_Error_0.new(("Cannot convert value to AST: %s."):format(l_inspect_0(v28))));
                            end;
                        else
                            local v29 = tostring(v28);
                            if not v24:test(v29) then
                                return {
                                    kind = l_Kind_0.FLOAT, 
                                    value = v29
                                };
                            else
                                return {
                                    kind = l_Kind_0.INT, 
                                    value = v29
                                };
                            end;
                        end;
                    else
                        return v20;
                    end;
                end;
                l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v27));
                return ;
            elseif l_isObjectLike_0(v26) then
                local v30 = {};
                for _, v32 in ipairs(v27:getFields():values()) do
                    local v33 = v25(v26[v32.name], v32.type);
                    if l_isNotNillish_0(v33) then
                        table.insert(v30, {
                            kind = l_Kind_0.OBJECT_FIELD, 
                            name = {
                                kind = l_Kind_0.NAME, 
                                value = v32.name
                            }, 
                            value = v33
                        });
                    end;
                end;
                return {
                    kind = l_Kind_0.OBJECT, 
                    fields = v30
                };
            else
                return v20;
            end;
        else
            local l_ofType_0 = v27.ofType;
            if not l_isIteratableObject_0(v26) then
                return v25(v26, l_ofType_0);
            else
                local v35 = {};
                for _, v37 in pairs(v26) do
                    local v38 = v25(v37, l_ofType_0);
                    if l_isNotNillish_0(v38) then
                        table.insert(v35, v38);
                    end;
                end;
                return {
                    kind = l_Kind_0.LIST, 
                    values = v35
                };
            end;
        end;
    else
        local v39 = v25(v26, v27.ofType);
        local v40 = false;
        if v39 ~= nil then
            v40 = false;
            if v39 ~= v20 then
                v40 = v39.kind;
            end;
        end;
        if v40 == l_Kind_0.NULL then
            return v20;
        else
            return v39;
        end;
    end;
end;
v24 = v6("^-?(?:0|[1-9][0-9]*)$");
return {
    astFromValue = v25, 
    NULL = v20
};
