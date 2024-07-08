local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local function _()
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("FileSystemService");
    end);
    return not not l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local v6 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Error_0 = v6.Error;
local l_Object_0 = v6.Object;
local l_String_0 = v6.String;
local v11 = require(l_Parent_1.PrettyFormat);
local _ = require(l_Parent_0.PrettyFormat);
local l_format_0 = v11.format;
local l_getSerializers_0 = require(l_Parent_0.plugins).getSerializers;
local _ = require(l_Parent_0.types);
local v16 = nil;
local v17 = nil;
local function _()
    return "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing";
end;
local function _(v19)
    local l_v19_0 = v19;
    if l_v19_0 then
        l_v19_0 = false;
        if typeof(v19) == "table" then
            l_v19_0 = not l_Array_0.isArray(v19);
        end;
    end;
    return l_v19_0;
end;
local function v24(v22, v23)
    return v22 .. " " .. v23;
end;
local function v26(v25)
    if not v25:match(" %d+$") then
        error(l_Error_0("Snapshot keys must end with a number."));
    end;
    return v25:gsub(" %d+$", "");
end;
local function v32(v27, v28)
    local v29 = {};
    local v30 = false;
    pcall(function()
        v29 = require(v27);
    end);
    local v31 = true;
    if v28 ~= "all" then
        v31 = v28 == "new";
    end;
    return {
        data = v29, 
        dirty = v30
    };
end;
local function v34(v33)
    if not v33:match("\n") then
        return v33;
    else
        return "\n" .. v33 .. "\n";
    end;
end;
local function v36(v35)
    if (not (v35:len() > 2) or not l_String_0.startsWith(v35, "\n")) or not l_String_0.endsWith(v35, "\n") then
        return v35;
    else
        return v35:sub(2, -2);
    end;
end;
local function v40(v37, v38, v39)
    return v16(l_format_0(v37, l_Object_0.assign({
        escapeRegex = true, 
        indent = v38 or 2, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    }, v39 or {})));
end;
local function v42(v41)
    return l_format_0(v41, {
        escapeRegex = true, 
        min = true, 
        plugins = l_getSerializers_0(), 
        printFunctionName = false
    });
end;
local function v44(v43)
    return (string.gsub(string.gsub(string.sub(v43, 2, -2), "\\\\", "\\"), "\\\"", "\""));
end;
local function v46(v45)
    return v45;
end;
local function _(v47)
    return "[=[\n" .. v47 .. "]=]";
