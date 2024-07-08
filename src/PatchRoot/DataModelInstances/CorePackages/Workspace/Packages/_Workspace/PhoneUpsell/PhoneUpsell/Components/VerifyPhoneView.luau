local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_TextInputBoxWithBorder_0 = require(l_Parent_0.AuthCommon).Components.TextInputBoxWithBorder;
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_LinkButton_0 = v2.App.Button.LinkButton;
local l_GetFFlagAddEntryViewToPhoneVerification_0 = require(l_Parent_0.SharedFlags).GetFFlagAddEntryViewToPhoneVerification;
return function(v10)
    local v11 = l_useStyle_0();
    local v12 = {
        titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone", 
        verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode", 
        placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode", 
        descriptionKey = "Feature.VerificationUpsell.Label.EnterCode", 
        buttonKey = "Feature.VerificationUpsell.Action.ResendCode", 
        buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent", 
        changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber"
    };
    if not (not l_GetFFlagAddEntryViewToPhoneVerification_0() or not v10.extraButtonKey) and v10.extraButtonKey ~= "" then
        v12.extraButtonKey = v10.extraButtonKey;
    end;
    local v13 = l_useLocalization_0(v12);
    local v14, v15 = v1.useState(false);
    local v16, v17 = v1.useState(0);
    local function v30(v18, v19, v20, v21, v22, v23)
        local function v27()
            v21();
            v15(true);
            v17(v20);
            local v24 = tick();
            local function v25()
                local v26 = v20 - (tick() - v24);
                if v26 > 0 then
                    v17((math.round(v26)));
                    task.delay(1, v25);
                    return ;
                else
                    v17(0);
                    v15(false);
                    return ;
                end;
            end;
            v25();
        end;
        local function _()
            if not v14 then
                return v18;
            else
                return v19 .. " (" .. v16 .. ")";
            end;
        end;
        local v29 = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v27, 
                    text = if not v14 then v18 else v19 .. " (" .. v16 .. ")", 
                    isDisabled = v14
                }
            }
        };
        if not ((not l_GetFFlagAddEntryViewToPhoneVerification_0() or not v23) or not v22) and v22 ~= "" then
            table.insert(v29, 1, {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = v23, 
                    text = v22, 
                    isDisabled = false
                }
            });
        end;
        return {
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = v29
        };
    end;
    local function _(v31)
        return v31:gsub("{phoneNumber}", "+" .. v10.prefix .. v10.phoneNumber);
    end;
    return v1.createElement(l_PartialPageModal_0, {
        title = v13.titleKey, 
        screenSize = v10.screenSize, 
        buttonStackProps = v30(v13.buttonKey, v13.buttonDisabledKey, 10, v10.onResendPhoneCode, v13.extraButtonKey, v10.onExtraButtonClick), 
        onCloseClicked = v10.onClose, 
        position = not not v10.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v10.keyboardHeight) or nil, 
        anchorPoint = not not v10.isKeyboardShowing and Vector2.new(0.5, 1) or nil
    }, {
        Middle = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            ListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 12)
            }), 
            BodyText = v1.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Text = v13.descriptionKey:gsub("{phoneNumber}", "+" .. v10.prefix .. v10.phoneNumber), 
                TextSize = v11.Font.BaseSize, 
                TextColor3 = v11.Theme.TextDefault.Color, 
                TextTransparency = v11.Theme.TextDefault.Transparency, 
                Font = v11.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, l_PartialPageModal_0:getMiddleContentWidth(v10.screenSize.X), 0, 0)
            }), 
            TextBox = v1.createElement(l_TextInputBoxWithBorder_0, {
                text = v10.code, 
                textInputType = not not v10.useOTPInputType and Enum.TextInputType.OneTimePassword or Enum.TextInputType.Number, 
                textInputHeight = 36, 
                layoutOrder = 2, 
                placeholderText = v13.placeholderKey, 
                errorText = v10.errorMessage, 
                onChangeTextCallback = v10.onCodeTextChange, 
                Size = UDim2.new(1, 0, 0, 0), 
                onFocused = v10.onCodeInputFocus
            }), 
            ChangePhoneButton = v1.createElement(l_LinkButton_0, {
                text = v13.changePhoneNumberKey, 
                onActivated = v10.returnToAddPhone, 
                layoutOrder = 3, 
                fontStyle = "CaptionBody", 
                minPaddingX = 0, 
                minPaddingY = 0
            })
        })
    });
end;
