local v0 = typeof or type;
local function _(v1)
    return function(v2)
        local v3 = v0(v2);
        if v3 == v1 then
            return true;
        else
            return false, string.format("%s expected, got %s", v1, v3);
        end;
    end;
end;
local v6 = {
    any = function(v5)
        if v5 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
local v7 = "boolean";
local l_v7_0 = v7 --[[ copy: 4 -> 5 ]];
v6.boolean = function(v9)
    local v10 = v0(v9);
    if v10 == l_v7_0 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_0, v10);
    end;
end;
v7 = "thread";
local l_v7_1 = v7 --[[ copy: 4 -> 6 ]];
v6.thread = function(v12)
    local v13 = v0(v12);
    if v13 == l_v7_1 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_1, v13);
    end;
end;
v7 = "function";
local l_v7_2 = v7 --[[ copy: 4 -> 7 ]];
v6.callback = function(v15)
    local v16 = v0(v15);
    if v16 == l_v7_2 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_2, v16);
    end;
end;
v7 = "nil";
local l_v7_3 = v7 --[[ copy: 4 -> 8 ]];
v6.none = function(v18)
    local v19 = v0(v18);
    if v19 == l_v7_3 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_3, v19);
    end;
end;
v7 = "string";
local l_v7_4 = v7 --[[ copy: 4 -> 9 ]];
v6.string = function(v21)
    local v22 = v0(v21);
    if v22 == l_v7_4 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_4, v22);
    end;
end;
v7 = "table";
local l_v7_5 = v7 --[[ copy: 4 -> 10 ]];
v6.table = function(v24)
    local v25 = v0(v24);
    if v25 == l_v7_5 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_5, v25);
    end;
end;
v7 = "userdata";
local l_v7_6 = v7 --[[ copy: 4 -> 11 ]];
v6.userdata = function(v27)
    local v28 = v0(v27);
    if v28 == l_v7_6 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_6, v28);
    end;
end;
v6.number = function(v29)
    local v30 = v0(v29);
    if v30 == "number" then
        if v29 == v29 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v30);
    end;
end;
v6.nan = function(v31)
    if v31 ~= v31 then
        return true;
    else
        return false, "unexpected non-NaN value";
    end;
end;
v7 = "Axes";
local l_v7_7 = v7 --[[ copy: 4 -> 12 ]];
v6.Axes = function(v33)
    local v34 = v0(v33);
    if v34 == l_v7_7 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_7, v34);
    end;
end;
v7 = "BrickColor";
local l_v7_8 = v7 --[[ copy: 4 -> 13 ]];
v6.BrickColor = function(v36)
    local v37 = v0(v36);
    if v37 == l_v7_8 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_8, v37);
    end;
end;
v7 = "CFrame";
local l_v7_9 = v7 --[[ copy: 4 -> 14 ]];
v6.CFrame = function(v39)
    local v40 = v0(v39);
    if v40 == l_v7_9 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_9, v40);
    end;
end;
v7 = "Color3";
local l_v7_10 = v7 --[[ copy: 4 -> 15 ]];
v6.Color3 = function(v42)
    local v43 = v0(v42);
    if v43 == l_v7_10 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_10, v43);
    end;
end;
v7 = "ColorSequence";
local l_v7_11 = v7 --[[ copy: 4 -> 16 ]];
v6.ColorSequence = function(v45)
    local v46 = v0(v45);
    if v46 == l_v7_11 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_11, v46);
    end;
end;
v7 = "ColorSequenceKeypoint";
local l_v7_12 = v7 --[[ copy: 4 -> 17 ]];
v6.ColorSequenceKeypoint = function(v48)
    local v49 = v0(v48);
    if v49 == l_v7_12 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_12, v49);
    end;
end;
v7 = "DockWidgetPluginGuiInfo";
local l_v7_13 = v7 --[[ copy: 4 -> 18 ]];
v6.DockWidgetPluginGuiInfo = function(v51)
    local v52 = v0(v51);
    if v52 == l_v7_13 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_13, v52);
    end;
