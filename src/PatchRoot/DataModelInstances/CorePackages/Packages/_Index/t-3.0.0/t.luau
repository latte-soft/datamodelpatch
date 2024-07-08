local v7 = {
    type = function(v0)
        return function(v1)
            local v2 = type(v1);
            if v2 == v0 then
                return true;
            else
                return false, string.format("%s expected, got %s", v0, v2);
            end;
        end;
    end, 
    typeof = function(v3)
        return function(v4)
            local v5 = typeof(v4);
            if v5 == v3 then
                return true;
            else
                return false, string.format("%s expected, got %s", v3, v5);
            end;
        end;
    end, 
    any = function(v6)
        if v6 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
v7.boolean = v7.typeof("boolean");
v7.thread = v7.typeof("thread");
v7.callback = v7.typeof("function");
v7["function"] = v7.callback;
v7.none = v7.typeof("nil");
v7["nil"] = v7.none;
v7.string = v7.typeof("string");
v7.table = v7.typeof("table");
v7.userdata = v7.type("userdata");
v7.number = function(v8)
    local v9 = typeof(v8);
    if v9 == "number" then
        if v8 == v8 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v9);
    end;
end;
v7.nan = function(v10)
    local v11 = typeof(v10);
    if v11 == "number" then
        if v10 ~= v10 then
            return true;
        else
            return false, "unexpected non-NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v11);
    end;
end;
v7.Axes = v7.typeof("Axes");
v7.BrickColor = v7.typeof("BrickColor");
v7.CatalogSearchParams = v7.typeof("CatalogSearchParams");
v7.CFrame = v7.typeof("CFrame");
v7.Color3 = v7.typeof("Color3");
v7.ColorSequence = v7.typeof("ColorSequence");
v7.ColorSequenceKeypoint = v7.typeof("ColorSequenceKeypoint");
v7.DateTime = v7.typeof("DateTime");
v7.DockWidgetPluginGuiInfo = v7.typeof("DockWidgetPluginGuiInfo");
v7.Enum = v7.typeof("Enum");
v7.EnumItem = v7.typeof("EnumItem");
v7.Enums = v7.typeof("Enums");
v7.Faces = v7.typeof("Faces");
v7.Instance = v7.typeof("Instance");
v7.NumberRange = v7.typeof("NumberRange");
v7.NumberSequence = v7.typeof("NumberSequence");
v7.NumberSequenceKeypoint = v7.typeof("NumberSequenceKeypoint");
v7.PathWaypoint = v7.typeof("PathWaypoint");
v7.PhysicalProperties = v7.typeof("PhysicalProperties");
v7.Random = v7.typeof("Random");
v7.Ray = v7.typeof("Ray");
v7.RaycastParams = v7.typeof("RaycastParams");
v7.RaycastResult = v7.typeof("RaycastResult");
v7.RBXScriptConnection = v7.typeof("RBXScriptConnection");
v7.RBXScriptSignal = v7.typeof("RBXScriptSignal");
v7.Rect = v7.typeof("Rect");
v7.Region3 = v7.typeof("Region3");
v7.Region3int16 = v7.typeof("Region3int16");
v7.TweenInfo = v7.typeof("TweenInfo");
v7.UDim = v7.typeof("UDim");
v7.UDim2 = v7.typeof("UDim2");
v7.Vector2 = v7.typeof("Vector2");
v7.Vector2int16 = v7.typeof("Vector2int16");
v7.Vector3 = v7.typeof("Vector3");
v7.Vector3int16 = v7.typeof("Vector3int16");
v7.literal = function(...)
    local v12 = select("#", ...);
    if v12 == 1 then
        local v13 = ...;
        return function(v14)
            if v14 ~= v13 then
                return false, string.format("expected %s, got %s", tostring(v13), (tostring(v14)));
            else
                return true;
            end;
        end;
    else
        local v15 = {};
        for v16 = 1, v12 do
            v15[v16] = v7.literal((select(v16, ...)));
        end;
        return v7.union(table.unpack(v15, 1, v12));
    end;
end;
v7.exactly = v7.literal;
v7.keyOf = function(v17)
    local v18 = {};
    local v19 = 0;
    for v20 in pairs(v17) do
        v19 = v19 + 1;
        v18[v19] = v20;
    end;
    return v7.literal(table.unpack(v18, 1, v19));
end;
v7.valueOf = function(v21)
    local v22 = {};
    local v23 = 0;
    for _, v25 in pairs(v21) do
        v23 = v23 + 1;
        v22[v23] = v25;
    end;
    return v7.literal(table.unpack(v22, 1, v23));
end;
v7.integer = function(v26)
    local v27, v28 = v7.number(v26);
    if v27 then
        if v26 % 1 == 0 then
            return true;
        else
            return false, string.format("integer expected, got %s", v26);
        end;
    else
        return false, v28 or "";
    end;
end;
v7.numberMin = function(v29)
    return function(v30)
        local v31, v32 = v7.number(v30);
        if v31 then
            if v29 <= v30 then
                return true;
            else
                return false, string.format("number >= %s expected, got %s", v29, v30);
            end;
        else
            return false, v32 or "";
        end;
    end;
