local l_Parent_0 = script.Parent.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_toJSBoolean_0 = v2.Boolean.toJSBoolean;
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v8(v6, v7)
    return rawget(v6, v7) ~= nil;
end;
local function v11(v9, v10)
    return rawget(v9, v10) ~= nil;
end;
local function v16(v12, _)
    local v14 = {};
    for v15 in pairs(v12) do
        if v12[v15] ~= nil then
            table.insert(v14, v15);
        end;
    end;
    return v14;
end;
local function v19(v17, v18)
    return l_getType_0(v18) == v17;
end;
local function v23(v20)
    if l_toJSBoolean_0(v20) and typeof(v20) == "table" then
        local l_status_0, l_result_0 = pcall(function()
            return v20.asymmetricMatch;
        end);
        if not (not l_status_0 or not (l_getType_0(l_result_0) == "function")) then
            return true;
        end;
    end;
    return false;
end;
local function _(v24, v25)
    local v26 = v23(v24);
    local v27 = v23(v25);
    if not v26 or not v27 then
        if not v26 then
            if not v27 then
                return nil;
            else
                return v25:asymmetricMatch(v24);
            end;
        else
            return v24:asymmetricMatch(v25);
        end;
    else
        return nil;
    end;
end;
local function v29(v30, v31, v32, v33, v34, v35)
    local v36 = true;
    local v37 = v23(v30);
    local v38 = v23(v31);
    local v39 = if not not v37 and v38 then nil else if v37 then v30:asymmetricMatch(v31) else if v38 then v31:asymmetricMatch(v30) else nil;
    if v39 ~= nil then
        return v39;
    else
        for _, v41 in ipairs(v34) do
            local v42 = v41(v30, v31);
            if v42 ~= nil then
                return v42;
            end;
        end;
        if not l_Object_0.is(v30, v31) then
            v37 = l_getType_0(v30);
            if v37 ~= l_getType_0(v31) then
                return false;
            elseif l_Array_0.isArray(v30) ~= l_Array_0.isArray(v31) then
                return false;
            elseif not ((v37 ~= "boolean" and v37 ~= "string") and v37 ~= "number") or v37 == "userdata" then
                return l_Object_0.is(v30, v31);
            elseif v37 == "DateTime" then
                return v30 == v31;
            elseif v37 == "regexp" then
                return tostring(v30) == tostring(v31);
            elseif not (typeof(v30) == "table") or typeof(v31) ~= "table" then
                return false;
            else
                v38 = #v32;
                while true do
                    if v38 > 0 then
                        if v32[v38] == v30 then
                            return v33[v38] == v31;
                        elseif v33[v38] == v31 then
                            return false;
                        else
                            v38 = v38 - 1;
                        end;
                    else
                        table.insert(v32, v30);
                        table.insert(v33, v31);
                        if l_Array_0.isArray(v30) and #v30 ~= #v31 then
                            return false;
                        else
                            local v43 = v16(v30, v35);
                            local v44 = #v43;
                            if #v16(v31, v35) ~= v44 then
                                return false;
                            else
                                while true do
                                    if v44 > 0 then
                                        local v45 = v43[v44];
                                        v36 = rawget(v31, v45) ~= nil and v29(v30[v45], v31[v45], v32, v33, v34, v35);
                                        if v36 then
                                            v44 = v44 - 1;
                                        else
                                            return false;
                                        end;
                                    else
                                        table.remove(v32);
                                        table.remove(v33);
                                        return v36;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        else
            return true;
        end;
    end;
end;
local function v50(v46, v47, v48, v49)
    return v29(v46, v47, {}, {}, v48 or {}, not not (v49 or false) and v8 or v11);
end;
local function v53(v51, v52)
    if not (not l_toJSBoolean_0(v51) or typeof(v51) ~= "table") then
        return v51[v52] ~= nil;
    else
        return false;
    end;
end;
local function _(v54)
    local v55 = false;
    if v54 ~= nil then
        v55 = typeof(v54) == "table";
    end;
    return v55;
end;
local function v59(v57)
    local v58 = false;
    if v57 ~= nil then
        v58 = typeof(v57) == "table";
    end;
    if v58 then
        v58 = true;
        if next(v57) ~= nil then
            v58 = not l_Array_0.isArray(v57);
        end;
    end;
    return v58;
