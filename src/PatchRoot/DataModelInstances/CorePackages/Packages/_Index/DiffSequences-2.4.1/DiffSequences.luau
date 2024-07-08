local l_Number_0 = require(script.Parent.LuauPolyfill).Number;
local function v7(v1, v2, v3, v4, v5)
    local v6 = 0;
    while not (not (v1 < v2 and v3 < v4) or not v5(v1, v3)) do
        v1 = v1 + 1;
        v3 = v3 + 1;
        v6 = v6 + 1;
    end;
    return v6;
end;
local function v14(v8, v9, v10, v11, v12)
    local v13 = 0;
    while not (not (v8 <= v9 and v10 <= v11) or not v12(v9, v11)) do
        v9 = v9 - 1;
        v11 = v11 - 1;
        v13 = v13 + 1;
    end;
    return v13;
end;
local function v27(v15, v16, v17, v18, v19, v20, v21)
    local v22 = 0;
    local v23 = -v15;
    local v24 = v20[v22 + 1];
    local l_v24_0 = v24;
    local v26 = v22 + 1;
    v20[v26] = v20[v26] + v7(v24 + 1, v16, ((v18 + v24) - v23) + 1, v17, v19);
    v26 = v15 < v21 and v15 or v21;
    v22 = v22 + 1;
    v23 = v23 + 2;
    while true do
        if v22 <= v26 then
            if v22 ~= v15 and l_v24_0 < v20[v22 + 1] then
                v24 = v20[v22 + 1];
            else
                v24 = l_v24_0 + 1;
                if v16 <= v24 then
                    return v22 - 1;
                end;
            end;
            l_v24_0 = v20[v22 + 1];
            v20[v22 + 1] = v24 + v7(v24 + 1, v16, ((v18 + v24) - v23) + 1, v17, v19);
            v22 = v22 + 1;
            v23 = v23 + 2;
        else
            return v21;
        end;
    end;
end;
local function v40(v28, v29, v30, v31, v32, v33, v34)
    local v35 = 0;
    local l_v28_0 = v28;
    local v37 = v33[v35 + 1];
    local l_v37_0 = v37;
    local v39 = v35 + 1;
    v33[v39] = v33[v39] - v14(v29, v37 - 1, v30, ((v31 + v37) - l_v28_0) - 1, v32);
    v39 = v28 < v34 and v28 or v34;
    v35 = v35 + 1;
    l_v28_0 = l_v28_0 - 2;
    while true do
        if v35 <= v39 then
            if v35 ~= v28 and v33[v35 + 1] < l_v37_0 then
                v37 = v33[v35 + 1];
            else
                v37 = l_v37_0 - 1;
                if v37 < v29 then
                    return v35 - 1;
                end;
            end;
            l_v37_0 = v33[v35 + 1];
            v33[v35 + 1] = v37 - v14(v29, v37 - 1, v30, ((v31 + v37) - l_v28_0) - 1, v32);
            v35 = v35 + 1;
            l_v28_0 = l_v28_0 - 2;
        else
            return v34;
        end;
    end;
end;
local function v75(v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51)
    local v52 = v44 - v42;
    local v53 = (v45 - v44) - (v43 - v42);
    local v54 = -v53 - (v41 - 1);
    local v55 = -v53 + (v41 - 1);
    local v56 = 0;
    local v57 = v41 < v48 and v41 or v48;
    local v58 = 0;
    local v59 = -v41;
    while true do
        if v58 <= v57 then
            local v60 = true;
            if v58 ~= 0 then
                v60 = false;
                if v58 ~= v41 then
                    v60 = v56 < v47[v58 + 1];
                end;
            end;
            local v61 = not not v60 and v47[v58 + 1] or v56;
            local v62 = not not v60 and v61 or v61 + 1;
            local v63 = (v52 + v62) - v59;
            local v64 = v7(v62 + 1, v43, v63 + 1, v45, v46);
            local v65 = v62 + v64;
            v56 = v47[v58 + 1];
            v47[v58 + 1] = v65;
            if v54 <= v59 and v59 <= v55 then
                local v66 = ((v41 - 1) - (v59 + v53)) / 2;
                if v66 <= v50 and v49[v66 + 1] - 1 <= v65 then
                    local v67 = (v52 + v61) - (not not v60 and v59 + 1 or v59 - 1);
                    local v68 = v14(v42, v61, v44, v67, v46);
                    local v69 = v61 - v68;
                    local v70 = v67 - v68;
                    local v71 = v69 + 1;
                    local v72 = v70 + 1;
                    v51.nChangePreceding = v41 - 1;
                    if v41 - 1 == ((v71 + v72) - v42) - v44 then
                        v51.aEndPreceding = v42;
                        v51.bEndPreceding = v44;
                    else
                        v51.aEndPreceding = v71;
                        v51.bEndPreceding = v72;
                    end;
                    v51.nCommonPreceding = v68;
                    if v68 ~= 0 then
                        v51.aCommonPreceding = v71;
                        v51.bCommonPreceding = v72;
                    end;
                    v51.nCommonFollowing = v64;
                    if v64 ~= 0 then
                        v51.aCommonFollowing = v62 + 1;
                        v51.bCommonFollowing = v63 + 1;
                    end;
                    local v73 = v65 + 1;
                    local v74 = (v63 + v64) + 1;
                    v51.nChangeFollowing = v41 - 1;
                    if v41 - 1 == ((v43 + v45) - v73) - v74 then
                        v51.aStartFollowing = v43;
                        v51.bStartFollowing = v45;
                    else
                        v51.aStartFollowing = v73;
                        v51.bStartFollowing = v74;
                    end;
                    return true;
                end;
            end;
            v58 = v58 + 1;
            v59 = v59 + 2;
        else
            return false;
        end;
    end;
