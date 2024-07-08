local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local l_withGridConfig_DEPRECATED_0 = v3.Core.Layout.Grid.withGridConfig_DEPRECATED;
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_CorePackages_0.Roact);
local v12 = require(l_CorePackages_0.RoactRodux);
local v13 = require(l_CorePackages_0.Packages.RoactGamepad);
local v14 = require(l_CorePackages_0.RoactNavigation);
local l_Focusable_0 = v13.Focusable;
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v19 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v21 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v22 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v23 = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v24 = require(l_Modules_0.LuaApp.AppPage);
local v25 = require(l_Modules_0.LuaApp.AppPageProperties);
local v26 = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v29 = require(l_Modules_0.LuaApp.Constants);
local v30 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v31 = require(l_Modules_0.LuaApp.Components.SearchBar);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v33 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v34 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v36 = require(l_Modules_0.LuaApp.Components.Banner.useBannerContainer);
local v37 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v38 = require(l_Modules_0.LuaApp.Context.withTopBarSearchSignal);
local v39 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v41 = require(script.Parent.Buttons.SearchButton);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v43 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppPhoneModeUnderTitleSearchBar);
local v44 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppPhoneModeUnderTitleSearchBarIXP);
local v45 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableTopBarShowItemsOnSearching);
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v47 = require(l_Modules_0.LuaApp.Flags.FFlagOmniSearchUpdatePlaceholderTextIXP);
local l_FFlagCleanPlayerSearchProp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCleanPlayerSearchProp;
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local l_NAV_BAR_SIZE_0 = v29.NAV_BAR_SIZE;
local v51 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v52 = v11.Component:extend("TopBarContainer");
v52.validateProps = v8.strictInterface({
    searchType = v8.string, 
    ZIndex = v8.number, 
    hideSiteMessageBanner = v8.boolean, 
    forceCompactMode = v8.boolean, 
    transparentBackground = v8.boolean, 
    searchParameters = v8.optional(v8.table), 
    onConfirmSearchCallback = v8.optional(v8.callback), 
    titleText = v8.optional(v8.string), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    leftItem = v8.optional(v8.any), 
    centerItem = v8.optional(v8.any), 
    rightItems = v8.optional(v8.array(v8.any)), 
    isSecondary = v8.optional(v8.boolean), 
    useParentSizeForCenterItem = v8.optional(v8.boolean), 
    setDefaultRefOverride = v8.optional(v8.callback), 
    gridConfig = v8.optional(v8.table), 
    focusController = v8.optional(v8.table), 
    totalBannerHeight = v8.optional(v8.number), 
    bannerContainer = v8.optional(v8.table), 
    screenSize = v8.Vector2, 
    formFactor = v8.string, 
    currentRoute = v8.table, 
    navigationHistory = v8.table, 
    showSearchBar = v8.boolean, 
    statusBarHeight = v8.number, 
    userId = v8.string, 
    opaquePage = v8.string, 
    confirmSearch = v8.callback, 
    setTopBarHeight = v8.callback, 
    analytics = v8.table, 
    sessionService = v8.optional(v8.union(v8.Instance, v8.table)), 
    eventIngest = v8.table, 
    enableNotifications = v8.boolean, 
    enableSearch = v8.boolean, 
    enableSearchAutoComplete = v8.boolean, 
    phoneModeUnderTitleSearchBar = v8.optional(v8.boolean), 
    shouldUpdateSearchPlaceholderText = if not v47 then nil else v8.optional(v8.boolean), 
    navigation = v8.table, 
    avatarRoute = v8.optional(v8.table), 
    forwardRef = v8.optional(v8.table)
});
v52.defaultProps = {
    searchType = v29.SearchTypes.Games, 
    enableSearch = false, 
    ZIndex = 2, 
    phoneModeUnderTitleSearchBar = false, 
    shouldUpdateSearchPlaceholderText = if not v47 then nil else false, 
    onConfirmSearchCallback = nil, 
    hideSiteMessageBanner = false, 
    forceCompactMode = false, 
    transparentBackground = false, 
    rightItems = {}
};
local function v60(v53)
    if not v43() and not v44() then
        return false;
    else
        local v54 = v43() or v53.phoneModeUnderTitleSearchBar;
        local l_formFactor_0 = v53.formFactor;
        local l_currentRoute_0 = v53.currentRoute;
        local l_name_0 = l_currentRoute_0[#l_currentRoute_0].name;
        local v58 = #l_currentRoute_0 > 1 and l_currentRoute_0[#l_currentRoute_0 - 1].name or "";
        local l_v54_0 = v54;
        if l_v54_0 then
            l_v54_0 = false;
            if l_formFactor_0 == l_FormFactor_0.COMPACT then
                l_v54_0 = true;
                if l_name_0 ~= v24.Home then
                    l_v54_0 = true;
                    if l_name_0 ~= v24.Games then
                        if v58 == v24.Home then
                            l_v54_0 = true;
                            if not (l_name_0 ~= v24.GameDetail) then
                                goto label0;
                            end;
                        end;
                        l_v54_0 = false;
                        if v58 == v24.Games then
                            l_v54_0 = l_name_0 == v24.GameDetail;
                        end;
                    end;
                end;
            end;
        end;
        ::label0::;
        return l_v54_0;
    end;
end;
local _ = function(v61, _)
    local l_statusBarHeight_0 = v61.statusBarHeight;
    local v64 = nil;
    v64 = (l_statusBarHeight_0 + l_NAV_BAR_SIZE_0) + math.round(v61.totalBannerHeight);
    if v60(v61) then
        v64 = v64 + 55;
    end;
    return v64 + 2 * v61.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
end;
local function _(v66)
    if v66 == v29.SearchTypes.Auto then
        return v29.SearchTypes.Games;
    else
        return v66;
    end;
end;
v52.shouldUpdate = function(v68, v69, v70)
    if v70 ~= v68.state then
        return true;
    elseif v69 == v68.props then
        return false;
    else
        for v71, v72 in pairs(v69) do
            if v71 ~= "rightItems" and v68.props[v71] ~= v72 then
                return true;
            end;
        end;
        for v73, v74 in pairs(v68.props) do
            if v73 ~= "rightItems" and v69[v73] ~= v74 then
                return true;
            end;
        end;
        return not v10.shallowEqual(v68.props.rightItems, v69.rightItems);
    end;
end;
v52.getPageOwner = function(v75)
    return v75.props.navigation.state.routeName;
end;
local function _(v76)
    local l_currentRoute_1 = v76.currentRoute;
    local l_name_1 = l_currentRoute_1[#l_currentRoute_1].name;
    local v79 = nil;
    v79 = if not v76.avatarRoute then v76.opaquePage else v76.avatarRoute.opaque.name;
    local l_routeName_0 = v76.navigation.state.routeName;
    local v81 = true;
    if l_routeName_0 ~= l_name_1 then
        v81 = l_routeName_0 == v79;
    end;
    return v81;
end;
v52.updateTopBarHeight = function(v83, v84, v85)
    local l_props_0 = v83.props;
    local l_state_0 = v83.state;
    local l_statusBarHeight_1 = l_props_0.statusBarHeight;
    local v89 = nil;
    v89 = (l_statusBarHeight_1 + l_NAV_BAR_SIZE_0) + math.round(l_props_0.totalBannerHeight);
    if v60(l_props_0) then
        v89 = v89 + 55;
    end;
    local v90 = v89 + 2 * l_props_0.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
    l_state_0 = v83.props;
    l_statusBarHeight_1 = l_state_0.currentRoute;
    v89 = l_statusBarHeight_1[#l_statusBarHeight_1].name;
    local v91 = nil;
    v91 = if not l_state_0.avatarRoute then l_state_0.opaquePage else l_state_0.avatarRoute.opaque.name;
    local l_routeName_1 = l_state_0.navigation.state.routeName;
    l_props_0 = true;
    if l_routeName_1 ~= v89 then
        l_props_0 = l_routeName_1 == v91;
    end;
    if not (not v84 or not v85) and v84.navigation == v83.props.navigation then
        l_statusBarHeight_1 = v84.statusBarHeight;
        v89 = nil;
        v89 = (l_statusBarHeight_1 + l_NAV_BAR_SIZE_0) + math.round(v84.totalBannerHeight);
        if v60(v84) then
            v89 = v89 + 55;
        end;
        l_state_0 = v89 + 2 * v84.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        v89 = v84.currentRoute;
        v91 = v89[#v89].name;
        l_routeName_1 = nil;
        l_routeName_1 = if not v84.avatarRoute then v84.opaquePage else v84.avatarRoute.opaque.name;
        local l_routeName_2 = v84.navigation.state.routeName;
        l_statusBarHeight_1 = true;
        if l_routeName_2 ~= v91 then
            l_statusBarHeight_1 = l_routeName_2 == l_routeName_1;
        end;
        if l_state_0 == v90 and l_props_0 == l_statusBarHeight_1 then
            return ;
        end;
    end;
    if l_props_0 then
        v83.props.setTopBarHeight(v90);
    end;
end;
v52.init = function(v94)
    v94.searchBarRef = v11.createRef();
    v94.isMounted = false;
    v94.rightItemRefs = v13.createRefCache();
    v94.itemDefaultChildRefs = v13.createRefCache();
    v94.leftItemRef = v11.createRef();
    v94.centerItemRef = v11.createRef();
    v94.buttonVisibilityCallbacks = {};
    v94.state = {
        isSearching = false, 
        absolutePosition = Vector2.new(0, 0), 
        lastInputType = l_UserInputService_0:GetLastInputType(), 
        hiddenItems = {}
    };
    v94:bindFunctions();
    v94:updateTopBarHeight();
end;
v52.bindFunctions = function(v95)
    v95.onSearchButtonActivated = function()
        if v95.isMounted then
            v95:setIsSearching(true);
            local l_currentRoute_2 = v95.props.currentRoute;
            v95.props.analytics.reportSearchButtonClick(l_currentRoute_2[#l_currentRoute_2].name);
            return ;
        else
            return ;
        end;
    end;
    v95.onExitSearch = function()
        if v95.isMounted then
            v95:setIsSearching(false);
            return ;
        else
            return ;
        end;
    end;
    v95.cancelSearchCallback = function()
        if v95.isMounted then
            local l_searchType_0 = v95.props.searchType;
            local v98 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else l_searchType_0 == v29.SearchTypes.Auto;
            if l_searchType_0 ~= v29.SearchTypes.Games and (not l_FFlagOmniSearchAutoTabIXP_0 or not v98) then
                if l_searchType_0 == v29.SearchTypes.Players then
                    v33(v95.props.eventIngest, "players", "cancel", nil);
                elseif l_searchType_0 == v29.SearchTypes.Catalog then
                    v95.props.analytics.reportSearchCanceled("catalog");
                end;
            else
                v33(v95.props.eventIngest, "games", "cancel", nil, if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v98);
            end;
            v95.onExitSearch();
            return ;
        else
            return ;
        end;
    end;
    v95.cancelSearchAndEndSession = function()
        v95.cancelSearchCallback();
        if v95.props.searchType == v29.SearchTypes.Games then
            v95.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
        end;
    end;
    v95.onSearchBarFocused = function()
        if v95.isMounted then
            local l_searchType_1 = v95.props.searchType;
            local v100 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else l_searchType_1 == v29.SearchTypes.Auto;
            if l_searchType_1 ~= v29.SearchTypes.Games and (not l_FFlagOmniSearchAutoTabIXP_0 or not v100) then
                if l_searchType_1 == v29.SearchTypes.Players then
                    v33(v95.props.eventIngest, "players", "open", nil);
                elseif l_searchType_1 == v29.SearchTypes.Catalog then
                    v95.props.analytics.reportSearchFocused("catalog");
                end;
            else
                if v95.props.enableSearchAutoComplete then
                    v95.props.sessionService:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete, l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                end;
                v33(v95.props.eventIngest, "games", "open", nil, if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v100);
            end;
            v95:setIsSearching(true);
            return ;
        else
            return ;
        end;
    end;
    v95.onTextCleared = function()
        if v95.isMounted then
            return ;
        else
            return ;
        end;
    end;
    v95.confirmSearchCallback = function(v101, v102, v103)
        if v95.isMounted then
            local l_searchType_2 = v95.props.searchType;
            v95.props.confirmSearch(v101, {
                isAutocompleteSuggestion = v102, 
                allAutocompleteSuggestions = v103, 
                searchType = l_searchType_2, 
                playerSearch = not l_FFlagCleanPlayerSearchProp_0 and true or nil, 
                isAvatarAutocompleteEnabled = v46(), 
                navigation = v95.props.navigation, 
                pageOwner = v95:getPageOwner(), 
                sessionService = v95.props.sessionService, 
                eventIngest = v95.props.eventIngest, 
                topBarAnalytics = v95.props.analytics
            });
            if v29.IsSearchTypeInOmniSearch(l_searchType_2) or l_searchType_2 == v29.SearchTypes.Catalog then
                v95.onExitSearch();
            end;
            if not (not v46() or not v95.props.onConfirmSearchCallback) then
                v95.props.onConfirmSearchCallback();
            end;
            return ;
        else
            return ;
        end;
    end;
    v95.absolutePositionChangedCallback = function(v105)
        v95:setState({
            absolutePosition = v105.AbsolutePosition
        });
    end;
    v95.searchSignalCallback = function(v106)
        if v95:getPageOwner() == v106 then
            v95.onSearchButtonActivated();
        end;
    end;
end;
v52.setIsSearching = function(v107, v108)
    v107:setState({
        isSearching = v108
    });
    if v107.props.setDefaultRefOverride then
        v107.props.setDefaultRefOverride(if not v108 then nil else v107.searchBarRef);
    end;
end;
v52.didMount = function(v109)
    v109.isMounted = true;
end;
v52.willUnmount = function(v110)
    v110.isMounted = false;
    if v110.abTestConnection then
        v110.abTestConnection:disconnect();
        v110.abTestConnection = nil;
    end;
end;
v52.isCompactViewMode = function(v111)
    return v111.props.forceCompactMode or v111.props.formFactor == l_FormFactor_0.COMPACT;
end;
v52.getPageNameLocalizationKey = function(v112)
    return v30[v112.props.navigation.state.routeName] or v30[v112.props.currentRoute[1].name];
end;
v52.maybeRenderRightItems = function(v113, v114, v115, v116)
    if not v115 or v60(v113.props) then
        return v113:renderRightItems(v114, if not v113:shouldShowCenterItem() then if v116 then v113.leftItemRef else nil else v113.centerItemRef);
    else
        return {};
    end;
end;
v52.renderRightItems = function(v117, _, v119)
    local v120 = {};
    v120 = v117.props.rightItems;
    local v121 = {};
    local function v124(v122)
        while true do
            if v122 < #v120 then
                v122 = v122 + 1;
                local v123 = v120[v122];
                if not v117.state.hiddenItems[v123] then
                    return v117.rightItemRefs[v123];
                end;
            else
                return nil;
            end;
        end;
    end;
    local function v127(v125)
        while true do
            if v125 > 1 then
                v125 = v125 - 1;
                local v126 = v120[v125];
                if not v117.state.hiddenItems[v126] then
                    return v117.rightItemRefs[v126];
                end;
            else
                return nil;
            end;
        end;
    end;
    for v128, v129 in ipairs(v120) do
        v121["topBarItem_" .. tostring(v128)] = v117:renderTopBarItem(v129, v127(v128) or v119, v124(v128), v128);
    end;
    return v121;
end;
v52.renderTopBarItem = function(v130, v131, v132, v133, v134, v135)
    local l_formFactor_1 = v130.props.formFactor;
    local l_isSearching_0 = v130.state.isSearching;
    local l_isSecondary_0 = v130.props.isSecondary;
    local v139 = v130:isCompactViewMode();
    local v140 = v60(v130.props);
    local v141 = v130:getItemRef(v131);
    local v142 = v130:getItemDefaultChildRef(v131);
    return v11.createElement(l_Focusable_0.Frame, {
        AutomaticSize = if v135 then nil else Enum.AutomaticSize.X, 
        Size = if v135 then UDim2.fromScale(1, 1) else UDim2.fromScale(0, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v134, 
        NextSelectionLeft = v132, 
        NextSelectionRight = v133, 
        [v11.Ref] = v141, 
        defaultChild = v142, 
        Visible = not v130.state.hiddenItems[v131]
    }, {
        Button = v11.createElement(v131, {
            formFactor = l_formFactor_1, 
            isCompactView = v139, 
            isUnderTitleSearchBarEnabled = v140, 
            isSearching = l_isSearching_0, 
            isSecondary = l_isSecondary_0, 
            cancelSearch = v130.cancelSearchAndEndSession, 
            activateSearch = v130.onSearchButtonActivated, 
            setVisible = v130:getButtonVisibilityCallback(v131), 
            buttonRef = v142
        })
    });
end;
v52.shouldShowLeftItem = function(v143)
    local l_leftItem_0 = v143.props.leftItem;
    return (not not l_leftItem_0 and not v143.state.hiddenItems[l_leftItem_0]) and (not v143.state.isSearching or false);
end;
v52.shouldShowCenterItem = function(v145)
    local l_centerItem_0 = v145.props.centerItem;
    return not not l_centerItem_0 and (not v145.state.hiddenItems[l_centerItem_0] or false);
end;
v52.getItemRef = function(v147, v148)
    if v148 == nil then
        return nil;
    elseif v148 == v147.props.leftItem then
        return v147.leftItemRef;
    elseif v148 == v147.props.centerItem then
        return v147.centerItemRef;
    else
        return v147.rightItemRefs[v148];
    end;
end;
v52.getItemDefaultChildRef = function(v149, v150)
    if v150 == nil then
        return nil;
    else
        return v149.itemDefaultChildRefs[v150];
    end;
end;
v52.hasSearchButton = function(v151)
    for _, v153 in ipairs(v151.props.rightItems) do
        if v153 == v41 then
            return true;
        end;
    end;
    return false;
end;
v52.getFirstRightItemRef = function(v154)
    for _, v156 in ipairs(v154.props.rightItems) do
        if not v154.state.hiddenItems[v156] then
            return v154.rightItemRefs[v156];
        end;
    end;
    return nil;
end;
v52.getButtonVisibilityCallback = function(v157, v158)
    local v159 = v157.buttonVisibilityCallbacks[v158];
    if not v159 then
        v159 = function(v160)
            v157:setState(function(v161)
                return {
                    hiddenItems = v9.Dictionary.join(v161.hiddenItems, {
                        [v158] = not v160 or v9.None
                    })
                };
            end);
        end;
        v157.buttonVisibilityCallbacks[v158] = v159;
    end;
    return v159;
end;
v52.getRenderSearchBar = function(v162, v163, v164, v165, v166, v167, v168, v169, v170)
    if not v163 or v60(v162.props) then
        return nil;
    else
        local v171 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else if v166 == v29.SearchTypes.Auto then v29.SearchTypes.Games else v166;
        return function()
            return v11.createElement(v31, {
                cancelSearch = v162.cancelSearchCallback, 
                confirmSearch = v162.confirmSearchCallback, 
                onFocused = v162.onSearchBarFocused, 
                onTextCleared = v162.onTextCleared, 
                isCompactView = v164, 
                placeholderText = v165, 
                searchType = v166, 
                autocomplete = not not v167 and if not l_FFlagOmniSearchAutoTabIXP_0 then v166 == v29.SearchTypes.Games else v171 == v29.SearchTypes.Games or v46() and v166 == v29.SearchTypes.Catalog, 
                [v11.Ref] = v162.searchBarRef, 
                focusController = v162.props.focusController, 
                isSearching = v162.state.isSearching, 
                animated = v168, 
                initialSearchText = not not v162.props.searchParameters and v162.props.searchParameters.searchKeyword or "", 
                searchBarPadding = if not v169 then nil else 0, 
                textSize = if (not not v47 and v162.props.shouldUpdateSearchPlaceholderText) and v166 ~= v29.SearchTypes.Catalog then v170.Tokens.Global.FontSize_75 else nil
            });
        end;
    end;
end;
v52.getRenderRootSearchBar = function(v172, v173, v174, v175, v176, v177, v178, v179)
    local v180 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else if v177 == v29.SearchTypes.Auto then v29.SearchTypes.Games else v177;
    if (v173 or not v174) or v175 then
        return nil;
    else
        return function()
            return v11.createElement(v31, {
                Size = UDim2.new(0, 400, 1, 0), 
                cancelSearch = v172.cancelSearchCallback, 
                confirmSearch = v172.confirmSearchCallback, 
                onFocused = v172.onSearchBarFocused, 
                onTextCleared = v172.onTextCleared, 
                placeholderText = v176, 
                isCompactView = v175, 
                modernUI = true, 
                searchType = if not l_FFlagOmniSearchAutoTabIXP_0 then v177 else v180, 
                autocomplete = not not v178 and if not l_FFlagOmniSearchAutoTabIXP_0 then v177 == v29.SearchTypes.Games else v180 == v29.SearchTypes.Games or v46() and v177 == v29.SearchTypes.Catalog, 
                isSearching = v172.state.isSearching, 
                initialSearchText = not not v172.props.searchParameters and v172.props.searchParameters.searchKeyword or "", 
                textSize = if (not not v47 and v172.props.shouldUpdateSearchPlaceholderText) and v177 ~= v29.SearchTypes.Catalog then v179.Tokens.Global.FontSize_100 else nil, 
                [v11.Ref] = v172.searchBarRef
            });
        end;
    end;
end;
v52.getHeaderBarProps = function(v181, v182, v183, v184, v185, v186, v187)
    local v188 = nil;
    if not v183 then
        if not v184 then
            local l_centerItem_1 = v181.props.centerItem;
            local l_l_centerItem_1_0 = l_centerItem_1 --[[ copy: 8 -> 9 ]];
            v188 = {
                title = v185 or v182.pageTitle, 
                renderRight = function()
                    return v11.createFragment(v186);
                end, 
                renderCenter = not not l_centerItem_1 and function()
                    local v191 = not not v187 and v181.leftItemRef or nil;
                    local v192 = v181:getFirstRightItemRef() or v181.props.NextSelectionRight;
                    if not v181.props.useParentSizeForCenterItem then
                        return v181:renderTopBarItem(l_l_centerItem_1_0, v191, v192);
                    else
                        return v181:renderTopBarItem(l_l_centerItem_1_0, v191, v192, nil, true);
                    end;
                end or nil
            };
        else
            v188 = {
                title = v185 or v182.pageTitle, 
                renderCenter = function()
                    return v184();
                end, 
                renderRight = function()
                    return v11.createFragment(v186);
                end
            };
            if v181.state.isSearching then
                if v45() and v181.props.formFactor == l_FormFactor_0.WIDE then
                    v188.renderLeft = nil;
                else
                    v188.renderLeft = function()
                        return nil;
                    end;
                end;
            end;
        end;
    else
        v188 = {
            title = "", 
            renderCenter = function()
                return v183();
            end
        };
    end;
    if v181.props.transparentBackground then
        v188.backgroundTransparency = 1;
    end;
    v188.barHeight = l_NAV_BAR_SIZE_0;
    v188.isSecondary = v181.props.isSecondary;
    v188.shouldHideSecondaryLeftItem = not v187;
    if v187 then
        v188.renderLeft = function()
            return v181:renderTopBarItem(v181.props.leftItem, nil, (not not v181:shouldShowCenterItem() and v181.centerItemRef or v181:getFirstRightItemRef()) or v181.props.NextSelectionRight);
        end;
    end;
    local l_gridConfig_0 = v181.props.gridConfig;
    v188.margin = l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingHorizontal];
    v188.contentPaddingRight = UDim.new(0, l_gridConfig_0[l_LayoutConfig_0.Keys.PaddingRightItems]);
    return v188;
end;
v52.renderWithProviders = function(v194, v195, v196, v197)
    local l_focusController_0 = v194.props.focusController;
    local l_titleText_0 = v194.props.titleText;
    local v200 = v194:shouldShowLeftItem();
    local v201 = v194:hasSearchButton() and v194.props.enableSearch;
    local l_searchType_3 = v194.props.searchType;
    local l_enableSearchAutoComplete_0 = v194.props.enableSearchAutoComplete;
    local l_ZIndex_0 = v194.props.ZIndex;
    local l_gridConfig_1 = v194.props.gridConfig;
    local v206 = l_gridConfig_1[l_LayoutConfig_0.Keys.PaddingVertical];
    local v207 = l_gridConfig_1[l_LayoutConfig_0.Keys.PaddingHorizontal];
    local v208 = (v194.props.statusBarHeight + l_NAV_BAR_SIZE_0) + v206;
    local l_v208_0 = v208;
    if v60(v194.props) then
        l_v208_0 = l_v208_0 + 55;
    end;
    local v210 = l_v208_0 + v194.props.totalBannerHeight;
    local v211 = v194:isCompactViewMode();
    local l_searchPlaceholderSearchGames_0 = v197.searchPlaceholderSearchGames;
    if not (not v47 or not v194.props.shouldUpdateSearchPlaceholderText) then
        l_searchPlaceholderSearchGames_0 = v197.searchPlaceholderSearchPeopleOrExperiences;
    end;
    if l_searchType_3 == v29.SearchTypes.Catalog then
        l_searchPlaceholderSearchGames_0 = v197.searchPlaceholderSearchMarketplace;
    end;
    local v213 = v211 and (v194.state.isSearching or v194.props.showSearchBar);
    local v214 = not v194.props.showSearchBar;
    local v215 = v194:maybeRenderRightItems(v196, v213, v200);
    local v216 = v194:getRenderSearchBar(v213, v211, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, v214, v200, if not v47 then nil else v196);
    local v217 = v194:getRenderRootSearchBar(v213, v201, v211, l_searchPlaceholderSearchGames_0, l_searchType_3, l_enableSearchAutoComplete_0, if not v47 then nil else v196);
    local v218 = {
        Active = true, 
        BackgroundColor3 = v196.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = if not v194.props.transparentBackground then v196.Theme.BackgroundDefault.Transparency else 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v208), 
        ZIndex = 2
    };
    local v219 = v194:getHeaderBarProps(v197, v216, v217, l_titleText_0, v215, v200);
    local v220 = UDim2.new(0, v194.props.screenSize.X, 0, v194.props.screenSize.Y);
    local v221 = UDim2.new(0, -v194.state.absolutePosition.X, 0, -v194.state.absolutePosition.Y);
    local l_forwardRef_0 = v194.props.forwardRef;
    local v223 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else if l_searchType_3 == v29.SearchTypes.Auto then v29.SearchTypes.Games else l_searchType_3;
    return v11.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        [v11.Change.AbsolutePosition] = v194.absolutePositionChangedCallback
    }, {
        TopBarContents = v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v210)
        }, {
            TopBar = v11.createElement("Frame", v218, {
                NavBar = v11.createElement(l_Focusable_0.Frame, {
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = v196.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = if not v194.props.transparentBackground then v196.Theme.BackgroundDefault.Transparency else 1, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, l_NAV_BAR_SIZE_0), 
                    [v11.Ref] = l_forwardRef_0, 
                    NextSelectionRight = not (not not v211 and v194.state.isSearching) and v194.props.NextSelectionRight or nil, 
                    NextSelectionDown = not (not not v211 and v194.state.isSearching) and v194.props.NextSelectionDown or nil, 
                    defaultChild = if v217 or v211 and v194.state.isSearching then v194.searchBarRef else if v194:shouldShowLeftItem() then v194.leftItemRef else if v194:shouldShowCenterItem() then v194.centerItemRef else v194:getFirstRightItemRef()
                }, {
                    UIBloxHeaderBar = v11.createElement(l_HeaderBar_0, v219)
                })
            }), 
            SearchBar = v60(v194.props) and v11.createElement(v31, {
                position = UDim2.new(0.5, 0, 0, v208), 
                anchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(1, -v207 * 2, 0, 55), 
                modernUI = true, 
                cancelSearch = v194.cancelSearchCallback, 
                confirmSearch = v194.confirmSearchCallback, 
                onFocused = v194.onSearchBarFocused, 
                onTextCleared = v194.onTextCleared, 
                isCompactView = v211, 
                placeholderText = l_searchPlaceholderSearchGames_0, 
                searchType = if not l_FFlagOmniSearchAutoTabIXP_0 then l_searchType_3 else v223, 
                autocomplete = not not l_enableSearchAutoComplete_0 and if not l_FFlagOmniSearchAutoTabIXP_0 then l_searchType_3 == v29.SearchTypes.Games else v223 == v29.SearchTypes.Games or v46() and l_searchType_3 == v29.SearchTypes.Catalog, 
                [v11.Ref] = v194.searchBarRef, 
                focusController = l_focusController_0, 
                isSearching = v194.state.isSearching, 
                initialSearchText = not not v194.props.searchParameters and v194.props.searchParameters.searchKeyword or ""
            }), 
            BannerContainer = v11.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(0, 0, 0, l_v208_0), 
                BackgroundTransparency = 1
            }, v194.props.bannerContainer)
        }), 
        DarkOverlay = v11.createElement("TextButton", {
            Size = v220, 
            Position = v221, 
            AutoButtonColor = false, 
            BackgroundColor3 = v196.Theme.Overlay.Color, 
            BackgroundTransparency = 1, 
            Text = "", 
            Visible = v194.state.isSearching, 
            [v11.Event.Activated] = v194.cancelSearchAndEndSession, 
            ZIndex = 1
        }), 
        LastInputChangedListener = v11.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v224)
                v194:setState({
                    lastInputType = v224
                });
            end
        }), 
        SignalConnection = v11.createElement(v39, {
            signal = v195, 
            callback = v194.searchSignalCallback
        }), 
        HiddenItems = v194:renderHiddenItems()
    });
