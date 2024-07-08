local _ = require(script.Parent.Parent.LuauPolyfill);
local v1 = {
    env = {}, 
    cwd = function()
        return "";
    end
};
local v2 = {};
v2.__index = v2;
v2.new = function()
    return (setmetatable({}, v2));
end;
v2.initialize = function(v3, v4, v5)
    v3.root = v4;
    v3.sep = v5;
end;
v2.getRoot = function(v6)
    return v6.root;
end;
v2.getSep = function(v7)
    return v7.sep;
end;
v2.pathsEqual = function(_, v9, v10)
    return v9 == v10;
end;
v2._splitPath = function(v11, v12)
    v12 = v11:normalizeSeparators(v12);
    local v13 = "";
    if not (not v11:isAbsolute(v12) and not v11:isDriveRelative(v12)) then
        v13 = v11:getRoot(v12);
        v12 = v12:sub(v13:len() + 1);
    end;
    local v14 = v12:match("[" .. v11.sep .. "]*$");
    if v14 then
        v12 = v12:sub(1, -v14:len() - 1);
    end;
    local v15 = v12:match("[^" .. v11.sep .. "]+$") or "";
    return v13, not not v15 and v12:sub(1, -v15:len() - 1) or v12, v15;
end;
v2._normalizeArray = function(_, v17, v18)
    local v19 = 0;
    for v20 = #v17, 1, -1 do
        local v21 = v17[v20];
        if v21 == "." then
            table.remove(v17, v20);
        elseif v21 == ".." then
            table.remove(v17, v20);
            v19 = v19 + 1;
        elseif v19 > 0 then
            table.remove(v17, v20);
            v19 = v19 - 1;
        end;
    end;
    if v18 then
        while v19 > 0 do
            table.insert(v17, 1, "..");
            v19 = v19 - 1;
        end;
    end;
