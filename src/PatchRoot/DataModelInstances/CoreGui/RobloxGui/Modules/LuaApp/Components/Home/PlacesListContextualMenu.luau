local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Components.Home.JoinableFriendsList);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local _ = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v12 = require(l_Modules_0.LuaApp.Components.Home.UserActiveGame);
local v13 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
local v15 = require(l_Modules_0.LuaApp.Components.FormBasedContextualMenu);
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v7.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
local l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0 = v7.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT;
local v18 = v2.PureComponent:extend("PlacesListContextualMenu");
v18.init = function(v19)
    v19.props.analytics.reportOpenModalFromGameTileForPlacesList(v19.props.game.placeId);
    v19.state = {
        headerHeight = 0
    };
    v19.headerRef = v2.createRef();
    v19.updateHeaderHeight = function()
        v19:setState({
            headerHeight = not not v19.headerRef.current and v19.headerRef.current.AbsoluteSize.Y or 0
        });
    end;
end;
v18.didMount = function(v20)
    v20.props.requestGameData(v20.props.networking, v20.props.game.placeId);
    v20.headerSizeChanged = v20.headerRef.current and v20.headerRef.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        v20.updateHeaderHeight();
    end);
    v20.updateHeaderHeight();
end;
v18.render = function(v21)
    local l_game_0 = v21.props.game;
    local l_anchorSpaceSize_0 = v21.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v21.props.anchorSpacePosition;
    local l_screenSize_0 = v21.props.screenSize;
    local l_formFactor_0 = v21.props.formFactor;
    local l_topBarHeight_0 = v21.props.topBarHeight;
    local l_closeCallback_0 = v21.props.closeCallback;
    local l_headerHeight_0 = v21.state.headerHeight;
    local v30 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local v31 = not not v30 and l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 or l_screenSize_0.X;
    return v2.createElement(v15, {
        anchorSpaceSize = l_anchorSpaceSize_0, 
        anchorSpacePosition = l_anchorSpacePosition_0, 
        itemWidth = v31
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        Header = v2.createElement(v12, {
            layoutOrder = 1, 
            width = v31, 
            universeId = l_game_0.universeId, 
            dismissContextualMenu = l_closeCallback_0, 
            featureContext = v13.PlacesList, 
            [v2.Ref] = v21.headerRef
        }), 
        Divider = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = v7.Color.GRAY4, 
            BorderSizePixel = 0
        }), 
        JoinableFriendsList = v2.createElement(v8, {
            LayoutOrder = 3, 
            maxHeight = not not v30 and ((l_screenSize_0.Y - (l_topBarHeight_0 + 50)) - (v7.BOTTOM_BAR_SIZE + 10)) - l_headerHeight_0 or l_screenSize_0.Y * 0.5 - l_DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT_0, 
            width = v31, 
            universeId = l_game_0.universeId
        })
    });
end;
v18.willUnmount = function(v32)
    if v32.headerSizeChanged then
        v32.headerSizeChanged:Disconnect();
    end;
end;
return (l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    networking = v6
})((v3.connect(function(v33, _)
    return {
        topBarHeight = v33.TopBar.topBarHeight, 
        formFactor = v33.FormFactor, 
        screenSize = v33.ScreenSize
    };
end, function(v35)
    return {
        requestGameData = function(v36, v37)
            return v35(l_ApiFetchGamesDataByPlaceIds_0(v36, {
                v37
            }));
        end, 
        closeCallback = function()
            v35(v11());
        end
    };
end)(v18))));