end;
v7.numberMax = function(v33)
    return function(v34)
        local v35, v36 = v7.number(v34);
        if v35 then
            if v34 <= v33 then
                return true;
            else
                return false, string.format("number <= %s expected, got %s", v33, v34);
            end;
        else
            return false, v36;
        end;
    end;
end;
v7.numberMinExclusive = function(v37)
    return function(v38)
        local v39, v40 = v7.number(v38);
        if v39 then
            if v37 < v38 then
                return true;
            else
                return false, string.format("number > %s expected, got %s", v37, v38);
            end;
        else
            return false, v40 or "";
        end;
    end;
end;
v7.numberMaxExclusive = function(v41)
    return function(v42)
        local v43, v44 = v7.number(v42);
        if v43 then
            if v42 < v41 then
                return true;
            else
                return false, string.format("number < %s expected, got %s", v41, v42);
            end;
        else
            return false, v44 or "";
        end;
    end;
end;
v7.numberPositive = v7.numberMinExclusive(0);
v7.numberNegative = v7.numberMaxExclusive(0);
v7.numberConstrained = function(v45, v46)
    assert(v7.number(v45));
    assert(v7.number(v46));
    local v47 = v7.numberMin(v45);
    local v48 = v7.numberMax(v46);
    return function(v49)
        local v50, v51 = v47(v49);
        if v50 then
            local v52, v53 = v48(v49);
            if v52 then
                return true;
            else
                return false, v53 or "";
            end;
        else
            return false, v51 or "";
        end;
    end;
end;
v7.numberConstrainedExclusive = function(v54, v55)
    assert(v7.number(v54));
    assert(v7.number(v55));
    local v56 = v7.numberMinExclusive(v54);
    local v57 = v7.numberMaxExclusive(v55);
    return function(v58)
        local v59, v60 = v56(v58);
        if v59 then
            local v61, v62 = v57(v58);
            if v61 then
                return true;
            else
                return false, v62 or "";
            end;
        else
            return false, v60 or "";
        end;
    end;
end;
v7.match = function(v63)
    assert(v7.string(v63));
    return function(v64)
        local v65, v66 = v7.string(v64);
        if v65 then
            if string.match(v64, v63) == nil then
                return false, string.format("%q failed to match pattern %q", v64, v63);
            else
                return true;
            end;
        else
            return false, v66;
        end;
    end;
end;
v7.optional = function(v67)
    assert(v7.callback(v67));
    return function(v68)
        if v68 == nil then
            return true;
        else
            local v69, v70 = v67(v68);
            if not v69 then
                return false, string.format("(optional) %s", v70 or "");
            else
                return true;
            end;
        end;
    end;
end;
v7.tuple = function(...)
    local v71 = {
        ...
    };
    return function(...)
        local v72 = {
            ...
        };
        for v73, v74 in ipairs(v71) do
            local v75, v76 = v74(v72[v73]);
            if v75 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v73, v76 or "");
            end;
        end;
        return true;
    end;
end;
v7.keys = function(v77)
    assert(v7.callback(v77));
    return function(v78)
        local v79, v80 = v7.table(v78);
        if v79 == false then
            return false, v80 or "";
        else
            for v81 in pairs(v78) do
                local v82, v83 = v77(v81);
                if v82 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v81), v83 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.values = function(v84)
    assert(v7.callback(v84));
    return function(v85)
        local v86, v87 = v7.table(v85);
        if v86 == false then
            return false, v87 or "";
        else
            for v88, v89 in pairs(v85) do
                local v90, v91 = v84(v89);
                if v90 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v88), v91 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.map = function(v92, v93)
    assert(v7.callback(v92));
    assert(v7.callback(v93));
    local v94 = v7.keys(v92);
    local v95 = v7.values(v93);
    return function(v96)
        local v97, v98 = v94(v96);
        if v97 then
            local v99, v100 = v95(v96);
            if v99 then
                return true;
            else
                return false, v100 or "";
            end;
        else
            return false, v98 or "";
        end;
    end;
end;
v7.set = function(v101)
    return v7.map(v101, v7.literal(true));
end;
local v102 = v7.keys(v7.integer);
local l_v102_0 = v102 --[[ copy: 1 -> 2 ]];
v7.array = function(v104)
    assert(v7.callback(v104));
    local v105 = v7.values(v104);
    return function(v106)
        local v107, v108 = l_v102_0(v106);
        if v107 == false then
            return false, string.format("[array] %s", v108 or "");
        else
            local v109 = 0;
            for _ in ipairs(v106) do
                v109 = v109 + 1;
            end;
            for v111 in pairs(v106) do
                if not (v111 >= 1) or v109 < v111 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v111)));
                end;
            end;
            local v112, v113 = v105(v106);
            if v112 then
                return true;
            else
                return false, string.format("[array] %s", v113 or "");
            end;
        end;
    end;
