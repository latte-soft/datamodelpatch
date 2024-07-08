local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
game:DefineFastFlag("ListPickerIconNotNeeded", false);
local v9 = l_game_EngineFeature_0 and 15 or 14;
local v10 = v3.PureComponent:extend("ListPickerItem");
v10.init = function(v11)
    v11.state = {
        menuItemDown = false
    };
    v11.onMenuItemActive = function(v12, v13)
        v11.props.onSelectItem(v12, v13);
    end;
    v11.onMenuItemInputBegan = function(_, v15)
        if (not (v15.UserInputType ~= Enum.UserInputType.Touch) or v15.UserInputType == Enum.UserInputType.MouseButton1) and v15.UserInputState == Enum.UserInputState.Begin then
            v11:onMenuItemDown();
        end;
    end;
    v11.onMenuItemInputEnd = function(_, _)
        v11:onMenuItemUp();
    end;
end;
v10.onMenuItemDown = function(v18)
    if not v18.state.menuItemDown then
        v18:eventDisconnect();
        v18.userInputServiceCon = l_UserInputService_0.InputEnded:Connect(function()
            v18:onMenuItemUp();
        end);
        v18:setState({
            menuItemDown = true
        });
    end;
end;
v10.onMenuItemUp = function(v19, v20)
    if v19.state.menuItemDown or v19.state.menuItemActive ~= v20 then
        v19:setState({
            menuItemDown = false
        });
    end;
    v19:eventDisconnect();
end;
v10.eventDisconnect = function(v21)
    if v21.userInputServiceCon then
        v21.userInputServiceCon:Disconnect();
        v21.userInputServiceCon = nil;
    end;
end;
v10.render = function(v22)
    local l_item_0 = v22.props.item;
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_separatorEnabled_0 = v22.props.separatorEnabled;
    local l_menuItemDown_0 = v22.state.menuItemDown;
    local v27 = true;
    if game:GetFastFlag("ListPickerIconNotNeeded") then
        local v28 = false;
        if l_item_0.displayIcon ~= nil then
            v28 = l_item_0.displayIcon ~= "";
        end;
        v27 = v28;
    end;
    return l_withStyle_0(function(v29)
        return v3.createElement(v5.FitImageButton, {
            AutoButtonColor = false, 
            BackgroundColor3 = not not l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Color or v29.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = not not l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Transparency or v29.Theme.BackgroundUIDefault.Transparency, 
            BorderSizePixel = 0, 
            fitAxis = v5.FitAxis.Height, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v3.Event.Activated] = l_item_0.onSelect, 
            [v3.Event.InputBegan] = v22.onMenuItemInputBegan, 
            [v3.Event.InputEnded] = v22.onMenuItemInputEnd
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Icon = v3.createElement("Frame", {
                Size = UDim2.new(0, not v27 and 20 or 60, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Image = v27 and v3.createElement(v7, {
                    Size = UDim2.new(0, 20, 0, 20), 
                    Position = UDim2.new(0, 20, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_item_0.displayIcon, 
                    ImageColor3 = v29.Theme.IconDefault.Color, 
                    ImageTransparency = v29.Theme.IconDefault.Transparency
                })
            }), 
            Content = v3.createElement(v5.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                fitAxis = v5.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, not v27 and 0 or -60, 0, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v9)
                }), 
                TextContent = v3.createElement(v6, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -20, 0, 0), 
                    Text = l_item_0.text, 
                    Font = v29.Font.Body.Font, 
                    TextSize = v29.Font.BaseSize * v29.Font.Body.RelativeSize, 
                    TextColor3 = v29.Theme.TextDefault.Color, 
                    TextTransparency = v29.Theme.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true, 
                    fitAxis = v5.FitAxis.Height
                }), 
                UIBottomPadding = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, v9), 
                    LayoutOrder = 3
                }), 
                Separator = l_separatorEnabled_0 and v3.createElement("Frame", {
                    BackgroundColor3 = v29.Theme.Divider.Color, 
                    BackgroundTransparency = v29.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
v10.willUnmount = function(v30)
    v30:eventDisconnect();
end;
return v10;
