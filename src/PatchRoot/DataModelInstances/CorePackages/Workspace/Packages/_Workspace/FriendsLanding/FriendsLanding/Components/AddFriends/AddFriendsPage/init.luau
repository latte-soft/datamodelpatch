local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Roact_0 = v2.Roact;
local v4 = require(l_Parent_0.Cryo);
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_Promise_0 = v2.Promise;
local l_UniversalAppPolicy_0 = v2.UniversalAppPolicy;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_getPageMargin_0 = l_UIBlox_0.App.Container.getPageMargin;
local l_useSelectionCursor_0 = l_UIBlox_0.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withLocalization_0 = v2.withLocalization;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_DiscoverabilityAnalytics_0 = v2.DiscoverabilityAnalytics;
local v20 = require(l_script_FirstAncestor_0.EnumScreens);
local v21 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_VerticalScrollViewWithMargin_0 = l_UIBlox_0.App.Container.VerticalScrollViewWithMargin;
local l_RefreshScrollingFrame_0 = v2.SocialLibraries.Components.RefreshScrollingFrame;
local v24 = require(l_script_FirstAncestor_0.Components.ShowMoreWrapper);
local v25 = require(script.Parent.AddFriendsTile);
local v26 = require(script.Parent.AddFriendsContactImporterBanner);
local v27 = require(script.Parent.AddFriendsGenericBanner);
local v28 = require(script.Parent.AddFriendsSectionHeaderFrame);
local v29 = require(script.Parent.AddFriendsEmptyState);
local l_UserSearchBarButton_0 = v2.SocialCommon.Components.UserSearchBar.UserSearchBarButton;
local v31 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v32 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v37 = require(l_Parent_0.ReactFocusNavigation);
local v38 = require(l_Parent_0.InputHandlers);
local l_useFocusGuiObject_0 = v2.useFocusGuiObject;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_TextKeys_0 = require(l_Parent_0.ContactImporter).TextKeys;
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v43 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateContactImportModalLogic);
local v44 = require(l_script_FirstAncestor_0.Flags.getFIntAddFriendsVisibleRecRows);
local v45 = require(l_script_FirstAncestor_0.Flags.FFlagEnableAddFriendsPageSearchBar);
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_Parent_0.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local l_FFlagFriendsLandingSafeAreaPadding_0 = require(l_Parent_0.SharedFlags).FFlagFriendsLandingSafeAreaPadding;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local v49 = require(l_script_FirstAncestor_0.Flags.FFlagFixJumpingEmptyPage);
local v50 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
local v52 = require(script.Parent.AddFriendsContentFrame);
local v53 = l_Roact_0.PureComponent:extend("AddFriendsPage");
local v54 = v44();
local function v55()
end;
v53.validateProps = l_t_0.strictInterface({
    friendRecommendations = l_t_0.table, 
    friendRecommendationsCount = l_t_0.integer, 
    friendRecommendationsSessionId = l_t_0.optional(l_t_0.string), 
    friendRequests = l_t_0.table, 
    friendRequestsCount = l_t_0.integer, 
    screenSize = l_t_0.Vector2, 
    refreshPage = l_t_0.callback, 
    visibleRows = l_t_0.integer, 
    amIFollowingUser = l_t_0.callback, 
    isUserFollowingMe = l_t_0.callback, 
    getFriendshipRequestSentFromExperience = l_t_0.callback, 
    handleNavigateDownToViewUserProfile = l_t_0.optional(l_t_0.callback), 
    handleOpenLearnMoreLink = l_t_0.optional(l_Dash_0.isCallable), 
    handleOpenPhoneVerificationLinkWebview = l_t_0.optional(l_Dash_0.isCallable), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleIgnoreAllFriendsRequests = l_t_0.optional(l_t_0.callback), 
    openPlayerContextualMenu = l_t_0.optional(l_t_0.callback), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    handleLoadMoreRequests = l_t_0.optional(l_t_0.callback), 
    contactImporterAndPYMKEnabled = l_t_0.optional(l_t_0.boolean), 
    contactImporterExperimentVariant = l_t_0.optional(l_t_0.string), 
    navigation = l_t_0.optional(l_t_0.table), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    localUserId = l_t_0.optional(l_t_0.string), 
    shouldShowContactImporterFeature = l_t_0.optional(l_t_0.boolean), 
    shouldShowContactImporterUpsellModal = l_t_0.optional(l_t_0.boolean), 
    fireContactImporterAnalyticsEvents = l_t_0.callback, 
    fireContactImporterSeenEvent = l_t_0.callback, 
    contactImporterWarningSeen = l_t_0.optional(l_t_0.callback), 
    isPhoneVerified = l_t_0.optional(l_t_0.boolean), 
    isDiscoverabilityUnset = l_t_0.optional(l_t_0.boolean), 
    getUserSettingsMetadata = l_t_0.optional(l_t_0.callback), 
    handleShowToastForTests = l_t_0.optional(l_Dash_0.isCallable), 
    showTooltip = l_t_0.optional(l_t_0.boolean), 
    setScreenTopBar = l_t_0.optional(l_Dash_0.isCallable), 
    addFriendsPageSearchbarEnabled = l_t_0.optional(l_t_0.boolean), 
    originSourceType = l_t_0.optional(l_t_0.table), 
    showNewAddFriendsPageVariant = l_t_0.optional(l_t_0.boolean), 
    fireProfileQRCodeBannerSeenEvent = l_t_0.optional(l_t_0.callback), 
    fireProfileQRCodeBannerPressedEvent = l_t_0.optional(l_t_0.callback), 
    hasOSPermissions = l_t_0.optional(l_t_0.boolean), 
    openProfilePeekView = l_t_0.optional(l_t_0.callback), 
    fireSearchbarPressedEvent = l_t_0.optional(l_t_0.callback), 
    canUploadContacts = l_t_0.optional(l_t_0.boolean), 
    shouldShowPYMKSection = l_t_0.boolean, 
    analytics = l_t_0.table, 
    BackgroundColor = l_t_0.optional(l_t_0.Color3), 
    BackgroundTransparency = l_t_0.optional(l_t_0.integer), 
    eventHandlerRef = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else l_t_0.optional(l_t_0.callback), 
    getItemMetrics = l_t_0.optional(l_t_0.callback), 
    itemMargin = l_t_0.optional(l_t_0.integer), 
    pagePaddingTop = l_t_0.optional(l_t_0.integer), 
    focusGuiObject = l_t_0.optional(l_t_0.callback), 
    shouldShowBanner = l_t_0.optional(l_t_0.boolean), 
    canvasPositionBinding = l_t_0.optional(l_t_0.table), 
    onSelectionChanged = l_t_0.optional(l_t_0.callback), 
    ScrollingEnabled = l_t_0.optional(l_t_0.boolean), 
    hasBottomWhitespace = l_t_0.boolean, 
    safeAreaMargin = if not l_FFlagFriendsLandingSafeAreaPadding_0 then nil else l_t_0.Vector2, 
    globalGuiInset = l_t_0.table, 
    enableProfileQrCode = l_t_0.boolean, 
    pymkEnabledForConsole = if not v51 then nil else l_t_0.optional(l_t_0.boolean)
});
v53.defaultProps = {
    handleNavigateDownToViewUserProfile = v55, 
    handleAcceptFriendRequest = v55, 
    handleDeclineFriendRequest = v55, 
    handleRequestFriendship = v55, 
    handleIgnoreAllFriendsRequests = v55, 
    handleLoadMoreRequests = nil, 
    handleOpenLearnMoreLink = v55, 
    handleOpenPhoneVerificationLinkWebview = v55, 
    handleShowToastForTests = nil, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
    itemMargin = 12, 
    pagePaddingTop = 0
};
v53.init = function(v56)
    local v57 = false;
    v56.state = {
        shouldShowContactImporterModal = v56.props.shouldShowContactImporterUpsellModal, 
        selectedIndexAfterShowMore = nil
    };
    v56.renderAddFriendsTile = function(v58, v59, v60, v61)
        local v62 = false;
        local v63 = v56.props.originSourceType[v58.id] == "PhoneContactImporter";
        v62 = (v56.props.showTooltip and not v57) and v63;
        if v63 then
            v57 = true;
        end;
        return l_Roact_0.createElement(v25, {
            layoutOrder = v61, 
            position = v61, 
            user = v58, 
            size = Vector2.new(v59, v60), 
            isFriendRequest = not v58.isRecommendation and true or false, 
            isRecommendation = v58.isRecommendation, 
            amIFollowingUser = v56.props.amIFollowingUser(v58), 
            isUserFollowingMe = v56.props.isUserFollowingMe(v58), 
            sentFromExperienceName = v56.props.getFriendshipRequestSentFromExperience(v58), 
            handleNavigateDownToViewUserProfile = v56.props.handleNavigateDownToViewUserProfile, 
            handleAcceptFriendRequest = v56.props.handleAcceptFriendRequest, 
            handleDeclineFriendRequest = v56.props.handleDeclineFriendRequest, 
            handleRequestFriendship = v56.props.handleRequestFriendship, 
            openPlayerContextualMenu = v56.props.openPlayerContextualMenu, 
            contactImporterWarningSeen = v56.props.contactImporterWarningSeen, 
            showTooltip = v62, 
            navigation = v56.props.navigation, 
            isPlayerContextualMenuEnabled = v56.props.isPlayerContextualMenuEnabled, 
            selected = v61 == v56.state.selectedIndexAfterShowMore, 
            focusGuiObject = v56.props.focusGuiObject
        });
    end;
    v56.showContactImporterBanner = function(v64)
        return v64.contactImporterAndPYMKEnabled;
    end;
    v56.shouldRenderShowMoreFriendRequests = function(v65)
        return v65 < v56.props.friendRequestsCount;
    end;
    v56.shouldRenderShowMoreFriendRecommendations = function(v66)
        return v66 < v56.props.friendRecommendationCount;
    end;
    v56.showToastForContactsUpload = function(v67)
        if v56.props.navigation then
            v56.props.navigation.navigate(v20.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v67
                    }
                }
            });
        end;
    end;
    v56.openContactImporter = function()
        v56.props.fireContactImporterAnalyticsEvents();
        v56.props.contactImporterWarningSeen();
        local _ = nil;
        if not if not v43() then (not v56.props.hasOSPermissions or not v56.props.canUploadContacts) or v56.state.shouldShowContactImporterModal else v56.state.shouldShowContactImporterModal then
            local v69 = {
                isFromAddFriendsPage = true, 
                openLearnMoreLink = v56.props.handleOpenLearnMoreLink, 
                bypassFetchContacts = true, 
                diagService = v56.props.diagService, 
                eventIngestService = v56.props.eventIngestService, 
                isPhoneVerified = v56.props.isPhoneVerified, 
                openAmpUpsell = v56.props.navigateToLuaAppPages[v20.AmpWizardContainer], 
                showToast = if not l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then nil else v56.props.handleShowToastForTests or v56.showToastForContactsUpload
            };
            if not v56.props.isDiscoverabilityUnset or not v56.props.isPhoneVerified then
                v56.props.navigation.navigate(v20.ContactsList, v69);
                return ;
            else
                v56.props.getUserSettingsMetadata():andThen(function()
                    v56.props.navigation.navigate(v20.DiscoverabilityOverlay, {
                        showToast = v56.showToastForContactsUpload, 
                        openLearnMoreLink = v56.props.handleOpenLearnMoreLink, 
                        diagService = v56.props.diagService, 
                        eventIngestService = v56.props.eventIngestService, 
                        entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.AddFriends
                    });
                end):catch(function()
                    return l_Promise_0.reject();
                end);
                return ;
            end;
        else
            v56.props.navigation.navigate(v20.ContactImporter, {
                isFromAddFriendsPage = true, 
                openLearnMoreLink = v56.props.handleOpenLearnMoreLink, 
                showToast = v56.props.handleShowToastForTests or v56.showToastForContactsUpload, 
                diagService = v56.props.diagService, 
                eventIngestService = v56.props.eventIngestService, 
                isDiscoverabilityUnset = v56.props.isDiscoverabilityUnset, 
                isPhoneVerified = v56.props.isPhoneVerified, 
                openAmpUpsell = v56.props.navigateToLuaAppPages[v20.AmpWizardContainer]
            });
            return ;
        end;
    end;
    v56.onSearchbarActivated = (not not v56.props.addFriendsPageSearchbarEnabled and v45) and function()
        v56.props.navigation.navigate(v20.SearchFriends, {
            searchText = "", 
            shouldShowUserSearchLandingPage = true, 
            userSearchSource = l_Sources_0.AddFriendsPage
        });
        v56.props.setScreenTopBar(v20.FriendsLanding, {
            shouldRenderCenter = true, 
            shouldAutoFocusCenter = true
        });
        v56.props.fireSearchbarPressedEvent();
    end or nil;
    v56.openProfileQRCodePage = if not v56.props.showNewAddFriendsPageVariant then nil else function()
        v56.props.fireProfileQRCodeBannerPressedEvent();
        v56.props.navigateToLuaAppPages[v20.ProfileQRCode]();
    end;
    v56.handleShowMore = function(v70)
        v56:setState({
            selectedIndexAfterShowMore = v56.props.visibleRows * v70 + 1
        });
        if v56.props.handleLoadMoreRequests then
            v56.props.handleLoadMoreRequests(v70);
        end;
    end;
