local _ = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v2 = {
    new = function()
        return {};
    end
};
v2.mock = function()
    local v3 = v2.new();
    v3.placeId = "10395446";
    v3.universeId = "149757";
    v3.name = "test";
    v3.totalUpVotes = 10970;
    v3.totalDownVotes = 2564;
    v3.playerCount = 5;
    v3.under9 = true;
    v3.under13 = false;
    v3.friendActivityTitle = "Friend Activity";
    v3.minimumAge = 0;
    v3.ageRecommendationDisplayName = "All Ages";
    v3.friendVisits = {
        {
            userId = "1894536079"
        }
    };
    v3.friendVisitedString = "1 Friend visited";
    v3.primaryWideAssetId = "12046435434";
    v3.defaultLayoutData = {};
    v3.layoutDataBySort = {};
    return v3;
end;
v2.mockEndpointResponse = function()
    return {
        rootPlaceId = "10395446", 
        universeId = "149757", 
        name = "test", 
        totalUpVotes = 10970, 
        totalDownVotes = 2564, 
        playerCount = 5, 
        under9 = true, 
        under13 = false, 
        friendActivityTitle = "Friend Activity", 
        minimumAge = 0, 
        ageRecommendationDisplayName = "All Ages", 
        friendVisits = {
            {
                userId = "1894536079"
            }
        }, 
        friendVisitedString = "1 Friend visited", 
        defaultLayoutData = {
            footer = {
                type = "TextLabel", 
                textLiteral = "This is footer text"
            }
        }, 
        layoutDataBySort = {
            ["500000000"] = {
                footer = {
                    type = "TextLabel", 
                    textLiteral = "This is a sort-level footer text"
                }
            }
        }, 
        primaryWideAssetId = "12046435434"
    };
end;
v2.fromJsonData = function(v4)
    if type(v4.universeId) ~= "number" and type(v4.universeId) ~= "string" then
        return v1.error("DiscoveryGame.fromJsonData expects universeId to be a number or a string");
    elseif type(v4.rootPlaceId) ~= "number" and type(v4.rootPlaceId) ~= "string" then
        return v1.error("DiscoveryGame.fromJsonData expects rootPlaceId to be a number or a string");
    else
        local v5 = v2.new();
        v5.placeId = tostring(v4.rootPlaceId);
        v5.universeId = tostring(v4.universeId);
        v5.name = v4.name;
        v5.totalUpVotes = v4.totalUpVotes;
        v5.totalDownVotes = v4.totalDownVotes;
        v5.playerCount = v4.playerCount;
        v5.under9 = v4.under9;
        v5.under13 = v4.under13;
        v5.friendActivityTitle = v4.friendActivityTitle;
        v5.minimumAge = v4.minimumAge;
        v5.ageRecommendationDisplayName = v4.ageRecommendationDisplayName;
        v5.friendVisits = v4.friendVisits;
        v5.friendVisitedString = v4.friendVisitedString;
        v5.primaryWideAssetId = if not not v4.primaryMediaAsset and v4.primaryMediaAsset.wideImageAssetId then tostring(v4.primaryMediaAsset.wideImageAssetId) else nil;
        v5.defaultLayoutData = v4.defaultLayoutData;
        v5.layoutDataBySort = v4.layoutDataBySort;
        if not (not v4 or not v4.navigationUid) then
            v5.navigationUniverseId = tostring(v4.navigationUid);
        end;
        return v1.success(v5);
    end;
end;
return v2;
