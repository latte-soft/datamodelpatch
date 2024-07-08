local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.Models.GameSortGroup);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup);
local v5 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled);
local v6 = {
    Games = v2.new(), 
    GamesSeeAll = v2.new(), 
    HomeGames = v2.new(), 
    GamesList = if not v5() then nil else v2.new()
};
return function(v7, v8)
    v7 = v7 or v6;
    assert(v7, "");
    if v8.type == v3.name then
        if v7[v8.groupId] then
            return (v1.Dictionary.join(v7, {
                [v8.groupId] = v1.Dictionary.join(v7[v8.groupId], {
                    sorts = v8.sorts, 
                    pageId = v8.pageId
                })
            }));
        end;
    elseif not (not (v5() and v8.type == v4.name) or not v7[v8.groupId]) then
        local v9 = v7[v8.groupId];
        local l_sorts_0 = v8.sorts;
        if v9.sorts then
            l_sorts_0 = v1.List.join(v9.sorts, l_sorts_0);
        end;
        v7 = v1.Dictionary.join(v7, {
            [v8.groupId] = v1.Dictionary.join(v9, {
                sorts = l_sorts_0, 
                pageId = ""
            })
        });
    end;
    return v7;
end;