end;
local function v107(v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86)
    local v87 = v80 - v78;
    local v88 = (v80 - v79) - (v78 - v77);
    local v89 = v88 - v76;
    local v90 = v88 + v76;
    local v91 = 0;
    local v92 = v76 < v85 and v76 or v85;
    local v93 = 0;
    local l_v76_0 = v76;
    while true do
        if v93 <= v92 then
            local v95 = true;
            if v93 ~= 0 then
                v95 = false;
                if v93 ~= v76 then
                    v95 = v84[v93 + 1] < v91;
                end;
            end;
            local v96 = not not v95 and v84[v93 + 1] or v91;
            local v97 = not not v95 and v96 or v96 - 1;
            local v98 = (v87 + v97) - l_v76_0;
            local v99 = v14(v77, v97 - 1, v79, v98 - 1, v81);
            local v100 = v97 - v99;
            v91 = v84[v93 + 1];
            v84[v93 + 1] = v100;
            if v89 <= l_v76_0 and l_v76_0 <= v90 then
                local v101 = (v76 + (l_v76_0 - v88)) / 2;
                if v101 <= v83 and v100 - 1 <= v82[v101 + 1] then
                    local v102 = v98 - v99;
                    v86.nChangePreceding = v76;
                    if v76 == ((v100 + v102) - v77) - v79 then
                        v86.aEndPreceding = v77;
                        v86.bEndPreceding = v79;
                    else
                        v86.aEndPreceding = v100;
                        v86.bEndPreceding = v102;
                    end;
                    v86.nCommonPreceding = v99;
                    if v99 ~= 0 then
                        v86.aCommonPreceding = v100;
                        v86.bCommonPreceding = v102;
                    end;
                    v86.nChangeFollowing = v76 - 1;
                    if v76 == 1 then
                        v86.nCommonFollowing = 0;
                        v86.aStartFollowing = v78;
                        v86.bStartFollowing = v80;
                    else
                        local v103 = (v87 + v96) - (not not v95 and l_v76_0 - 1 or l_v76_0 + 1);
                        local v104 = v7(v96, v78, v103, v80, v81);
                        v86.nCommonFollowing = v104;
                        if v104 ~= 0 then
                            v86.aCommonFollowing = v96;
                            v86.bCommonFollowing = v103;
                        end;
                        local v105 = v96 + v104;
                        local v106 = v103 + v104;
                        if v76 - 1 == ((v78 + v80) - v105) - v106 then
                            v86.aStartFollowing = v78;
                            v86.bStartFollowing = v80;
                        else
                            v86.aStartFollowing = v105;
                            v86.bStartFollowing = v106;
                        end;
                    end;
                    return true;
                end;
            end;
            v93 = v93 + 1;
            l_v76_0 = l_v76_0 - 2;
        else
            return false;
        end;
    end;
end;
local function v129(v108, v109, v110, v111, v112, v113, v114, v115, v116)
    local v117 = v111 - v109;
    local v118 = v112 - v110;
    local v119 = v110 - v109;
    local v120 = v112 - v111;
    local v121 = v120 - v119;
    local l_v119_0 = v119;
    local l_v119_1 = v119;
    v114[1] = v109 - 1;
    v115[1] = v110;
    if v121 % 2 == 0 then
        local v124 = (v108 ~= 0 and v108 or v121) / 2;
        for v125 = 1, (v119 + v120) / 2 do
            l_v119_0 = v27(v125, v110, v112, v117, v113, v114, l_v119_0);
            if v125 < v124 then
                l_v119_1 = v40(v125, v109, v111, v118, v113, v115, l_v119_1);
            elseif v107(v125, v109, v110, v111, v112, v113, v114, l_v119_0, v115, l_v119_1, v116) then
                return ;
            end;
        end;
    else
        local v126 = ((v108 ~= 0 and v108 or v121) + 1) / 2;
        local v127 = ((v119 + v120) + 1) / 2;
        local v128 = 1;
        l_v119_0 = v27(v128, v110, v112, v117, v113, v114, l_v119_0);
        v128 = v128 + 1;
        while v128 <= v127 do
            l_v119_1 = v40(v128 - 1, v109, v111, v118, v113, v115, l_v119_1);
            if v128 < v126 then
                l_v119_0 = v27(v128, v110, v112, v117, v113, v114, l_v119_0);
            elseif v75(v128, v109, v110, v111, v112, v113, v114, l_v119_0, v115, l_v119_1, v116) then
                return ;
            end;
            v128 = v128 + 1;
        end;
    end;
    error(string.format("%s: no overlap aStart=%i aEnd=%i bStart=%i bEnd=%i", "diff-sequences", v109, v110, v111, v112));
