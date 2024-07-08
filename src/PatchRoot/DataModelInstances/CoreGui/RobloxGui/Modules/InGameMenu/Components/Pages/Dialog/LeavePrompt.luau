local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_t_0 = v4.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v10 = require(l_Parent_0.GameIcon);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v13 = require(l_Parent_0.ThemedTextLabel);
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v15 = require(l_Parent_0.Connection.FocusHandler);
local v16 = require(l_Parent_0.ZonePortal);
local v17 = require(l_Parent_1.Enums.Direction);
local v18 = require(l_RobloxGui_0.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience);
local v19 = require(l_RobloxGui_0.Modules.FTUX.Utility.IsFTUXExperience);
local v20 = require(l_RobloxGui_0.Modules.FTUX.Enums.PlatformEnum);
local v21 = l_Roact_0.PureComponent:extend("LeavePrompt");
v21.validateProps = l_t_0.strictInterface({
    titleText = l_t_0.string, 
    bodyText = l_t_0.string, 
    confirmText = l_t_0.string, 
    cancelText = l_t_0.string, 
    onConfirm = l_t_0.callback, 
    onCancel = l_t_0.callback, 
    canGamepadCaptureFocus = l_t_0.boolean, 
    canKeyboardCaptureFocus = l_t_0.boolean
});
v21.defaultProps = {
    canGamepadCaptureFocus = false, 
    canKeyboardCaptureFocus = false
};
v21.init = function(v22)
    v22.leaveButtonRef = l_Roact_0.createRef();
end;
v21.render = function(v23)
    return l_withStyle_0(function(v24)
        local l_Font_0 = v24.Font;
        return l_Roact_0.createElement("ImageButton", {
            Size = UDim2.fromScale(1, 1), 
            AutoButtonColor = false, 
            BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v24.Theme.BackgroundDefault.Transparency, 
            Selectable = false
        }, {
            Content = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Selectable = false
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 24), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                GameThumbnail = l_Roact_0.createElement(v10, {
                    gameId = game.GameId, 
                    iconSize = 100, 
                    layoutOrder = 1
                }), 
                TitleText = l_Roact_0.createElement(v13, {
                    fontKey = "Header1", 
                    themeKey = "TextEmphasis", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize + 4), 
                    Text = v23.props.titleText
                }), 
                BodyText = l_Roact_0.createElement(v13, {
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    LayoutOrder = 3, 
                    Size = if not not v18() and v19(v20.QuestVR) then UDim2.fromOffset(353, 4 * (l_Font_0.Body.RelativeSize * l_Font_0.BaseSize + 4)) else UDim2.fromOffset(353, 2 * (l_Font_0.Body.RelativeSize * l_Font_0.BaseSize + 4)), 
                    Text = v23.props.bodyText, 
                    TextWrapped = true
                }), 
                ButtonGroup = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(353, 84), 
                    LayoutOrder = 4
                }, {
                    ConfirmButton = l_Roact_0.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        layoutOrder = 4, 
                        position = UDim2.fromOffset(0, 0), 
                        size = UDim2.fromOffset(353, 36), 
                        onActivated = v23.props.onConfirm, 
                        text = v23.props.confirmText, 
                        buttonRef = v23.leaveButtonRef
                    }), 
                    CancelButton = l_Roact_0.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        layoutOrder = 5, 
                        position = UDim2.fromOffset(0, 48), 
                        size = UDim2.fromOffset(353, 36), 
                        onActivated = v23.props.onCancel, 
                        text = v23.props.cancelText
                    })
                })
            }), 
            FocusHandler = l_Roact_0.createElement(v15, {
                isFocused = v23.props.canGamepadCaptureFocus, 
                didFocus = function()
                    l_GuiService_0.SelectedCoreObject = v23.leaveButtonRef.current;
                end
            }), 
            ZonePortal = l_Roact_0.createElement(v16, {
                targetZone = 0, 
                direction = v17.Left
            }), 
            KeyboardFocusHandler = l_Roact_0.createElement(v15, {
                isFocused = v23.props.canKeyboardCaptureFocus, 
                didFocus = function()
                    l_ContextActionService_0:BindCoreAction("LeavePromptConfirm", function(_, v27)
                        if v27 == Enum.UserInputState.End then
                            v23.props.onConfirm();
                            return Enum.ContextActionResult.Sink;
                        else
                            return Enum.ContextActionResult.Pass;
                        end;
                    end, false, Enum.KeyCode.Return);
                end, 
                didBlur = function()
                    l_ContextActionService_0:UnbindCoreAction("LeavePromptConfirm");
                end
            }) or nil
        });
    end);
end;
return v21;