end;
local function v60(v61, v62, v63, v64)
    v63 = v63 or {};
    v64 = v64 or {};
    if not (l_getType_0(v61) == "set") or l_getType_0(v62) ~= "set" then
        return nil;
    else
        local v65 = #v63;
        while true do
            if v65 > 0 then
                if v63[v65] == v61 then
                    return v64[v65] == v62;
                else
                    v65 = v65 - 1;
                end;
            else
                table.insert(v63, v61);
                table.insert(v64, v62);
                local function v68(v66, v67)
                    return v60(v66, v67, {
                        unpack(v63)
                    }, {
                        unpack(v64)
                    });
                end;
                if v61.size ~= nil then
                    if v61.size ~= v62.size then
                        return false;
                    elseif l_getType_0(v61) == "set" then
                        local v69 = true;
                        for _, v71 in v61:ipairs() do
                            if not v62:has(v71) then
                                local v72 = false;
                                for _, v74 in v62:ipairs() do
                                    if v50(v71, v74, {
                                        v68
                                    }) == true then
                                        v72 = true;
                                    end;
                                end;
                                if v72 == false then
                                    v69 = false;
                                    break;
                                end;
                            end;
                        end;
                        table.remove(v63);
                        table.remove(v64);
                        return v69;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v93(v75, v76)
    local function v77(v78)
        local v79 = v78 or {};
        return function(v80, v81)
            local v82 = false;
            if v81 ~= nil then
                v82 = typeof(v81) == "table";
            end;
            if v82 then
                v82 = true;
                if next(v81) ~= nil then
                    v82 = not l_Array_0.isArray(v81);
                end;
            end;
            if v82 then
                return l_Array_0.every(l_Object_0.keys(v81), function(v83)
                    local v84 = v81[v83];
                    local v85 = false;
                    if v84 ~= nil then
                        v85 = typeof(v84) == "table";
                    end;
                    if v85 then
                        v85 = true;
                        if next(v84) ~= nil then
                            v85 = not l_Array_0.isArray(v84);
                        end;
                    end;
                    if v85 then
                        if not v79[v81[v83]] then
                            v79[v81[v83]] = true;
                        else
                            return v50(v80[v83], v81[v83], {
                                v60
                            });
                        end;
                    end;
                    v85 = false;
                    if v80 ~= nil then
                        v84 = v80;
                        v85 = if not (not l_toJSBoolean_0(v84) or typeof(v84) ~= "table") then v84[v83] ~= nil else false and v50(v80[v83], v81[v83], {
                            v77(v79)
                        });
                    end;
                    v79[v81[v83]] = nil;
                    return v85;
                end);
            else
                return nil;
            end;
        end;
    end;
    local v86 = {};
    return (function(v87, v88)
        local v89 = false;
        if v88 ~= nil then
            v89 = typeof(v88) == "table";
        end;
        if v89 then
            v89 = true;
            if next(v88) ~= nil then
                v89 = not l_Array_0.isArray(v88);
            end;
        end;
        if v89 then
            return l_Array_0.every(l_Object_0.keys(v88), function(v90)
                local v91 = v88[v90];
                local v92 = false;
                if v91 ~= nil then
                    v92 = typeof(v91) == "table";
                end;
                if v92 then
                    v92 = true;
                    if next(v91) ~= nil then
                        v92 = not l_Array_0.isArray(v91);
                    end;
                end;
                if v92 then
                    if not v86[v88[v90]] then
                        v86[v88[v90]] = true;
                    else
                        return v50(v87[v90], v88[v90], {
                            v60
                        });
                    end;
                end;
                v92 = false;
                if v87 ~= nil then
                    v91 = v87;
                    v92 = if not (not l_toJSBoolean_0(v91) or typeof(v91) ~= "table") then v91[v90] ~= nil else false and v50(v87[v90], v88[v90], {
                        v77(v86)
                    });
                end;
                v86[v88[v90]] = nil;
                return v92;
            end);
        else
            return nil;
        end;
    end)(v75, v76);
end;
local function v94(v95, v96, v97)
    local v98 = v97 or {};
    if not l_Array_0.isArray(v95) then
        if l_getType_0(v95) == "DateTime" then
            return v95;
        else
            local v99 = false;
            if v95 ~= nil then
                v99 = typeof(v95) == "table";
            end;
            if v99 then
                v99 = false;
                if v96 ~= nil then
                    v99 = typeof(v96) == "table";
                end;
                if v99 then
                    if not v50(v95, v96, {
                        v60, 
                        v93
                    }) then
                        v99 = {};
                        v98[v95] = v99;
                        for _, v103 in ipairs(l_Array_0.filter(l_Object_0.keys(v95), function(v100)
                            local l_v96_0 = v96;
                            if not (not l_toJSBoolean_0(l_v96_0) or typeof(l_v96_0) ~= "table") then
                                return l_v96_0[v100] ~= nil;
                            else
                                return false;
                            end;
                        end)) do
                            if v98[v95[v103]] ~= nil then
                                v99[v103] = v98[v95[v103]];
                            else
                                v99[v103] = v94(v95[v103], v96[v103], v98);
                            end;
                        end;
                        if #l_Object_0.keys(v99) > 0 then
                            return v99;
                        end;
                    else
                        return v96;
                    end;
                end;
            end;
        end;
    elseif l_Array_0.isArray(v96) and #v96 == #v95 then
        local v104 = {};
        for v105, v106 in ipairs(v96) do
            table.insert(v104, v94(v95[v105], v106));
        end;
        return v104;
    end;
    return v95;
end;
return {
    equals = v50, 
    isA = v19, 
    isAsymmetric = v23, 
    getObjectSubset = v94, 
    iterableEquality = v60, 
    subsetEquality = v93, 
    isObjectWithKeys = v59, 
    hasPropertyInObject = v53
};
