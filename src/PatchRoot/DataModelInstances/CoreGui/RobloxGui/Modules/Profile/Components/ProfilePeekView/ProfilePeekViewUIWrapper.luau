local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_memoize_0 = v1.memoize;
local l_PeekViewWithTopBar_0 = v1.PeekViewWithTopBar;
local l_AppUserLayers_0 = v1.AppUserLayers;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local v7 = require(l_Parent_0.Components.ProfileTopBar);
local v8 = require(l_Parent_0.Components.ProfileCard);
local v9 = require(l_Parent_0.Components.ContactProfileCard);
local v10 = require(l_Parent_0.Components.ProfileActionBar);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v12 = require(l_Parent_0.Common.Constants);
local v13 = require(l_Parent_0.Common.ProfileTypes);
local v14 = require(l_Parent_0.Components.ProfileModalView);
local l_getSafeAreaSize_0 = v1.getSafeAreaSize;
local v16 = require(script.Parent.ProfilePeekView);
local _ = require(script.Parent.profilePeekViewMapStateToProps);
local l_GetFFlagPeekViewScrimEnabledIXP_0 = v1.GetFFlagPeekViewScrimEnabledIXP;
local l_GetFFlagPeekViewScrimEnabled_0 = v1.GetFFlagPeekViewScrimEnabled;
local v20 = l_Roact_0.PureComponent:extend("ProfilePeekViewUIWrapper");
v20.init = function(v21)
    local l_props_0 = v21.props;
    v21.getInnerPaddingSize = l_memoize_0(function(v23)
        if v23 < 600 then
            return 20;
        else
            return 40;
        end;
    end);
    v21.renderContent = l_memoize_0(function(v24, v25)
        if l_props_0.profileType == v13.FromContacts then
            return function()
                return l_Roact_0.createElement(v9, {
                    profileUserId = l_props_0.profileUserId, 
                    navigation = l_props_0.navigation, 
                    onClickWithToast = l_props_0.onClickWithToast, 
                    width = v24, 
                    height = v25, 
                    avatarImageUrl = if not l_props_0.contactProps then nil else l_props_0.contactProps.avatarImageUrl
                });
            end;
        else
            return function()
                return l_Roact_0.createElement(v8, {
                    profileUserId = l_props_0.profileUserId, 
                    navigation = l_props_0.navigation, 
                    onClickWithToast = l_props_0.onClickWithToast, 
                    width = v24, 
                    height = v25
                });
            end;
        end;
    end);
    v21.renderBottomBar = l_memoize_0(function(v26)
        return function()
            return l_Roact_0.createElement(v10, {
                navigation = l_props_0.navigation, 
                innerPaddingSize = v26, 
                onClickWithToast = l_props_0.onClickWithToast
            });
        end;
    end);
    v21.renderTopBar = function()
        return l_Roact_0.createElement(v7, {
            showCloseIcon = not l_props_0.peekViewProps.showBackButton, 
            navigateBack = l_props_0.peekViewProps.onPeekViewGoBack
        });
    end;
end;
v20.render = function(v27)
    local l_props_1 = v27.props;
    local l_globalGuiInset_0 = l_props_1.globalGuiInset;
    local v30 = l_props_1.statusBarHeight + v12.NavBarHeight;
    local v31 = l_getSafeAreaSize_0(l_props_1.screenSize, l_globalGuiInset_0);
    local l_Offset_0 = v31.Y.Offset;
    local v33 = math.min(v31.X.Offset, 640);
    local v34 = v27.getInnerPaddingSize(v33);
    local v35 = v27.renderContent(v33, (l_Offset_0 - v30) - 40);
    local v36 = v27.renderBottomBar(v34);
    if not l_GetFFlagPeekViewScrimEnabled_0() and not l_props_1.scrimEnabled then
        return l_Roact_0.createElement(not not l_props_1.wideMode and v14 or v16, {
            bottomOffset = l_globalGuiInset_0.bottom, 
            peekViewProps = l_props_1.peekViewProps, 
            renderBottomBar = v36, 
            renderContent = v35, 
            renderTopBar = v27.renderTopBar, 
            topBarHeight = v30, 
            viewWidth = v33
        });
    elseif not l_props_1.wideMode then
        return l_Roact_0.createElement(l_PeekViewWithTopBar_0, {
            topBarHeight = v30, 
            viewWidth = UDim.new(0, v33), 
            bottomDockedContainerHeight = 58, 
            fullViewContentHeight = UDim.new(1, -v30), 
            briefViewContentHeight = UDim.new(0, v33 + 48), 
            onViewStateChanged = v27.viewStateChanged, 
            onClosed = l_props_1.peekViewProps.onPeekViewClosed, 
            mountAsFullView = l_props_1.peekViewProps.mountAsFullView, 
            mountAnimation = l_props_1.peekViewProps.mountAnimation, 
            bottomBarSlot = v36(), 
            contentSlot = v35(), 
            topBarSlot = v27.renderTopBar()
        });
    else
        return l_Roact_0.createElement(v14, {
            bottomOffset = l_globalGuiInset_0.bottom, 
            peekViewProps = l_props_1.peekViewProps, 
            renderBottomBar = v36, 
            renderContent = v35, 
            renderTopBar = v27.renderTopBar, 
            topBarHeight = v30, 
            viewWidth = v33
        });
    end;
end;
if l_GetFFlagPeekViewScrimEnabledIXP_0() then
    v20 = l_RoactAppExperiment_0.connectUserLayer({
        l_AppUserLayers_0.PlatformExcellenceQualityImprovementApp
    }, function(v37, _)
        local v39 = v37[l_AppUserLayers_0.PlatformExcellenceQualityImprovementApp];
        return {
            scrimEnabled = v39 and v39.peekViewScrimEnabled
        };
    end)(v20);
end;
return v20;
