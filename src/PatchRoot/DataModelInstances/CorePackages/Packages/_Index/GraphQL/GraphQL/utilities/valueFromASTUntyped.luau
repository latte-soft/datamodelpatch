local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_language_0 = l_Parent_0.language;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_coerceToTable_0 = v4.coerceToTable;
local v7 = require(l_Parent_0.luaUtils.null);
local _ = require(l_jsutils_0.ObjMap);
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_keyValMap_0 = require(l_jsutils_0.keyValMap).keyValMap;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local _ = require(l_language_0.ast);
local function v14(v15, v16)
    if v15.kind == l_Kind_0.NULL then
        return v7;
    elseif v15.kind == l_Kind_0.INT then
        return (tonumber(v15.value, 10));
    elseif v15.kind == l_Kind_0.FLOAT then
        return (tonumber(v15.value));
    elseif not (v15.kind ~= l_Kind_0.STRING and v15.kind ~= l_Kind_0.ENUM) or v15.kind == l_Kind_0.BOOLEAN then
        return v15.value;
    elseif v15.kind == l_Kind_0.LIST then
        return l_Array_0.map(v15.values, function(v17)
            return v14(v17, v16);
        end);
    elseif v15.kind == l_Kind_0.OBJECT then
        return l_coerceToTable_0(l_keyValMap_0(v15.fields, function(v18)
            return v18.name.value;
        end, function(v19)
            return v14(v19.value, v16);
        end));
    elseif v15.kind == l_Kind_0.VARIABLE then
        return v16 and v16[v15.name.value];
    else
        l_invariant_0(false, "Unexpected value node: " .. l_inspect_0(v15));
        error("Unexpected value node: " .. l_inspect_0(v15));
        return ;
    end;
end;
return {
    valueFromASTUntyped = v14
};
