local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.type.definition);
local l_isInterfaceType_0 = v2.isInterfaceType;
local l_isObjectType_0 = v2.isObjectType;
local l_isListType_0 = v2.isListType;
local l_isNonNullType_0 = v2.isNonNullType;
local l_isAbstractType_0 = v2.isAbstractType;
local function v8(v9, v10)
    if v9 == v10 then
        return true;
    elseif not l_isNonNullType_0(v9) or not l_isNonNullType_0(v10) then
        if not l_isListType_0(v9) or not l_isListType_0(v10) then
            return false;
        else
            return v8(v9.ofType, v10.ofType);
        end;
    else
        return v8(v9.ofType, v10.ofType);
    end;
end;
local function v11(v12, v13, v14)
    if v13 == v14 then
        return true;
    elseif not l_isNonNullType_0(v14) then
        if not l_isNonNullType_0(v13) then
            if not l_isListType_0(v14) then
                if not l_isListType_0(v13) then
                    return (l_isAbstractType_0(v14) and (l_isInterfaceType_0(v13) or l_isObjectType_0(v13))) and v12:isSubType(v14, v13);
                else
                    return false;
                end;
            elseif not l_isListType_0(v13) then
                return false;
            else
                return v11(v12, v13.ofType, v14.ofType);
            end;
        else
            return v11(v12, v13.ofType, v14);
        end;
    elseif not l_isNonNullType_0(v13) then
        return false;
    else
        return v11(v12, v13.ofType, v14.ofType);
    end;
end;
return {
    isEqualType = v8, 
    isTypeSubTypeOf = v11, 
    doTypesOverlap = function(v15, v16, v17)
        if v16 == v17 then
            return true;
        elseif not l_isAbstractType_0(v16) then
            if not l_isAbstractType_0(v17) then
                return false;
            else
                return v15:isSubType(v17, v16);
            end;
        elseif not l_isAbstractType_0(v17) then
            return v15:isSubType(v16, v17);
        else
            return l_Array_0.some(v15:getPossibleTypes(v16), function(v18)
                return v15:isSubType(v17, v18);
            end);
        end;
    end
};
