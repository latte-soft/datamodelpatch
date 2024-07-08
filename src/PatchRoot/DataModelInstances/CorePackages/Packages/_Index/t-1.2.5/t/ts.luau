local v0 = typeof or type;
local function _(v1)
    return function(v2)
        if v0(v2) == v1 then
            return true;
        else
            return false;
        end;
    end;
end;
local v5 = {
    any = function(v4)
        if v4 ~= nil then
            return true;
        else
            return false;
        end;
    end
};
local v6 = "boolean";
local l_v6_0 = v6 --[[ copy: 4 -> 5 ]];
v5.boolean = function(v8)
    if v0(v8) == l_v6_0 then
        return true;
    else
        return false;
    end;
end;
v6 = "thread";
local l_v6_1 = v6 --[[ copy: 4 -> 6 ]];
v5.thread = function(v10)
    if v0(v10) == l_v6_1 then
        return true;
    else
        return false;
    end;
end;
v6 = "function";
local l_v6_2 = v6 --[[ copy: 4 -> 7 ]];
v5.callback = function(v12)
    if v0(v12) == l_v6_2 then
        return true;
    else
        return false;
    end;
end;
v6 = "nil";
local l_v6_3 = v6 --[[ copy: 4 -> 8 ]];
v5.none = function(v14)
    if v0(v14) == l_v6_3 then
        return true;
    else
        return false;
    end;
end;
v6 = "string";
local l_v6_4 = v6 --[[ copy: 4 -> 9 ]];
v5.string = function(v16)
    if v0(v16) == l_v6_4 then
        return true;
    else
        return false;
    end;
end;
v6 = "table";
local l_v6_5 = v6 --[[ copy: 4 -> 10 ]];
v5.table = function(v18)
    if v0(v18) == l_v6_5 then
        return true;
    else
        return false;
    end;
end;
v6 = "userdata";
local l_v6_6 = v6 --[[ copy: 4 -> 11 ]];
v5.userdata = function(v20)
    if v0(v20) == l_v6_6 then
        return true;
    else
        return false;
    end;
end;
v5.number = function(v21)
    if v0(v21) == "number" then
        if v21 == v21 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.nan = function(v22)
    if v22 ~= v22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Axes";
local l_v6_7 = v6 --[[ copy: 4 -> 12 ]];
v5.Axes = function(v24)
    if v0(v24) == l_v6_7 then
        return true;
    else
        return false;
    end;
end;
v6 = "BrickColor";
local l_v6_8 = v6 --[[ copy: 4 -> 13 ]];
v5.BrickColor = function(v26)
    if v0(v26) == l_v6_8 then
        return true;
    else
        return false;
    end;
end;
v6 = "CFrame";
local l_v6_9 = v6 --[[ copy: 4 -> 14 ]];
v5.CFrame = function(v28)
    if v0(v28) == l_v6_9 then
        return true;
    else
        return false;
    end;
end;
v6 = "Color3";
local l_v6_10 = v6 --[[ copy: 4 -> 15 ]];
v5.Color3 = function(v30)
    if v0(v30) == l_v6_10 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequence";
local l_v6_11 = v6 --[[ copy: 4 -> 16 ]];
v5.ColorSequence = function(v32)
    if v0(v32) == l_v6_11 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequenceKeypoint";
local l_v6_12 = v6 --[[ copy: 4 -> 17 ]];
v5.ColorSequenceKeypoint = function(v34)
    if v0(v34) == l_v6_12 then
        return true;
    else
        return false;
    end;
end;
v6 = "DockWidgetPluginGuiInfo";
local l_v6_13 = v6 --[[ copy: 4 -> 18 ]];
v5.DockWidgetPluginGuiInfo = function(v36)
    if v0(v36) == l_v6_13 then
        return true;
    else
        return false;
    end;
end;
v6 = "Faces";
local l_v6_14 = v6 --[[ copy: 4 -> 19 ]];
v5.Faces = function(v38)
    if v0(v38) == l_v6_14 then
        return true;
    else
        return false;
    end;
end;
v6 = "Instance";
local l_v6_15 = v6 --[[ copy: 4 -> 20 ]];
v5.Instance = function(v40)
    if v0(v40) == l_v6_15 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberRange";
local l_v6_16 = v6 --[[ copy: 4 -> 21 ]];
v5.NumberRange = function(v42)
    if v0(v42) == l_v6_16 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequence";
local l_v6_17 = v6 --[[ copy: 4 -> 22 ]];
v5.NumberSequence = function(v44)
    if v0(v44) == l_v6_17 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequenceKeypoint";
local l_v6_18 = v6 --[[ copy: 4 -> 23 ]];
v5.NumberSequenceKeypoint = function(v46)
    if v0(v46) == l_v6_18 then
        return true;
    else
        return false;
    end;
end;
v6 = "PathWaypoint";
local l_v6_19 = v6 --[[ copy: 4 -> 24 ]];
v5.PathWaypoint = function(v48)
    if v0(v48) == l_v6_19 then
        return true;
    else
        return false;
    end;
