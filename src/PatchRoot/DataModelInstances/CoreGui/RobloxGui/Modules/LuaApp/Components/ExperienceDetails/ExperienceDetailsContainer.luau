local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux);
local v8 = require(script.Parent.useExperienceDetailsState);
local v9 = require(script.Parent.useExperienceDetailsFetches);
local v10 = require(script.Parent.Hooks.useExperienceDetailsDesignTokens);
local v11 = require(script.Parent.useExperienceDetailsNavigation);
local v12 = require(script.Parent.useExperienceDetailsFocusNavigationBindings);
local v13 = require(script.Parent.useExperienceDetailsConfiguration);
local l_useUserExperiment_0 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment).useUserExperiment;
local v15 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v23 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsPage);
local v24 = require(l_Modules_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local v25 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local l_Follow_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Follow;
local l_getFirstFocusableDescendant_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).getFirstFocusableDescendant;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAddNotificationsEnabledAgeGate);
local l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddExperienceGuidelinesToActionBar10ft;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageIXP);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppShowPillContainsStrongLanguageLayer);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixSendFollowEventParams);
return (v24.connect(function(v40)
    return {
        universeId = v40.universeId, 
        launchSource = "ExperienceDetailsPage", 
        referralSource = v40.referralSource
    };
end, function(v41, _)
    return {
        playabilityStatus = v41.playabilityStatus, 
        playButtonState = v41.playButtonState, 
        onPlayButtonActivated = v41.onPlayButtonActivated
    };
end)(function(v43)
    local v45 = v5(function(v44)
        return {
            roundedCorners = v44.getUseRoundedCorners()
        };
    end);
    local v46 = v6(v17);
    local v47 = v6(l_AppLinking_0);
    local v48 = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v6(v18);
    local v50 = l_useSelector_0(function(v49)
        return {
            screenSize = v49.ScreenSize, 
            globalGuiInset = v49.GlobalGuiInset
        };
    end);
    local v51 = v8(v43);
    local v52 = v11();
    local v53 = v9();
    local v54 = nil;
    local v55 = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else l_useDispatch_0();
    local v56 = l_useDeviceType_0();
    local v57 = nil;
    if not v30() or not v29() then
        v57 = v4.useCallback(function()
            return v53.fetchGameDetailsPageData(v46, v43.universeId);
        end, {
            v46, 
            v43.universeId
        });
    else
        local v58 = l_useUiModeInfo_0();
        local l_v58_0 = v58 --[[ copy: 13 -> 30 ]];
        v57 = v4.useCallback(function()
            return v53.fetchGameDetailsPageData(v46, v43.universeId, l_v58_0);
        end, {
            v46, 
            v43.universeId, 
            v58
        });
    end;
    local v61 = if not v36() then nil else l_useUserExperiment_0({
        v37()
    }, function(v60)
        return (v60[v37()] or {}).IsShowContainsStrongLanguageWarningEnabled;
    end);
    local v63 = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then {} else l_useUserExperiment_0({
        v15.EDPCommunityLinksLayer
    }, function(v62)
        return (v62[v15.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
    end, false);
    local v65 = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else l_useUserExperiment_0({
        v15.ExperienceDetailsPageLayer
    }, function(v64)
        return ((v64[v15.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2;
    end, true);
    v4.useEffect(function()
        v57();
    end, {
        v43.universeId
    });
    local v69 = v4.useCallback(function(v66, v67)
        if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
            local v68 = v51.gameInfo and v51.gameInfo.placeId;
            if v39() and (not (v68 ~= nil) or v66 == nil) then
                return ;
            else
                v55(v25(v46, v66, v67, v65, if not v31() then nil else v51.notificationsEnabled and v51.notificationsEnabled.count or 0, if not v31() then nil else v51.notificationsEnabled and v51.notificationsEnabled.limit or 0));
                l_Follow_0(v48, "ExperienceDetailsActionBar", v68, not v67);
            end;
        end;
    end, {
        v55, 
        v46, 
        v48, 
        v43.universeId, 
        v51
    });
    local l_screenSize_0 = v50.screenSize;
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_l_GuiService_0_SafeZoneOffsets_0).Y.Offset;
    local v73 = UDim2.new(1, 0, 1, 0);
    if v45.roundedCorners then
        v73 = UDim2.new(1, 0, 1, 0);
    end;
    local v74 = v51.gameDetail and v51.gameDetail.creator;
    local v75 = if not v28() then v51.creatorVerified else v74 and v74.hasVerifiedBadge;
    local v76 = v13();
    v54 = v10();
    local v77 = v4.useRef(nil);
    local v79, v80 = v12(v4.useCallback(function(_)
        v43.onPlayButtonActivated();
    end, {
        v43.onPlayButtonActivated
    }), (v4.useCallback(function()
        if v77.current then
            l_GuiService_0.SelectedCoreObject = l_getFirstFocusableDescendant_0(v77.current);
        end;
    end, {})));
    return v4.createElement("Frame", {
        ref = v79, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
        Size = v73, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        ExperienceDetailsPage = v4.createElement(v43.ExperienceDetailsPage or v23, {
            universeId = v43.universeId, 
            referralSource = v43.referralSource, 
            onClose = v52.navigateBack, 
            statsAndInfoRef = v77, 
            thumbnail = v51.thumbnail, 
            bannerImageId = v51.bannerImageId, 
            gameInfo = v51.gameInfo, 
            gameDetail = v51.gameDetail, 
            creatorVerified = v75, 
            gameDetailsPageDataStatus = v51.gameDetailsPageDataStatus, 
            gameProductInfo = v51.gameProductInfo, 
            socialLinks = v51.socialLinks, 
            ageRecommendations = v51.ageRecommendations, 
            isShowContainsStrongLanguageWarningEnabled = if not v36() then nil else v61, 
            containsStrongLanguage = if not v35() then nil else v51.assetTextFilterSettings, 
            communityLink = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v51.communityLink, 
            communityLinksEnabled = v63.inTreatment, 
            communityLinkVariant = v63.linkVariant, 
            gameFollowings = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v51.gameFollowings, 
            enableNotificationsDiscoverability = v65, 
            isLocalUserUnder13 = if not v32() then nil else v51.isLocalUserUnder13, 
            fetchGameDetailsPageData = v57, 
            openLeaveRobloxAlertUIBlox = v52.openLeaveRobloxAlertUIBlox, 
            openVerifiedBadgeModal = v52.openVerifiedBadgeModal, 
            closeAlert = v52.closeAlert, 
            openMoreContextualMenu = v52.openMoreContextualMenu, 
            openShareContextualMenu = v52.openShareContextualMenu, 
            openCreatorPage = v52.openCreatorPage, 
            openExperienceGuidelinesExplained = if not l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() then nil else v52.openExperienceGuidelinesExplained, 
            setControllerBarNavigation = v80, 
            playabilityStatus = v43.playabilityStatus, 
            playButtonState = v43.playButtonState, 
            onPlayButtonActivated = v43.onPlayButtonActivated, 
            toggleFollowExperience = if not v65 then nil else v69, 
            linking = v47, 
            deviceType = v56, 
            viewHeight = l_Offset_0, 
            detailsPageConfiguration = v76, 
            tokens = v54
        })
    });
end));
