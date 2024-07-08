local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactNavigation);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_MenuTile_0 = v5.App.Tile.MenuTile;
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_CorePackages_0.Logging);
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_validateColorInfo_0 = v5.Style.Validator.validateColorInfo;
local l_validateFontInfo_0 = v5.Style.Validator.validateFontInfo;
local l_validateTypographyInfo_0 = v5.Style.Validator.validateTypographyInfo;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.AppPage);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v17 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v21 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v23 = require(l_Modules_0.LuaApp.openExternalBrowser);
local _ = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v26 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v27 = require(l_Modules_0.LuaApp.Constants);
local v28 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v29 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForReportLogs);
local v30 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v31 = require(l_Modules_0.LuaApp.Components.FriendsLanding.navigateToFriendsLandingEvent);
local v32 = require(l_Modules_0.Profile.Analytics.ProfileAnalytics);
local v33 = require(l_Modules_0.Profile.Analytics.EntryPoints);
local _ = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local _ = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_GetFFlagFixTenFootUiMorePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixTenFootUiMorePage;
local v38 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableReportLogsButton);
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagForceEnableReportLogsButton);
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local v41 = v1.PureComponent:extend("MoreGridItem");
v41.validateProps = v4.strictInterface({
    item = v4.table, 
    layoutOrder = v4.integer, 
    formFactor = v4.string, 
    localUserId = v4.string, 
    navigateDown = v4.callback, 
    openLeaveRobloxAlertUIBlox = v4.callback, 
    openReportLogConfirmation = if v39() or v38() then v4.callback else nil, 
    closeAlert = v4.callback, 
    catalogAnalytics = v4.table, 
    shouldUseExternalBrowserForMorePageItem = v4.callback, 
    linking = v4.table, 
    navigation = v4.table, 
    luaProfileEnabled = v4.optional(v4.boolean), 
    eventIngest = v4.any, 
    disableWebViewSupport = v4.boolean, 
    disableIAPEntryPoint = v4.optional(v4.boolean), 
    showWebViewNotAvailableToastMessage = v4.callback, 
    itemStyleProps = v4.optional(v4.strictInterface({
        iconStyle = v4.optional(l_validateColorInfo_0), 
        iconSize = v4.optional(l_IconSize_0.isEnumValue), 
        titleStyle = v4.optional(l_validateColorInfo_0), 
        titleFont = v4.optional(v4.union(l_validateFontInfo_0, l_validateTypographyInfo_0))
    }))
});
v41.init = function(v42)
    v42.navigateDown = function(v43)
        local l_item_0 = v42.props.item;
        local l_url_0 = l_item_0.context.url;
        local l_titleKey_0 = l_item_0.context.titleKey;
        if l_item_0.urlGenerator then
            l_url_0 = l_item_0.urlGenerator(v42.props.localUserId);
        end;
        local v47 = nil;
        if l_item_0.getSearchParams then
            v47 = l_item_0.getSearchParams(v42.props.formFactor);
        end;
        local v48 = nil;
        if not (not l_titleKey_0 and not v47) then
            v48 = {
                titleKey = l_titleKey_0, 
                searchParams = v47
            };
        end;
        local v49 = l_item_0.shouldOpenInExternalBrowser and v42.props.shouldUseExternalBrowserForMorePageItem();
        local v50 = false;
        if v42.props.disableWebViewSupport == true then
            v50 = l_item_0.context.fallbackToExternalBrowser == true;
        end;
        if not v49 and not v50 then
            if l_item_0.itemType == v16.ItemType.Catalog then
                v42.props.navigation.navigate(v25.Catalog);
                return ;
            elseif l_item_0.itemType == v16.ItemType.OfficialStore then
                v42.props.openLeaveRobloxAlertUIBlox(v42.openUrl);
                return ;
            elseif not (not v39() and not v38()) and l_item_0.itemType == v16.ItemType.ReportLogs then
                v42.props.openReportLogConfirmation();
                return ;
            else
                v42.props.navigateDown({
                    name = l_item_0.context.page, 
                    detail = l_url_0, 
                    extraProps = v7.Dictionary.join(v48 or {}, v43 or {})
                });
                return ;
            end;
        else
            v23(v42.props.linking, l_url_0);
            return ;
        end;
    end;
    v42.openUrl = function()
        v42.props.linking:openURL(v42.props.item.context.url):andThen(function(v51)
            if v51 == false then
                v8.warn("LinkingProtocol:openURL failed for offical amazon store.");
            end;
        end);
        v42.props.closeAlert();
    end;
    v42.onActivated = function()
        local l_catalogAnalytics_0 = v42.props.catalogAnalytics;
        local l_item_1 = v42.props.item;
        local v54 = nil;
        local v55 = false;
        if l_item_1.itemType == v16.ItemType.Settings then
            v55 = v42.props.disableWebViewSupport;
        end;
        local v56 = false;
        if l_item_1.itemType == v16.ItemType.BuildersClub then
            v56 = v42.props.disableIAPEntryPoint;
        end;
        if not v55 and not v56 then
            if l_item_1.itemType == v16.ItemType.Catalog then
                l_catalogAnalytics_0.moreMenuToCatalogButton();
            end;
            if l_item_1.itemType == v16.ItemType.Friends then
                v31({
                    context = "morePage", 
                    localUserId = v42.props.localUserId
                });
                v54 = {
                    navigateToFriendsLandingEventStart = {
                        startPage = v14.More, 
                        startTime = os.clock()
                    }
                };
            end;
            if l_item_1.itemType == v16.ItemType.Profile then
                if not l_FFlagLuaAppConsolidateProfileLogging_0 then
                    v32.new({
                        localUserId = v42.props.localUserId, 
                        profileUserId = v42.props.localUserId
                    }):navigateToProfile(v33.MorePageSelf);
                else
                    v54 = {
                        source = l_Sources_0.MorePageTile
                    };
                end;
            end;
            v42.navigateDown(v54);
            v42.props.eventIngest:sendEventDeferred("moreGridItem", "moreGridItemClick", {
                itemType = l_item_1.itemType, 
                url = l_item_1.context.url, 
                localUserId = v42.props.localUserId
            });
            return ;
        else
            v42.props.showWebViewNotAvailableToastMessage();
            return ;
        end;
    end;
    v42:setState({
        refreshLock = 1
    });
