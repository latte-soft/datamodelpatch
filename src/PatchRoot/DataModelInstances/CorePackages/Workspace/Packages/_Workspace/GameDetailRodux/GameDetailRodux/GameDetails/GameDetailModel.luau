local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSwapToSourceButton;
local v3 = {
    new = function()
        return {};
    end
};
v3.mock = function(v4, v5)
    local v6 = v3.new();
    local v7 = l_DateTime_0.new();
    local v8 = l_DateTime_0.fromUnixTimestamp(v7:GetUnixTimestamp() + 60);
    v6.id = v4;
    v6.rootPlaceId = "370731277";
    v6.name = v5;
    v6.description = "This is MeepCity";
    v6.sourceName = if not l_GetFFlagEnableSwapToSourceButton_0() then nil else "source name";
    v6.sourceDescription = if not l_GetFFlagEnableSwapToSourceButton_0() then nil else "source description";
    v6.creator = {
        id = 123247, 
        name = "alexnewtron", 
        type = "User", 
        isRNVAccount = false, 
        hasVerifiedBadge = false
    };
    v6.price = nil;
    v6.isExperimental = false;
    v6.allowedGearGenres = {
        "TownAndCity"
    };
    v6.allowedGearCategories = {};
    v6.playing = 49252;
    v6.visits = 2358954901;
    v6.maxPlayers = 110;
    v6.created = v7:GetIsoDate();
    v6.updated = v8:GetIsoDate();
    v6.studioAccessToApisAllowed = true;
    v6.universeAvatarType = "MorphToR15";
    v6.genre = "Town and City";
    return v6;
end;
v3.fromJsonData = function(v9)
    local v10 = v3.new();
    v10.id = tostring(v9.id);
    v10.rootPlaceId = tostring(v9.rootPlaceId);
    v10.name = v9.name;
    v10.description = v9.description;
    v10.sourceName = if not l_GetFFlagEnableSwapToSourceButton_0() then nil else v9.sourceName;
    v10.sourceDescription = if not l_GetFFlagEnableSwapToSourceButton_0() then nil else v9.sourceDescription;
    v10.creator = {
        id = v9.creator.id, 
        name = v9.creator.name, 
        type = v9.creator.type, 
        isRNVAccount = v9.creator.isRNVAccount, 
        hasVerifiedBadge = v9.creator.hasVerifiedBadge
    };
    v10.price = v9.price;
    v10.isExperimental = v9.isExperimental;
    v10.allowedGearGenres = v9.allowedGearGenres;
    v10.allowedGearCategories = v9.allowedGearCategories;
    v10.playing = v9.playing;
    v10.visits = v9.visits;
    v10.maxPlayers = v9.maxPlayers;
    v10.created = v9.created;
    v10.updated = v9.updated;
    v10.studioAccessToApisAllowed = v9.studioAccessToApisAllowed;
    v10.universeAvatarType = v9.universeAvatarType;
    v10.genre = v9.genre;
    return v10;
end;
return v3;
