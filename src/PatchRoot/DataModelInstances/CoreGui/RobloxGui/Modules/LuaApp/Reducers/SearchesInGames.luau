local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.SetSearchInGames);
local v3 = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames);
local v4 = require(l_Modules_0.LuaApp.Actions.RemoveSearchInGames);
local v5 = require(l_Modules_0.LuaApp.Actions.ResetSearchesInGames);
return function(v6, v7)
    v6 = v6 or {};
    if v7.type == v2.name then
        return (v1.Set(v6, v7.searchUuid, v7.searchInGames));
    elseif v7.type == v3.name then
        local l_searchUuid_0 = v7.searchUuid;
        local v9 = v6[l_searchUuid_0];
        local l_searchInGames_0 = v7.searchInGames;
        if v9 then
            l_searchInGames_0.emphasis = v9.emphasis;
            l_searchInGames_0.entries = v1.JoinLists(v9.entries, l_searchInGames_0.entries);
        end;
        return (v1.Set(v6, l_searchUuid_0, l_searchInGames_0));
    elseif v7.type == v4.name then
        return (v1.Set(v6, v7.searchUuid, nil));
    else
        if v7.type == v5.name then
            v6 = {};
        end;
        return v6;
    end;
end;
