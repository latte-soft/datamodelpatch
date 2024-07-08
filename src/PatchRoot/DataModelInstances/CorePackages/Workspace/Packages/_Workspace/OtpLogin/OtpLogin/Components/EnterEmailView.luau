local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local v9 = require(script.Parent.InputField);
local v10 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v11 = require(l_Parent_0.Analytics.EventConstants);
local function v16(v12, v13, v14, v15)
    return {
        buttonHeight = v15, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v13, 
                    text = v12, 
                    isDisabled = v14
                }
            }
        }
    };
end;
return function(v17)
    local v18 = l_useStyle_0();
    local v19 = l_useDesignTokens_0();
    local v20 = l_useLocalization_0({
        emailPlaceholder = "Authentication.Login.Label.Email", 
        continueButton = "Authentication.OneTimePasscode.Action.Continue"
    });
    local v21 = l_PartialPageModal_0:getMiddleContentWidth(v17.screenSize.X);
    local v23 = l_React_0.useCallback(function()
        local l_isDisabled_0 = v17.isDisabled;
        if not l_isDisabled_0 then
            l_isDisabled_0 = true;
            if string.len(v17.errorMessage) <= 0 then
                l_isDisabled_0 = string.len(v17.email) == 0;
            end;
        end;
        return l_isDisabled_0;
    end, {
        v17.isDisabled, 
        v17.errorMessage, 
        v17.email
    });
    l_React_0.useEffect(function()
        v10.sendPageLoadEvent(v11.ctx.sendOtp, v17.origin);
    end, {});
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v17.enterEmailTitle, 
        screenSize = v17.screenSize, 
        buttonStackProps = v16(v20.continueButton, v17.handleContinue, v23(), v19.Global.Size_600), 
        onCloseClicked = v17.onClose, 
        position = not not v17.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v17.keyboardHeight) or nil, 
        anchorPoint = not not v17.isKeyboardShowing and Vector2.new(0.5, 1) or nil
    }, {
        Middle = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v19.Global.Size_300), 
                PaddingBottom = UDim.new(0, v19.Global.Size_300)
            }), 
            ListLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v19.Global.Size_150)
            }), 
            BodyText = l_React_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v17.enterEmailDescription, 
                TextSize = v18.Font.BaseSize, 
                TextColor3 = v18.Theme.TextDefault.Color, 
                TextTransparency = v18.Theme.TextDefault.Transparency, 
                Font = v18.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, v21, 0, 0), 
                LayoutOrder = 1
            }), 
            EmailInput = l_React_0.createElement(v9, {
                text = v17.email, 
                disabled = v17.isDisabled, 
                onChange = v17.onEmailTextChange, 
                errorMessage = v17.errorMessage, 
                placeholder = v20.emailPlaceholder, 
                LayoutOrder = 2
            })
        })
    });
end;
