local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useSelectionCursor_0 = l_UIBlox_0.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v11 = require(script.Parent.AddFriendsSectionHeaderFrame);
local v12 = require(script.Parent.AddFriendsGridView);
local v13 = require(script.Parent.AddFriendsEmptyState);
local v14 = require(script.Parent.IgnoreAllFriendsRequestsMenu);
local v15 = require(l_script_FirstAncestor_0.Common.Constants);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local v17 = game:DefineFastFlag("FixIgnoreAllGamepad", false);
local l_TOP_BAR_HEIGHT_0 = v15.TOP_BAR_HEIGHT;
local v19 = l_Images_0["icons/menu/more_on"];
local v20 = l_Images_0["icons/menu/more_off"];
local function v21()
end;
if not v17 then
    local l_Roact_0 = v2.Roact;
    local v23 = l_Roact_0.PureComponent:extend("AddFriendsContentFrame");
    v23.validateProps = l_t_0.interface({
        headerFrame = l_t_0.optional(l_t_0.strictInterface({
            title = l_t_0.string, 
            iconVisible = l_t_0.boolean
        })), 
        renderAddFriendsTile = l_t_0.callback, 
        position = l_t_0.UDim2, 
        friends = l_t_0.array(l_t_0.table), 
        screenSize = l_t_0.Vector2, 
        renderShowMore = l_t_0.callback, 
        itemMargin = l_t_0.optional(l_t_0.integer), 
        getItemMetrics = l_t_0.optional(l_t_0.callback), 
        layoutOrder = l_t_0.optional(l_t_0.integer), 
        handleIgnoreAllFriendsRequests = l_t_0.optional(l_t_0.callback), 
        showNewAddFriendsPageVariant = l_t_0.optional(l_t_0.boolean)
    });
    v23.defaultProps = {
        itemMargin = 12, 
        getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
        layoutOrder = 1, 
        handleIgnoreAllFriendsRequests = v21
    };
    v23.init = function(v24)
        v24.state = {
            isIgnoreAllMenuOpen = false
        };
        v24.onHeaderIconClicked = function()
            v24:setState({
                isIgnoreAllMenuOpen = not v24.state.isIgnoreAllMenuOpen
            });
        end;
        v24.onIgnoreAll = function()
            v24:setState({
                isIgnoreAllMenuOpen = false
            });
            if v24.props.handleIgnoreAllFriendsRequests then
                v24.props.handleIgnoreAllFriendsRequests();
            end;
        end;
    end;
    v23.render = function(v25)
        if v25.props.showNewAddFriendsPageVariant then
            l_TOP_BAR_HEIGHT_0 = -155;
        end;
        local v26 = if not v25.props.showNewAddFriendsPageVariant then v25.props.headerFrame else v25.props.headerFrame and #v25.props.friends > 0;
        return l_withStyle_0(function(v27)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = v25.props.position, 
                BackgroundColor3 = if v16 then nil else v27.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if not v16 then nil else 1, 
                LayoutOrder = v25.props.layoutOrder, 
                BorderSizePixel = 0
            }, {
                ContentContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundColor3 = if v16 then nil else v27.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = if not v16 then nil else 1, 
                    BorderSizePixel = 0
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 0)
                    }), 
                    HeaderFrame = not not v26 and l_Roact_0.createElement(v11, {
                        layoutOrder = 1, 
                        title = v25.props.headerFrame.title, 
                        icon = if not v25.state.isIgnoreAllMenuOpen then v20 else v19, 
                        iconVisible = v25.props.headerFrame.iconVisible, 
                        onIconActivated = v25.onHeaderIconClicked
                    }) or nil, 
                    ContentView = #v25.props.friends > 0 and l_Roact_0.createElement(v12, {
                        items = v25.props.friends, 
                        layoutOrder = 2, 
                        windowSize = v25.props.screenSize, 
                        renderAddFriendsTile = v25.props.renderAddFriendsTile, 
                        itemMargin = v25.props.itemMargin, 
                        getItemMetrics = v25.props.getItemMetrics
                    }) or l_Roact_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, l_TOP_BAR_HEIGHT_0), 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1
                    }, {
                        EmptyState = if not v25.props.showNewAddFriendsPageVariant then l_Roact_0.createElement(v13) else l_Roact_0.createElement(v13, {
                            screenSize = v25.props.screenSize, 
                            showNewAddFriendsPageVariant = v25.props.showNewAddFriendsPageVariant
                        })
                    }), 
                    BottomLoadMoreButton = v25.props.renderShowMore(3)
                }), 
                IgnoreAllContextMenu = l_Roact_0.createElement(v14, {
                    open = v25.state.isIgnoreAllMenuOpen, 
                    width = UDim.new(0, 300), 
                    onIgnoreAll = v25.onIgnoreAll, 
                    openPositionY = UDim.new(0, v27.Tokens.Global.Space_600)
                })
            });
        end);
    end;
    return v23;
