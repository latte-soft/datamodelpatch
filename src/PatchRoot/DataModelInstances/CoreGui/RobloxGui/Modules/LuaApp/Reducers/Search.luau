local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Reducers.SearchesInGames);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SearchesInCatalog);
return function(v3, v4)
    v3 = v3 or {};
    return {
        SearchesInGames = v1(v3.SearchesInGames, v4), 
        SearchesInCatalog = v2(v3.SearchesInCatalog, v4)
    };
end;
