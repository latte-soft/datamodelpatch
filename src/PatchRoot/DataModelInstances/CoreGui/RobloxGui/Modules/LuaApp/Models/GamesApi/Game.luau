local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v1 = {
    User = "User", 
    Group = "Group"
};
local v2 = {
    new = function()
        return {};
    end
};
v2.mock = function()
    local v3 = v2.new();
    v3.creatorId = "22915773";
    v3.creatorName = "Jaegerblox";
    v3.creatorType = v1.User;
    v3.placeId = "10395446";
    v3.universeId = "149757";
    v3.imageToken = "70395446";
    v3.name = "test";
    v3.totalUpVotes = 10970;
    v3.totalDownVotes = 2564;
    v3.price = 0;
    v3.playerCount = 150;
    v3.under9 = true;
    v3.under13 = false;
    v3.minimumAge = 13;
    v3.ageRecommendationDisplayName = "Ages 13+";
    v3.primaryWideAssetId = "12046435434";
    return v3;
end;
v2.mockEndpointResponse = function()
    return {
        creatorId = "22915773", 
        creatorName = "Jaegerblox", 
        creatorType = v1.User, 
        placeId = "10395446", 
        universeId = "149757", 
        imageToken = "70395446", 
        name = "test", 
        totalUpVotes = 10970, 
        totalDownVotes = 2564, 
        price = 0, 
        playerCount = 150, 
        under9 = true, 
        under13 = false, 
        minimumAge = 0, 
        ageRecommendationDisplayName = "All Ages", 
        primaryWideAssetId = "12046435434"
    };
end;
v2.fromJsonData = function(v4)
    if type(v4.universeId) ~= "number" and type(v4.universeId) ~= "string" then
        return v0.error("Game.fromJsonData expects universeId to be a number or a string");
    elseif type(v4.placeId) ~= "number" and type(v4.placeId) ~= "string" then
        return v0.error("Game.fromJsonData expects placeId to be a number or a string");
    elseif type(v4.creatorId) ~= "number" and type(v4.creatorId) ~= "string" then
        return v0.error("Game.fromJsonData expects creatorId to be a number or a string");
    else
        local v5 = v2.new();
        v5.creatorId = tostring(v4.creatorId);
        v5.creatorName = v4.creatorName;
        v5.creatorType = v4.creatorType;
        v5.placeId = tostring(v4.placeId);
        v5.universeId = tostring(v4.universeId);
        v5.imageToken = v4.imageToken;
        v5.name = v4.name;
        v5.totalUpVotes = v4.totalUpVotes;
        v5.totalDownVotes = v4.totalDownVotes;
        v5.price = v4.price;
        v5.playerCount = v4.playerCount;
        v5.under9 = v4.under9;
        v5.under13 = v4.under13;
        v5.minimumAge = v4.minimumAge;
        v5.ageRecommendationDisplayName = v4.ageRecommendationDisplayName;
        v5.primaryWideAssetId = if not not v4.primaryMediaAsset and v4.primaryMediaAsset.wideImageAssetId then tostring(v4.primaryMediaAsset.wideImageAssetId) else nil;
        return v0.success(v5);
    end;
end;
v2.fromExperienceData = function(v6)
    if type(v6.universeId) ~= "number" and type(v6.universeId) ~= "string" then
        return v0.error("Game.fromJsonData expects universeId to be a number or a string");
    elseif type(v6.rootPlaceId) ~= "number" and type(v6.rootPlaceId) ~= "string" then
        return v0.error("Game.fromJsonData expects placeId to be a number or a string");
    else
        local v7 = v2.new();
        v7.placeId = tostring(v6.rootPlaceId);
        v7.universeId = tostring(v6.universeId);
        v7.name = v6.name;
        v7.totalUpVotes = v6.totalUpVotes;
        v7.totalDownVotes = v6.totalDownVotes;
        v7.playerCount = v6.playerCount;
        v7.under9 = v6.under9;
        v7.under13 = v6.under13;
        v7.minimumAge = v6.minimumAge;
        v7.ageRecommendationDisplayName = v6.ageRecommendationDisplayName;
        v7.primaryWideAssetId = if not not v6.primaryMediaAsset and v6.primaryMediaAsset.wideImageAssetId then tostring(v6.primaryMediaAsset.wideImageAssetId) else nil;
        return v0.success(v7);
    end;
end;
return v2;
