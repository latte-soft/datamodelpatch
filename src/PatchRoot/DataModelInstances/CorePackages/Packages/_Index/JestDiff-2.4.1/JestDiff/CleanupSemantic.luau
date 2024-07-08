local _ = require(script.Parent.Parent.LuauPolyfill);
local v1 = nil;
local v2 = nil;
local l_sub_0 = string.sub;
local l_byte_0 = string.byte;
local l_match_0 = string.match;
local l_find_0 = string.find;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_floor_0 = math.floor;
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local v12 = {};
v12.__index = v12;
v12.new = function(v13, v14)
    return (setmetatable({
        v13, 
        v14
    }, v12));
end;
local function v21(v15, v16)
    if not (#v15 ~= 0 and #v16 ~= 0) or l_byte_0(v15, 1, 1) ~= l_byte_0(v16, 1, 1) then
        return 0;
    else
        local v17 = 1;
        local v18 = l_min_0(#v15, #v16);
        local l_v18_0 = v18;
        local v20 = 1;
        while v17 < l_v18_0 do
            if l_sub_0(v15, v20, l_v18_0) == l_sub_0(v16, v20, l_v18_0) then
                v17 = l_v18_0;
                v20 = v17;
            else
                v18 = l_v18_0;
            end;
            l_v18_0 = l_floor_0(v17 + (v18 - v17) / 2);
        end;
        return l_v18_0;
    end;
end;
local function v28(v22, v23)
    if not (#v22 ~= 0 and #v23 ~= 0) or l_byte_0(v22, -1) ~= l_byte_0(v23, -1) then
        return 0;
    else
        local v24 = 1;
        local v25 = l_min_0(#v22, #v23);
        local l_v25_0 = v25;
        local v27 = 1;
        while v24 < l_v25_0 do
            if l_sub_0(v22, -l_v25_0, -v27) == l_sub_0(v23, -l_v25_0, -v27) then
                v24 = l_v25_0;
                v27 = v24;
            else
                v25 = l_v25_0;
            end;
            l_v25_0 = l_floor_0(v24 + (v25 - v24) / 2);
        end;
        return l_v25_0;
    end;
end;
local function v37(v29, v30)
    local v31 = #v29;
    local v32 = #v30;
    if not (v31 ~= 0) or v32 == 0 then
        return 0;
    else
        if v32 < v31 then
            v29 = l_sub_0(v29, (v31 - v32) + 1);
        elseif v31 < v32 then
            v30 = l_sub_0(v30, 1, v31);
        end;
        local v33 = l_min_0(v31, v32);
        if v29 == v30 then
            return v33;
        else
            local v34 = 0;
            local v35 = 1;
            while true do
                local v36 = l_find_0(v30, l_sub_0(v29, (v33 - v35) + 1), 1, true);
                if not (v36 == nil) then
                    v35 = v35 + (v36 - 1);
                    if not (v36 ~= 1) or l_sub_0(v29, (v33 - v35) + 1) == l_sub_0(v30, 1, v35) then
                        v34 = v35;
                        v35 = v35 + 1;
                    end;
                else
                    break;
                end;
            end;
            return v34;
        end;
    end;
end;
local function v52(v38)
    local v39 = false;
    local v40 = {};
    local v41 = 0;
    local v42 = nil;
    local v43 = 1;
    local v44 = 0;
    local v45 = 0;
    local v46 = 0;
    local v47 = 0;
    while v38[v43] do
        if v38[v43][1] == 0 then
            v41 = v41 + 1;
            v40[v41] = v43;
            v44 = v46;
            v45 = v47;
            v46 = 0;
            v47 = 0;
            v42 = v38[v43][2];
        else
            if v38[v43][1] == 1 then
                v46 = v46 + #v38[v43][2];
            else
                v47 = v47 + #v38[v43][2];
            end;
            if (v42 and #v42 <= l_max_0(v44, v45)) and #v42 <= l_max_0(v46, v47) then
                l_insert_0(v38, v40[v41], v12.new(-1, v42));
                v38[v40[v41] + 1][1] = 1;
                v41 = (v41 - 1) - 1;
                v43 = v41 > 0 and v40[v41] or 0;
                v44 = 0;
                v45 = 0;
                v46 = 0;
                v47 = 0;
                v42 = nil;
                v39 = true;
            end;
        end;
        v43 = v43 + 1;
    end;
    if v39 then
        v2(v38);
    end;
    v1(v38);
    v43 = 2;
    while v38[v43] do
        if v38[v43 - 1][1] == -1 and v38[v43][1] == 1 then
            local v48 = v38[v43 - 1][2];
            local v49 = v38[v43][2];
            local v50 = v37(v48, v49);
            local v51 = v37(v49, v48);
            if v51 <= v50 then
                if not (#v48 / 2 > v50) or #v49 / 2 <= v50 then
                    l_insert_0(v38, v43, v12.new(0, (l_sub_0(v49, 1, v50))));
                    v38[v43 - 1][2] = l_sub_0(v48, 1, #v48 - v50);
                    v38[v43 + 1][2] = l_sub_0(v49, v50 + 1);
                    v43 = v43 + 1;
                end;
            elseif not (#v48 / 2 > v51) or #v49 / 2 <= v51 then
                l_insert_0(v38, v43, v12.new(0, (l_sub_0(v48, 1, v51))));
                v38[v43 - 1] = {
                    1, 
                    (l_sub_0(v49, 1, #v49 - v51))
                };
                v38[v43 + 1] = {
                    -1, 
                    (l_sub_0(v48, v51 + 1))
                };
                v43 = v43 + 1;
            end;
            v43 = v43 + 1;
        end;
        v43 = v43 + 1;
    end;
end;
local function v65(v53, v54)
    if not (#v53 ~= 0) or #v54 == 0 then
        return 6;
    else
        local v55 = l_sub_0(v53, -1);
        local v56 = l_sub_0(v54, 1, 1);
        local v57 = l_match_0(v55, "%W");
        local v58 = l_match_0(v56, "%W");
        local v59 = v57 and l_match_0(v55, "%s");
        local v60 = v58 and l_match_0(v56, "%s");
        local v61 = v59 and l_match_0(v55, "%c");
        local v62 = v60 and l_match_0(v56, "%c");
        local v63 = v61 and l_match_0(v53, "\n\r?\n$");
        local v64 = v62 and l_match_0(v54, "^\r?\n\r?\n");
        if not v63 and not v64 then
            if not v61 and not v62 then
                if (not v57 or v59) or not v60 then
                    if not v59 and not v60 then
                        if not v57 and not v58 then
                            return 0;
                        else
                            return 1;
                        end;
                    else
                        return 2;
                    end;
                else
                    return 3;
                end;
            else
                return 4;
            end;
        else
            return 5;
        end;
    end;
end;
v1 = function(v66)
    local v67 = 2;
    while v66[v67 + 1] do
        local v68 = v66[v67 - 1];
        local v69 = v66[v67 + 1];
        if v68[1] == 0 and v69[1] == 0 then
            local v70 = v66[v67];
            local v71 = v68[2];
            local v72 = v70[2];
            local v73 = v69[2];
            local v74 = v28(v71, v72);
            if v74 > 0 then
                local v75 = l_sub_0(v72, -v74);
                v71 = l_sub_0(v71, 1, -v74 - 1);
                v72 = v75 .. l_sub_0(v72, 1, -v74 - 1);
                v73 = v75 .. v73;
            end;
            local l_v71_0 = v71;
            local l_v72_0 = v72;
            local l_v73_0 = v73;
            local v79 = v65(v71, v72) + v65(v72, v73);
            while l_byte_0(v72, 1) == l_byte_0(v73, 1) do
                v71 = v71 .. l_sub_0(v72, 1, 1);
                v72 = l_sub_0(v72, 2) .. l_sub_0(v73, 1, 1);
                v73 = l_sub_0(v73, 2);
                local v80 = v65(v71, v72) + v65(v72, v73);
                if v79 <= v80 then
                    v79 = v80;
                    l_v71_0 = v71;
                    l_v72_0 = v72;
                    l_v73_0 = v73;
                end;
            end;
            if v68[2] ~= l_v71_0 then
                if #l_v71_0 > 0 then
                    v66[v67 - 1][2] = l_v71_0;
                else
                    l_remove_0(v66, v67 - 1);
                    v67 = v67 - 1;
                end;
                v66[v67][2] = l_v72_0;
                if #l_v73_0 > 0 then
                    v66[v67 + 1][2] = l_v73_0;
                else
                    l_remove_0(v66, v67 + 1);
                    v67 = v67 - 1;
                end;
            end;
        end;
        v67 = v67 + 1;
    end;
end;
v2 = function(v81)
    v81[#v81 + 1] = v12.new(0, "");
    local v82 = 1;
    local v83 = 0;
    local v84 = 0;
    local v85 = "";
    local v86 = "";
    local v87 = nil;
    while v81[v82] do
        local v88 = v81[v82][1];
        if v88 == 1 then
            v84 = v84 + 1;
            v86 = v86 .. v81[v82][2];
            v82 = v82 + 1;
        elseif v88 == -1 then
            v83 = v83 + 1;
            v85 = v85 .. v81[v82][2];
            v82 = v82 + 1;
        elseif v88 == 0 then
            if v83 + v84 > 1 then
                if v83 > 0 and v84 > 0 then
                    v87 = v21(v86, v85);
                    if v87 > 0 then
                        local v89 = (v82 - v83) - v84;
                        if v89 > 1 and v81[v89 - 1][1] == 0 then
                            v81[v89 - 1][2] = v81[v89 - 1][2] .. l_sub_0(v86, 1, v87);
                        else
                            l_insert_0(v81, 1, v12.new(0, (l_sub_0(v86, 1, v87))));
                            v82 = v82 + 1;
                        end;
                        v86 = l_sub_0(v86, v87 + 1);
                        v85 = l_sub_0(v85, v87 + 1);
                    end;
                    v87 = v28(v86, v85);
                    if v87 ~= 0 then
                        v81[v82][2] = l_sub_0(v86, -v87) .. v81[v82][2];
                        v86 = l_sub_0(v86, 1, -v87 - 1);
                        v85 = l_sub_0(v85, 1, -v87 - 1);
                    end;
                end;
                v82 = (v82 - v83) - v84;
                for _ = 1, v83 + v84 do
                    l_remove_0(v81, v82);
                end;
                if #v85 > 0 then
                    l_insert_0(v81, v82, v12.new(-1, v85));
                    v82 = v82 + 1;
                end;
                if #v86 > 0 then
                    l_insert_0(v81, v82, v12.new(1, v86));
                    v82 = v82 + 1;
                end;
                v82 = v82 + 1;
            elseif v82 > 1 and v81[v82 - 1][1] == 0 then
                v81[v82 - 1][2] = v81[v82 - 1][2] .. v81[v82][2];
                l_remove_0(v81, v82);
            else
                v82 = v82 + 1;
            end;
            v84 = 0;
            v83 = 0;
            v85 = "";
            v86 = "";
        end;
    end;
    if v81[#v81][2] == "" then
        v81[#v81] = nil;
    end;
    local v91 = false;
    v82 = 2;
    while v82 < #v81 do
        local v92 = v81[v82 - 1];
        local v93 = v81[v82 + 1];
        if v92[1] == 0 and v93[1] == 0 then
            local v94 = v81[v82];
            local v95 = v94[2];
            local v96 = v92[2];
            local v97 = v93[2];
            if #v96 == 0 then
                l_remove_0(v81, v82 - 1);
                v91 = true;
            elseif l_sub_0(v95, -#v96) == v96 then
                v94[2] = v96 .. l_sub_0(v95, 1, -#v96 - 1);
                v93[2] = v96 .. v93[2];
                l_remove_0(v81, v82 - 1);
                v91 = true;
            elseif l_sub_0(v95, 1, #v97) == v97 then
                v92[2] = v96 .. v97;
                v94[2] = l_sub_0(v95, #v97 + 1) .. v97;
                l_remove_0(v81, v82 + 1);
                v91 = true;
            end;
        end;
        v82 = v82 + 1;
    end;
    if not v91 then
        return ;
    else
        return v2(v81);
    end;
end;
return {
    Diff = v12, 
    DIFF_EQUAL = 0, 
    DIFF_DELETE = -1, 
    DIFF_INSERT = 1, 
    cleanupSemantic = v52, 
    _diff_commonPrefix = v21, 
    _diff_commonSuffix = v28, 
    _diff_commonOverlap = v37, 
    _diff_cleanupMerge = v2, 
    _diff_cleanupSemanticLossless = v1
};
