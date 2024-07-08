local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Result);
local v2 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local v3 = {
    new = function()
        return {};
    end
};
v3.mock = function(v4, v5)
    local v6 = v3.new();
    v6.name = "test name";
    v6.universeId = v4 or "149757";
    v6.placeId = v5 or "384314";
    v6.isSponsored = false;
    v6.isShowSponsoredLabel = v6.isSponsored;
    v6.adId = nil;
    v6.playerCount = 150;
    v6.creatorName = "test name";
    v6.creatorHasVerifiedBadge = false;
    v6.topicId = "test_topic";
    return v6;
end;
v3.fromJsonData = function(v7, v8)
    if (v8 and type(v7.universeId) ~= "number") and type(v7.universeId) ~= "string" then
        return v1.error("GameSearchEntry.fromJsonData expects universeId to be a number or a string for game contents");
    elseif (v8 and type(v7.placeId) ~= "number") and type(v7.placeId) ~= "string" then
        return v1.error("GameSearchEntry.fromJsonData expects placeId to be a number or a string for game contents");
    else
        local v9 = v3.new();
        v9.name = v7.name;
        v9.topicId = v7.topicId;
        if v8 then
            v9.universeId = tostring(v7.universeId);
            v9.placeId = tostring(v7.placeId);
            v9.isSponsored = v7.isSponsored;
            v9.isShowSponsoredLabel = nil;
            if v7.isShowSponsoredLabel == nil then
                v9.isShowSponsoredLabel = true;
            else
                v9.isShowSponsoredLabel = v7.isShowSponsoredLabel;
            end;
            v9.adId = v7.nativeAdData;
            v9.playerCount = v7.playerCount;
            if v2() then
                v9.creatorName = v7.creatorName;
                v9.creatorHasVerifiedBadge = v7.creatorHasVerifiedBadge;
            end;
        end;
        return v1.success(v9);
    end;
end;
return v3;
