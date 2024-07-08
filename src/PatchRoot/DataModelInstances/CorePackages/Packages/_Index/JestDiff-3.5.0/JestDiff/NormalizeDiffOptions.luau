local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Number_0 = v2.Number;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_0.types);
local function v8(v7)
    return v7;
end;
local v9 = {
    aAnnotation = "Expected", 
    aColor = v5.green, 
    aIndicator = "-", 
    bAnnotation = "Received", 
    bColor = v5.red, 
    bIndicator = "+", 
    changeColor = v5.inverse, 
    changeLineTrailingSpaceColor = v8, 
    commonColor = v5.dim, 
    commonIndicator = " ", 
    commonLineTrailingSpaceColor = v8, 
    compareKeys = l_Object_0.None, 
    contextLines = 5, 
    emptyFirstOrLastLinePlaceholder = "", 
    expand = true, 
    includeChangeCounts = false, 
    omitAnnotationLines = false, 
    patchColor = v5.yellow
};
local function _(v10)
    if v10 and typeof(v10) == "function" then
        return v10;
    else
        return v9.compareKeys;
    end;
end;
local function _(v12)
    if not (not (typeof(v12) == "number") or not l_Number_0.isSafeInteger(v12)) and v12 >= 0 then
        return v12;
    else
        return 5;
    end;
end;
return {
    noColor = v8, 
    normalizeDiffOptions = function(v14)
        local v15 = v14 or {};
        local l_assign_0 = l_Object_0.assign;
        local v17 = {};
        local l_v9_0 = v9;
        local l_v15_0 = v15;
        local v20 = {};
        local l_compareKeys_0 = v15.compareKeys;
        v20.compareKeys = if not not l_compareKeys_0 and typeof(l_compareKeys_0) == "function" then l_compareKeys_0 else v9.compareKeys;
        l_compareKeys_0 = v15.contextLines;
        v20.contextLines = if (typeof(l_compareKeys_0) == "number" and l_Number_0.isSafeInteger(l_compareKeys_0)) and l_compareKeys_0 >= 0 then l_compareKeys_0 else 5;
        return (l_assign_0(v17, l_v9_0, l_v15_0, v20));
    end
};
