local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v6 = require(l_CorePackages_0.Promise);
local v7 = require(l_Modules_0.AvatarExperience.Flags.AEInfiniteScrollRecommendationsIXPTest);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    GetAvatarData = function(v10)
        local _ = nil;
        return v10(if not l_game_EngineFeature_0 then string.format("%s/v1/avatar", v2.AVATAR_URL) else string.format("%s/v2/avatar/avatar", v2.AVATAR_URL), "GET");
    end, 
    GetOutfit = function(v12, v13)
        local _ = nil;
        return v12(if not l_game_EngineFeature_0 then string.format("%s/v1/outfits/%s/details", v2.AVATAR_URL, v13) else string.format("%s/v3/outfits/%s/details", v2.AVATAR_URL, v13), "GET");
    end, 
    GetRecommendations = function(v15, v16, v17)
        local v18 = v2:makeQueryString({
            numItems = v3.NumRecommendedItems, 
            details = true
        });
        local v19 = "%s/v2/recommendations/user-inventory?bundleTypeId=%s&%s";
        if v17 then
            v19 = "%s/v2/recommendations/user-inventory?assetTypeId=%s&%s";
        end;
        return v15(string.format(v19, v2.CATALOG_URL, v16, v18), "GET");
    end, 
    GetRecommendedUserInventoryItems = function(v20, v21)
        if v7.isEnabled() then
            local v22 = string.format("%sv2/recommendations/user-inventory/details?limit=%s", v2.CATALOG_URL, (tostring(if not v21.limit then v4.DefaultUserRecommendationsFetchSize else v21.limit)));
            if v21.assetTypeId then
                v22 = v22 .. "&assetTypeId=" .. tostring(v21.assetTypeId);
            end;
            if v21.assetId then
                v22 = v22 .. "&assetId=" .. tostring(v21.assetId);
            end;
            if v21.bundleTypeId then
                v22 = v22 .. "&bundleTypeId=" .. tostring(v21.bundleTypeId);
            end;
            if v21.bundleId then
                v22 = v22 .. "&bundleId=" .. tostring(v21.bundleId);
            end;
            if v21.cursor then
                v22 = v22 .. "&cursor=" .. v21.cursor;
            end;
            return v20(v22, "GET");
        else
            return v6.resolve();
        end;
    end
};