else
    local v28 = require(l_Parent_0.React);
    local v29 = {
        itemMargin = 12, 
        getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
        layoutOrder = 1, 
        handleIgnoreAllFriendsRequests = v21
    };
    return function(v30)
        local v31 = if not v30.itemMargin then v29.itemMargin else v30.itemMargin;
        local v32 = if not v30.getItemMetrics then v29.getItemMetrics else v30.getItemMetrics;
        local v33 = if not v30.layoutOrder then v29.layoutOrder else v30.layoutOrder;
        local v34 = if not v30.handleIgnoreAllFriendsRequests then v29.handleIgnoreAllFriendsRequests else v30.handleIgnoreAllFriendsRequests;
        local v35, v36 = v28.useState(false);
        local v38 = v28.useCallback(function()
            v36(function(v37)
                return not v37;
            end);
        end, {});
        local v39 = v28.useCallback(function()
            v36(false);
            v34();
        end, {
            v34
        });
        if v30.showNewAddFriendsPageVariant then
            l_TOP_BAR_HEIGHT_0 = -155;
        end;
        local v40 = if not v30.showNewAddFriendsPageVariant then v30.headerFrame ~= nil else v30.headerFrame and #v30.friends > 0;
        local v41 = l_useStyle_0();
        return v28.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = v30.position, 
            BackgroundColor3 = if v16 then nil else v41.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = if not v16 then nil else 1, 
            LayoutOrder = v33, 
            BorderSizePixel = 0
        }, {
            ContentContainer = v28.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = if v16 then nil else v41.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if not v16 then nil else 1, 
                BorderSizePixel = 0
            }, {
                Layout = v28.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                HeaderFrame = if not v40 then nil else v28.createElement(v11, {
                    layoutOrder = 1, 
                    title = v30.headerFrame.title, 
                    icon = if not v35 then v20 else v19, 
                    iconVisible = v30.headerFrame.iconVisible, 
                    onIconActivated = v38
                }), 
                ContentView = if #v30.friends > 0 then v28.createElement(v12, {
                    items = v30.friends, 
                    layoutOrder = 2, 
                    windowSize = v30.screenSize, 
                    renderAddFriendsTile = v30.renderAddFriendsTile, 
                    itemMargin = v31, 
                    getItemMetrics = v32
                }) else v28.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, l_TOP_BAR_HEIGHT_0), 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Selectable = true, 
                    SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.Invisible)
                }, {
                    EmptyState = if not v30.showNewAddFriendsPageVariant then v28.createElement(v13) else v28.createElement(v13, {
                        screenSize = v30.screenSize, 
                        showNewAddFriendsPageVariant = v30.showNewAddFriendsPageVariant
                    })
                }), 
                BottomLoadMoreButton = v30.renderShowMore(3)
            }), 
            IgnoreAllContextMenu = v28.createElement(v14, {
                open = v35, 
                width = UDim.new(0, 300), 
                onIgnoreAll = v39, 
                openPositionY = UDim.new(0, v41.Tokens.Global.Space_600)
            })
        });
    end;
end;
