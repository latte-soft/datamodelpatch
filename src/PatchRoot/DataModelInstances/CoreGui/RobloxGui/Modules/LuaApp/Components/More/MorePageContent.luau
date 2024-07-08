local l_CorePackages_0 = game:GetService("CorePackages");
local l_NavigationEvents_0 = require(l_CorePackages_0.RoactNavigation).NavigationEvents;
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.Cryo);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Components.More.MoreGrid);
local v10 = require(l_Modules_0.LuaApp.Components.More.MoreGridItem);
local v11 = require(l_Modules_0.LuaApp.Components.More.MoreLogOut);
local v12 = require(l_Modules_0.LuaApp.Components.More.MoreSwitchAccount);
local v13 = require(l_Modules_0.Common.Roact);
local v14 = game:DefineFastFlag("MobileMorePageScrollToTop", false);
local v15 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAccountSwitchExperimentBypassBackdoorDev);
local v17 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v18 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_VerticalScrollViewWithMargin_0 = v2.App.Container.VerticalScrollViewWithMargin;
local v21 = v13.PureComponent:extend("MorePageContent");
local v22 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
v21.validateProps = v3.strictInterface({
    isWideView = v3.boolean, 
    itemTable = v3.table, 
    topBarHeight = v3.integer
});
v21.init = function(v23)
    v23.shouldResize = true;
    v23.scrollviewRef = v13.createRef();
    v23.onWillFocus = function()
        if v23.scrollviewRef.current then
            local _ = v23.scrollviewRef.current.AbsoluteCanvasSize;
        end;
    end;
    v23.onResize = function(v25)
        if v23.shouldResize then
            local l_X_0 = v25.AbsoluteSize.X;
            local l_isWideView_0 = v23.props.isWideView;
            local v28 = nil;
            local v29 = nil;
            if not l_isWideView_0 then
                v29 = 12;
                v28 = l_X_0 < 360 and 12 or 24;
            else
                v29 = 24;
                v28 = if l_X_0 > 1020 then (l_X_0 - 924) / 2 else 48;
            end;
            local v30 = l_X_0 - 2 * v28;
            if v30 <= 0 then
                return ;
            else
                local v31 = l_GridMetrics_0.getMediumMetrics(v30, v29);
                v23:setState({
                    gridCellSize = v31.itemWidth, 
                    gridCellsInARow = v31.itemsPerRow, 
                    gutter = v29, 
                    paddingHorizontal = v28
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v23.renderGridItem = function(v32, v33)
        return v13.createElement(v10, {
            item = v32, 
            layoutOrder = v33
        });
    end;
    if v14 then
        v23.statusBarTappedConnection = l_UserInputService_0.StatusBarTapped:Connect(function()
            local l_current_0 = v23.scrollviewRef.current;
            if l_current_0 then
                if not l_UserGameSettings_0.ReducedMotion then
                    l_current_0:ScrollToTop();
                    return ;
                else
                    l_current_0.CanvasPosition = Vector2.new(0, 0);
                    return ;
                end;
            else
                return ;
            end;
        end);
    end;
    v23:setState({
        gridCellSize = 1, 
        gridCellsInARow = 1, 
        gutter = 12, 
        paddingHorizontal = 12
    });
end;
v21.willUnmount = function(v35)
    v35.shouldResize = false;
    if v14 then
        v35.statusBarTappedConnection:Disconnect();
    end;
end;
v21.render = function(v36)
    local l_gridCellSize_0 = v36.state.gridCellSize;
    local l_gridCellsInARow_0 = v36.state.gridCellsInARow;
    local l_gutter_0 = v36.state.gutter;
    local l_paddingHorizontal_0 = v36.state.paddingHorizontal;
    local v41 = v36.props.itemTable[1];
    local v42 = v36.props.itemTable[2][1];
    local l_topBarHeight_0 = v36.props.topBarHeight;
    local v44 = math.ceil(#v41 / l_gridCellsInARow_0) * (l_gridCellSize_0 + l_gutter_0) - l_gutter_0;
    local v45 = v22.fromLocalStorage().isUnder13 ~= true;
    local v46 = false;
    if v15 then
        v46 = v45 and (v36.props.isAccountSwitcherEnabled or v16 == true);
    end;
    local v47 = nil;
    v47 = if not v46 then (v44 + 2 * l_gutter_0) + 48 else (v44 + 2 * l_gutter_0) + 96;
    local v48 = nil;
    if v46 then
        v48 = v13.createElement(v12, {
            buttonHeight = 48, 
            buttonMaxWidth = 640, 
            item = v36.props.itemTable[2][1], 
            layoutOrder = 2
        });
    end;
    return v13.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, l_topBarHeight_0), 
        Size = UDim2.new(1, 0, 1, -l_topBarHeight_0)
    }, {
        UIPadding = v13.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_gutter_0)
        }), 
        Content = v13.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v13.Change.AbsoluteSize] = v36.onResize
        }, {
            NavigationEvents = v13.createElement(l_NavigationEvents_0, {
                onWillFocus = v36.onWillFocus
            }), 
            VerticalScrollViewWithMargin = v13.createElement(l_VerticalScrollViewWithMargin_0, {
                canvasSizeY = UDim.new(0, v47), 
                paddingHorizontal = l_paddingHorizontal_0, 
                [v13.Ref] = v36.scrollviewRef
            }, {
                UIListLayout = v13.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, l_gutter_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                MoreGrid = v13.createElement(v9, {
                    size = UDim2.new(1, 0, 0, v44), 
                    gridCellPadding = l_gutter_0, 
                    gridCellSize = l_gridCellSize_0, 
                    items = v41, 
                    renderItem = v36.renderGridItem, 
                    layoutOrder = 1
                }), 
                MoreSwitchAccount = v48, 
                MoreLogOut = v13.createElement(v11, {
                    buttonHeight = 48, 
                    buttonMaxWidth = 640, 
                    item = v42, 
                    layoutOrder = 3
                })
            })
        })
    });
end;
if v15 == true then
    v21 = v17.connectBrowserTrackerLayer({
        v18.AccountSwitcherLayer
    }, function(v49, _)
        return {
            isAccountSwitcherEnabled = (v49[v18.AccountSwitcherLayer] or {}).isAccountSwitcherEnabled
        };
    end)(v21);
end;
return v21;