end;
v7 = "Faces";
local l_v7_14 = v7 --[[ copy: 4 -> 19 ]];
v6.Faces = function(v54)
    local v55 = v0(v54);
    if v55 == l_v7_14 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_14, v55);
    end;
end;
v7 = "Instance";
local l_v7_15 = v7 --[[ copy: 4 -> 20 ]];
v6.Instance = function(v57)
    local v58 = v0(v57);
    if v58 == l_v7_15 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_15, v58);
    end;
end;
v7 = "NumberRange";
local l_v7_16 = v7 --[[ copy: 4 -> 21 ]];
v6.NumberRange = function(v60)
    local v61 = v0(v60);
    if v61 == l_v7_16 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_16, v61);
    end;
end;
v7 = "NumberSequence";
local l_v7_17 = v7 --[[ copy: 4 -> 22 ]];
v6.NumberSequence = function(v63)
    local v64 = v0(v63);
    if v64 == l_v7_17 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_17, v64);
    end;
end;
v7 = "NumberSequenceKeypoint";
local l_v7_18 = v7 --[[ copy: 4 -> 23 ]];
v6.NumberSequenceKeypoint = function(v66)
    local v67 = v0(v66);
    if v67 == l_v7_18 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_18, v67);
    end;
end;
v7 = "PathWaypoint";
local l_v7_19 = v7 --[[ copy: 4 -> 24 ]];
v6.PathWaypoint = function(v69)
    local v70 = v0(v69);
    if v70 == l_v7_19 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_19, v70);
    end;
end;
v7 = "PhysicalProperties";
local l_v7_20 = v7 --[[ copy: 4 -> 25 ]];
v6.PhysicalProperties = function(v72)
    local v73 = v0(v72);
    if v73 == l_v7_20 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_20, v73);
    end;
end;
v7 = "Random";
local l_v7_21 = v7 --[[ copy: 4 -> 26 ]];
v6.Random = function(v75)
    local v76 = v0(v75);
    if v76 == l_v7_21 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_21, v76);
    end;
end;
v7 = "Ray";
local l_v7_22 = v7 --[[ copy: 4 -> 27 ]];
v6.Ray = function(v78)
    local v79 = v0(v78);
    if v79 == l_v7_22 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_22, v79);
    end;
end;
v7 = "Rect";
local l_v7_23 = v7 --[[ copy: 4 -> 28 ]];
v6.Rect = function(v81)
    local v82 = v0(v81);
    if v82 == l_v7_23 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_23, v82);
    end;
end;
v7 = "Region3";
local l_v7_24 = v7 --[[ copy: 4 -> 29 ]];
v6.Region3 = function(v84)
    local v85 = v0(v84);
    if v85 == l_v7_24 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_24, v85);
    end;
end;
v7 = "Region3int16";
local l_v7_25 = v7 --[[ copy: 4 -> 30 ]];
v6.Region3int16 = function(v87)
    local v88 = v0(v87);
    if v88 == l_v7_25 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_25, v88);
    end;
end;
v7 = "TweenInfo";
local l_v7_26 = v7 --[[ copy: 4 -> 31 ]];
v6.TweenInfo = function(v90)
    local v91 = v0(v90);
    if v91 == l_v7_26 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_26, v91);
    end;
end;
v7 = "UDim";
local l_v7_27 = v7 --[[ copy: 4 -> 32 ]];
v6.UDim = function(v93)
    local v94 = v0(v93);
    if v94 == l_v7_27 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_27, v94);
    end;
end;
v7 = "UDim2";
local l_v7_28 = v7 --[[ copy: 4 -> 33 ]];
v6.UDim2 = function(v96)
    local v97 = v0(v96);
    if v97 == l_v7_28 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_28, v97);
    end;
end;
v7 = "Vector2";
local l_v7_29 = v7 --[[ copy: 4 -> 34 ]];
v6.Vector2 = function(v99)
    local v100 = v0(v99);
    if v100 == l_v7_29 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_29, v100);
    end;
end;
v7 = "Vector3";
local l_v7_30 = v7 --[[ copy: 4 -> 35 ]];
v6.Vector3 = function(v102)
    local v103 = v0(v102);
    if v103 == l_v7_30 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_30, v103);
    end;