end;
v52.renderHiddenItems = function(v225)
    return v11.createElement("Frame", {
        Visible = false
    }, {
        leftItem = (v225.props.leftItem and not v225:shouldShowLeftItem()) and v225:renderTopBarItem(v225.props.leftItem), 
        centerItem = (v225.props.centerItem and not v225:shouldShowCenterItem()) and v225:renderTopBarItem(v225.props.centerItem)
    });
end;
v52.render = function(v226)
    return v38(function(v227)
        return l_withStyle_0(function(v228)
            return l_withLocalization_0({
                pageTitle = v226:getPageNameLocalizationKey(), 
                searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames", 
                searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace", 
                searchPlaceholderSearchPeopleOrExperiences = "Search.GlobalSearch.Example.SearchPeopleOrExperiences"
            })(function(v229)
                return v226:renderWithProviders(v227, v228, v229);
            end);
        end);
    end);
end;
v52.didUpdate = function(v230, v231, v232)
    v230:updateTopBarHeight(v231, v232);
    local v233 = v51[v230.state.lastInputType];
    local l_focusController_1 = v230.props.focusController;
    if ((not v230.state.isSearching or v232.isSearching) or not v233) or not l_focusController_1 then
        if not (((v230.state.isSearching or not v232.isSearching) or not v233) or not l_focusController_1) then
            l_focusController_1.moveFocusTo(v230.searchButtonRef);
        end;
    else
        l_focusController_1.moveFocusTo(v230.searchBarRef);
    end;
    v230:closeSearchBarIfLeavingPage(v231);
