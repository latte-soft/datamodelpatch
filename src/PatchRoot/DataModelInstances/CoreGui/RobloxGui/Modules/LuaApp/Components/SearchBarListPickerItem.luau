local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local v11 = require(l_Modules_0.LuaApp.FitChildren);
local v12 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v13 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v14 = v4.PureComponent:extend("SearchBarListPickerItem");
v14.defaultProps = {
    displayIcon = nil
};
v14.init = function(v15)
    v15.state = {
        menuItemDown = false
    };
    v15.onMenuItemInputBegan = function(_, v17)
        if (not (v17.UserInputType ~= Enum.UserInputType.Touch) or v17.UserInputType == Enum.UserInputType.MouseButton1) and v17.UserInputState == Enum.UserInputState.Begin then
            v15.onMenuItemDown();
        end;
    end;
    v15.onMenuItemInputEnd = function(_, _)
        v15.onMenuItemUp();
    end;
    v15.eventDisconnect = function()
        if v15.userInputServiceConn then
            v15.userInputServiceConn:Disconnect();
            v15.userInputServiceConn = nil;
        end;
    end;
    v15.onMenuItemDown = function()
        if not v15.state.menuItemDown then
            v15.eventDisconnect();
            v15.userInputServiceConn = l_UserInputService_0.InputEnded:Connect(function()
                v15.onMenuItemUp();
            end);
            v15:setState({
                menuItemDown = true
            });
        end;
    end;
    v15.onMenuItemUp = function(v20)
        if v15.state.menuItemDown or v15.state.menuItemActive ~= v20 then
            v15:setState({
                menuItemDown = false
            });
        end;
        v15.eventDisconnect();
    end;
end;
v14.renderWithProviders = function(v21, v22)
    local l_item_0 = v21.props.item;
    local l_layoutOrder_0 = v21.props.layoutOrder;
    local l_separatorEnabled_0 = v21.props.separatorEnabled;
    local l_menuItemDown_0 = v21.state.menuItemDown;
    local l_isRichItem_0 = l_item_0.isRichItem;
    local l_forwardRef_0 = v21.props.forwardRef;
    return l_withStyle_0(function(v29)
        return v4.createElement(l_Focusable_0.ImageButton, {
            BackgroundColor3 = not not l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Color or v29.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = not not l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Transparency or 1, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, not l_isRichItem_0 and 56 or 64), 
            [v4.Event.Activated] = l_item_0.onSelect, 
            [v4.Event.InputBegan] = v21.onMenuItemInputBegan, 
            [v4.Event.InputEnded] = v21.onMenuItemInputEnd, 
            NextSelectionLeft = v21.props.NextSelectionLeft, 
            NextSelectionRight = v21.props.NextSelectionRight, 
            NextSelectionUp = v21.props.NextSelectionUp, 
            NextSelectionDown = v21.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0, 
            SelectionImageObject = v22(l_CursorKind_0.RoundedRectNoInset)
        }, {
            Container = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 9)
                }), 
                LeftSpacing = v4.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                SearchIcon = v4.createElement(v13, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = "LuaApp/icons/ic-search-new", 
                    ImageColor3 = v29.Theme.IconDefault.Color, 
                    ImageTransparency = v29.Theme.IconDefault.Transparency, 
                    LayoutOrder = 2
                }), 
                Content = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -112, 1, 0), 
                    LayoutOrder = 3
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TitleText = v4.createElement(v12, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = l_item_0.text, 
                        Font = v29.Font.Body.Font, 
                        TextSize = v29.Font.BaseSize * v29.Font.Body.RelativeSize, 
                        TextColor3 = v29.Theme.TextDefault.Color, 
                        TextTransparency = v29.Theme.TextDefault.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        fitAxis = v11.FitAxis.Height
                    }), 
                    CategoryText = l_isRichItem_0 and v4.createElement(v12, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = "Game", 
                        Font = v29.Font.CaptionBody.Font, 
                        TextSize = v29.Font.BaseSize * v29.Font.CaptionBody.RelativeSize, 
                        TextColor3 = v29.Theme.TextMuted.Color, 
                        TextTransparency = v29.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        fitAxis = v11.FitAxis.Height
                    })
                }), 
                RichIcon = l_isRichItem_0 and v4.createElement("Frame", {
                    Size = UDim2.new(0, 44, 0, 44), 
                    Position = UDim2.new(1, -44, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4
                }, {
                    Shadow = v4.createElement("Frame", {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 8, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v29.Theme.BackgroundOnHover.Color, 
                        BackgroundTransparency = v29.Theme.BackgroundOnHover.Transparency, 
                        ZIndex = 10
                    }), 
                    Border = v4.createElement("Frame", {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 2, 0, 6), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v29.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = v29.Theme.BackgroundDefault.Transparency, 
                        ZIndex = 11
                    }), 
                    GameIcon = v4.createElement(l_LoadableImage_0, {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 0, 0, 8), 
                        BackgroundTransparency = 1, 
                        Image = l_item_0.displayIcon, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 12
                    })
                })
            }), 
            Separator = l_separatorEnabled_0 and v4.createElement("Frame", {
                BackgroundColor3 = v29.Theme.Divider.Color, 
                BackgroundTransparency = v29.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
v14.render = function(v30)
    return l_withSelectionCursorProvider_0(function(v31)
        return v30:renderWithProviders(v31);
    end);
end;
v14.willUnmount = function(v32)
    v32.eventDisconnect();
end;
return v4.forwardRef(function(v33, v34)
    return v4.createElement(v14, v3.Dictionary.join(v33, {
        forwardRef = v34
    }));
end);
