local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Utility.divideTransparency);
local v11 = require(script.Parent.ThemedButton);
local v12 = require(script.Parent.ThemedTextLabel);
local v13 = require(script.Parent.Divider);
local v14 = require(script.Parent.BarOnTopScrollingFrame);
local v15 = require(script.Parent.Connection.FocusHandler);
local v16 = require(l_Parent_0.Localization.withLocalization);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = l_Roact_0.PureComponent:extend("DropDownSelection");
v18.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    placeHolderText = l_t_0.optional(l_t_0.string), 
    selectedIndex = l_t_0.numberMin(0), 
    selections = l_t_0.array(l_t_0.string), 
    localize = l_t_0.boolean, 
    enabled = l_t_0.boolean, 
    truncate = l_t_0.optional(l_t_0.boolean), 
    selectionChanged = l_t_0.callback, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    selectionParentName = l_t_0.optional(l_t_0.string), 
    ButtonRef = l_t_0.optional(l_t_0.table)
}), function(v19)
    if #v19.selections < v19.selectedIndex then
        return false, "selectedIndex must not be greater than the number of selections";
    else
        return true;
    end;
end);
v18.defaultProps = {
    canOpen = true
};
v18.init = function(v20)
    v20.rootRef = l_Roact_0.createRef();
    v20.firstOptionRef = l_Roact_0.createRef();
    v20.openDropDownButtonRef = v20.props.ButtonRef or l_Roact_0.createRef();
    v20.state = {
        isOpen = false, 
        dropDownItemHeight = 10, 
        absolutePositionX = 0, 
        absolutePositionY = 0, 
        screenSizeX = 0, 
        screenSizeY = 0
    };
    v20.ancestryConnection = nil;
    v20.sizeConnection = nil;
end;
v18.getDerivedStateFromProps = function(v21)
    if v21.canOpen then
        return nil;
    else
        return {
            isOpen = false
        };
    end;
