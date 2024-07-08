local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v6.Roact;
local l_UIBlox_0 = v6.UIBlox;
local l_t_0 = v6.t;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v14 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Resources.Assets);
local v17 = require(script.Parent.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v19 = require(script.Parent.Connection.FocusHandler);
local v20 = l_Roact_0.PureComponent:extend("InformationalDialog");
v20.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    confirmText = l_t_0.string, 
    titleText = l_t_0.string, 
    subBodyText = l_t_0.optional(l_t_0.string), 
    iconImage = l_t_0.optional(l_t_0.union(l_t_0.table, l_t_0.string)), 
    iconSize = l_t_0.number, 
    onContinueFunc = l_t_0.optional(l_t_0.callback), 
    bindReturnToConfirm = l_t_0.boolean, 
    blurBackground = l_t_0.boolean, 
    visible = l_t_0.boolean, 
    inputType = l_t_0.optional(l_t_0.string)
});
v20.defaultProps = {
    subBodyText = nil, 
    blurBackground = false, 
    iconImage = nil, 
    iconSize = 64
};
v20.init = function(v21)
    v21.state = {
        isRooted = false, 
        show = true
    };
    v21.onAncestryChanged = function(v22)
        if v22:IsDescendantOf(game) then
            v21:setState({
                isRooted = true
            });
        end;
    end;
    v21.confirmButtonRef = l_Roact_0.createRef();
    v21.buttonContainerRef = l_Roact_0.createRef();
end;
v20.render = function(v23)
    local l_props_0 = v23.props;
    return l_withStyle_0(function(v25)
        local l_Font_0 = v25.Font.Body.Font;
        local v27 = v25.Font.Body.RelativeSize * v25.Font.BaseSize;
        local l_Y_0 = l_TextService_0:GetTextSize(l_props_0.bodyText, v27, l_Font_0, Vector2.new(295, math.huge)).Y;
        local l_Y_1 = l_TextService_0:GetTextSize(l_props_0.subBodyText, v27, l_Font_0, Vector2.new(295, math.huge)).Y;
        local v30 = 20 + math.max(l_Y_0, v27 * 2);
        local v31 = 20 + math.max(l_Y_1, v27 * 2);
        local v32 = nil;
        if v14() then
            v32 = not v23.props.visible;
        end;
        return l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = l_Roact_0.createElement("ScreenGui", {
                DisplayOrder = 8, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = l_props_0.blurBackground, 
                Enabled = l_props_0.visible and v23.state.show, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v25.Theme.Overlay.Color, 
                    BackgroundTransparency = v25.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = ""
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v16.Images.RoundedRect.Image, 
                    ImageColor3 = v25.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v25.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v16.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 335, 0, ((((49 + v30) + v31) + 36) + 70) + l_props_0.iconSize), 
                    SliceCenter = v16.Images.RoundedRect.SliceCenter
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 20), 
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20)
                    }), 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_props_0.iconImage, 
                        Size = UDim2.new(0, l_props_0.iconSize, 0, l_props_0.iconSize), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }), 
                    Title = l_Roact_0.createElement(v17, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = l_props_0.titleText
                    }), 
                    Divider = l_Roact_0.createElement("Frame", {
                        BackgroundColor3 = v25.Theme.Divider.Color, 
                        BackgroundTransparency = v25.Theme.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0.8, 0, 0, 1)
                    }), 
                    SpaceContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 10)
                    }), 
                    BodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, v30)
                    }, {
                        BodyText = l_Roact_0.createElement(v17, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.bodyText, 
                            TextWrapped = true
                        })
                    }), 
                    SubBodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, 0, 0, v31)
                    }, {
                        BodyText = l_Roact_0.createElement(v17, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.subBodyText, 
                            TextWrapped = true
                        })
                    }), 
                    SpaceContainer2 = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 7, 
                        Size = UDim2.new(1, 0, 0, 10)
                    }), 
                    ButtonContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 8, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        [l_Roact_0.Ref] = v23.buttonContainerRef, 
                        [l_Roact_0.Event.AncestryChanged] = v23.onAncestryChanged
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 20), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            layoutOrder = 1, 
                            size = UDim2.new(1, -5, 1, 0), 
                            text = l_props_0.confirmText, 
                            onActivated = function()
                                v23:setState({
                                    show = false
                                });
                                if v23.props.onContinueFunc then
                                    v23.props.onContinueFunc();
                                end;
                                l_RunService_0:SetRobloxGuiFocused(false);
                            end, 
                            [l_Roact_0.Ref] = v23.confirmButtonRef
                        })
                    })
                })
            }), 
            FocusHandler = l_Roact_0.createElement(v19, {
                isFocused = (v23.state.isRooted and v23.props.visible) and v23.props.inputType == v15.InputType.Gamepad, 
                shouldForgetPreviousSelection = v32, 
                didFocus = function()
                    l_GuiService_0:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent");
                    l_GuiService_0:AddSelectionParent("InGameMenuModalButtonsSelectionParent", v23.buttonContainerRef:getValue());
                    l_GuiService_0.SelectedCoreObject = v23.confirmButtonRef:getValue();
                end
            })
        });
    end);
end;
v20.updateBlur = function(v33)
    l_RunService_0:SetRobloxGuiFocused(v33.props.blurBackground and v33.props.visible);
end;
v20.bindActions = function(v34)
    local function v38(_, v36, _)
        if v36 == Enum.UserInputState.Begin then
            v34.props.onConfirm();
        end;
    end;
    if v34.props.bindReturnToConfirm then
        l_ContextActionService_0:BindCoreAction("InGameMenuModalConfirm", v38, false, Enum.KeyCode.Return);
    end;
end;
v20.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalConfirm");
end;
v20.didMount = function(v40)
    v40:updateBlur();
    if v40.props.visible then
        v40:bindActions();
    end;
end;
v20.didUpdate = function(v41)
    v41:updateBlur();
    if not v41.props.visible then
        v41:unbindActions();
        return ;
    else
        v41:bindActions();
        return ;
    end;
end;
v20.willUnmount = function(v42)
    if v42.props.blurBackground then
        l_RunService_0:SetRobloxGuiFocused(false);
    end;
    v42:unbindActions();
end;
return v20;