end;
v41.render = function(v57)
    local l_item_2 = v57.props.item;
    local l_badgeCount_0 = l_item_2.badgeCount;
    local l_icon_0 = l_item_2.icon;
    local l_layoutOrder_0 = v57.props.layoutOrder;
    local l_textKey_0 = l_item_2.textKey;
    local l_refreshLock_0 = v57.state.refreshLock;
    local v64 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v57.props.itemStyleProps;
    return v21({
        title = l_textKey_0
    })(function(v65)
        return v1.createFragment({
            [l_layoutOrder_0 .. "-" .. l_refreshLock_0] = v1.createElement(l_MenuTile_0, {
                badgeValue = l_badgeCount_0 > 0 and l_badgeCount_0 or nil, 
                icon = l_icon_0, 
                layoutOrder = l_layoutOrder_0, 
                onActivated = function()
                    v57.onActivated();
                    v57:setState({
                        refreshLock = l_refreshLock_0 + 1
                    });
                end, 
                title = v65.title, 
                styleProps = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v64
            })
        });
    end);
end;
return l_RoactServices_0.connect({
    catalogAnalytics = v15, 
    linking = l_AppLinking_0, 
    eventIngest = v19
})((l_RoactAppPolicy_0.connect(function(v66)
    return {
        disableWebViewSupport = not v66.getWebViewSupport(), 
        disableIAPEntryPoint = v66.getDisableIAPEntryPoint()
    };
end)((v2.withNavigation((l_RoactAppPolicy_0.connect(function(v67)
    return {
        shouldUseExternalBrowserForMorePageItem = v67.shouldUseExternalBrowserForMorePageItem
    };
end)((v3.connect(function(v68, _)
    return {
        formFactor = v68.FormFactor, 
        localUserId = v68.LocalUserId
    };
end, function(v70)
    return {
        navigateDown = function(v71)
            v70(v17(v71));
        end, 
        showWebViewNotAvailableToastMessage = function()
            v70(v26(v27.WEBVIEWS_UNAVAILABLE_TOAST));
        end, 
        openLeaveRobloxAlertUIBlox = function(v72)
            v70(v28(v72));
        end, 
        openReportLogConfirmation = (v39() or v38()) and function()
            v70(v29());
        end or nil, 
        closeAlert = function()
            v70(v30());
        end
    };
end)(v41)))))))));