end;
v18.renderDropDownList = function(v22, v23, v24)
    local v25 = {
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v26, v27 in ipairs(v22.props.selections) do
        local l_v27_0 = v27;
        if v22.props.localize then
            l_v27_0 = v24[v26];
        end;
        local v29 = -25;
        if v22.props.truncate and v26 == 1 then
            v29 = -48;
        end;
        do
            local l_l_v27_0_0, l_v29_0 = l_v27_0, v29;
            v25["button" .. v26] = l_Roact_0.createElement(v11, {
                Size = UDim2.new(1, 0, 0, v22.state.dropDownItemHeight - 1), 
                LayoutOrder = v26 * 2, 
                onActivated = function()
                    v22:setState({
                        isOpen = false
                    });
                    v22.props.selectionChanged(v26);
                end, 
                normalThemeKey = "BackgroundUIDefault", 
                hoverThemeKey = "BackgroundOnHover", 
                ButtonRef = v26 == 1 and v22.firstOptionRef or nil, 
                imageProps = v9.Images.WhiteSquare, 
                renderChildren = function(_, v33, v34)
                    local v35 = not not v33 and v23.Theme.IconOnHover or v23.Theme.IconDefault;
                    return {
                        SelectedIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Size = UDim2.new(0, 15, 0, 12), 
                            Position = UDim2.new(1, -25, 0.5, 0), 
                            Image = v9.Images.SelectedCheck, 
                            ImageColor3 = v35.Color, 
                            ImageTransparency = v10(v35.Transparency, not v34 and 1 or 2), 
                            Visible = v22.props.selectedIndex == v26
                        }), 
                        TextLabel = l_Roact_0.createElement(v12, {
                            fontKey = "Header2", 
                            themeKey = "TextEmphasis", 
                            Position = UDim2.new(0, 25, 0, 0), 
                            Size = UDim2.new(1, l_v29_0, 1, 0), 
                            Text = l_l_v27_0_0, 
                            TextTruncate = if not v22.props.truncate then Enum.TextTruncate.None else Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    };
                end
            });
            if v26 < #v22.props.selections then
                v25["divider" .. v26] = l_Roact_0.createElement(v13, {
                    LayoutOrder = v26 * 2 + 1
                });
            end;
        end;
    end;
    return v25;
end;
v18.renderFocusHandler = function(v36)
    return not not v36.props.selectionParentName and l_Roact_0.createElement(v15, {
        isFocused = v36.props.canOpen and v36.state.isOpen, 
        didFocus = function()
            l_ContextActionService_0:BindCoreAction("settings_dropdown_close_action", function(_, v38)
                if v38 == Enum.UserInputState.End then
                    v36:setState({
                        isOpen = false
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            if v36.props.canCaptureFocus then
                l_GuiService_0:RemoveSelectionGroup(v36.props.selectionParentName);
                l_GuiService_0:AddSelectionParent(v36.props.selectionParentName, v36.rootRef.current);
                l_GuiService_0.SelectedCoreObject = v36.firstOptionRef.current;
            end;
        end, 
        didBlur = function()
            l_ContextActionService_0:UnbindCoreAction("settings_dropdown_close_action");
            l_GuiService_0:RemoveSelectionGroup(v36.props.selectionParentName);
            if not ((not v36.props.canOpen or v36.state.isOpen) or not v36.props.canCaptureFocus) then
                l_GuiService_0.SelectedCoreObject = v36.openDropDownButtonRef.current;
            end;
        end
    }) or nil;
end;
v18.render = function(v39)
    return l_withStyle_0(function(v40)
        return v16(not not v39.props.localize and v39.props.selections or {})(function(v41)
            local l_placeHolderText_0 = v39.props.placeHolderText;
            if v39.props.selectedIndex > 0 then
                l_placeHolderText_0 = if not v39.props.localize then v39.props.selections[v39.props.selectedIndex] else v41[v39.props.selectedIndex];
            end;
            local l_Size_0 = v9.Images.Shadow.Size;
            return l_Roact_0.createElement("Frame", {
                Size = v39.props.Size, 
                Position = v39.props.Position, 
                LayoutOrder = v39.props.LayoutOrder, 
                BackgroundTransparency = 1, 
                [l_Roact_0.Ref] = v39.rootRef, 
                [l_Roact_0.Change.AbsoluteSize] = function(v44)
                    v39:setState({
                        dropDownItemHeight = v44.AbsoluteSize.Y
                    });
                end, 
                [l_Roact_0.Change.AbsolutePosition] = function(v45)
                    v39:setState({
                        absolutePositionX = v45.AbsolutePosition.X, 
                        absolutePositionY = v45.AbsolutePosition.Y
                    });
                end
            }, {
                OpenDropDownButton = l_Roact_0.createElement(v11, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Visible = not v39.state.isOpen, 
                    enabled = v39.props.enabled, 
                    onActivated = function()
                        v39:setState({
                            isOpen = true
                        });
                    end, 
                    normalThemeKey = "SecondaryDefault", 
                    hoverThemeKey = "SecondaryOnHover", 
                    imageProps = v9.Images.RoundedRectBorder, 
                    renderChildren = function(v46, v47, v48)
                        local v49 = not not v47 and v40.Theme.IconOnHover or v40.Theme.IconDefault;
                        return {
                            ButtonIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 36, 0, 36), 
                                Position = UDim2.new(1, -16, 0.5, 0), 
                                AnchorPoint = Vector2.new(1, 0.5), 
                                Image = v9.Images.ExpandArrow, 
                                ImageColor3 = v49.Color, 
                                ImageTransparency = v10(v49.Transparency, not v48 and 1 or 2)
                            }), 
                            ButtonText = l_Roact_0.createElement(v12, {
                                Text = l_placeHolderText_0, 
                                themeKey = "SecondaryContent", 
                                fontKey = "Header2", 
                                Position = UDim2.new(0, 12, 0, 0), 
                                Size = UDim2.new(1, not v39.props.truncate and -12 or -48, 1, 0), 
                                TextTransparency = v46, 
                                TextTruncate = if not v39.props.truncate then Enum.TextTruncate.None else Enum.TextTruncate.AtEnd, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        };
                    end, 
                    ButtonRef = v39.openDropDownButtonRef
                }), 
                CloseDropDownArea = l_Roact_0.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Position = UDim2.new(0, -v39.state.absolutePositionX, 0, -v39.state.absolutePositionY), 
                    Size = UDim2.new(0, v39.state.screenSizeX, 0, v39.state.screenSizeY), 
                    Visible = v39.state.isOpen, 
                    Selectable = false, 
                    [l_Roact_0.Event.Activated] = function()
                        v39:setState({
                            isOpen = false
                        });
                    end, 
                    ZIndex = 2
                }), 
                DropDownShadow = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v9.Images.Shadow.Image, 
                    Position = UDim2.new(0, -l_Size_0, 0, -l_Size_0), 
                    Size = UDim2.new(1, l_Size_0 * 2, 0, (l_Size_0 * 2 + 8) + math.min(#v39.props.selections, 7.5) * 44), 
                    ScaleType = v9.Images.Shadow.ScaleType, 
                    SliceCenter = v9.Images.Shadow.SliceCenter, 
                    Visible = v39.state.isOpen, 
                    ZIndex = 3
                }, {
                    FocusHandler = v39:renderFocusHandler(), 
                    DropDownBackground = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v9.Images.RoundedRect.Image, 
                        ImageColor3 = v40.Theme.BackgroundUIDefault.Color, 
                        ImageTransparency = v40.Theme.BackgroundUIDefault.Transparency, 
                        ScaleType = v9.Images.RoundedRect.ScaleType, 
                        Size = UDim2.new(1, -(l_Size_0 * 2), 1, -(l_Size_0 * 2)), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        SliceCenter = v9.Images.RoundedRect.SliceCenter, 
                        SliceScale = 0.5
                    }, {
                        DropDownList = l_Roact_0.createElement(v14, {
                            Position = UDim2.new(0, 0, 0, 4), 
                            Size = UDim2.new(1, 0, 1, -8), 
                            CanvasSize = UDim2.new(1, 0, 0, #v39.props.selections * v39.state.dropDownItemHeight)
                        }, (v39:renderDropDownList(v40, v41)))
                    })
                })
            });
        end);
    end);