end;
v7 = "Vector3int16";
local l_v7_31 = v7 --[[ copy: 4 -> 36 ]];
v6.Vector3int16 = function(v105)
    local v106 = v0(v105);
    if v106 == l_v7_31 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_31, v106);
    end;
end;
v7 = "Enum";
local l_v7_32 = v7 --[[ copy: 4 -> 37 ]];
v6.Enum = function(v108)
    local v109 = v0(v108);
    if v109 == l_v7_32 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_32, v109);
    end;
end;
v7 = "EnumItem";
local l_v7_33 = v7 --[[ copy: 4 -> 38 ]];
v6.EnumItem = function(v111)
    local v112 = v0(v111);
    if v112 == l_v7_33 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_33, v112);
    end;
end;
v7 = "RBXScriptSignal";
local l_v7_34 = v7 --[[ copy: 4 -> 39 ]];
v6.RBXScriptSignal = function(v114)
    local v115 = v0(v114);
    if v115 == l_v7_34 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_34, v115);
    end;
end;
v7 = "RBXScriptConnection";
v6.RBXScriptConnection = function(v116)
    local v117 = v0(v116);
    if v117 == v7 then
        return true;
    else
        return false, string.format("%s expected, got %s", v7, v117);
    end;
end;
v6.literal = function(...)
    local v118 = select("#", ...);
    if v118 == 1 then
        local v119 = ...;
        return function(v120)
            if v120 ~= v119 then
                return false, string.format("expected %s, got %s", tostring(v119), (tostring(v120)));
            else
                return true;
            end;
        end;
    else
        local v121 = {};
        for v122 = 1, v118 do
            v121[v122] = v6.literal((select(v122, ...)));
        end;
        return v6.union(unpack(v121));
    end;