end;
v53.didMount = function(v71)
    if v71.showContactImporterBanner(v71.props) then
        v71.props.fireContactImporterSeenEvent();
    end;
    if not (not v71.props.showNewAddFriendsPageVariant or not v71.props.enableProfileQrCode) then
        v71.props.fireProfileQRCodeBannerSeenEvent();
    end;
end;
v53.didUpdate = function(v72, v73)
    if not (not v72.showContactImporterBanner(v72.props) or v72.showContactImporterBanner(v73)) then
        v72.props.fireContactImporterSeenEvent();
    end;
    if v73.shouldShowContactImporterUpsellModal ~= v72.props.shouldShowContactImporterUpsellModal then
        v72:setState({
            shouldShowContactImporterModal = v72.props.shouldShowContactImporterUpsellModal
        });
    end;
end;
v53.render = function(v74)
    local l_getItemMetrics_0 = v74.props.getItemMetrics;
    local l_itemMargin_0 = v74.props.itemMargin;
    local l_pagePaddingTop_0 = v74.props.pagePaddingTop;
    local v78 = if not not l_FFlagFriendsLandingSafeAreaPadding_0 and v74.props.safeAreaMargin.X > 0 then v74.props.safeAreaMargin.X else l_getPageMargin_0(v74.props.screenSize.X);
    return l_withLocalization_0({
        friendRequestsText = "Feature.AddFriends.Label.FriendRequests", 
        buttonText = if not v74.props.showNewAddFriendsPageVariant then l_TextKeys_0.CONTACTS_LIST_TITLE else nil, 
        bannerText = if not v74.props.showNewAddFriendsPageVariant then l_TextKeys_0.BANNER_TEXT else nil, 
        contactImporterBannerTitle = if not v74.props.showNewAddFriendsPageVariant then nil else l_TextKeys_0.CONNECT_WITH_CONTACTS_TITLE, 
        contactImporterBannerText = if not v74.props.showNewAddFriendsPageVariant then nil else l_TextKeys_0.CONNECT_WITH_CONTACTS_BODY, 
        qrCodeBannerTitle = if not v74.props.showNewAddFriendsPageVariant then nil else "Feature.AddFriends.Title.ShareQRCode", 
        qrCodeBannerText = if not v74.props.showNewAddFriendsPageVariant then nil else "Feature.AddFriends.Label.ShareQRCode", 
        peopleYouMayKnow = v21.PEOPLE_YOU_MAY_KNOW
    })(function(v79)
        return l_withStyle_0(function(v80)
            local v81 = v74.props.friendRequestsCount > 0;
            local v82 = not not v81 and " (" .. v74.props.friendRequestsCount .. ")" or "";
            local v83 = true;
            if not (not v74.props.shouldShowPYMKSection or v81) and v74.props.friendRecommendationsCount > 0 then
                v83 = false;
            end;
            local v84 = nil;
            local v85 = nil;
            local v86 = nil;
            if not v74.props.showNewAddFriendsPageVariant then
                if v74.showContactImporterBanner(v74.props) then
                    v84 = l_Roact_0.createElement(v26, {
                        bannerText = v79.bannerText, 
                        buttonText = v79.buttonText, 
                        onActivated = v74.openContactImporter, 
                        containerWidth = v74.props.screenSize.X
                    });
                end;
            else
                v85 = if not v74.showContactImporterBanner(v74.props) then nil else l_Roact_0.createElement(v27, {
                    bannerIcon = l_Images_0["icons/graphic/contacts_large"], 
                    bannerTitle = v79.contactImporterBannerTitle, 
                    bannerText = v79.contactImporterBannerText, 
                    onActivated = v74.openContactImporter, 
                    hasInfoButton = false
                });
                v86 = if not v74.props.enableProfileQrCode then nil else l_Roact_0.createElement(v27, {
                    bannerIcon = l_Images_0["icons/graphic/scanqr_large"], 
                    bannerTitle = v79.qrCodeBannerTitle, 
                    bannerText = v79.qrCodeBannerText, 
                    onActivated = v74.openProfileQRCodePage, 
                    hasInfoButton = false
                });
            end;
            local l_TOP_BAR_HEIGHT_0 = v32.TOP_BAR_HEIGHT;
            if v74.props.showNewAddFriendsPageVariant then
                l_TOP_BAR_HEIGHT_0 = -155;
            end;
            local v88 = if not v49 then nil else l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, l_TOP_BAR_HEIGHT_0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                SelectionImageObject = v74.props.cursor
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                HeaderFrame = not not (not v74.props.showNewAddFriendsPageVariant and true or v81) and l_Roact_0.createElement(v28, {
                    layoutOrder = 1, 
                    title = v79.friendRequestsText
                }) or nil, 
                EmptyStateLayoutWrapper = l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = if v50 then nil else v80.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = if not v50 then nil else 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                }, {
                    EmptyState = if not v74.props.showNewAddFriendsPageVariant then l_Roact_0.createElement(v29) else l_Roact_0.createElement(v29, {
                        screenSize = v74.props.screenSize, 
                        showNewAddFriendsPageVariant = v74.props.showNewAddFriendsPageVariant
                    })
                })
            });
            local v89 = l_Roact_0.createElement(v24, {
                analytics = v74.props.analytics, 
                sectionType = v31.FriendRequests, 
                friendRecommendationsSessionId = v74.props.friendRecommendationsSessionId, 
                listComponent = v52, 
                visibleRows = v74.props.visibleRows, 
                handleShowMore = v74.handleShowMore, 
                itemMargin = l_itemMargin_0, 
                getItemMetrics = l_getItemMetrics_0, 
                showContactImporterTooltip = v74.props.showContactImporterTooltip, 
                itemSize = l_getItemMetrics_0(v74.props.screenSize.X - 2 * v78, l_itemMargin_0).itemWidth, 
                friends = v74.props.friendRequests, 
                overrideRenderShowMore = not not v74.props.friendRequestsCount and v74.shouldRenderShowMoreFriendRequests or nil, 
                headerFrame = {
                    title = v79.friendRequestsText .. v82, 
                    iconVisible = v81
                }, 
                renderAddFriendsTile = v74.renderAddFriendsTile, 
                handleIgnoreAllFriendsRequests = v74.props.handleIgnoreAllFriendsRequests, 
                position = UDim2.new(0, 0, 0, 0), 
                layoutOrder = 2, 
                screenSize = Vector2.new((v74.props.screenSize.X - 2 * v78) - v74.props.globalGuiInset.left, v74.props.screenSize.Y), 
                showNewAddFriendsPageVariant = v74.props.showNewAddFriendsPageVariant, 
                spacingIfEmpty = v74.props.friendRecommendationsCount > 0 and 0 or nil
            });
            local v90 = nil;
            v90 = if not v49 then v89 else if v74.props.friendRequestsCount > 0 then v89 else v88;
            local l_createFragment_0 = l_Roact_0.createFragment;
            local v92 = {
                pagePadding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_pagePaddingTop_0)
                })
            };
            local l_createElement_0 = l_Roact_0.createElement;
            local v94 = "Frame";
            local v95 = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v74.props.BackgroundColor, 
                BackgroundTransparency = v74.props.BackgroundTransparency, 
                BorderSizePixel = 0, 
                [l_Roact_0.Ref] = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else v74.props.eventHandlerRef
            };
            local v96 = {};
            local l_createElement_1 = l_Roact_0.createElement;
            local v98 = "Frame";
            local v99 = {
                Size = UDim2.fromScale(1, 1), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            };
            local v100 = {};
            local l_createElement_2 = l_Roact_0.createElement;
            local l_l_RefreshScrollingFrame_0_0 = l_RefreshScrollingFrame_0;
            local v103 = {
                ScrollingElement = l_VerticalScrollViewWithMargin_0
            };
            local v104 = {
                size = UDim2.new(1, 0, 1, if not not v74.props.addFriendsPageSearchbarEnabled and v45 then -2 * v32.TOP_BAR_HEIGHT else -v32.TOP_BAR_HEIGHT)
            };
            local v105 = true;
            if v74.props.friendRequestsCount <= 0 then
                v105 = v74.props.shouldShowPYMKSection and v74.props.friendRecommendationsCount > 0;
            end;
            v104.useAutomaticCanvasSize = v105;
            v104.canvasSizeY = UDim.new(1, 1);
            v104.paddingHorizontal = v78;
            v104.Selectable = false;
            v104.onSelectionChanged = v74.props.onSelectionChanged;
            v104.CanvasPosition = v74.props.canvasPositionBinding;
            v104.ScrollingEnabled = v74.props.ScrollingEnabled;
            v103.scrollingElementProps = v104;
            v103.refresh = v74.props.refreshPage;
            v104 = {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                UIPadding = if not v74.props.showNewAddFriendsPageVariant then if v74.props.contactImporterAndPYMKEnabled then l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 4)
                }) else nil else l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8)
                }), 
                Banner = if not v74.props.shouldShowBanner then nil else v84, 
                BannerSection = if not v74.props.showNewAddFriendsPageVariant then nil else l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(640, math.huge)
                    }), 
                    BannerLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12)
                    }), 
                    ContactImporterBanner = v85, 
                    QRCodeBanner = v86
                }), 
                pulldownSpacing = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }), 
                requestSection = v83 and v90
            };
            v105 = v74.props.shouldShowPYMKSection;
            if v105 then
                v105 = false;
                if v74.props.friendRecommendationsCount > 0 then
                    v105 = l_Roact_0.createElement(v24, {
                        listComponent = v52, 
                        visibleRows = v54, 
                        itemMargin = l_itemMargin_0, 
                        getItemMetrics = l_getItemMetrics_0, 
                        itemSize = l_getItemMetrics_0(v74.props.screenSize.X - 2 * v78, l_itemMargin_0).itemWidth, 
                        friends = v74.props.friendRecommendations, 
                        headerFrame = {
                            title = v79.peopleYouMayKnow, 
                            iconVisible = false
                        }, 
                        renderAddFriendsTile = v74.renderAddFriendsTile, 
                        position = UDim2.new(0, 0, 0, 0), 
                        layoutOrder = 3, 
                        screenSize = Vector2.new((v74.props.screenSize.X - 2 * v78) - v74.props.globalGuiInset.left, v74.props.screenSize.Y), 
                        shouldShowPYMKSection = v74.props.shouldShowPYMKSection
                    });
                end;
            end;
            v104.recommendationSection = v105;
            v104.BottomWhitespace = if not not v74.props.hasBottomWhitespace and v81 then l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 3000), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1000
            }) else nil;
            v100.ScrollView = l_createElement_2(l_l_RefreshScrollingFrame_0_0, v103, v104);
            v96.contentFrame = l_createElement_1(v98, v99, v100);
            v92.page = l_createElement_0(v94, v95, v96);
            l_createFragment_0 = l_createFragment_0(v92);
            if not v74.props.addFriendsPageSearchbarEnabled or not v45 then
                return l_createFragment_0;
            else
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = v74.props.BackgroundColor, 
                    BackgroundTransparency = v74.props.BackgroundTransparency
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    SearchbarButton = l_Roact_0.createElement(l_UserSearchBarButton_0, {
                        onActivated = v74.onSearchbarActivated
                    }); 
                    l_createFragment_0
                });
            end;
        end);
    end);
