local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.RoactNavigation);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v13 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableContactMethodPromptModal);
local v16 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenContactMethodPromptModal);
local v17 = require(l_Modules_0.LuaApp.Enum.ContactMethodPromptTypes);
local v18 = require(l_Modules_0.Personalization.Home.HomeOmniFeed.HomeOmniFeed);
local v19 = require(l_Modules_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local v20 = require(l_Modules_0.Personalization.Home.HomeOmniFeed.HomeOmniFeedDataLoader);
local v21 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = v22.useUiModeInfo;
local v25 = require(l_Modules_0.LuaApp.AppPage);
local v26 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v27 = require(l_Modules_0.Personalization.Home.VngAppUpsell.CheckForVngAppUpsell);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_GetFFlagEnableMaquettesHomePageAgeBlock_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMaquettesHomePageAgeBlock;
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseHomeOmniFeedDataLoader);
local v32 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local l_FFlagLuaAppHomeVngAppUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell;
local v34 = v3.PureComponent:extend("HomePageWithFeed");
v34.validateProps = v6.strictInterface({
    homePageDataStatus = v6.string, 
    homePageUpsellCardVariation = v6.any, 
    launchContactMethodPrompt = v6.callback, 
    navigateToU13Block = v6.callback, 
    useGridPageLayout = v6.optional(v6.boolean), 
    policyEnableHomePageAgeBlock = if not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() then nil else v6.optional(v6.boolean), 
    setThrottleFramerateEnabled = v6.optional(v6.callback), 
    navigation = v6.table, 
    screenProps = v6.optional(v6.table), 
    notificationService = v6.any, 
    backgroundColor = v6.Color3, 
    backgroundTransparency = v6.number, 
    hasTopBar = v6.boolean
});
v34.init = function(v35)
    if not ((not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() or not l_IsVRAppBuild_0()) or not v35.props.policyEnableHomePageAgeBlock) then
        v35.props.navigateToU13Block();
    end;
    v35.notifyPageLoaded = function()
        v35.props.notificationService:ActionEnabled(Enum.AppShellActionType.HomePageLoaded);
    end;
    v35.tryLaunchContactMethodPromptModal = function()
        if v35.props.homePageUpsellCardVariation and v35.props.homePageUpsellCardVariation.upsellCardType == v17.ContactMethodMandatoryEmailPhone then
            v35.props.launchContactMethodPrompt();
        end;
    end;
    v35.onDidFocus = function()
        if l_isSubjectToDesktopPolicies_0() then
            v35.props.setThrottleFramerateEnabled(false);
        end;
    end;
    v35.onWillBlur = function()
        if l_isSubjectToDesktopPolicies_0() then
            v35.props.setThrottleFramerateEnabled(true);
        end;
    end;
end;
v34.render = function(v36)
    local function v42(_)
        local l_backgroundColor_0 = v36.props.backgroundColor;
        local l_backgroundTransparency_0 = v36.props.backgroundTransparency;
        local l_useGridPageLayout_0 = v36.props.useGridPageLayout;
        local v41 = if not v31() then v3.createElement(v18) else v3.createElement(v20, {
            OmniFeedComponent = v18
        });
        return v3.createElement("Frame", {
            [v3.Tag] = if not v30() then nil else "app-screen.home", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_backgroundColor_0, 
            BackgroundTransparency = l_backgroundTransparency_0, 
            BorderSizePixel = 0
        }, {
            NavigationEvents = v3.createElement(v5.NavigationEvents, {
                onDidFocus = v36.onDidFocus, 
                onWillBlur = v36.onWillBlur
            }), 
            CheckForVngAppUpsell = if not l_FFlagLuaAppHomeVngAppUpsell_0 then nil else v3.createElement(v27), 
            Content = if not v32 then v3.createElement(v14.PageWrapper, {
                topBarSlot = if not v36.props.hasTopBar then nil else v3.createElement(v21, {
                    useGridPageLayout = l_useGridPageLayout_0
                }), 
                BackgroundColor3 = l_backgroundColor_0, 
                BackgroundTransparency = l_backgroundTransparency_0
            }, {
                HomeOmniFeed = v41
            }) else nil, 
            HomeOmniFeed = if not v32 then nil else v41
        });
    end;
    return l_withStyle_0(function(v43)
        return v42(v43);
    end);
end;
v34.didMount = function(v44)
    v44.isMounted = true;
    if v44.props.homePageDataStatus == v13.Done then
        v44.notifyPageLoaded();
    end;
    if not (not v15() or not v44.props.homePageUpsellCardVariation) then
        v44.tryLaunchContactMethodPromptModal();
    end;
    v44.onDidFocus();
end;
v34.didUpdate = function(v45, v46)
    if not ((not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() or not l_IsVRAppBuild_0()) or not v45.props.policyEnableHomePageAgeBlock) then
        v45.props.navigateToU13Block();
    end;
    local v47 = v45.props.homePageDataStatus == v13.Done;
    local v48 = v46.homePageDataStatus == v13.Done;
    if not (not v47 or v48) then
        v45.notifyPageLoaded();
    end;
    local v49 = v15();
    if v49 then
        v49 = false;
        if v45.props.homePageUpsellCardVariation ~= "" then
            v49 = v45.props.homePageUpsellCardVariation ~= v46.homePageUpsellCardVariation;
        end;
    end;
    if v49 then
        v45.tryLaunchContactMethodPromptModal();
    end;
end;
v34.willUnmount = function(v50)
    v50.isMounted = false;
end;
local v56 = v5.withNavigation((v4.connect(function(v51, _)
    local v53 = "";
    if v15() then
        v53 = v51.HomePageUpsellCardVariation or "";
    end;
    return {
        homePageDataStatus = v51.Startup.HomePageDataStatus, 
        homePageUpsellCardVariation = v53
    };
end, function(v54)
    return {
        launchContactMethodPrompt = function(v55)
            if v15() then
                v54(v16(v55, {}));
            end;
        end, 
        navigateToU13Block = function()
            if l_GetFFlagEnableMaquettesHomePageAgeBlock_0() then
                v54(v26({
                    {
                        name = v25.U13Block
                    }
                }));
            end;
        end
    };
end)(v34)));
return (v19((l_RoactAppPolicy_0.connect(function(v57, _)
    return {
        useGridPageLayout = v57.useGridPageLayout(), 
        policyEnableHomePageAgeBlock = if not l_GetFFlagEnableMaquettesHomePageAgeBlock_0() then nil else v57.getEnableHomePageAgeBlock()
    };
end)((l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
})(function(v59)
    local v60 = l_useDesignTokens_0();
    return v3.createElement(v56, (v2.Dictionary.join(v59, {
        backgroundColor = v60.LuaApps.App.Page.BackgroundColor, 
        backgroundTransparency = v60.LuaApps.App.Page.BackgroundTransparency, 
        hasTopBar = l_useUiModeInfo_0().uiMode ~= l_UiMode_0.TenFoot
    })));
end))))));
