local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Result);
local v3 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v7 = {
    new = function()
        return {};
    end, 
    mock = function(v5)
        local v6 = {
            contentType = v3.OmniRecommendationsContentType.Game, 
            contentId = v5 or "149757", 
            isSponsored = false
        };
        v6.isShowSponsoredLabel = v6.isSponsored;
        v6.adId = nil;
        return v6;
    end
};
v7.fromGamesApiData = function(v8)
    if type(v8.universeId) ~= "number" and type(v8.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string");
    else
        local v9 = v7.new();
        v9.contentType = v3.OmniRecommendationsContentType.Game;
        v9.contentId = tostring(v8.universeId);
        v9.isSponsored = v8.isSponsored;
        v9.isShowSponsoredLabel = nil;
        if v8.isShowSponsoredLabel == nil then
            v9.isShowSponsoredLabel = true;
        else
            v9.isShowSponsoredLabel = v8.isShowSponsoredLabel;
        end;
        v9.adId = v8.nativeAdData;
        return v2.success(v9);
    end;
end;
v7.fromExploreApiData = function(v10)
    if type(v10.universeId) ~= "number" and type(v10.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string");
    else
        local v11 = v7.new();
        v11.contentType = v3.OmniRecommendationsContentType.Game;
        v11.contentId = tostring(v10.universeId);
        v11.isSponsored = v10.isSponsored;
        v11.adId = v10.nativeAdData;
        v11.isShowSponsoredLabel = nil;
        return v2.success(v11);
    end;
end;
v7.fromOmniRecommendations = function(v12)
    local v13 = v7.new();
    v13.contentType = v12.contentType;
    v13.contentId = tostring(v12.contentId);
    v13.adId = not not v12.contentMetadata and v12.contentMetadata.EncryptedAdTrackingData or nil;
    local v14 = false;
    if v13.adId ~= nil then
        v14 = v13.adId ~= "";
    end;
    v13.isSponsored = v14;
    v13.isShowSponsoredLabel = nil;
    return v2.success(v13);
end;
return v7;
