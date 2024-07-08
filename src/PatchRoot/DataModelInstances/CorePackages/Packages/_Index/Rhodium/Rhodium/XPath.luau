local v0 = {
    __type = "XPath"
};
v0.__index = v0;
local v1 = {};
for v2 = 1, 6 do
    v1[("\\.=[],"):sub(v2, v2)] = true;
end;
v0.addSlash = function(v3)
    local v4 = {};
    for v5 = 1, v3:len() do
        local v6 = v3:sub(v5, v5);
        if v1[v6] then
            table.insert(v4, "\\");
        end;
        table.insert(v4, v6);
    end;
    return table.concat(v4);
end;
v0.removeSlash = function(v7)
    local v8 = {};
    local v9 = false;
    for v10 = 1, v7:len() do
        local v11 = v7:sub(v10, v10);
        if v11 == "\\" and v9 == false then
            v9 = true;
        else
            if v9 == true then
                v9 = false;
            end;
            table.insert(v8, v11);
        end;
    end;
    return table.concat(v8);
end;
local function v19(v12, v13)
    local v14 = {};
    if not (v12 ~= nil) or v12 == "" then
        return v14;
    else
        local v15 = false;
        local v16 = 1;
        for v17 = 1, v12:len() do
            local v18 = v12:sub(v17, v17);
            if v18 == "\\" and v15 == false then
                v15 = true;
            elseif v15 == true then
                v15 = false;
            elseif v18 == v13 then
                table.insert(v14, (v12:sub(v16, v17 - 1)));
                v16 = v17 + 1;
            end;
        end;
        table.insert(v14, (v12:sub(v16, v12:len())));
        return v14;
    end;
end;
local function v20(v21)
    local v22 = {};
    for v23, v24 in pairs(v21) do
        if type(v24) == "table" then
            v22[v23] = v20(v24);
        else
            v22[v23] = v24;
        end;
    end;
    return v22;
end;
v0.new = function(v25, v26)
    local v27 = {
        data = {}, 
        root = v26, 
        waitDelay = 0.2, 
        waitTimeOut = 2
    };
    setmetatable(v27, v0);
    if type(v25) == "string" then
        v27:fromString(v25);
        return v27;
    else
        if type(v25) == "userdata" then
            local l_v25_0 = v25;
            while l_v25_0 do
                local l_Name_0 = l_v25_0.Name;
                if l_v25_0.ClassName == "DataModel" then
                    l_Name_0 = "game";
                end;
                table.insert(v27.data, 1, {
                    name = l_Name_0
                });
                l_v25_0 = l_v25_0.Parent;
            end;
        elseif type(v25) == "table" and v25.__type == v0.__type then
            return v25:copy();
        else
            error(string.format("unknown parameter %s", (tostring(v25))));
        end;
        return v27;
    end;
end;
v0.size = function(v30)
    return #v30.data;
end;
v0.mergeFilter = function(v31, v32, v33)
    if v31:size() < v32 then
        error("bad index");
    end;
    local v34 = v31.data[v32].filter or {};
    local v35 = {};
    for _, v37 in ipairs(v34) do
        v35[v37.key] = v37.value;
    end;
    if v33 then
        for _, v39 in ipairs(v33) do
            v35[v39.key] = tostring(v39.value);
        end;
    end;
    local v40 = {};
    for v41, v42 in pairs(v35) do
        table.insert(v40, {
            key = v41, 
            value = v42
        });
    end;
    v31.data[v32].filter = v40;
    return v31;
end;
v0.fromString = function(v43, v44)
    local v45 = false;
    local v46 = false;
    local v47 = {};
    local v48 = 1;
    v44 = v44 .. ".";
    for v49 = 1, v44:len() do
        local v50 = v44:sub(v49, v49);
        if v50 == "\\" and v46 == false then
            v46 = true;
        elseif v46 == true then
            v46 = false;
        elseif v50 == "." then
            if not v45 then
                table.insert(v47, {
                    name = v44:sub(v48, v49 - 1)
                });
                v48 = v49 + 1;
            end;
        elseif v50 == "[" then
            if v45 == true then
                error("no nested bracket allowed: " .. v44);
            end;
            v45 = true;
        elseif v50 == "]" then
            if not v45 then
                error("unbalanced brackets: " .. v44);
            end;
            v45 = false;
        end;
    end;
    if v45 == true then
        error("unbalanced brackets: " .. v44);
    end;
    for v51 = 1, #v47 do
        local v52, v53 = v47[v51].name:match("%s*(.*[^\\])%[(.*[^\\])%]%s*");
        if v52 == nil then
            v53 = "";
            v52 = v47[v51].name;
        end;
        if v52 ~= nil and v53 ~= nil then
            v47[v51].name = v0.removeSlash(v52);
            local v54 = v19(v53, ",");
            local v55 = {};
            for _, v57 in ipairs(v54) do
                local v58, v59 = v57:match("^%s*(.-[^\\])%s*=%s*(.-)%s*$");
                if not (not v58 or not v59) then
                    table.insert(v55, {
                        key = v58, 
                        value = v59
                    });
                end;
            end;
            v47[v51].filter = v55;
        end;
    end;
    v43.data = v47;