end;
v6.exactly = v6.literal;
v6.keyOf = function(v123)
    local v124 = {};
    for v125 in pairs(v123) do
        v124[#v124 + 1] = v125;
    end;
    return v6.literal(unpack(v124));
end;
v6.valueOf = function(v126)
    local v127 = {};
    for _, v129 in pairs(v126) do
        v127[#v127 + 1] = v129;
    end;
    return v6.literal(unpack(v127));
end;
v6.integer = function(v130)
    local v131, v132 = v6.number(v130);
    if v131 then
        if v130 % 1 == 0 then
            return true;
        else
            return false, string.format("integer expected, got %s", v130);
        end;
    else
        return false, v132 or "";
    end;
end;
v6.numberMin = function(v133)
    return function(v134)
        local v135, v136 = v6.number(v134);
        if v135 then
            if v133 <= v134 then
                return true;
            else
                return false, string.format("number >= %s expected, got %s", v133, v134);
            end;
        else
            return false, v136 or "";
        end;
    end;
end;
v6.numberMax = function(v137)
    return function(v138)
        local v139, v140 = v6.number(v138);
        if v139 then
            if v138 <= v137 then
                return true;
            else
                return false, string.format("number <= %s expected, got %s", v137, v138);
            end;
        else
            return false, v140;
        end;
    end;
end;
v6.numberMinExclusive = function(v141)
    return function(v142)
        local v143, v144 = v6.number(v142);
        if v143 then
            if v141 < v142 then
                return true;
            else
                return false, string.format("number > %s expected, got %s", v141, v142);
            end;
        else
            return false, v144 or "";
        end;
    end;
end;
v6.numberMaxExclusive = function(v145)
    return function(v146)
        local v147, v148 = v6.number(v146);
        if v147 then
            if v146 < v145 then
                return true;
            else
                return false, string.format("number < %s expected, got %s", v145, v146);
            end;
        else
            return false, v148 or "";
        end;
    end;
end;
v6.numberPositive = v6.numberMinExclusive(0);
v6.numberNegative = v6.numberMaxExclusive(0);
v6.numberConstrained = function(v149, v150)
    assert(v6.number(v149) and v6.number(v150));
    local v151 = v6.numberMin(v149);
    local v152 = v6.numberMax(v150);
    return function(v153)
        local v154, v155 = v151(v153);
        if v154 then
            local v156, v157 = v152(v153);
            if v156 then
                return true;
            else
                return false, v157 or "";
            end;
        else
            return false, v155 or "";
        end;
    end;
end;
v6.numberConstrainedExclusive = function(v158, v159)
    assert(v6.number(v158) and v6.number(v159));
    local v160 = v6.numberMinExclusive(v158);
    local v161 = v6.numberMaxExclusive(v159);
    return function(v162)
        local v163, v164 = v160(v162);
        if v163 then
            local v165, v166 = v161(v162);
            if v165 then
                return true;
            else
                return false, v166 or "";
            end;
        else
            return false, v164 or "";
        end;
    end;
end;
v6.match = function(v167)
    assert(v6.string(v167));
    return function(v168)
        local v169, v170 = v6.string(v168);
        if v169 then
            if string.match(v168, v167) == nil then
                return false, string.format("\"%s\" failed to match pattern \"%s\"", v168, v167);
            else
                return true;
            end;
        else
            return false, v170;
        end;
    end;
end;
v6.optional = function(v171)
    assert(v6.callback(v171));
    return function(v172)
        if v172 == nil then
            return true;
        else
            local v173, v174 = v171(v172);
            if not v173 then
                return false, string.format("(optional) %s", v174 or "");
            else
                return true;
            end;
        end;
    end;
end;
v6.tuple = function(...)
    local v175 = {
        ...
    };
    return function(...)
        local v176 = {
            ...
        };
        for v177 = 1, #v175 do
            local v178, v179 = v175[v177](v176[v177]);
            if v178 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v177, v179 or "");
            end;
        end;
        return true;
    end;
end;
v6.keys = function(v180)
    assert(v6.callback(v180));
    return function(v181)
        local v182, v183 = v6.table(v181);
        if v182 == false then
            return false, v183 or "";
        else
            for v184 in pairs(v181) do
                local v185, v186 = v180(v184);
                if v185 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v184), v186 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.values = function(v187)
    assert(v6.callback(v187));
    return function(v188)
        local v189, v190 = v6.table(v188);
        if v189 == false then
            return false, v190 or "";
        else
            for v191, v192 in pairs(v188) do
                local v193, v194 = v187(v192);
                if v193 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v191), v194 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.map = function(v195, v196)
    assert(v6.callback(v195), v6.callback(v196));
    local v197 = v6.keys(v195);
    local v198 = v6.values(v196);
    return function(v199)
        local v200, v201 = v197(v199);
        if v200 then
            local v202, v203 = v198(v199);
            if v202 then
                return true;
            else
                return false, v203 or "";
            end;
        else
            return false, v201 or "";
        end;
    end;
end;
local v204 = v6.keys(v6.integer);
local l_v204_0 = v204 --[[ copy: 3 -> 40 ]];
v6.array = function(v206)
    assert(v6.callback(v206));
    local v207 = v6.values(v206);
    return function(v208)
        local v209, v210 = l_v204_0(v208);
        if v209 == false then
            return false, string.format("[array] %s", v210 or "");
        else
            local v211 = 0;
            for _, _ in ipairs(v208) do
                v211 = v211 + 1;
            end;
            for v214 in pairs(v208) do
                if not (v214 >= 1) or v211 < v214 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v214)));
                end;
            end;
            local v215, v216 = v207(v208);
            if v215 then
                return true;
            else
                return false, string.format("[array] %s", v216 or "");
            end;
        end;
    end;
end;
v204 = v6.array(v6.callback);
local l_v204_1 = v204 --[[ copy: 3 -> 41 ]];
v6.union = function(...)
    local v218 = {
        ...
    };
    assert(l_v204_1(v218));
    return function(v219)
        for _, v221 in pairs(v218) do
            if v221(v219) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v6.some = v6.union;
v6.intersection = function(...)
    local v222 = {
        ...
    };
    assert(l_v204_1(v222));
    return function(v223)
        for _, v225 in pairs(v222) do
            local v226, v227 = v225(v223);
            if not v226 then
                return false, v227 or "";
            end;
        end;
        return true;
    end;