end;
v2._splitBySeparators = function(v22, v23)
    local v24 = {};
    for v25 in v23:gmatch("[^" .. v22.sep .. "]+") do
        v24[#v24 + 1] = v25;
    end;
    return v24;
end;
v2.normalize = function(v26, v27)
    v27 = v26:normalizeSeparators(v27);
    local v28 = v26:isAbsolute(v27);
    local v29 = not not v28 and v26:getRoot(v27) or nil;
    local v30 = v27:sub(#v27) == v26.sep;
    if v29 then
        v27 = v27:sub(v29:len() + 1);
    end;
    local v31 = v26:_splitBySeparators(v27);
    v26:_normalizeArray(v31, not v28);
    v27 = table.concat(v31, v26.sep);
    if #v27 == 0 then
        if not v28 then
            return ".";
        else
            return v29;
        end;
    else
        if v30 then
            v27 = v27 .. v26.sep;
        end;
        if v28 then
            v27 = v29 .. v27;
        end;
        return v27;
    end;
end;
v2._filterparts = function(v32, v33)
    local v34 = {};
    for _, v36 in ipairs(v33) do
        if v36 and v36 ~= "" then
            table.insert(v34, v36);
        end;
    end;
    for v37, v38 in ipairs(v34) do
        if v37 > 1 then
            while v38:sub(1, 1) == v32.sep do
                v38 = v38:sub(2);
            end;
        end;
        if v37 < #v34 then
            while v38:sub(#v38) == v32.sep do
                v38 = v38:sub(1, #v38 - 1);
            end;
        end;
        v34[v37] = v38;
    end;
    return v34;
end;
v2._rawjoin = function(v39, v40)
    return table.concat(v40, v39.sep);
end;
v2._filteredjoin = function(v41, ...)
    local v42 = {
        ...
    };
    for v43, v44 in ipairs(v42) do
        v42[v43] = v41:normalizeSeparators(v44);
    end;
    local v45 = v41:_filterparts(v42);
    return v41:_rawjoin(v45), v45;
end;
v2.join = function(v46, ...)
    return v46:normalize((v46:_filteredjoin(...)));
end;
v2.resolve = function(v47, ...)
    local v48 = {
        ...
    };
    local v49 = "";
    local v50 = nil;
    local v51 = false;
    for v52 = #v48, 1, -1 do
        local v53 = v48[v52];
        if v53 and v53 ~= "" then
            local v54 = v50 and v47:getRoot(v53);
            if v47:isDriveRelative(v53) then
                v54 = v54 or v47:getRoot(v53);
                v50 = v50 or v54;
                v53 = v53:sub(v54:len() + 1);
            end;
            if not v54 or v50:sub(1, 2) == v54:sub(1, 2) then
                v49 = v47:join(v47:normalize(v53), v49);
                if v47:isAbsolute(v49) then
                    v51 = true;
                    break;
                end;
            end;
        end;
    end;
    if not v51 then
        if not v50 then
            v49 = v47:join(v1.cwd(), v49);
        else
            local v55 = v1.env["=" .. v50];
            v49 = if not not v55 and v47:pathsEqual(v55:sub(1, 2), v50) then v47:join(v55, v49) else v47:join(v50, v49);
        end;
    end;
    local v56 = v49:match("[" .. v47.sep .. "]*$");
    if v56 then
        v49 = v49:sub(1, -v56:len() - 1);
    end;
    return v49;
end;
v2._commonParts = function(v57, ...)
    local v58 = {};
    local v59 = {
        ...
    };
    local v60 = {};
    for _, v62 in ipairs(v59) do
        table.insert(v60, v57:_splitBySeparators(v62));
    end;
    for v63 = 1, #v60[1] do
        local v64 = v60[1][v63];
        for v65 = 2, #v60 do
            if not v57:pathsEqual(v64, v60[v65][v63]) then
                return v58;
            end;
        end;
        table.insert(v58, v64);
    end;
    return v58;
end;
v2.relative = function(v66, v67, v68)
    local v69, v70, v71 = v66:_splitPath(v67);
    local v72, v73, v74 = v66:_splitPath(v68);
    if v66:pathsEqual(v69, v72) then
        local v75 = v70 .. v71;
        local v76 = v73 .. v74;
        local v77 = v66:_commonParts(v75, v76);
        local v78 = v66:_splitBySeparators(v75);
        local v79 = v66:_splitBySeparators(v76);
        local v80 = {};
        if #v77 > 0 then
            for _ = #v77, #v78 - 1 do
                table.insert(v80, "..");
            end;
        end;
        for v82 = #v77 + 1, #v79 do
            table.insert(v80, v79[v82]);
        end;
        return v66:_rawjoin(v80);
    else
        return v68;
    end;
end;
v2.dirname = function(v83, v84)
    v84 = v83:normalizeSeparators(v84);
    if v84:sub(v84:len()) == v83.sep then
        v84 = v84:sub(1, -2);
    end;
    local v85, v86 = v83:_splitPath(v84);
    if #v86 > 0 then
        return v85 .. v86:sub(1, #v86 - 1);
    elseif #v85 > 0 then
        return v85;
    else
        return ".";
    end;
end;
v2.basename = function(v87, v88, v89)
    local _, _, v92 = v87:_splitPath(v88);
    if v89 then
        local v93 = v92:find(v89:gsub(".", ".") .. "$");
        if v93 then
            v92 = v92:sub(1, v93 - 1);
        end;
    end;
    return v92;
end;
v2.extname = function(v94, v95)
    local v96 = v94:basename(v95);
    if v96 == ".." then
        return "";
    else
        return v96:match(".(%.[^.]*)$") or "";
    end;
end;
v2.isDriveRelative = function(_)
    return false;
end;
v2.isAbsolute = function(v98, v99)
    return v99:sub(1, v98.root:len()) == v98.root;
end;
v2.normalizeSeparators = function(_, v101)
    return v101;
end;
return {
    Path = v2
};
