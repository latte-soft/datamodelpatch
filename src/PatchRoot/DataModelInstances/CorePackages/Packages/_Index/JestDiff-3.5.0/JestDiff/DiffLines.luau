local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local v3 = require(l_Parent_1.DiffSequences);
local v4 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v4.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v4.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v4.DIFF_INSERT;
local l_Diff_0 = v4.Diff;
local l_joinAlignedDiffsExpand_0 = require(l_Parent_0.JoinAlignedDiffs).joinAlignedDiffsExpand;
local l_joinAlignedDiffsNoExpand_0 = require(l_Parent_0.JoinAlignedDiffs).joinAlignedDiffsNoExpand;
local l_normalizeDiffOptions_0 = require(l_Parent_0.NormalizeDiffOptions).normalizeDiffOptions;
local _ = require(l_Parent_0.types);
local v13 = nil;
local function _(v14)
    local v15 = false;
    if #v14 == 1 then
        v15 = #v14[1] == 0;
    end;
    return v15;
end;
local function v23(v17)
    local v18 = 0;
    local v19 = 0;
    for _, v21 in ipairs(v17) do
        local v22 = v21[1];
        if v22 == l_DIFF_DELETE_0 then
            v18 = v18 + 1;
        elseif v22 == l_DIFF_INSERT_0 then
            v19 = v19 + 1;
        end;
    end;
    return {
        a = v18, 
        b = v19
    };
end;
local function v43(v24, v25)
    local l_aAnnotation_0 = v24.aAnnotation;
    local l_aColor_0 = v24.aColor;
    local l_aIndicator_0 = v24.aIndicator;
    local l_bAnnotation_0 = v24.bAnnotation;
    local l_bColor_0 = v24.bColor;
    local l_bIndicator_0 = v24.bIndicator;
    local l_includeChangeCounts_0 = v24.includeChangeCounts;
    if not v24.omitAnnotationLines then
        local v33 = "";
        local v34 = "";
        if l_includeChangeCounts_0 then
            local v35 = tostring(v25.a);
            local v36 = tostring(v25.b);
            local v37 = #l_bAnnotation_0 - #l_aAnnotation_0;
            local v38 = string.rep(" ", (math.max(0, v37)));
            local v39 = string.rep(" ", (math.max(0, -v37)));
            local v40 = #v36 - #v35;
            local v41 = string.rep(" ", (math.max(0, v40)));
            local v42 = string.rep(" ", (math.max(0, -v40)));
            v33 = v38 .. "  " .. l_aIndicator_0 .. " " .. v41 .. v35;
            v34 = v39 .. "  " .. l_bIndicator_0 .. " " .. v42 .. v36;
        end;
        return l_aColor_0(l_aIndicator_0 .. " " .. l_aAnnotation_0 .. v33) .. "\n" .. l_bColor_0(l_bIndicator_0 .. " " .. l_bAnnotation_0 .. v34) .. "\n\n";
    else
        return "";
    end;
end;
local function v46(v44, v45)
    if not v45.expand then
        return v43(v45, (v23(v44))) .. l_joinAlignedDiffsNoExpand_0(v44, v45);
    else
        return v43(v45, (v23(v44))) .. l_joinAlignedDiffsExpand_0(v44, v45);
    end;
end;
local function v52(v47, v48, v49)
    local l_v47_0 = v47;
    local v51 = false;
    if #l_v47_0 == 1 then
        v51 = #l_v47_0[1] == 0;
    end;
    if v51 then
        v47 = {};
    end;
    l_v47_0 = v48;
    v51 = false;
    if #l_v47_0 == 1 then
        v51 = #l_v47_0[1] == 0;
    end;
    if v51 then
        v48 = {};
    end;
    return (v46(v13(v47, v48), l_normalizeDiffOptions_0(v49)));
end;
local function v64(v53, v54, v55, v56, v57)
    local l_v53_0 = v53;
    local v59 = false;
    if #l_v53_0 == 1 then
        v59 = #l_v53_0[1] == 0;
    end;
    if v59 then
        l_v53_0 = v55;
        v59 = false;
        if #l_v53_0 == 1 then
            v59 = #l_v53_0[1] == 0;
        end;
        if v59 then
            v53 = {};
            v55 = {};
        end;
    end;
    l_v53_0 = v54;
    v59 = false;
    if #l_v53_0 == 1 then
        v59 = #l_v53_0[1] == 0;
    end;
    if v59 then
        l_v53_0 = v56;
        v59 = false;
        if #l_v53_0 == 1 then
            v59 = #l_v53_0[1] == 0;
        end;
        if v59 then
            v54 = {};
            v56 = {};
        end;
    end;
    if not (#v53 == #v55) or #v54 ~= #v56 then
        return (v52(v53, v54, v57));
    else
        v59 = v13(v55, v56);
        l_v53_0 = 0;
        local v60 = 0;
        for _, v62 in ipairs(v59) do
            local v63 = v62[1];
            if v63 == l_DIFF_DELETE_0 then
                v62[2] = v53[l_v53_0 + 1];
                l_v53_0 = l_v53_0 + 1;
            elseif v63 == l_DIFF_INSERT_0 then
                v62[2] = v54[v60 + 1];
                v60 = v60 + 1;
            else
                v62[2] = v54[v60 + 1];
                l_v53_0 = l_v53_0 + 1;
                v60 = v60 + 1;
            end;
        end;
        return (v46(v59, l_normalizeDiffOptions_0(v57)));
    end;
end;
v13 = function(v65, v66)
    local v67 = #v65;
    local v68 = #v66;
    local function v71(v69, v70)
        return v65[v69 + 1] == v66[v70 + 1];
    end;
    local v72 = {};
    local v73 = 0;
    local v74 = 0;
    v3(v67, v68, v71, function(v75, v76, v77)
        while v73 ~= v76 do
            table.insert(v72, l_Diff_0.new(l_DIFF_DELETE_0, v65[v73 + 1]));
            v73 = v73 + 1;
        end;
        while v74 ~= v77 do
            table.insert(v72, l_Diff_0.new(l_DIFF_INSERT_0, v66[v74 + 1]));
            v74 = v74 + 1;
        end;
        while v75 ~= 0 do
            table.insert(v72, l_Diff_0.new(l_DIFF_EQUAL_0, v66[v74 + 1]));
            v75 = v75 - 1;
            v73 = v73 + 1;
            v74 = v74 + 1;
        end;
    end);
    while v73 ~= v67 do
        table.insert(v72, l_Diff_0.new(l_DIFF_DELETE_0, v65[v73 + 1]));
        v73 = v73 + 1;
    end;
    while v74 ~= v68 do
        table.insert(v72, l_Diff_0.new(l_DIFF_INSERT_0, v66[v74 + 1]));
        v74 = v74 + 1;
    end;
    return v72;
end;
return {
    printDiffLines = v46, 
    diffLinesUnified = v52, 
    diffLinesUnified2 = v64, 
    diffLinesRaw = v13
};
