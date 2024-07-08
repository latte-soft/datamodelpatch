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
    v6.universeId = v4 or "149757";
    v6.placeId = v5 or "384314";
    v6.isSponsored = false;
    v6.isShowSponsoredLabel = v6.isSponsored;
    v6.adId = nil;
    v6.playerCount = 150;
    v6.creatorName = "test name";
    v6.creatorHasVerifiedBadge = false;
    return v6;
end;
v3.fromJsonData = function(v7)
    if type(v7.universeId) ~= "number" and type(v7.universeId) ~= "string" then
        return v1.error("GameSortEntry.fromJsonData expects universeId to be a number or a string");
    elseif type(v7.placeId) ~= "number" and type(v7.placeId) ~= "string" then
        return v1.error("GameSortEntry.fromJsonData expects placeId to be a number or a string");
    else
        local v8 = v3.new();
        v8.universeId = tostring(v7.universeId);
        v8.placeId = tostring(v7.placeId);
        v8.isSponsored = v7.isSponsored;
        v8.isShowSponsoredLabel = nil;
        if v7.isShowSponsoredLabel == nil then
            v8.isShowSponsoredLabel = true;
        else
            v8.isShowSponsoredLabel = v7.isShowSponsoredLabel;
        end;
        v8.adId = v7.nativeAdData;
        v8.playerCount = v7.playerCount;
        if v2() then
            v8.creatorName = v7.creatorName;
            v8.creatorHasVerifiedBadge = v7.creatorHasVerifiedBadge;
        end;
        return v1.success(v8);
    end;
end;
return v3;