end;
v52.closeSearchBarIfLeavingPage = function(v235, v236)
    local l_currentRoute_3 = v235.props.currentRoute;
    local l_currentRoute_4 = v236.currentRoute;
    if l_currentRoute_3[#l_currentRoute_3].name ~= l_currentRoute_4[#l_currentRoute_4].name and v235.state.isSearching == true then
        v235.onExitSearch();
    end;
    if (not (not v235.props.avatarRoute or not v236.avatarRoute) and v235.props.avatarRoute.opaque.key ~= v236.avatarRoute.opaque.key) and v235.state.isSearching == true then
        v235.onExitSearch();
    end;
end;
local function _(v239)
    local l_name_2 = v239[#v239].name;
    local v241;
    if not v37() or l_name_2 ~= v24.GameDetail then
        v241 = false;
        if not (l_name_2 == v24.ProfilePeekView) then
            goto label1;
        end;
    end;
    v241 = false;
    if #v239 > 1 then
        v241 = v239[#v239 - 1].name == v24.SearchPage;
    end;
    ::label1::;
    return v241;
end;
local function _(v243)
    if v243[#v243].name == v24.SearchPage then
        return true;
    else
        local l_name_3 = v243[#v243].name;
        local v245;
        if not v37() or l_name_3 ~= v24.GameDetail then
            v245 = false;
            if not (l_name_3 == v24.ProfilePeekView) then
                goto label2;
            end;
        end;
        v245 = false;
        if #v243 > 1 then
            v245 = v243[#v243 - 1].name == v24.SearchPage;
        end;
        ::label2::;
        if not v245 then
            return false;
        else
            return true;
        end;
    end;
end;
local function v251(v247)
    for v248 = #v247, 1, -1 do
        local l_name_4 = v247[v248].name;
        local v250 = v25[l_name_4];
        if not (v250 ~= nil and v250.renderUnderlyingPage) then
            return l_name_4;
        end;
    end;
    return nil;
end;
v52 = v40(v14.withNavigation((l_RoactAppPolicy_0.connect(function(v252, _)
    return {
        enableNotifications = v252.getNotifications(), 
        enableSearch = v252.getSearchBar(), 
        enableSearchAutoComplete = v252.getSearchAutoComplete()
    };
end)((l_RoactServices_0.connect({
    analytics = v16, 
    sessionService = l_AppSessionService_0, 
    eventIngest = v19
})((v12.connect(function(v254, _)
    local v256 = v254.Navigation.history[#v254.Navigation.history];
    local v257 = {
        screenSize = v254.ScreenSize, 
        formFactor = v254.FormFactor, 
        currentRoute = v256, 
        navigationHistory = v254.Navigation.history
    };
    local v258;
    if v256[#v256].name == v24.SearchPage then
        v258 = true;
    else
        local l_name_5 = v256[#v256].name;
        local v260;
        if not v37() or l_name_5 ~= v24.GameDetail then
            v260 = false;
            if not (l_name_5 == v24.ProfilePeekView) then
                goto label3;
            end;
        end;
        v260 = false;
        if #v256 > 1 then
            v260 = v256[#v256 - 1].name == v24.SearchPage;
        end;
        ::label3::;
        v258 = not not v260 or false;
    end;
    v257.showSearchBar = v258;
    v257.statusBarHeight = v254.TopBar.statusBarHeight;
    v257.userId = v254.LocalUserId;
    v257.opaquePage = v251(v256);
    return v257;
end, function(v261)
    return {
        confirmSearch = function(v262, v263)
            return v261(v23(v262, v263));
        end, 
        setTopBarHeight = function(v264)
            return v261(v26(v264));
        end
    };
end)((v34(function(v265, v266)
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingRightItems] = 0, 
        [l_LayoutConfig_0.Keys.PaddingHorizontal] = l_getPageMargin_0(v266.screenSize.X), 
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v267)
        return v11.createElement(v265, v9.Dictionary.join(v266, {
            gridConfig = v267
        }));
    end);
end)(v52))))))))), {
    required = false
});
if not (not v44() and not v47) then
    v52 = v21.connectUserLayer({
        v22.SearchBarLayer
    }, function(v268, _)
        local v270 = v268[v22.SearchBarLayer] or {};
        return {
            phoneModeUnderTitleSearchBar = if not v44() then nil else v270.phoneModeUnderTitleSearchBar == "true", 
            shouldUpdateSearchPlaceholderText = if not v47 then nil else v270.shouldUpdateSearchPlaceholderText
        };
    end)(v52);
end;
local l_v52_0 = v52;
v52 = function(v272)
    local v273, v274 = v36(v272.hideSiteMessageBanner);
    return v13.withFocusController(function(v275)
        return v11.createElement(l_v52_0, v9.Dictionary.join(v272, {
            focusController = v275, 
            bannerContainer = v273, 
            totalBannerHeight = v274
        }));
    end);
end;
return v11.forwardRef(function(v276, v277)
    return v11.createElement(v52, v9.Dictionary.join(v276, {
        forwardRef = v277
    }));
end);
