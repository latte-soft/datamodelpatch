local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local l_robloxGetParent_0 = require(script.Parent.utils).robloxGetParent;
local function _()
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("CoreScriptSyncService");
    end);
    return not not l_status_0 and l_result_0 or nil;
end;
local v12 = nil;
local v13 = nil;
local v14 = nil;
v6.EXTENSION = "snap";
local v15 = "." .. "snap";
v6.DOT_EXTENSION = v15;
v6.isSnapshotPath = function(v16)
    return l_String_0.endsWith(v16, v15);
end;
local v17 = l_Map_0.new();
v6.buildSnapshotResolver = function(v18, _)
    return v5.resolve():andThen(function()
        local l_rootDir_0 = v18.rootDir;
        local v21 = v17:get(l_rootDir_0);
        local v22 = if v21 ~= nil then v21 else v13():expect();
        v17:set(l_rootDir_0, v22);
        return v22;
    end);
end;
v13 = function()
    return v5.resolve():andThen(function()
        return v14();
    end);
end;
v14 = function()
    return {
        resolveSnapshotPath = function(_, v24)
            return {
                getInstance = function()
                    local l_Name_0 = v24.Name;
                    local v26 = nil;
                    pcall(function()
                        v26 = v24.Parent.__snapshots__[l_Name_0 .. v15];
                    end);
                    return v26;
                end, 
                getPath = function()
                    if v12 == nil then
                        local l_status_1, l_result_1 = pcall(function()
                            return game:GetService("CoreScriptSyncService");
                        end);
                        v12 = (not not l_status_1 and l_result_1 or nil) or false;
                    end;
                    if not v12 then
                        error(l_Error_0("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\n" .. "You may need to pass in --load.asRobloxScript."));
                    end;
                    local l_status_2, l_result_2 = pcall(function()
                        return v12:GetScriptFilePath(v24);
                    end);
                    if not l_status_2 then
                        if not string.find(l_result_2, "lacking permission 5") then
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s' because of the following error: %s", v24.Name, l_result_2)));
                        else
                            error(l_Error_0.new(string.format("Could not get a snapshot path for test file '%s'. You may need to pass in --load.asRobloxScript", v24.Name)));
                        end;
                    end;
                    return ("%s/__snapshots__/%s"):format(l_robloxGetParent_0(l_result_2, 1), v24.Name .. v15 .. ".lua");
                end
            };
        end
    };
end;
return v6;
