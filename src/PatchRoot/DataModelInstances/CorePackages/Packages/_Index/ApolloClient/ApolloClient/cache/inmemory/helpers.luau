local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_1.LuauRegExp);
local _ = require(l_Parent_1.GraphQL);
local _ = require(script.Parent.types);
local v6 = require(l_Parent_0.utilities);
local l_isReference_0 = v6.isReference;
local l_isField_0 = v6.isField;
local l_DeepMerger_0 = v6.DeepMerger;
local l_resultKeyNameFromFieldf_0 = v6.resultKeyNameFromFieldf;
local l_shouldInclude_0 = v6.shouldInclude;
local l_isNonNullObject_0 = v6.isNonNullObject;
local v13 = {};
local v14 = require(l_Parent_0.luaUtils.hasOwnProperty);
v13.hasOwn = v14;
v13.getTypenameFromStoreObject = function(v15, v16)
    if not l_isReference_0(v16) then
        if not v16 then
            return nil;
        else
            return v16.__typename;
        end;
    else
        return (v15:get(v16.__ref, "__typename"));
    end;
end;
v13.TypeOrFieldNameRegExp = v3("^[_a-zA-Z][_0-9a-zA-Z]*", "i");
local v17 = {};
v13.fieldNameFromStoreName = function(v18)
    if not v17[v18] then
        local v19 = string.match(v18, "^[_a-zA-Z][_0-9a-zA-Z]*") or v18;
        v17[v18] = v19;
        return v19;
    else
        return v17[v18];
    end;
end;
local function v20(v21, v22, v23)
    if not l_isNonNullObject_0(v22) then
        return false;
    elseif not l_Array_0.isArray(v22) then
        return l_Array_0.every(v21.selections, function(v24)
            if not l_isField_0(v24) or not l_shouldInclude_0(v24, v23) then
                return true;
            else
                local v25 = l_resultKeyNameFromFieldf_0(v24);
                return v14(v22, v25) and (not v24.selectionSet or v20(v24.selectionSet, v22[v25], v23));
            end;
        end);
    else
        return l_Array_0.every(v22, function(v26)
            return v20(v21, v26, v23);
        end);
    end;
end;
v13.selectionSetMatchesResult = v20;
v13.storeValueIsStoreObject = function(v27)
    return (l_isNonNullObject_0(v27) and not l_isReference_0(v27)) and not l_Array_0.isArray(v27);
end;
v13.makeProcessedFieldsMerger = function()
    return l_DeepMerger_0.new();
end;
return v13;
