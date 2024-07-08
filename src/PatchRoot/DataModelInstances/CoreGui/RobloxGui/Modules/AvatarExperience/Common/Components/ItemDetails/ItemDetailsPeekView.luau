local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v4.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local v13 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.itemdetails");
local v14 = l_Images_0["icons/navigation/close"];
local v15 = v3.PureComponent:extend("ItemDetailsPeekView");
v15.init = function(v16)
    local v17, v18 = v3.createBinding(UDim2.new(0, 0, 0, 0));
    v16.closeButtonPosition = v17;
    v16.updateCloseButtonPosition = v18;
    v17, v18 = v3.createBinding(false);
    v16.closeButtonVisible = v17;
    v16.updateCloseButtonVisible = v18;
    local v19;
    v18, v19 = v3.createBinding(v16.props.luaProfileEnabled and v16.props.navigation.state.routeName == v9.TryOnItem);
    v16.topBarNavVisible = v18;
    v16.updateTopBarNavVisible = v19;
    local v20, v21 = v3.createBinding(not v16.props.mountAsFullView and 0 or 1);
    v16.briefViewPercentBinding = v20;
    v16.updateBriefViewPercentBinding = v21;
    v16.scrollingEnabledBinding = v16.briefViewPercentBinding:map(function(v22)
        return v22 == 1;
    end);
    v16.peekViewStateChanged = function(v23, v24)
        v13:debug("peekViewStateChanged: {} -> {}", v24, v23);
        v16:setState({});
        local l_analytics_0 = v16.props.analytics;
        local l_routeName_0 = v16.props.navigation.state.routeName;
        local l_itemId_0 = v16.props.itemId;
        local l_itemType_0 = v16.props.itemType;
        if not (v23 ~= l_PeekViewState_0.Closed) or v23 == l_PeekViewState_0.Hidden then
            if l_routeName_0 == v9.TryOnItem then
                v16.props.closeFocusedScreen(v16.props.navigation);
            else
                v16.props.closeAllPeekViews(v16.props.navigation);
            end;
            l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        elseif v23 == l_PeekViewState_0.Full then
            l_analytics_0.expandItemDetailPage(l_itemId_0, l_itemType_0);
        end;
        v16.props.setPeekViewState(v23);
    end;
    v16.briefToFullTransitionPercent = function(v29)
        if v16.props.navigation.state.routeName ~= v9.TryOnItem then
            if v29 > 0.8 then
                v16.updateTopBarNavVisible(true);
            else
                v16.updateTopBarNavVisible(false);
            end;
            if v29 > 0.95 then
                v16.updateCloseButtonVisible(false);
            else
                v16.updateCloseButtonVisible(true);
            end;
        end;
        v16.updateBriefViewPercentBinding(v29);
    end;
    v16.peekHeaderPositionYChange = function(v30)
        v16.updateCloseButtonPosition(UDim2.new(0, 15, 1, -((math.floor(v30 + 0.5) + 18) + 4)));
    end;
end;
v15.render = function(v31)
    return l_withStyle_0(function(v32)
        return v31:renderWith(v32);
    end);
