local l_Parent_0 = script.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v2.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v2.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v2.DIFF_INSERT;
local _ = require(l_Parent_0.types);
local function _(v7, v8)
    return v7:gsub("%s+$", function(v9)
        return v8(v9);
    end);
end;
local function v18(v11, v12, v13, v14, v15, v16)
    if #v11 ~= 0 then
        return v13(v14 .. " " .. v11:gsub("%s+$", function(v17)
            return v15(v17);
        end));
    elseif v14 ~= " " then
        return v13(v14);
    elseif v12 and #v16 ~= 0 then
        return v13(v14 .. " " .. v16);
    else
        return "";
    end;
end;
local function v22(v19, v20, v21)
    return v18(v19, v20, v21.aColor, v21.aIndicator, v21.changeLineTrailingSpaceColor, v21.emptyFirstOrLastLinePlaceholder);
end;
local function v26(v23, v24, v25)
    return v18(v23, v24, v25.bColor, v25.bIndicator, v25.changeLineTrailingSpaceColor, v25.emptyFirstOrLastLinePlaceholder);
end;
local function v30(v27, v28, v29)
    return v18(v27, v28, v29.commonColor, v29.commonIndicator, v29.commonLineTrailingSpaceColor, v29.emptyFirstOrLastLinePlaceholder);
end;
local function _(v31, v32, v33, v34, v35)
    return v35.patchColor(string.format("@@ -%d,%d +%d,%d @@", v31 + 1, v32 - v31, v33 + 1, v34 - v33));
