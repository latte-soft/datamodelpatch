local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Text);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v6 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButton);
local v7 = require(l_Modules_0.LuaApp.Components.SecondaryButton);
local v8 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v9 = game:DefineFastFlag("VRAlertWindowCapturesPointer", false);
local v10 = v1.PureComponent:extend("AlertWindow");
v10.defaultProps = {
    titleTextSize = 25, 
    messageTextAlignment = Enum.TextXAlignment.Center
};
v10.render = function(v11)
    local l_appTheme_0 = v11.props.appTheme;
    local l_containerWidth_0 = v11.props.containerWidth;
    local l_titleText_0 = v11.props.titleText;
    local l_titleTextSize_0 = v11.props.titleTextSize;
    local l_titleFont_0 = v11.props.titleFont;
    local l_messageText_0 = v11.props.messageText;
    local l_messageFont_0 = v11.props.messageFont;
    local l_buttonFont_0 = v11.props.buttonFont;
    local l_confirmButtonText_0 = v11.props.confirmButtonText;
    local l_cancelButtonText_0 = v11.props.cancelButtonText;
    local l_onConfirm_0 = v11.props.onConfirm;
    local l_isConfirming_0 = v11.props.isConfirming;
    local l_hasCancelButton_0 = v11.props.hasCancelButton;
    local l_onCancel_0 = v11.props.onCancel;
    local l_messageTextAlignment_0 = v11.props.messageTextAlignment;
    local v27 = math.min((l_containerWidth_0 - 20) - 20, 400);
    local v28 = (v27 - 20) - 20;
    local v29 = not not l_hasCancelButton_0 and (v28 - 10) / 2 or v28;
    local v30 = v2.GetTextHeight(l_messageText_0, l_messageFont_0, 20, v28);
    local function v32(v31)
        return v1.createElement(v4.FitFrame, {
            Size = UDim2.new(0, v27, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = l_appTheme_0.AlertWindow.Background.Color, 
            BorderSizePixel = 0, 
            Active = v9, 
            fitAxis = v4.FitAxis.Height
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            Title = v1.createElement(v4.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                fitAxis = v4.FitAxis.Height
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                PaddingTop = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 11), 
                    LayoutOrder = 1
                }), 
                Title = v1.createElement(v5, {
                    Size = UDim2.new(1, 0, 0, 28), 
                    Position = UDim2.new(0, 0, 0, 11), 
                    BackgroundTransparency = 1, 
                    Text = l_titleText_0, 
                    Font = l_titleFont_0, 
                    TextSize = l_titleTextSize_0, 
                    TextColor3 = l_appTheme_0.AlertWindow.Title.Color, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    fitAxis = v4.FitAxis.Height
                }), 
                PaddingBottom = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 11), 
                    LayoutOrder = 3
                })
            }), 
            Divider = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_appTheme_0.AlertWindow.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            Message = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 86 + v30), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Message = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v30), 
                    Position = UDim2.new(0, 0, 0, 40), 
                    BackgroundTransparency = 1, 
                    Text = l_messageText_0, 
                    Font = l_messageFont_0, 
                    TextSize = 20, 
                    TextColor3 = l_appTheme_0.AlertWindow.Message.Color, 
                    TextXAlignment = l_messageTextAlignment_0, 
                    TextWrapped = true
                })
            }), 
            Buttons = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 36), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                CancelButton = l_hasCancelButton_0 and v1.createElement(v7, {
                    Size = UDim2.new(0, v29, 1, 0), 
                    Text = v31.cancelText, 
                    Font = l_buttonFont_0, 
                    TextSize = 22, 
                    LayoutOrder = 1, 
                    onActivated = l_onCancel_0
                }), 
                ConfirmButton = v1.createElement(v6, {
                    Size = UDim2.new(0, v29, 1, 0), 
                    Text = if not l_isConfirming_0 then l_confirmButtonText_0 else "", 
                    Font = l_buttonFont_0, 
                    TextSize = 22, 
                    LayoutOrder = 2, 
                    onActivated = not not l_isConfirming_0 and function()
                    end or l_onConfirm_0, 
                    isLoading = l_isConfirming_0
                })
            })
        });
    end;
    if not l_cancelButtonText_0 then
        return v3({
            cancelText = "Feature.GamePage.LabelCancelField"
        })(v32);
    else
        return v32({
            cancelText = l_cancelButtonText_0
        });
    end;
end;
return (v8(v10));
