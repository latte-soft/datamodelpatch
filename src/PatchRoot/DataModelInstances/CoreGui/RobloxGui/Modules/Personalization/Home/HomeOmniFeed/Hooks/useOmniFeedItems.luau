local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useReactiveVar_0 = require(l_CorePackages_0.Packages.ApolloClient).useReactiveVar;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Personalization.OmniFeed.DataStore.OrderedOmniItems);
local v5 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v6 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v7 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v8 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v10 = require(l_Modules_0.LuaApp.AppPage);
return function(v11, v12, v13, v14)
    local v15 = l_useReactiveVar_0(v12);
    local v16 = l_useReactiveVar_0(v13);
    local v17 = v1.useMemo(function()
        return v4({}, v5(v15, v10.Home));
    end, {
        v15
    });
    local v19, v20 = v1.useMemo(function()
        local v18 = (if not v14 then v4(v17, v7(v8.GameSortGroups.HomeGames, v16, nil)) else v4(v17, v6(v11)))[v10.Home] or {};
        return v18.allItems or {}, v18.localItems or {};
    end, {
        v11.sorts, 
        v17[v10.Home].allItems, 
        v16
    });
    return v19, v20;
end;