end;
return {
    joinAlignedDiffsNoExpand = function(v37, v38)
        local v39 = #v37;
        local l_contextLines_0 = v38.contextLines;
        local v41 = l_contextLines_0 + l_contextLines_0;
        local l_v39_0 = v39;
        local v43 = false;
        local v44 = 0;
        local v45 = 0;
        while v45 ~= v39 do
            local l_v45_0 = v45;
            while v45 ~= v39 and v37[v45 + 1][1] == l_DIFF_EQUAL_0 do
                v45 = v45 + 1;
            end;
            if l_v45_0 ~= v45 then
                if l_v45_0 == 0 then
                    if l_contextLines_0 < v45 then
                        l_v39_0 = l_v39_0 - (v45 - l_contextLines_0);
                        v43 = true;
                    end;
                elseif v45 == v39 then
                    local v47 = v45 - l_v45_0;
                    if l_contextLines_0 < v47 then
                        l_v39_0 = l_v39_0 - (v47 - l_contextLines_0);
                        v43 = true;
                    end;
                else
                    local v48 = v45 - l_v45_0;
                    if v41 < v48 then
                        l_v39_0 = l_v39_0 - (v48 - v41);
                        v44 = v44 + 1;
                    end;
                end;
            end;
            while v45 ~= v39 and v37[v45 + 1][1] ~= l_DIFF_EQUAL_0 do
                v45 = v45 + 1;
            end;
        end;
        local v49 = true;
        if v44 == 0 then
            v49 = v43;
        end;
        if v44 ~= 0 then
            l_v39_0 = l_v39_0 + (v44 + 1);
        elseif v43 then
            l_v39_0 = l_v39_0 + 1;
        end;
        local v50 = l_v39_0 - 1;
        local v51 = {};
        local v52 = 0;
        if v49 then
            table.insert(v51, "");
        end;
        local v53 = 0;
        local v54 = 0;
        local v55 = 0;
        local v56 = 0;
        local function _(v57)
            local v58 = #v51;
            local l_v51_0 = v51;
            local l_v30_0 = v30;
            local l_v57_0 = v57;
            local v62 = true;
            if v58 ~= 0 then
                v62 = v58 == v50;
            end;
            table.insert(l_v51_0, l_v30_0(l_v57_0, v62, v38));
            v55 = v55 + 1;
            v56 = v56 + 1;
        end;
        local function _(v64)
            local v65 = #v51;
            local l_v51_1 = v51;
            local l_v22_0 = v22;
            local l_v64_0 = v64;
            local v69 = true;
            if v65 ~= 0 then
                v69 = v65 == v50;
            end;
            table.insert(l_v51_1, l_v22_0(l_v64_0, v69, v38));
            v55 = v55 + 1;
        end;
        local function _(v71)
            local v72 = #v51;
            local l_v51_2 = v51;
            local l_v26_0 = v26;
            local l_v71_0 = v71;
            local v76 = true;
            if v72 ~= 0 then
                v76 = v72 == v50;
            end;
            table.insert(l_v51_2, l_v26_0(l_v71_0, v76, v38));
            v56 = v56 + 1;
        end;
        v45 = 0;
        while v45 ~= v39 do
            local l_v45_1 = v45;
            while v45 ~= v39 and v37[v45 + 1][1] == l_DIFF_EQUAL_0 do
                v45 = v45 + 1;
            end;
            if l_v45_1 ~= v45 then
                if l_v45_1 == 0 then
                    if l_contextLines_0 < v45 then
                        l_v45_1 = v45 - l_contextLines_0;
                        v53 = l_v45_1;
                        v54 = l_v45_1;
                        v55 = v53;
                        v56 = v54;
                    end;
                    local l_l_v45_1_0 = l_v45_1;
                    while l_l_v45_1_0 ~= v45 do
                        local v80 = v37[l_l_v45_1_0 + 1][2];
                        local v81 = #v51;
                        local l_v51_3 = v51;
                        local l_v30_1 = v30;
                        local l_v80_0 = v80;
                        local v85 = true;
                        if v81 ~= 0 then
                            v85 = v81 == v50;
                        end;
                        table.insert(l_v51_3, l_v30_1(l_v80_0, v85, v38));
                        v55 = v55 + 1;
                        v56 = v56 + 1;
                        l_l_v45_1_0 = l_l_v45_1_0 + 1;
                    end;
                elseif v45 == v39 then
                    local l_v45_2 = v45;
                    if l_contextLines_0 < v45 - l_v45_1 then
                        l_v45_2 = l_v45_1 + l_contextLines_0;
                    end;
                    local l_l_v45_1_1 = l_v45_1;
                    while l_l_v45_1_1 ~= l_v45_2 do
                        local v88 = v37[l_l_v45_1_1 + 1][2];
                        local v89 = #v51;
                        local l_v51_4 = v51;
                        local l_v30_2 = v30;
                        local l_v88_0 = v88;
                        local v93 = true;
                        if v89 ~= 0 then
                            v93 = v89 == v50;
                        end;
                        table.insert(l_v51_4, l_v30_2(l_v88_0, v93, v38));
                        v55 = v55 + 1;
                        v56 = v56 + 1;
                        l_l_v45_1_1 = l_l_v45_1_1 + 1;
                    end;
                else
                    local v94 = v45 - l_v45_1;
                    if v41 < v94 then
                        local v95 = l_v45_1 + l_contextLines_0;
                        local l_l_v45_1_2 = l_v45_1;
                        while l_l_v45_1_2 ~= v95 do
                            local v97 = v37[l_l_v45_1_2 + 1][2];
                            local v98 = #v51;
                            local l_v51_5 = v51;
                            local l_v30_3 = v30;
                            local l_v97_0 = v97;
                            local v102 = true;
                            if v98 ~= 0 then
                                v102 = v98 == v50;
                            end;
                            table.insert(l_v51_5, l_v30_3(l_v97_0, v102, v38));
                            v55 = v55 + 1;
                            v56 = v56 + 1;
                            l_l_v45_1_2 = l_l_v45_1_2 + 1;
                        end;
                        local v103 = v52 + 1;
                        local l_v53_0 = v53;
                        local l_v55_0 = v55;
                        local l_v54_0 = v54;
                        v51[v103] = v38.patchColor(string.format("@@ -%d,%d +%d,%d @@", l_v53_0 + 1, l_v55_0 - l_v53_0, l_v54_0 + 1, v56 - l_v54_0));
                        v52 = #v51;
                        table.insert(v51, "");
                        v103 = v94 - v41;
                        v53 = v55 + v103;
                        v54 = v56 + v103;
                        v55 = v53;
                        v56 = v54;
                        l_l_v45_1_2 = v45 - l_contextLines_0;
                        while l_l_v45_1_2 ~= v45 do
                            local v107 = v37[l_l_v45_1_2 + 1][2];
                            l_v53_0 = #v51;
                            l_v54_0 = v51;
                            local l_v30_4 = v30;
                            local l_v107_0 = v107;
                            local v110 = true;
                            if l_v53_0 ~= 0 then
                                v110 = l_v53_0 == v50;
                            end;
                            table.insert(l_v54_0, l_v30_4(l_v107_0, v110, v38));
                            v55 = v55 + 1;
                            v56 = v56 + 1;
                            l_l_v45_1_2 = l_l_v45_1_2 + 1;
                        end;
                    else
                        local l_l_v45_1_3 = l_v45_1;
                        while l_l_v45_1_3 ~= v45 do
                            local v112 = v37[l_l_v45_1_3 + 1][2];
                            local v113 = #v51;
                            local l_v51_6 = v51;
                            local l_v30_5 = v30;
                            local l_v112_0 = v112;
                            local v117 = true;
                            if v113 ~= 0 then
                                v117 = v113 == v50;
                            end;
                            table.insert(l_v51_6, l_v30_5(l_v112_0, v117, v38));
                            v55 = v55 + 1;
                            v56 = v56 + 1;
                            l_l_v45_1_3 = l_l_v45_1_3 + 1;
                        end;
                    end;
                end;
            end;
            while v45 ~= v39 and v37[v45 + 1][1] == l_DIFF_DELETE_0 do
                local v118 = v37[v45 + 1][2];
                local v119 = #v51;
                local l_v51_7 = v51;
                local l_v22_1 = v22;
                local l_v118_0 = v118;
                local v123 = true;
                if v119 ~= 0 then
                    v123 = v119 == v50;
                end;
                table.insert(l_v51_7, l_v22_1(l_v118_0, v123, v38));
                v55 = v55 + 1;
                v45 = v45 + 1;
            end;
            while v45 ~= v39 and v37[v45 + 1][1] == l_DIFF_INSERT_0 do
                local v124 = v37[v45 + 1][2];
                local v125 = #v51;
                local l_v51_8 = v51;
                local l_v26_1 = v26;
                local l_v124_0 = v124;
                local v129 = true;
                if v125 ~= 0 then
                    v129 = v125 == v50;
                end;
                table.insert(l_v51_8, l_v26_1(l_v124_0, v129, v38));
                v56 = v56 + 1;
                v45 = v45 + 1;
            end;
        end;
        if v49 then
            local v130 = v52 + 1;
            local l_v53_1 = v53;
            local l_v55_1 = v55;
            local l_v54_1 = v54;
            v51[v130] = v38.patchColor(string.format("@@ -%d,%d +%d,%d @@", l_v53_1 + 1, l_v55_1 - l_v53_1, l_v54_1 + 1, v56 - l_v54_1));
        end;
        return table.concat(v51, "\n");
    end, 
    joinAlignedDiffsExpand = function(v134, v135)
        return table.concat(l_Array_0.map(v134, function(v136, v137, v138)
            local v139 = v136[2];
            local v140 = true;
            if v137 ~= 1 then
                v140 = v137 == #v138;
            end;
            local v141 = v136[1];
            if v141 == l_DIFF_DELETE_0 then
                return v22(v139, v140, v135);
            elseif v141 == l_DIFF_INSERT_0 then
                return v26(v139, v140, v135);
            else
                return v30(v139, v140, v135);
            end;
        end), "\n");
    end
};
