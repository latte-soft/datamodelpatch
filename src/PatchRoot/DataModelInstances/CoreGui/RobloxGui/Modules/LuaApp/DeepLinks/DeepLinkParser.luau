local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.StringUtilities.ParseQuery);
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLinkingToSorts);
local v5 = require(script.Parent.PreserveCasePaths);
local l_GetFFlagUseThumbnailUrlForContactPeekView_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseThumbnailUrlForContactPeekView;
local function v12(v7, v8)
    local v9 = {
        string.find(string.lower(v8), (string.gsub(v7, "(%()(.*)(%))", "()(%2)()")))
    };
    if #v9 > 0 then
        table.remove(v9, 1);
        table.remove(v9, 1);
        if #v9 == 0 then
            return v9, true;
        else
            local v10 = {};
            local v11 = 1;
            while v11 + 2 <= #v9 do
                table.insert(v10, {
                    v9[v11], 
                    v9[v11 + 2] - 1
                });
                v11 = v11 + 3;
            end;
            return v10, true;
        end;
    else
        return v9, false;
    end;
end;
local function v21(v13, v14)
    if not v4() then
        local v15 = {
            string.find(v14, v13)
        };
        if #v15 > 0 then
            table.remove(v15, 1);
            table.remove(v15, 1);
            return v15;
        else
            return nil;
        end;
    else
        local v16, v17 = v12(v13, v14);
        local v18 = {};
        if not v17 then
            return nil;
        else
            for _, v20 in pairs(v16) do
                table.insert(v18, (string.sub(v14, v20[1], v20[2])));
            end;
            return v18;
        end;
    end;
end;
local function v31(v22, v23)
    local l_ipairs_0 = ipairs;
    local v25 = v23 or {};
    for _, v27 in l_ipairs_0(v25) do
        local v28, v29 = unpack(v27);
        local v30 = v21(v28, v22);
        if v30 then
            return v29, v30;
        end;
    end;
    return nil;
end;
local function v33(v32)
    return v32 .. "[]";
end;
local function v46(v34, v35, v36, v37)
    v1.isType(v37, "string", "url");
    local v38, v39 = unpack(string.split(v37, "?"));
    local v40, v41 = v31(v38, v35);
    if type(v40) == "function" then
        local v42 = v3(v39, v36);
        if v4() then
            for v43, v44 in pairs(v42) do
                local v45 = string.lower(v43);
                if v45 ~= v43 then
                    v42[v45] = v44;
                    v42[v43] = nil;
                end;
            end;
        end;
        table.insert(v41, v42);
        table.insert(v41, v34);
        return v40(unpack(v41));
    else
        warn("DeepLinkParser: URL not supported: " .. v38);
        return {};
    end;
end;
preserveCase = function(v47)
    local v48, _ = unpack(string.split(v47, "?"));
    for _, v51 in pairs(v5) do
        if v48 == v51 then
            return true;
        end;
    end;
    return false;
end;
local v52 = {};
v52.__index = v52;
v52.new = function(v53, v54)
    local v55 = {
        mappings = v53 or {}, 
        keymapper = v54 or v33
    };
    setmetatable(v55, v52);
    return v55;
end;
v52.resolve = function(v56, v57, v58)
    if not l_GetFFlagUseThumbnailUrlForContactPeekView_0() then
        if not v4() then
            v57 = string.lower(v57);
        end;
    elseif not (v4() or preserveCase(v57)) then
        v57 = string.lower(v57);
    end;
    return v46(v58, v56.mappings, v56.keymapper, v57);
end;
v52.matches = function(v59, v60)
    return type((v31(unpack(string.split(string.lower(v60), "?")), v59.mappings))) == "function";
end;
return v52;