end;
local function v130(v131, v132, v133, v134, v135, v136, v137, v138, v139, v140)
    if v135 - v134 < v133 - v132 then
        v136 = not v136;
        if v136 and #v137 == 1 then
            local v141, v142 = unpack(v137[1]);
            local l_v141_0 = v141 --[[ copy: 10 -> 24 ]];
            local l_v142_0 = v142 --[[ copy: 11 -> 25 ]];
            v137[2] = {
                function(v145, v146, v147)
                    return l_v141_0(v145, v147, v146);
                end, 
                function(v148, v149)
                    return l_v142_0(v149, v148);
                end
            };
        end;
        local l_v132_0 = v132;
        local l_v133_0 = v133;
        v132 = v134;
        v133 = v135;
        v134 = l_v132_0;
        v135 = l_v133_0;
    end;
    local v152, v153 = unpack(v137[not v136 and 1 or 2]);
    v129(v131, v132, v133, v134, v135, v153, v138, v139, v140);
    local l_nChangePreceding_0 = v140.nChangePreceding;
    local l_aEndPreceding_0 = v140.aEndPreceding;
    local l_bEndPreceding_0 = v140.bEndPreceding;
    local l_nCommonPreceding_0 = v140.nCommonPreceding;
    local l_aCommonPreceding_0 = v140.aCommonPreceding;
    local l_bCommonPreceding_0 = v140.bCommonPreceding;
    local l_nCommonFollowing_0 = v140.nCommonFollowing;
    local l_aCommonFollowing_0 = v140.aCommonFollowing;
    local l_bCommonFollowing_0 = v140.bCommonFollowing;
    local l_nChangeFollowing_0 = v140.nChangeFollowing;
    local l_aStartFollowing_0 = v140.aStartFollowing;
    local l_bStartFollowing_0 = v140.bStartFollowing;
    if v132 < l_aEndPreceding_0 and v134 < l_bEndPreceding_0 then
        v130(l_nChangePreceding_0, v132, l_aEndPreceding_0, v134, l_bEndPreceding_0, v136, v137, v138, v139, v140);
    end;
    if l_nCommonPreceding_0 ~= 0 then
        v152(l_nCommonPreceding_0, l_aCommonPreceding_0, l_bCommonPreceding_0);
    end;
    if l_nCommonFollowing_0 ~= 0 then
        v152(l_nCommonFollowing_0, l_aCommonFollowing_0, l_bCommonFollowing_0);
    end;
    if l_aStartFollowing_0 < v133 and l_bStartFollowing_0 < v135 then
        v130(l_nChangeFollowing_0, l_aStartFollowing_0, v133, l_bStartFollowing_0, v135, v136, v137, v138, v139, v140);
    end;
end;
local function v168(v166, v167)
    if typeof(v167) ~= "number" then
        error(string.format("%s: %s type %s is not a number", "diff-sequences", v166, (type(v167))));
    end;
    if not l_Number_0.isSafeInteger(v167) then
        error(string.format("%s: %s type %s is not a safe integer", "diff-sequences", v166, (type(v167))));
    end;
    if v167 < 0 then
        error(string.format("%s: %s type %s is a negative integer", "diff-sequences", v166, (type(v167))));
    end;
end;
local function _(v169, v170)
    if typeof(v170) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", v169, (type(v170))));
    end;
end;
return function(v172, v173, v174, v175)
    v168("aLength", v172);
    v168("bLength", v173);
    if typeof(v174) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "isCommon", (type(v174))));
    end;
    if typeof(v175) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "foundSubsequence", (type(v175))));
    end;
    local v176 = v7(0, v172, 0, v173, v174);
    if v176 ~= 0 then
        v175(v176, 0, 0);
    end;
    if not (v172 == v176) or v173 ~= v176 then
        local v177 = v14(v176, v172 - 1, v176, v173 - 1, v174);
        local v178 = v172 - v177;
        local v179 = v173 - v177;
        local v180 = v176 + v177;
        if v172 ~= v180 and v173 ~= v180 then
            v130(0, v176, v178, v176, v179, false, {
                {
                    v175, 
                    v174
                }
            }, {
                0
            }, {
                0
            }, {
                aCommonFollowing = 0, 
                aCommonPreceding = 0, 
                aEndPreceding = 0, 
                aStartFollowing = 0, 
                bCommonFollowing = 0, 
                bCommonPreceding = 0, 
                bEndPreceding = 0, 
                bStartFollowing = 0, 
                nChangeFollowing = 0, 
                nChangePreceding = 0, 
                nCommonFollowing = 0, 
                nCommonPreceding = 0
            });
        end;
        if v177 ~= 0 then
            v175(v177, v178, v179);
        end;
    end;
end;