end;
v18.watchLayerCollector = function(v50, v51)
    v50:setState({
        screenSizeX = v51.AbsoluteSize.X, 
        screenSizeY = v51.AbsoluteSize.Y
    });
    v50.sizeConnection = v51:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        v50:setState({
            screenSizeX = v51.AbsoluteSize.X, 
            screenSizeY = v51.AbsoluteSize.Y
        });
    end);
end;
v18.didMount = function(v52)
    local l_current_0 = v52.rootRef.current;
    local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
    if l_l_current_0_FirstAncestorWhichIsA_0 == nil then
        v52.ancestryConnection = l_current_0.AncestryChanged:Connect(function()
            l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
            if l_l_current_0_FirstAncestorWhichIsA_0 ~= nil then
                v52.ancestryConnection:Disconnect();
                v52.ancestryConnection = nil;
                v52:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
            end;
        end);
    else
        v52:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
    end;
end;
v18.didUpdate = function(v55, v56)
    if v56.ButtonRef ~= v55.props.ButtonRef then
        v55.openDropDownButtonRef = v55.props.ButtonRef or l_Roact_0.createRef();
    end;
    if v55.state.isOpen and v56.canCaptureFocus ~= v55.props.canCaptureFocus then
        v55:setState({
            isOpen = false
        });
    end;
end;
v18.willUnmount = function(v57)
    if v57.ancestryConnection then
        v57.ancestryConnection:Disconnect();
    end;
    if v57.sizeConnection then
        v57.sizeConnection:Disconnect();
    end;
end;
return v18;
