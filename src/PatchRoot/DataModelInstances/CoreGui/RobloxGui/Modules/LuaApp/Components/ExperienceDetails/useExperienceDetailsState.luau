local l_CorePackages_0 = game:GetService("CorePackages");
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_useGameProductInfoSelector_0 = require(l_CorePackages_0.Workspace.Packages.GameProductInfoRodux).useGameProductInfoSelector;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.Common.memoize);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v10 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia);
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = v11.UiMode;
local v14 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_GameIconReducer_0 = v14.GameIcons.GameIconReducer;
local l_useGameIconSelector_0 = v14.GameIcons.useGameIconSelector;
local l_BigGameIconReducer_0 = v14.BigGameIcons.BigGameIconReducer;
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAddNotificationsEnabledAgeGate);
local function _(v26)
    return {
        mediaType = v8.GameMediaImageType.Image, 
        imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v26, 768, 432)
    };
end;
local v34 = v7(function(v28, v29, v30)
    local v31 = nil;
    if v28 then
        for _, v33 in pairs(v28) do
            if v33.assetTypeId == v8.GameMediaImageType.Image then
                v31 = v33;
                break;
            end;
        end;
    end;
    if v31 == nil then
        if v30 == v9.Done then
            return {
                mediaType = v8.GameMediaImageType.Image, 
                imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v29, 768, 432)
            };
        else
            return nil;
        end;
    else
        return v31;
    end;
end);
return function(v35)
    local v36 = nil;
    if not v20() or not v19() then
        v36 = l_useGameIconSelector_0(v35.universeId);
    else
        local v37 = l_useUiModeInfo_0();
        v36 = l_useSelector_0(function(v38)
            if not (v37 and v37.uiMode == l_UiMode_0.TenFoot) then
                return v38[l_GameIconReducer_0.key][v35.universeId];
            else
                return v38[l_BigGameIconReducer_0.key][v35.universeId] or v38[l_GameIconReducer_0.key][v35.universeId];
            end;
        end);
    end;
    return {
        thumbnail = v36, 
        bannerImageId = l_useSelector_0(function(v39)
            local v40 = v34(v39.GameMedia[v35.universeId], v35.placeId, (v10.GetFetchingStatus(v39, v35.universeId)));
            if not v40 then
                return nil;
            else
                return v40.imageId;
            end;
        end), 
        gameInfo = l_useSelector_0(function(v41)
            return v41.Games[v35.universeId];
        end), 
        gameDetail = l_useSelector_0(function(v42)
            return v42.GameDetails[v35.universeId];
        end), 
        creatorVerified = l_useSelector_0(function(v43)
            if not v18() then
                return (v3.isCreatorOfGameVerified(v43, v35));
            else
                return nil;
            end;
        end), 
        gameDetailsPageDataStatus = l_useSelector_0(function(v44)
            return l_ApiFetchGameDetails_0.GetFetchingStatus(v44, v35.universeId);
        end), 
        gameProductInfo = l_useGameProductInfoSelector_0(v35.universeId), 
        socialLinks = l_useSelector_0(function(v45)
            local v46 = v45.GameSocialLinks[v35.universeId];
            if not v46 then
                return nil;
            else
                return v46.externalLinks;
            end;
        end), 
        ageRecommendations = l_useSelector_0(function(v47)
            return v47.AgeRecommendations[v35.universeId];
        end), 
        communityLink = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else l_useSelector_0(function(v48)
            return v48.CommunityLinks.ExperienceCommunityLinks[v35.universeId] or nil;
        end), 
        assetTextFilterSettings = if not v23() then nil else if not v23() then nil else l_useSelector_0(function(v49)
            return v49.AssetTextFilterSettings[v35.universeId];
        end), 
        gameFollowings = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else l_useSelector_0(function(v50)
            return v50.GameFollowings[v35.universeId];
        end), 
        notificationsEnabled = if not v24() then nil else if not v24() then nil else l_useSelector_0(function(v51)
            return v51.ExperienceNotificationsEnabled;
        end), 
        isLocalUserUnder13 = if not v25() then nil else if not v25() then nil else l_useSelector_0(function(v52)
            return v52.IsLocalUserUnder13;
        end)
    };
end;