end;
local function v54(v49)
    local v50 = v49:split("/");
    local v51 = table.concat(table.pack(table.unpack(v50, 1, #v50 - 1)), "/");
    local l_status_1, l_result_1 = pcall(function()
        if not v5:Exists(v51) then
            v5:CreateDirectories(v51);
        end;
    end);
    if not (l_status_1 or not l_result_1:find("Error%(13%): Access Denied%. Path is outside of sandbox%.")) then
        error("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`");
    end;
end;
v16 = function(v55)
    return (string.gsub(string.gsub(v55, "\r\n", "\n"), "\r", "\n"));
end;
local function _(v56)
    local function v58(v57)
        return ("%03d%s"):format(string.len(v57), v57);
    end;
    table.sort(v56, function(v59, v60)
        return tostring(v59):gsub("%d+", v58) < tostring(v60):gsub("%d+", v58);
    end);
    return v56;
end;
local function v75(v62, v63)
    local v64 = {
        "-- Jest Roblox Snapshot v" .. "1" .. ", " .. "http://roblox.github.io/jest-roblox/snapshot-testing", 
        "local exports = {}"
    };
    local l_ipairs_0 = ipairs;
    local v66 = l_Object_0.keys(v62);
    local function v68(v67)
        return ("%03d%s"):format(string.len(v67), v67);
    end;
    local l_v68_0 = v68 --[[ copy: 7 -> 8 ]];
    table.sort(v66, function(v70, v71)
        return tostring(v70):gsub("%d+", l_v68_0) < tostring(v71):gsub("%d+", l_v68_0);
    end);
    for _, v73 in l_ipairs_0(v66) do
        table.insert(v64, "exports[ [=[" .. v73 .. "]=] ] = " .. "[=[\n" .. v16(v62[v73]) .. "]=]");
    end;
    table.insert(v64, "return exports");
    if v5 == nil then
        local v74;
        v74, v66 = pcall(function()
            return game:GetService("FileSystemService");
        end);
        v5 = (not not v74 and v66 or nil) or false;
    end;
    if not v5 then
        error(l_Error_0("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    v54(v63);
    v5:WriteFile(v63, table.concat(v64, "\n\n"));
end;
local function v76(v77, v78)
    local v79 = l_Array_0.from(v77);
    for v80, v81 in ipairs(v78) do
        local v82 = v79[v80];
        if not l_Array_0.isArray(v77[v80]) then
            local l_v82_0 = v82;
            if l_v82_0 then
                l_v82_0 = false;
                if typeof(v82) == "table" then
                    l_v82_0 = not l_Array_0.isArray(v82);
                end;
            end;
            if not l_v82_0 then
                v79[v80] = v81;
            else
                v79[v80] = v17(v77[v80], v81);
            end;
        else
            v79[v80] = v76(v77[v80], v81);
        end;
    end;
    return v79;
end;
v17 = function(v84, v85)
    local l_v84_0 = v84;
    if l_v84_0 then
        l_v84_0 = false;
        if typeof(v84) == "table" then
            l_v84_0 = not l_Array_0.isArray(v84);
        end;
    end;
    if l_v84_0 then
        l_v84_0 = v85;
        if l_v84_0 then
            l_v84_0 = false;
            if typeof(v85) == "table" then
                l_v84_0 = not l_Array_0.isArray(v85);
            end;
        end;
        if l_v84_0 then
            l_v84_0 = {};
            for v87, v88 in pairs(v84) do
                l_v84_0[v87] = v88;
            end;
            for v89, _ in pairs(v85) do
                local v91 = v85[v89];
                local l_v91_0 = v91;
                if l_v91_0 then
                    l_v91_0 = false;
                    if typeof(v91) == "table" then
                        l_v91_0 = not l_Array_0.isArray(v91);
                    end;
                end;
                if not l_v91_0 or v85[v89]["$$typeof"] then
                    if not l_Array_0.isArray(v85[v89]) then
                        l_Object_0.assign(l_v84_0, {
                            [v89] = v85[v89]
                        });
                    else
                        l_v84_0[v89] = v76(v84[v89], v85[v89]);
                    end;
                elseif v84[v89] then
                    l_v84_0[v89] = v17(v84[v89], v85[v89]);
                else
                    l_Object_0.assign(l_v84_0, {
                        [v89] = v85[v89]
                    });
                end;
            end;
            return l_v84_0;
        end;
    end;
    if not l_Array_0.isArray(v84) or not l_Array_0.isArray(v85) then
        return v84;
    else
        return (v76(v84, v85));
    end;
end;
return {
    testNameToKey = v24, 
    keyToTestName = v26, 
    getSnapshotData = v32, 
    addExtraLineBreaks = v34, 
    removeExtraLineBreaks = v36, 
    serialize = v40, 
    minify = v42, 
    deserializeString = v44, 
    escapeBacktickString = v46, 
    saveSnapshotFile = v75, 
    deepMerge = v17, 
    robloxGetParent = function(v93, v94)
        local v95 = v94 or 0;
        local v96 = string.sub(v93, 1, 1) == "/";
        local v97 = {};
        for v98 in string.gmatch(v93, "[^\\/][^\\/]*") do
            table.insert(v97, v98);
        end;
        if v95 > 0 then
            v97 = {
                table.unpack(v97, 1, #v97 - v95)
            };
        end;
        if not v96 then
            return table.concat(v97, "\\");
        else
            return "/" .. table.concat(v97, "/");
        end;
    end
};
