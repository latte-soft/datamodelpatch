local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v5 = require(l_Modules_0.LuaApp.Components.LocalizedFitTextLabel);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v11 = v2.PureComponent:extend("ListCell");
v11.defaultProps = {
    textLocalization = false
};
v11.init = function(v12)
    v12.state = {
        cellPressed = false
    };
    v12.onInputBegan = function(_, v14)
        if not (not ((not (v14.UserInputType ~= Enum.UserInputType.Touch) or v14.UserInputType == Enum.UserInputType.MouseButton1) and v14.UserInputState == Enum.UserInputState.Begin) or v12.state.cellPressed) then
            v12:setState({
                cellPressed = true
            });
        end;
    end;
    v12.onInputEnd = function()
        if v12.state.cellPressed then
            v12:setState({
                cellPressed = false
            });
        end;
    end;
    v12.onActivated = function()
        v12.props.item.onActivated();
    end;
end;
v11.render = function(v15)
    return l_withStyle_0(function(v16)
        local l_item_0 = v15.props.item;
        local l_layoutOrder_0 = v15.props.layoutOrder;
        local l_cellPressed_0 = v15.state.cellPressed;
        local l_renderRightSideGadget_0 = l_item_0.renderRightSideGadget;
        local v21 = l_item_0.rightSideGadgetSize or Vector2.new(0, 0);
        local l_useUIBloxImage_0 = l_item_0.useUIBloxImage;
        local l_ContextualMenu_0 = v15.props.appTheme.ContextualMenu;
        local l_Transparency_0 = l_ContextualMenu_0.Cells.Icon.Transparency;
        if not l_item_0.checked then
            if l_item_0.disabled then
                l_cellPressed_0 = false;
                l_Transparency_0 = l_ContextualMenu_0.Cells.Icon.DisabledTransparency;
            end;
        else
            l_Transparency_0 = l_ContextualMenu_0.Cells.Icon.OnTransparency;
        end;
        return v2.createElement(v3.FitImageButton, {
            BackgroundTransparency = not not l_cellPressed_0 and l_ContextualMenu_0.Cells.Background.OnPressTransparency or 1, 
            BackgroundColor3 = l_ContextualMenu_0.Cells.Background.OnPressColor, 
            BorderSizePixel = 0, 
            fitAxis = v3.FitAxis.Height, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v2.Event.Activated] = v15.onActivated, 
            [v2.Event.InputBegan] = v15.onInputBegan, 
            [v2.Event.InputEnded] = v15.onInputEnd
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Icon = v2.createElement(v3.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                fitAxis = v3.FitAxis.Height, 
                Size = UDim2.new(0, 56, 0, 0)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10)
                }), 
                Image = not not l_useUIBloxImage_0 and v2.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = not not l_item_0.checked and l_item_0.displayIconChecked or l_item_0.displayIcon, 
                    ImageColor3 = not not l_item_0.checked and l_ContextualMenu_0.Cells.Icon.OnColor or l_ContextualMenu_0.Cells.Icon.Color, 
                    ImageTransparency = l_Transparency_0, 
                    Size = UDim2.new(0, 36, 0, 36)
                }) or v2.createElement(v6, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = not not l_item_0.checked and l_item_0.displayIconChecked or l_item_0.displayIcon, 
                    ImageColor3 = not not l_item_0.checked and l_ContextualMenu_0.Cells.Icon.OnColor or l_ContextualMenu_0.Cells.Icon.Color, 
                    ImageTransparency = l_Transparency_0, 
                    Size = UDim2.new(0, 36, 0, 36)
                })
            }), 
            Content = v2.createElement(v3.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                fitAxis = v3.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -56 - v21.X, 0, 0)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 23)
                }), 
                TextContent = v2.createElement(not not l_item_0.textLocalization and v5 or v4, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = v16.Font.Body.Font, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -10, 0, 0), 
                    Text = not not l_item_0.checked and l_item_0.textChecked or l_item_0.text, 
                    TextColor3 = l_ContextualMenu_0.Title.Color, 
                    TextTransparency = not not l_item_0.disabled and l_ContextualMenu_0.Title.DisabledTransparency or l_ContextualMenu_0.Title.Transparency, 
                    TextSize = v16.Font.BaseSize * v16.Font.Body.RelativeSize, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true, 
                    fitAxis = v3.FitAxis.Height
                }), 
                UIBottomPadding = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 23), 
                    LayoutOrder = 3
                })
            }), 
            RightSideGadget = l_renderRightSideGadget_0 and v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3, 
                Size = UDim2.new(0, v21.X, 0, v21.Y)
            }, l_renderRightSideGadget_0())
        });
    end);
end;
return (v10(v11));