end;
v6 = "PhysicalProperties";
local l_v6_20 = v6 --[[ copy: 4 -> 25 ]];
v5.PhysicalProperties = function(v50)
    if v0(v50) == l_v6_20 then
        return true;
    else
        return false;
    end;
end;
v6 = "Random";
local l_v6_21 = v6 --[[ copy: 4 -> 26 ]];
v5.Random = function(v52)
    if v0(v52) == l_v6_21 then
        return true;
    else
        return false;
    end;
end;
v6 = "Ray";
local l_v6_22 = v6 --[[ copy: 4 -> 27 ]];
v5.Ray = function(v54)
    if v0(v54) == l_v6_22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Rect";
local l_v6_23 = v6 --[[ copy: 4 -> 28 ]];
v5.Rect = function(v56)
    if v0(v56) == l_v6_23 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3";
local l_v6_24 = v6 --[[ copy: 4 -> 29 ]];
v5.Region3 = function(v58)
    if v0(v58) == l_v6_24 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3int16";
local l_v6_25 = v6 --[[ copy: 4 -> 30 ]];
v5.Region3int16 = function(v60)
    if v0(v60) == l_v6_25 then
        return true;
    else
        return false;
    end;
end;
v6 = "TweenInfo";
local l_v6_26 = v6 --[[ copy: 4 -> 31 ]];
v5.TweenInfo = function(v62)
    if v0(v62) == l_v6_26 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim";
local l_v6_27 = v6 --[[ copy: 4 -> 32 ]];
v5.UDim = function(v64)
    if v0(v64) == l_v6_27 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim2";
local l_v6_28 = v6 --[[ copy: 4 -> 33 ]];
v5.UDim2 = function(v66)
    if v0(v66) == l_v6_28 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector2";
local l_v6_29 = v6 --[[ copy: 4 -> 34 ]];
v5.Vector2 = function(v68)
    if v0(v68) == l_v6_29 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3";
local l_v6_30 = v6 --[[ copy: 4 -> 35 ]];
v5.Vector3 = function(v70)
    if v0(v70) == l_v6_30 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3int16";
local l_v6_31 = v6 --[[ copy: 4 -> 36 ]];
v5.Vector3int16 = function(v72)
    if v0(v72) == l_v6_31 then
        return true;
    else
        return false;
    end;
end;
v6 = "Enum";
local l_v6_32 = v6 --[[ copy: 4 -> 37 ]];
v5.Enum = function(v74)
    if v0(v74) == l_v6_32 then
        return true;
    else
        return false;
    end;
end;
v6 = "EnumItem";
local l_v6_33 = v6 --[[ copy: 4 -> 38 ]];
v5.EnumItem = function(v76)
    if v0(v76) == l_v6_33 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptSignal";
local l_v6_34 = v6 --[[ copy: 4 -> 39 ]];
v5.RBXScriptSignal = function(v78)
    if v0(v78) == l_v6_34 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptConnection";
v5.RBXScriptConnection = function(v79)
    if v0(v79) == v6 then
        return true;
    else
        return false;
    end;
end;
v5.literal = function(...)
    local v80 = select("#", ...);
    if v80 == 1 then
        local v81 = ...;
        return function(v82)
            if v82 ~= v81 then
                return false;
            else
                return true;
            end;
        end;
    else
        local v83 = {};
        for v84 = 1, v80 do
            v83[v84] = v5.literal((select(v84, ...)));
        end;
        return v5.union(unpack(v83));
    end;
