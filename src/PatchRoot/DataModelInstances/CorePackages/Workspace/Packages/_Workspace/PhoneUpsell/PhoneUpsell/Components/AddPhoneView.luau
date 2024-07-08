local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local v9 = require(l_Parent_0.AuthCommon);
local l_TextBoxStateWrapper_0 = v9.Components.TextBoxStateWrapper;
local l_PhoneNumberTextBox_0 = v9.Components.PhoneNumberTextBox;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local v13 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v14 = {
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    buttonKey = "Feature.VerificationUpsell.Action.Continue", 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA"
};
local function v21(v15, v16, v17, v18, v19)
    local v20 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v16, 
                text = v15, 
                isDisabled = v17
            }
        }
    };
    if v18 and v18 ~= "" then
        table.insert(v20, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v19, 
                text = v18, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v20
    };
end;
return function(v22)
    local v23 = v13(v14, v22);
    local function v24()
    end;
    local v25, v26 = v2.useState(false);
    local v27 = l_PartialPageModal_0:getMiddleContentWidth(v23.screenSize.X);
    local v28 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v23.titleKey, 
        descriptionKey = v23.descriptionKey, 
        buttonKey = v23.buttonKey, 
        legalTextKey = v23.legalTextKey
    };
    if v23.extraButtonKey and v23.extraButtonKey ~= "" then
        v28.extraButtonKey = v23.extraButtonKey;
    end;
    return l_withStyle_0(function(v29)
        return l_withLocalization_0(v28)(function(v30)
            local l_BaseSize_0 = v29.Font.BaseSize;
            local l_RelativeSize_0 = v29.Font.Body.RelativeSize;
            local l_RelativeSize_1 = v29.Font.CaptionHeader.RelativeSize;
            local v34 = v23.isDisabled or v23.requireLegalTextCheckbox and not v25;
            local l_createElement_0 = v2.createElement;
            local l_l_PartialPageModal_0_0 = l_PartialPageModal_0;
            local v37 = {
                title = v30.titleKey, 
                screenSize = v23.screenSize, 
                buttonStackProps = v21(v30.buttonKey, v23.onSetPhoneNumber, v34, v30.extraButtonKey, v23.onExtraButtonClick), 
                onCloseClicked = v23.onClose, 
                position = not not v23.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v23.keyboardHeight) or nil, 
                anchorPoint = not not v23.isKeyboardShowing and Vector2.new(0.5, 1) or nil
            };
            local v38 = {};
            local l_createElement_1 = v2.createElement;
            local v40 = "Frame";
            local v41 = {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            };
            local v42 = {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                BodyText = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Text = v30.descriptionKey, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v29.Theme.TextDefault.Color, 
                    TextTransparency = v29.Theme.TextDefault.Transparency, 
                    Font = v29.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v27, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                PhoneInput = v2.createElement(l_TextBoxStateWrapper_0, {
                    ChildClass = l_PhoneNumberTextBox_0, 
                    ErrorState = v23.errorMessage ~= "", 
                    ErrorText = v23.errorMessage, 
                    Size = UDim2.new(1, 0, 0, 36), 
                    LayoutOrder = 1, 
                    ChildProps = {
                        CountryCode = v23.countryCode, 
                        SetCountryCode = v23.setCountryCode, 
                        Text = v23.phoneNumber, 
                        PlaceholderText = v30.phoneNumberKey, 
                        Font = v29.Font.Body.Font, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Color = v29.Theme.BackgroundUIContrast.Color, 
                        Transparency = v29.Theme.BackgroundUIContrast.Transparency, 
                        TextColor = v29.Theme.TextDefault.Color, 
                        PlaceholderColor = v29.Theme.UIDefault.Color, 
                        TextTransparency = v29.Theme.TextDefault.Transparency, 
                        ClearTextOnFocus = false, 
                        PaddingX = 12, 
                        TextInputTypeOverride = not not v23.usePhoneNumberTextType and Enum.TextInputType.Phone or Enum.TextInputType.Number, 
                        onChangeText = v23.onPhoneNumberTextChange, 
                        onFocused = v23.onPhoneInputFocus, 
                        onFocusLost = v24, 
                        phoneCountryCodeSelectorCallback = v23.onCountryCodeSelectorClick
                    }
                }), 
                PrivacyText = v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v30.phonePrivacyDisclaimerKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v29.Theme.TextEmphasis.Color, 
                    TextTransparency = v29.Theme.TextEmphasis.Transparency, 
                    Font = v29.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v27, 0, 24)
                })
            };
            local v43;
            if not v23.requireLegalTextCheckbox then
                if not v23.alwaysShowLegalText then
                    v43 = false;
                    if not (v23.countryCode.prefix == "1") then
                        goto label0;
                    end;
                end;
                v43 = v2.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v30.legalTextKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v29.Theme.TextDefault.Color, 
                    TextTransparency = v29.Theme.TextDefault.Transparency, 
                    Font = v29.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v27, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                });
            else
                v43 = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v27, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 6)
                    }), 
                    LegalCheckbox = v2.createElement(l_Checkbox_0, {
                        onActivated = v26, 
                        isSelected = v25, 
                        text = ""
                    }), 
                    LegalText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v30.legalTextKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v29.Theme.TextDefault.Color, 
                        TextTransparency = v29.Theme.TextDefault.Transparency, 
                        Font = v29.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, -32, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                });
            end;
            ::label0::;
            v42.LegalTextContainer = v43;
            v43 = false;
            if v23.countryCode.prefix == "1" then
                v43 = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TermsOfUseButton = v2.createElement(l_LinkButton_0, {
                        text = v30.termsOfUseKey, 
                        onActivated = v23.onTermsOfUseClick, 
                        layoutOrder = 5, 
                        fontStyle = "CaptionBody", 
                        size = UDim2.fromScale(0.2, 0.2)
                    }), 
                    TextButtonDivider = v2.createElement("TextLabel", {
                        LayoutOrder = 6, 
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v29.Theme.TextDefault.Color, 
                        TextTransparency = v29.Theme.TextDefault.Transparency, 
                        Font = v29.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    PrivacyPolicyButton = v2.createElement(l_LinkButton_0, {
                        text = v30.privacyPolicyKey, 
                        onActivated = v23.onPrivacyPolicyClick, 
                        layoutOrder = 7, 
                        fontStyle = "CaptionBody"
                    })
                });
            end;
            v42.LegalButtonsContainer = v43;
            v38.Middle = l_createElement_1(v40, v41, v42);
            return l_createElement_0(l_l_PartialPageModal_0_0, v37, v38);
        end);
    end);
end;
