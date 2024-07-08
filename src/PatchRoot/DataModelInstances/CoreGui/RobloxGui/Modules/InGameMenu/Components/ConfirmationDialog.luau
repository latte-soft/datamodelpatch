local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v6.Roact;
local l_t_0 = v6.t;
local l_UIBlox_0 = v6.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v14 = require(l_Parent_0.Resources.Constants);
local v15 = require(l_Parent_0.Resources.Assets);
local v16 = require(script.Parent.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = require(script.Parent.Connection.FocusHandler);
local v19 = l_Roact_0.PureComponent:extend("ConfirmationDialog");
v19.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    cancelText = l_t_0.string, 
    confirmText = l_t_0.string, 
    titleText = l_t_0.string, 
    bindReturnToConfirm = l_t_0.boolean, 
    onCancel = l_t_0.callback, 
    onConfirm = l_t_0.callback, 
    blurBackground = l_t_0.boolean, 
    visible = l_t_0.boolean, 
    inputType = l_t_0.optional(l_t_0.string)
});
v19.defaultProps = {
    bodyText = "This is some body text. It will wrap when needed.", 
    cancelText = "Cancel", 
    confirmText = "Confirm", 
    titleText = "Dialog Title", 
    blurBackground = false
};
v19.init = function(v20)
    v20.state = {
        isRooted = false
    };
    v20.onAncestryChanged = function(v21)
        if v21:IsDescendantOf(game) then
            v20:setState({
                isRooted = true
            });
        end;
    end;
    v20.confirmButtonRef = l_Roact_0.createRef();
    v20.buttonContainerRef = l_Roact_0.createRef();
end;
v19.render = function(v22)
    local l_props_0 = v22.props;
    return l_withStyle_0(function(v24)
        local l_Font_0 = v24.Font.Body.Font;
        local v26 = v24.Font.Body.RelativeSize * v24.Font.BaseSize;
        local v27 = (20 + math.max(l_TextService_0:GetTextSize(l_props_0.bodyText, v26, l_Font_0, Vector2.new(295, math.huge)).Y, v26 * 2)) + 20;
        return l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuConfirmationDialog = l_Roact_0.createElement("ScreenGui", {
                DisplayOrder = v14.DisplayOrder.ConfirmationDialog, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = l_props_0.blurBackground, 
                Enabled = l_props_0.visible, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v24.Theme.Overlay.Color, 
                    BackgroundTransparency = v24.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = ""
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v15.Images.RoundedRect.Image, 
                    ImageColor3 = v24.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v24.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v15.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 335, 0, ((49 + v27) + 36) + 20), 
                    SliceCenter = v15.Images.RoundedRect.SliceCenter
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20)
                    }), 
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Title = l_Roact_0.createElement(v16, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = l_props_0.titleText
                    }), 
                    Divider = l_Roact_0.createElement("Frame", {
                        BackgroundColor3 = v24.Theme.Divider.Color, 
                        BackgroundTransparency = v24.Theme.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0.8, 0, 0, 1)
                    }), 
                    BodyTextContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, v27)
                    }, {
                        BodyText = l_Roact_0.createElement(v16, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_props_0.bodyText, 
                            TextWrapped = true
                        })
                    }), 
                    ButtonContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        [l_Roact_0.Ref] = v22.buttonContainerRef, 
                        [l_Roact_0.Event.AncestryChanged] = v22.onAncestryChanged
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 10), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        CancelButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            layoutOrder = 1, 
                            size = UDim2.new(0.5, -5, 1, 0), 
                            text = l_props_0.cancelText, 
                            onActivated = l_props_0.onCancel
                        }), 
                        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            layoutOrder = 2, 
                            size = UDim2.new(0.5, -5, 1, 0), 
                            text = l_props_0.confirmText, 
                            onActivated = l_props_0.onConfirm, 
                            [l_Roact_0.Ref] = v22.confirmButtonRef
                        })
                    })
                })
            }), 
            FocusHandler = l_Roact_0.createElement(v18, {
                isFocused = (v22.state.isRooted and v22.props.visible) and v22.props.inputType == v14.InputType.Gamepad, 
                didFocus = function()
                    l_GuiService_0:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent");
                    l_GuiService_0:AddSelectionParent("InGameMenuModalButtonsSelectionParent", v22.buttonContainerRef:getValue());
                    l_GuiService_0.SelectedCoreObject = v22.confirmButtonRef:getValue();
                end
            })
        });
    end);
end;
v19.updateBlur = function(v28)
    l_RunService_0:SetRobloxGuiFocused(v28.props.blurBackground and v28.props.visible);
end;
v19.bindActions = function(v29)
    local function v33(_, v31, _)
        if v31 == Enum.UserInputState.Begin then
            v29.props.onConfirm();
        end;
    end;
    if v29.props.bindReturnToConfirm then
        l_ContextActionService_0:BindCoreAction("InGameMenuModalConfirm", v33, false, Enum.KeyCode.Return);
    end;
    l_ContextActionService_0:BindCoreAction("InGameMenuModalCancel", function(_, v35, _)
        if v35 == Enum.UserInputState.Begin then
            v29.props.onCancel();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v19.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalConfirm");
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalCancel");
end;
v19.didMount = function(v38)
    v38:updateBlur();
    if v38.props.visible then
        v38:bindActions();
    end;
end;
v19.didUpdate = function(v39)
    v39:updateBlur();
    if not v39.props.visible then
        v39:unbindActions();
        return ;
    else
        v39:bindActions();
        return ;
    end;
end;
v19.willUnmount = function(v40)
    if v40.props.blurBackground then
        l_RunService_0:SetRobloxGuiFocused(false);
    end;
    v40:unbindActions();
end;
return v19;