end;
v0.copy = function(v60)
    local v61 = v20(v60);
    setmetatable(v61, v0);
    return v61;
end;
v0.parent = function(v62)
    local v63 = v62:copy();
    if #v63.data <= 1 then
        return v63;
    else
        table.remove(v63.data, #v63.data);
        return v63;
    end;
end;
v0._itemToString = function(_, v65)
    local v66 = v0.addSlash(v65.name);
    if v65.filter and #v65.filter > 0 then
        local v67 = {};
        for _, v69 in ipairs(v65.filter) do
            table.insert(v67, v69.key .. " = " .. v69.value);
        end;
        v66 = v66 .. "[" .. table.concat(v67, ", ") .. "]";
    end;
    return v66;
end;
v0.toString = function(v70, v71)
    if v71 == nil then
        local v72 = {};
        for _, v74 in ipairs(v70.data) do
            table.insert(v72, v70:_itemToString(v74));
        end;
        return table.concat(v72, ".");
    elseif type(v71) == "number" then
        if v71 < 0 then
            v71 = (v70:size() + v71) + 1;
        end;
        if not (v70:size() >= v71) or v71 < 1 then
            error("invalid index");
        end;
        return v70:_itemToString(v70.data[v71]);
    elseif type(v71) == "table" then
        return v70:_itemToString(v71);
    else
        error("Unsupported argument to `XPath:toString()`");
        return ;
    end;
end;
v0.hasChild = function(v75, v76)
    return v76:relative(v75) ~= nil;
end;
v0.relative = function(v77, v78)
    if v77:size() < #v78.data then
        return nil;
    else
        local v79 = v78:copy();
        local v80 = v77:copy();
        while true do
            if #v79.data > 0 then
                if v79.data[1].name ~= v80.data[1].name then
                    return nil;
                else
                    table.remove(v79.data, 1);
                    table.remove(v80.data, 1);
                end;
            else
                return v80;
            end;
        end;
    end;
end;
v0.cat = function(v81, v82)
    if typeof(v82) == "string" then
        v82 = v0.new(v82);
    end;
    local v83 = v81:copy();
    for _, v85 in ipairs(v82.data) do
        table.insert(v83.data, v85);
    end;
    return v83;
end;
v0.clearFilter = function(v86)
    for v87 = 1, v86:size() do
        v86.data[v87].filter = nil;
    end;
    return v86;
end;
local function _(v88, v89)
    local l_status_0, l_result_0 = pcall(function()
        return v88[v89];
    end);
    if not l_status_0 then
        return nil;
    else
        return l_result_0;
    end;
end;
local function _(v93, v94)
    v93 = tostring(v93);
    v94 = tostring(v94);
    local v95 = true;
    if v94 ~= "*" then
        v95 = v93 == v94;
    end;
    return v95;
end;
local function v111(v97, v98)
    local l_v97_Children_0 = v97:GetChildren();
    local v100 = {};
    for _, v102 in ipairs(l_v97_Children_0) do
        local l_pcall_0 = pcall;
        local v104 = "Name";
        local v105;
        l_pcall_0, v105 = l_pcall_0(function()
            return v102[v104];
        end);
        local v106 = if not l_pcall_0 then nil else v105;
        l_pcall_0 = v98;
        v106 = tostring(v106);
        l_pcall_0 = tostring(l_pcall_0);
        local v107 = true;
        if l_pcall_0 ~= "*" then
            v107 = v106 == l_pcall_0;
        end;
        if v107 then
            table.insert(v100, v102);
        end;
    end;
    if #v100 == 0 then
        local l_status_1, l_result_1 = pcall(function()
            return v97[v98];
        end);
        local v110 = if not l_status_1 then nil else l_result_1;
        if v110 then
            table.insert(v100, v110);
        end;
    end;
    return v100;
end;
local function v119(v112, v113)
    local v114 = {};
    for _, v116 in ipairs(v112) do
        for _, v118 in ipairs((v111(v116, v113))) do
            table.insert(v114, v118);
        end;
    end;
    return v114;
end;
local _ = function(v120, v121)
    for _, v123 in ipairs(v121) do
        v120 = v119(v120, v123);
    end;
    return v120;
end;
local function v141(v125, v126)
    local l_key_0 = v126.key;
    local v128, v129 = l_key_0:match("^%.?(.*[^\\])%.(%w-)$");
    if v129 == nil then
        v128 = "";
        v129 = l_key_0:match("^%.?(%w-)$");
    end;
    if v129 ~= nil then
        local v130 = v19(v128, ".");
        for v131 = 1, #v130 do
            v130[v131] = v0.removeSlash(v130[v131]);
        end;
        local v132 = {
            v125
        };
        for _, v134 in ipairs(v130) do
            v132 = v119(v132, v134);
        end;
        for _, v136 in ipairs(v132) do
            local l_v129_0 = v129;
            local l_l_v129_0_0 = l_v129_0 --[[ copy: 13 -> 16 ]];
            local l_status_2, l_result_2 = pcall(function()
                return v136[l_l_v129_0_0];
            end);
            l_status_2 = if not l_status_2 then nil else l_result_2;
            l_result_2 = v0.removeSlash(v126.value);
            l_status_2 = tostring(l_status_2);
            l_result_2 = tostring(l_result_2);
            l_v129_0 = true;
            if l_result_2 ~= "*" then
                l_v129_0 = l_status_2 == l_result_2;
            end;
            if l_v129_0 then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v146(v142, v143)
    for _, v145 in ipairs(v143) do
        if not v141(v142, v145) then
            return false;
        end;
    end;
    return true;
end;
local function v152(v147, v148)
    if v148 == nil then
        return v147;
    else
        local v149 = {};
        for _, v151 in ipairs(v147) do
            if v146(v151, v148) then
                table.insert(v149, v151);
            end;
        end;
        return v149;
    end;
end;
v0.getFirstInstance = function(v153)
    local v154 = v153:getInstances();
    if #v154 == 0 then
        return nil;
    else
        return v154[1];
    end;
end;
v0.getInstances = function(v155)
    if v155:size() < 1 then
        error("instance " .. v155:toString() .. " does not exist");
    end;
    local v156 = nil;
    local l_name_0 = v155.data[1].name;
    if l_name_0 == "game" then
        v156 = game;
    elseif l_name_0 == "PluginGuiService" then
        v156 = game:GetService("PluginGuiService");
    end;
    if v155.root == nil and v156 == nil then
        error("instance " .. v155:toString() .. " does not exist");
    end;
    local v158 = {
        if not v155.root then v156 else v155.root
    };
    local v159 = not v155.root and 2 or 1;
    while true do
        if v159 <= v155:size() then
            v158 = v152(v119(v158, v155.data[v159].name), v155.data[v159].filter);
            if #v158 == 0 then
                return v158, v159 - 1;
            else
                v159 = v159 + 1;
            end;
        else
            return v158, v159 - 1;
        end;
    end;
end;
v0.setWait = function(v160, v161, v162)
    v160.waitDelay = v162 or v160.waitDelay;
    v160.waitTimeOut = v161 or v160.waitTimeOut;
    return v160;
end;
v0.waitFor = function(v163, v164, v165, v166, v167)
    v166 = v166 or v163.waitDelay;
    v167 = v167 or v163.waitTimeOut;
    assert(v167);
    v167 = os.clock() + v167;
    while true do
        local v168 = v164();
        if not v165(v168) then
            task.wait(v166);
            if v167 < os.clock() then
                return v168, false;
            end;
        else
            return v168, true;
        end;
    end;
end;
v0.waitForFirstInstance = function(v169)
    local v170 = v169:waitForNInstances(1);
    if v170 ~= nil and #v170 > 0 then
        return v170[1];
    else
        return nil;
    end;
end;
v0.waitForInstances = function(v171, v172)
    if type(v172) ~= "function" then
        error("arg #1 should be a function");
    end;
    return v171:waitFor(function()
        return v171:getInstances();
    end, v172);
end;
v0.waitForDisappear = function(v173)
    local _, v176 = v173:waitForInstances(function(v174)
        return #v174 == 0;
    end);
    return v176 == true;
end;
v0.waitForNInstances = function(v177, v178)
    local v180, v181 = v177:waitForInstances(function(v179)
        return v178 <= #v179;
    end);
    return v180 or {}, v181;
end;
return v0;