end;
v5.exactly = v5.literal;
v5.keyOf = function(v85)
    local v86 = {};
    for v87 in pairs(v85) do
        v86[#v86 + 1] = v87;
    end;
    return v5.literal(unpack(v86));
end;
v5.valueOf = function(v88)
    local v89 = {};
    for _, v91 in pairs(v88) do
        v89[#v89 + 1] = v91;
    end;
    return v5.literal(unpack(v89));
end;
v5.integer = function(v92)
    if v5.number(v92) then
        if v92 % 1 == 0 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.numberMin = function(v93)
    return function(v94)
        if v5.number(v94) then
            if v93 <= v94 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.numberMax = function(v95)
    return function(v96)
        if v5.number(v96) then
            if v96 <= v95 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.numberMinExclusive = function(v97)
    return function(v98)
        if v5.number(v98) then
            if v97 < v98 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.numberMaxExclusive = function(v99)
    return function(v100)
        if v5.number(v100) then
            if v100 < v99 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.numberPositive = v5.numberMinExclusive(0);
v5.numberNegative = v5.numberMaxExclusive(0);
v5.numberConstrained = function(v101, v102)
    assert(v5.number(v101) and v5.number(v102));
    local v103 = v5.numberMin(v101);
    local v104 = v5.numberMax(v102);
    return function(v105)
        if v103(v105) then
            if v104(v105) then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.numberConstrainedExclusive = function(v106, v107)
    assert(v5.number(v106) and v5.number(v107));
    local v108 = v5.numberMinExclusive(v106);
    local v109 = v5.numberMaxExclusive(v107);
    return function(v110)
        if v108(v110) then
            if v109(v110) then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.match = function(v111)
    assert(v5.string(v111));
    return function(v112)
        if v5.string(v112) then
            if string.match(v112, v111) == nil then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end;
end;
v5.optional = function(v113)
    assert(v5.callback(v113));
    return function(v114)
        if v114 == nil then
            return true;
        elseif not v113(v114) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.tuple = function(...)
    local v115 = {
        ...
    };
    return function(...)
        local v116 = {
            ...
        };
        for v117 = 1, #v115 do
            if v115[v117](v116[v117]) == false then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.keys = function(v118)
    assert(v5.callback(v118));
    return function(v119)
        if v5.table(v119) == false then
            return false;
        else
            for v120 in pairs(v119) do
                if v118(v120) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.values = function(v121)
    assert(v5.callback(v121));
    return function(v122)
        if v5.table(v122) == false then
            return false;
        else
            for _, v124 in pairs(v122) do
                if v121(v124) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.map = function(v125, v126)
    assert(v5.callback(v125), v5.callback(v126));
    local v127 = v5.keys(v125);
    local v128 = v5.values(v126);
    return function(v129)
        if v127(v129) then
            if v128(v129) then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
local v130 = v5.keys(v5.integer);
local l_v130_0 = v130 --[[ copy: 3 -> 40 ]];
v5.array = function(v132)
    assert(v5.callback(v132));
    local v133 = v5.values(v132);
    return function(v134)
        if l_v130_0(v134) == false then
            return false;
        else
            local v135 = 0;
            for _, _ in ipairs(v134) do
                v135 = v135 + 1;
            end;
            for v138 in pairs(v134) do
                if not (v138 >= 1) or v135 < v138 then
                    return false;
                end;
            end;
            if v133(v134) then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v130 = v5.array(v5.callback);
local l_v130_1 = v130 --[[ copy: 3 -> 41 ]];
v5.union = function(...)
    local v140 = {
        ...
    };
    assert(l_v130_1(v140));
    return function(v141)
        for _, v143 in pairs(v140) do
            if v143(v141) then
                return true;
            end;
        end;
        return false;
    end;
end;
v5.intersection = function(...)
    local v144 = {
        ...
    };
    assert(l_v130_1(v144));
    return function(v145)
        for _, v147 in pairs(v144) do
            if not v147(v145) then
                return false;
            end;
        end;
        return true;
    end;
end;
v130 = v5.map(v5.any, v5.callback);
local l_v130_2 = v130 --[[ copy: 3 -> 42 ]];
v5.interface = function(v149)
    assert(l_v130_2(v149));
    return function(v150)
        if v5.table(v150) == false then
            return false;
        else
            for v151, v152 in pairs(v149) do
                if v152(v150[v151]) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.strictInterface = function(v153)
    assert(l_v130_2(v153));
    return function(v154)
        if v5.table(v154) == false then
            return false;
        else
            for v155, v156 in pairs(v153) do
                if v156(v154[v155]) == false then
                    return false;
                end;
            end;
            for v157 in pairs(v154) do
                if not v153[v157] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.instanceOf = function(v158)
    assert(v5.string(v158));
    return function(v159)
        if v5.Instance(v159) then
            if v159.ClassName ~= v158 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end;
end;
v5.instance = v5.instanceOf;
v5.instanceIsA = function(v160)
    assert(v5.string(v160));
    return function(v161)
        if v5.Instance(v161) then
            if v161:IsA(v160) then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v5.enum = function(v162)
    assert(v5.Enum(v162));
    return function(v163)
        if v5.EnumItem(v163) then
            if v163.EnumType == v162 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
end;
v130 = v5.tuple(v5.callback, v5.callback);
local l_v130_3 = v130 --[[ copy: 3 -> 43 ]];
v5.wrap = function(v165, v166)
    assert(l_v130_3(v165, v166));
    return function(...)
        assert(v166(...));
        return v165(...);
    end;
end;
v5.strict = function(v167)
    return function(...)
        assert(v167(...));
    end;
end;
v130 = v5.map(v5.string, v5.callback);
v5.children = function(v168)
    assert(v130(v168));
    return function(v169)
        if v5.Instance(v169) then
            local v170 = {};
            for _, v172 in pairs(v169:GetChildren()) do
                local l_Name_0 = v172.Name;
                if v168[l_Name_0] then
                    if not v170[l_Name_0] then
                        v170[l_Name_0] = v172;
                    else
                        return false;
                    end;
                end;
            end;
            for v174, v175 in pairs(v168) do
                if not v175(v170[v174]) then
                    return false;
                end;
            end;
            return true;
        else
            return false;
        end;
    end;
end;
return v5;