end;
v6.every = v6.intersection;
v204 = v6.map(v6.any, v6.callback);
local l_v204_2 = v204 --[[ copy: 3 -> 42 ]];
v6.interface = function(v229)
    assert(l_v204_2(v229));
    return function(v230)
        local v231, v232 = v6.table(v230);
        if v231 == false then
            return false, v232 or "";
        else
            for v233, v234 in pairs(v229) do
                local v235, v236 = v234(v230[v233]);
                if v235 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v233), v236 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.strictInterface = function(v237)
    assert(l_v204_2(v237));
    return function(v238)
        local v239, v240 = v6.table(v238);
        if v239 == false then
            return false, v240 or "";
        else
            for v241, v242 in pairs(v237) do
                local v243, v244 = v242(v238[v241]);
                if v243 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v241), v244 or "");
                end;
            end;
            for v245 in pairs(v238) do
                if not v237[v245] then
                    return false, string.format("[interface] unexpected field '%s'", (tostring(v245)));
                end;
            end;
            return true;
        end;
    end;
end;
v6.instanceOf = function(v246, v247)
    assert(v6.string(v246));
    local v248 = nil;
    if v247 ~= nil then
        v248 = v6.children(v247);
    end;
    return function(v249)
        local v250, v251 = v6.Instance(v249);
        if v250 then
            if v249.ClassName ~= v246 then
                return false, string.format("%s expected, got %s", v246, v249.ClassName);
            else
                if v248 then
                    local v252, v253 = v248(v249);
                    if not v252 then
                        return false, v253;
                    end;
                end;
                return true;
            end;
        else
            return false, v251 or "";
        end;
    end;
end;
v6.instance = v6.instanceOf;
v6.instanceIsA = function(v254, v255)
    assert(v6.string(v254));
    local v256 = nil;
    if v255 ~= nil then
        v256 = v6.children(v255);
    end;
    return function(v257)
        local v258, v259 = v6.Instance(v257);
        if v258 then
            if v257:IsA(v254) then
                if v256 then
                    local v260, v261 = v256(v257);
                    if not v260 then
                        return false, v261;
                    end;
                end;
                return true;
            else
                return false, string.format("%s expected, got %s", v254, v257.ClassName);
            end;
        else
            return false, v259 or "";
        end;
    end;
end;
v6.enum = function(v262)
    assert(v6.Enum(v262));
    return function(v263)
        local v264, v265 = v6.EnumItem(v263);
        if v264 then
            if v263.EnumType == v262 then
                return true;
            else
                return false, string.format("enum of %s expected, got enum of %s", tostring(v262), (tostring(v263.EnumType)));
            end;
        else
            return false, v265;
        end;
    end;
end;
v204 = v6.tuple(v6.callback, v6.callback);
local l_v204_3 = v204 --[[ copy: 3 -> 43 ]];
v6.wrap = function(v267, v268)
    assert(l_v204_3(v267, v268));
    return function(...)
        assert(v268(...));
        return v267(...);
    end;
end;
v6.strict = function(v269)
    return function(...)
        assert(v269(...));
    end;
end;
v204 = v6.map(v6.string, v6.callback);
v6.children = function(v270)
    assert(v204(v270));
    return function(v271)
        local v272, v273 = v6.Instance(v271);
        if v272 then
            local v274 = {};
            for _, v276 in pairs(v271:GetChildren()) do
                local l_Name_0 = v276.Name;
                if v270[l_Name_0] then
                    if not v274[l_Name_0] then
                        v274[l_Name_0] = v276;
                    else
                        return false, string.format("Cannot process multiple children with the same name \"%s\"", l_Name_0);
                    end;
                end;
            end;
            for v278, v279 in pairs(v270) do
                local v280, v281 = v279(v274[v278]);
                if not v280 then
                    return false, string.format("[%s.%s] %s", v271:GetFullName(), v278, v281 or "");
                end;
            end;
            return true;
        else
            return false, v273 or "";
        end;
    end;
end;
return v6;