end;
v7.strictArray = function(...)
    local v114 = {
        ...
    };
    assert(v7.array(v7.callback)(v114));
    return function(v115)
        local v116, v117 = l_v102_0(v115);
        if v116 == false then
            return false, string.format("[strictArray] %s", v117 or "");
        elseif #v114 < #v115 then
            return false, string.format("[strictArray] Array size exceeds limit of %d", #v114);
        else
            for v118, v119 in pairs(v114) do
                local v120, v121 = v119(v115[v118]);
                if not v120 then
                    return false, string.format("[strictArray] Array index #%d - %s", v118, v121);
                end;
            end;
            return true;
        end;
    end;
end;
v102 = v7.array(v7.callback);
local l_v102_1 = v102 --[[ copy: 1 -> 3 ]];
v7.union = function(...)
    local v123 = {
        ...
    };
    assert(l_v102_1(v123));
    return function(v124)
        for _, v126 in ipairs(v123) do
            if v126(v124) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v7.some = v7.union;
v7.intersection = function(...)
    local v127 = {
        ...
    };
    assert(l_v102_1(v127));
    return function(v128)
        for _, v130 in ipairs(v127) do
            local v131, v132 = v130(v128);
            if not v131 then
                return false, v132 or "";
            end;
        end;
        return true;
    end;
end;
v7.every = v7.intersection;
v102 = v7.map(v7.any, v7.callback);
local l_v102_2 = v102 --[[ copy: 1 -> 4 ]];
v7.interface = function(v134)
    assert(l_v102_2(v134));
    return function(v135)
        local v136, v137 = v7.table(v135);
        if v136 == false then
            return false, v137 or "";
        else
            for v138, v139 in pairs(v134) do
                local v140, v141 = v139(v135[v138]);
                if v140 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v138), v141 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v7.strictInterface = function(v142)
    assert(l_v102_2(v142));
    return function(v143)
        local v144, v145 = v7.table(v143);
        if v144 == false then
            return false, v145 or "";
        else
            for v146, v147 in pairs(v142) do
                local v148, v149 = v147(v143[v146]);
                if v148 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v146), v149 or "");
                end;
            end;
            for v150 in pairs(v143) do
                if not v142[v150] then
                    return false, string.format("[interface] unexpected field %q", (tostring(v150)));
                end;
            end;
            return true;
        end;
    end;
end;
v7.instanceOf = function(v151, v152)
    assert(v7.string(v151));
    local v153 = nil;
    if v152 ~= nil then
        v153 = v7.children(v152);
    end;
    return function(v154)
        local v155, v156 = v7.Instance(v154);
        if v155 then
            if v154.ClassName ~= v151 then
                return false, string.format("%s expected, got %s", v151, v154.ClassName);
            else
                if v153 then
                    local v157, v158 = v153(v154);
                    if not v157 then
                        return false, v158;
                    end;
                end;
                return true;
            end;
        else
            return false, v156 or "";
        end;
    end;
end;
v7.instance = v7.instanceOf;
v7.instanceIsA = function(v159, v160)
    assert(v7.string(v159));
    local v161 = nil;
    if v160 ~= nil then
        v161 = v7.children(v160);
    end;
    return function(v162)
        local v163, v164 = v7.Instance(v162);
        if v163 then
            if v162:IsA(v159) then
                if v161 then
                    local v165, v166 = v161(v162);
                    if not v165 then
                        return false, v166;
                    end;
                end;
                return true;
            else
                return false, string.format("%s expected, got %s", v159, v162.ClassName);
            end;
        else
            return false, v164 or "";
        end;
    end;
end;
v7.enum = function(v167)
    assert(v7.Enum(v167));
    return function(v168)
        local v169, v170 = v7.EnumItem(v168);
        if v169 then
            if v168.EnumType == v167 then
                return true;
            else
                return false, string.format("enum of %s expected, got enum of %s", tostring(v167), (tostring(v168.EnumType)));
            end;
        else
            return false, v170;
        end;
    end;
end;
v102 = v7.tuple(v7.callback, v7.callback);
local l_v102_3 = v102 --[[ copy: 1 -> 5 ]];
v7.wrap = function(v172, v173)
    assert(l_v102_3(v172, v173));
    return function(...)
        assert(v173(...));
        return v172(...);
    end;
end;
v7.strict = function(v174)
    return function(...)
        assert(v174(...));
    end;
end;
v102 = v7.map(v7.string, v7.callback);
v7.children = function(v175)
    assert(v102(v175));
    return function(v176)
        local v177, v178 = v7.Instance(v176);
        if v177 then
            local v179 = {};
            for _, v181 in ipairs(v176:GetChildren()) do
                local l_Name_0 = v181.Name;
                if v175[l_Name_0] then
                    if not v179[l_Name_0] then
                        v179[l_Name_0] = v181;
                    else
                        return false, string.format("Cannot process multiple children with the same name %q", l_Name_0);
                    end;
                end;
            end;
            for v183, v184 in pairs(v175) do
                local v185, v186 = v184(v179[v183]);
                if not v185 then
                    return false, string.format("[%s.%s] %s", v176:GetFullName(), v183, v186 or "");
                end;
            end;
            return true;
        else
            return false, v178 or "";
        end;
    end;
end;
return v7;