end;
v53 = l_RoactRodux_0.connect(function(v106)
    return {
        originSourceType = l_getDeepValue_0(v106, "FriendsLanding.RequestsFromOriginSourceType") or {}
    };
end, nil)((l_UniversalAppPolicy_0.connect(function(v107)
    return {
        enableProfileQrCode = v107.getEnableProfileQrCode()
    };
end)(v53)));
return function(v108)
    local v109 = l_useDesignTokens_0();
    local v110 = l_useUiModeInfo_0();
    local v111 = l_useFocusGuiObject_0();
    local v112 = v110.uiMode == l_UiMode_0.TenFoot;
    local v113 = if not v49 then nil else l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    if not v112 then
        v111 = nil;
    end;
    local v114 = nil;
    if l_FFlagEnableFriendsLandingControllerBar_0 then
        v114 = v37.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, (v38.onRelease(function(v115)
            v115:cancel();
            v108.navigateToLuaAppPages[v20.SearchPage]();
        end)));
    end;
    local v116, v117 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v109.Global.Space_600, v109.LuaApps.App.Page.ScrollAnimationConfig);
    return l_Roact_0.createElement(v53, v4.Dictionary.join(v108, {
        BackgroundColor = v109.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v109.LuaApps.App.Page.BackgroundTransparency, 
        isPlayerContextualMenuEnabled = v112, 
        eventHandlerRef = v114, 
        getItemMetrics = if not v112 then nil else l_GridMetrics_0.makeCustomMetricsGetter(v109.LuaApps.FriendsLanding.AddFriendsPage.GridViewItemMetrics), 
        itemMargin = v109.LuaApps.FriendsLanding.AddFriendsPage.ItemMargin, 
        pagePaddingTop = v109.LuaApps.FriendsLanding.AddFriendsPage.PagePaddingTop, 
        safeAreaMargin = if not l_FFlagFriendsLandingSafeAreaPadding_0 then nil else v109.LuaApps.App.Page.SafeAreaMargin, 
        focusGuiObject = v111, 
        shouldShowBanner = not (v112 or v108.showNewAddFriendsPageVariant), 
        shouldShowPYMKSection = not v112 or if v51 and v108.pymkEnabledForConsole then v108.shouldShowPYMKSection else false, 
        showNewAddFriendsPageVariant = not v112 and v108.showNewAddFriendsPageVariant, 
        canvasPositionBinding = if not v112 then nil else v116, 
        onSelectionChanged = if not v112 then nil else v117, 
        ScrollingEnabled = if not v112 then nil else false, 
        hasBottomWhitespace = v112, 
        cursor = v113
    }));
end;
