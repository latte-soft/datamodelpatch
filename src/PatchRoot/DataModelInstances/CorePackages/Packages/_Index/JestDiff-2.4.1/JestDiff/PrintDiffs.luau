local l_Parent_0 = script.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_EQUAL_0 = v2.DIFF_EQUAL;
local l_cleanupSemantic_0 = v2.cleanupSemantic;
local v5 = require(l_Parent_0.DiffLines);
local l_diffLinesUnified_0 = v5.diffLinesUnified;
local l_printDiffLines_0 = v5.printDiffLines;
local v8 = require(l_Parent_0.DiffStrings);
local v9 = require(l_Parent_0.GetAlignedDiffs);
local l_normalizeDiffOptions_0 = require(l_Parent_0.NormalizeDiffOptions).normalizeDiffOptions;
local _ = require(l_Parent_0.types);
local v12 = nil;
local function v20(v13, v14)
    if not v14 then
        return l_Array_0.some(v13, function(v15)
            return v15[1] == l_DIFF_EQUAL_0;
        end);
    else
        local v16 = #v13;
        return l_Array_0.some(v13, function(v17, v18)
            local v19 = false;
            if v17[1] == l_DIFF_EQUAL_0 then
                v19 = true;
                if v18 == v16 then
                    v19 = v17[2] ~= "\n";
                end;
            end;
            return v19;
        end);
    end;
end;
local function v27(v21, v22, v23)
    if (v21 ~= v22 and #v21 ~= 0) and #v22 ~= 0 then
        local v24 = true;
        if v21:find("\n") == nil then
            v24 = v22:find("\n") ~= nil;
        end;
        local v25 = v12(not not v24 and v21 .. "\n" or v21, not not v24 and v22 .. "\n" or v22, true);
        if v20(v25, v24) then
            local v26 = l_normalizeDiffOptions_0(v23);
            return l_printDiffLines_0(v9(v25, v26.changeColor), v26);
        end;
    end;
    return l_diffLinesUnified_0(v21:split("\n"), v22:split("\n"), v23);
end;
v12 = function(v28, v29, v30)
    local v31 = v8(v28, v29);
    if v30 then
        l_cleanupSemantic_0(v31);
    end;
    return v31;
end;
return {
    diffStringsUnified = v27, 
    diffStringsRaw = v12
};
