local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v10 = require(script.Parent.Parent.Resources.Assets);
local v11 = require(script.Parent.ThemedTextLabel);
local v12 = require(script.Parent.Divider);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v14 = l_Roact_0.PureComponent:extend("InfoDialog");
v14.validateProps = l_t_0.strictInterface({
    bodyText = l_t_0.string, 
    dismissText = l_t_0.string, 
    titleText = l_t_0.string, 
    iconImage = l_t_0.union(l_t_0.string, l_t_0.table), 
    onDismiss = l_t_0.callback, 
    visible = l_t_0.boolean, 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v14.render = function(v15)
    local l_props_0 = v15.props;
    return l_withStyle_0(function(v17)
        local l_Font_0 = v17.Font.Body.Font;
        local v19 = v17.Font.Body.RelativeSize * v17.Font.BaseSize;
        local v20 = 48 + math.max(l_TextService_0:GetTextSize(l_props_0.bodyText, v19, l_Font_0, Vector2.new(264, math.huge)).Y, v19 * 2);
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 8, 
            Visible = l_props_0.visible
        }, {
            Overlay = l_Roact_0.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v17.Theme.Overlay.Color, 
                BackgroundTransparency = v17.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v10.Images.RoundedRect.Image, 
                ImageColor3 = v17.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = v10.Images.RoundedRect.ScaleType, 
                Size = UDim2.new(0, 312, 0, ((((49 + v20) + 36) + 36) + 24) + 10), 
                SliceCenter = v10.Images.RoundedRect.SliceCenter
            }, {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 36, 0, 36), 
                    BackgroundTransparency = 1, 
                    Image = v15.props.iconImage, 
                    LayoutOrder = 1
                }), 
                Title = l_Roact_0.createElement(v11, {
                    fontKey = "Header1", 
                    themeKey = "TextEmphasis", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 48), 
                    Text = l_props_0.titleText
                }), 
                Divider = l_Roact_0.createElement(v12, {
                    LayoutOrder = 3
                }), 
                BodyTextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v20)
                }, {
                    BodyText = l_Roact_0.createElement(v11, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Text = l_props_0.bodyText, 
                        TextWrapped = true
                    })
                }), 
                ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 5, 
                    size = UDim2.new(1, 0, 0, 36), 
                    onActivated = l_props_0.onDismiss, 
                    text = l_props_0.dismissText, 
                    [l_Roact_0.Ref] = v15.props.buttonRef
                })
            })
        });
    end);
end;
v14.bindActions = function(v21)
    l_ContextActionService_0:BindCoreAction("InGameMenuModalDismiss", function(_, v23, _)
        if v23 == Enum.UserInputState.Begin then
            v21.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v14.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuModalDismiss");
end;
v14.didMount = function(v26)
    if v26.props.visible then
        v26:bindActions();
    end;
end;
v14.didUpdate = function(v27)
    if not v27.props.visible then
        v27:unbindActions();
        return ;
    else
        v27:bindActions();
        return ;
    end;
end;
v14.willUnmount = function(v28)
    v28:unbindActions();
end;
return v14;
