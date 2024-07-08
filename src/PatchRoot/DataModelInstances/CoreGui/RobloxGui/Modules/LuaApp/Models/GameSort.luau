local v0 = {
    default = "LuaApp/category/filter_default", 
    Featured = "LuaApp/category/filter_featured", 
    FriendActivity = "LuaApp/category/filter_friendsplaying", 
    MyFavorite = "LuaApp/category/filter_myfavorites", 
    MyRecent = "LuaApp/category/filter_continueplaying", 
    Popular = "LuaApp/category/filter_popular", 
    PopularInCountry = "LuaApp/category/filter_popularnearyou", 
    TopGrossing = "LuaApp/category/filter_topearning", 
    TopRated = "LuaApp/category/filter_toprated", 
    TopRetaining = "LuaApp/category/filter_recommended"
};
local v1 = {
    new = function()
        return {};
    end
};
v1.mock = function()
    local v2 = v1.new();
    v2.displayIcon = "";
    v2.displayName = "";
    v2.genreOptionsAvailable = false;
    v2.isDefaultSort = true;
    v2.name = "";
    v2.numberOfRows = 1;
    v2.timeOptionsAvailable = false;
    v2.token = "";
    v2.contextUniverseId = "";
    v2.contextCountryRegionId = "";
    return v2;
end;
v1.fromJsonData = function(v3)
    local v4 = v1.new();
    v4.displayName = v3.displayName;
    v4.genreOptionsAvailable = v3.genreOptionsAvailable;
    v4.isDefaultSort = v3.isDefaultSort;
    v4.name = v3.name;
    v4.numberOfRows = v3.numberOfRows;
    v4.timeOptionsAvailable = v3.timeOptionsAvailable;
    v4.token = v3.token;
    v4.contextUniverseId = v3.contextUniverseId;
    v4.contextCountryRegionId = v3.contextCountryRegionId;
    v4.gameSetTargetId = v3.gameSetTargetId;
    v4.gameSetTypeId = tostring(v3.gameSetTypeId);
    v4.topicLayoutData = v3.topicLayoutData;
    if v4.name ~= nil then
        v4.displayIcon = v0[v4.name];
    end;
    if v4.displayIcon == nil then
        v4.displayIcon = v0.default;
    end;
    return v4;
end;
v1.fromExploreJsonData = function(v5)
    local v6 = v1.new();
    v6.displayName = v5.sortDisplayName;
    v6.name = v5.sortId;
    v6.token = "";
    v6.gameSetTargetId = v5.gameSetTargetId;
    v6.gameSetTypeId = tostring(v5.gameSetTypeId);
    v6.topicLayoutData = v5.topicLayoutData;
    if v6.name ~= nil then
        v6.displayIcon = v0[v6.name];
    end;
    if v6.displayIcon == nil then
        v6.displayIcon = v0.default;
    end;
    return v6;
end;
return v1;