end;
v15.renderWith = function(v33, v34)
    local l_Theme_0 = v34.Theme;
    local v36 = v33.props.lastInputGroup == v8.InputType.MouseAndKeyboard;
    local l_isTryOnPage_0 = v33.props.isTryOnPage;
    local l_viewPosition_0 = v33.props.viewPosition;
    local l_viewSize_0 = v33.props.viewSize;
    local l_briefViewHeight_0 = v33.props.briefViewHeight;
    local l_showDropShadow_0 = v33.props.showDropShadow;
    local l_mountAnimation_0 = v33.props.mountAnimation;
    local l_mountAsFullView_0 = v33.props.mountAsFullView;
    local l_topBarHeight_0 = v33.props.topBarHeight;
    local l_fromProfile_0 = v33.props.fromProfile;
    local l_peekViewFullViewEnabled_0 = v33.props.peekViewFullViewEnabled;
    local l_peekViewState_0 = v33.props.peekViewState;
    local v48 = UDim2.fromOffset(0, l_topBarHeight_0 - (not l_fromProfile_0 and 0 or 6));
    local l_renderContent_0 = v33.props.renderContent;
    local l_renderTopBar_0 = v33.props.renderTopBar;
    local l_renderBottomBar_0 = v33.props.renderBottomBar;
    local v52 = true;
    if l_peekViewState_0 ~= l_PeekViewState_0.Full then
        v52 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Extended then
            v52 = v36 or l_isTryOnPage_0;
        end;
    end;
    local l_scrollingEnabledBinding_0 = v33.scrollingEnabledBinding;
    local v54 = nil;
    if not l_peekViewFullViewEnabled_0 then
        v54 = Enum.ElasticBehavior.Never;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = l_viewSize_0, 
        Position = l_viewPosition_0
    }, {
        Overlay = v3.createElement("Frame", {
            BackgroundTransparency = if not l_isTryOnPage_0 then v33.briefViewPercentBinding:map(function(v55)
                return 1 - (1 - l_Theme_0.Overlay.Transparency) * v55;
            end) else 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        TopBar = if not v52 then nil else l_renderTopBar_0(), 
        CloseButton = (v36 and not l_isTryOnPage_0) and v3.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            Position = v33.closeButtonPosition, 
            Size = UDim2.new(0, 36, 0, 36), 
            Image = v14, 
            ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            Visible = v33.closeButtonVisible, 
            [v3.Event.Activated] = v33.props.closeBriefView
        }), 
        PeekViewContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = v48, 
            Size = UDim2.new(1, 0, 1, -v48.Y.Offset), 
            ZIndex = 2
        }, {
            PeekView = v3.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, l_briefViewHeight_0), 
                viewStateChanged = v33.peekViewStateChanged, 
                mountAnimation = l_mountAnimation_0, 
                mountAsFullView = l_mountAsFullView_0, 
                canDragFullViewToBrief = not l_fromProfile_0, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                bottomDockedContainerHeight = l_briefViewHeight_0, 
                bottomDockedContainerContent = {
                    ActionBarContainer = if not v12() then l_renderBottomBar_0() else l_renderBottomBar_0 and l_renderBottomBar_0()
                }, 
                showDropShadow = l_showDropShadow_0, 
                elasticBehavior = v54, 
                backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                briefToFullTransitionPercent = v33.briefToFullTransitionPercent, 
                peekHeaderClose = l_fromProfile_0 or false, 
                peekHeaderPositionYChange = v33.peekHeaderPositionYChange, 
                isScrollingEnabled = not v36 or l_scrollingEnabledBinding_0, 
                contentFrameRef = v33.props.contentFrameRef, 
                peekViewState = l_peekViewState_0
            }, {
                ItemDetails = l_renderContent_0()
            })
        })
    });
end;
local function _(v56)
    local l_peekViewState_1 = v56.peekViewState;
    local v58 = true;
    if l_peekViewState_1 ~= l_PeekViewState_0.Full then
        v58 = l_peekViewState_1 == l_PeekViewState_0.Extended;
    end;
    return v58;
end;
v15.didUpdate = function(v60, v61, _)
    local l_current_0 = v60.props.avatarRoute.current;
    local l_name_0 = l_current_0.name;
    local l_key_0 = l_current_0.key;
    local l_key_1 = v60.props.navigation.state.key;
    if not v60.props.peekViewShowing then
        if not (not (v61.peekViewShowing and l_name_0 ~= v9.ItemDetails) or not v60.props.itemDetailsExpanded) then
            v60.props.setItemDetailsExpanded(false);
        end;
    else
        local l_peekViewState_2 = v60.props.peekViewState;
        local v68 = true;
        if l_peekViewState_2 ~= l_PeekViewState_0.Full then
            v68 = l_peekViewState_2 == l_PeekViewState_0.Extended;
        end;
        if v60.props.itemDetailsExpanded ~= v68 then
            v60.props.setItemDetailsExpanded(v68);
        end;
    end;
    if v60.props.lastInputGroup == v8.InputType.Gamepad then
        local l_peekViewState_3 = v60.props.peekViewState;
        local v70 = true;
        if l_peekViewState_3 ~= l_PeekViewState_0.Full then
            v70 = l_peekViewState_3 == l_PeekViewState_0.Extended;
        end;
        l_peekViewState_3 = v61.peekViewState;
        local v71 = true;
        if l_peekViewState_3 ~= l_PeekViewState_0.Full then
            v71 = l_peekViewState_3 == l_PeekViewState_0.Extended;
        end;
        if l_key_0 == l_key_1 then
            if not v70 or v71 then
                if not (v70 or not v71) then
                    v60.props.focusController.moveFocusTo(v60.props.actionBarContainerRef);
                end;
            else
                v60.props.focusController.moveFocusTo(v60.props.contentFrameRef);
                return ;
            end;
        end;
    end;
end;
v15.didMount = function(v72)
    if not v72.props.mountAnimation then
        v72.peekHeaderPositionYChange(v72.props.briefViewHeight + 25);
    end;
    if v72.props.peekViewShowing then
        local l_peekViewState_4 = v72.props.peekViewState;
        local v74 = true;
        if l_peekViewState_4 ~= l_PeekViewState_0.Full then
            v74 = l_peekViewState_4 == l_PeekViewState_0.Extended;
        end;
        if v72.props.itemDetailsExpanded ~= v74 then
            v72.props.setItemDetailsExpanded(v74);
        end;
    end;
end;
v15.willUnmount = function(v75)
    if not (not v75.props.peekViewShowing or not v75.props.itemDetailsExpanded) then
        v75.props.setItemDetailsExpanded(false);
    end;
end;
return v15;
