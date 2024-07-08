local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Rodux);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v6 = require(l_Modules_0.LuaApp.Util.safeCall);
local v7 = require(l_Modules_0.LuaApp.Util.toStringLimited);
local v8 = require(l_Modules_0.Common.StringUtilities.StringReplaceAll);
local v9 = {
    _store = nil, 
    _lumberyakLog = "", 
    addLumberyakLog = nil
};
l_Logger_0:addSink({
    maxLevel = l_Logger_0.Levels.fromString((game:DefineFastString("LuaAppBacktraceLogLevel", "Info"))), 
    log = function(_, v11, _)
        v9:addLumberyakLog(v11);
    end
});
v9.connectToStore = function(v13, v14)
    if getmetatable(v14) == v4.Store then
        v13._store = v14;
    end;
end;
v9.addLumberyakLog = function(v15, v16)
    if type(v16) == "string" then
        v15._lumberyakLog = v15._lumberyakLog .. v16 .. "\n";
    end;
end;
v9.generateAppLog = function(v17)
    return (v6(function()
        local v18 = "";
        if #v17._lumberyakLog > 0 then
            v18 = v18 .. "============ LumberYak Logs ============\n" .. v17._lumberyakLog;
        end;
        if v17._store ~= nil then
            local v20 = v7(v17._store:getState(), nil, 5, function(v19)
                if v19 == 1 then
                    return -1;
                else
                    return 20;
                end;
            end);
            if #v20 > 0 then
                v18 = v18 .. "============ Rodux Store ============\n" .. v20;
            end;
        end;
        local v21 = {};
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 ~= nil then
            if l_LocalPlayer_0.UserId and l_LocalPlayer_0.UserId > 0 then
                v21[tostring(l_LocalPlayer_0.UserId)] = "UserId";
            end;
            if l_LocalPlayer_0.Name and l_LocalPlayer_0.Name ~= "" then
                v21[tostring(l_LocalPlayer_0.Name)] = "UserName";
            end;
        end;
        return (v8(v18, v21));
    end, ""));
end;
return v9;
