local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_LinkButton_0 = l_UIBlox_0.App.Button.LinkButton;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local v9 = require(l_Parent_0.Utils.debounce);
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_useState_0 = l_React_0.useState;
local v13 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v14 = require(l_Parent_0.Analytics.EventConstants);
local v15 = require(l_Parent_0.Common.otpLoginConstants);
local v16 = require(script.Parent.InputField);
local v17 = game:DefineFastFlag("EnableKoreaKISAComplianceModularized", false);
return function(v18)
    local v19 = l_useStyle_0();
    local v20 = l_useDesignTokens_0();
    local v21 = l_PartialPageModal_0:getMiddleContentWidth(v18.screenSize.X);
    local v22, v23 = l_React_0.useState(true);
    local v24, v25 = l_React_0.useState(v15.DEFAULT_TIMER_COOLDOWN);
    local v26 = l_useLocalization_0({
        placeholderKey = "Authentication.OneTimePasscode.Label.SixDigitCode", 
        buttonKey = "Authentication.OneTimePasscode.Action.Resend", 
        buttonDisabledKey = "Authentication.OneTimePasscode.Label.CodeSent", 
        footerDescriptionKey = "Authentication.OneTimePasscode.Description.DidntReceiveCode", 
        changeEmailKey = "Authentication.OneTimePasscode.Action.ChangeEmailV2", 
        helpButtonKey = "Authentication.OneTimePasscode.Action.GetHelp", 
        complianceCheckboxMessageKey = v18.complianceCheckboxMessageKey
    });
    local v27, v28 = l_useState_0("");
    local v29, v30 = l_useState_0(false);
    local function _(v31)
        v30(v31);
    end;
    local function v33(v34, v35)
        local v36 = v35 - (tick() - v34);
        if v36 > 0 then
            v25((math.round(v36)));
            task.delay(1, function()
                v33(v34, v35);
            end);
            return ;
        else
            v25(0);
            v23(false);
            return ;
        end;
    end;
    local function v43(v37, v38, v39, v40)
        local function v41()
            v40();
            v23(true);
            v25(v39);
            v33(tick(), v39);
        end;
        local function _()
            if not v22 then
                return v37;
            else
                return v38 .. " (" .. v24 .. ")";
            end;
        end;
        return {
            buttonHeight = v20.Global.Size_600, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v41, 
                        text = if not v22 then v37 else v38 .. " (" .. v24 .. ")", 
                        isDisabled = v22 or v18.isDisabled
                    }
                }
            }
        };
    end;
    local v45 = l_React_0.useCallback(function(v44)
        return v44:gsub("{email}", v18.email);
    end, {
        v18.email
    });
    local v47 = l_React_0.useCallback(v9(function(v46)
        v13.sendFormInteractionEvent(v14.ctx.enterOtp, v18.origin, v14.field.code);
        if v46.Text then
            v46.Text = string.sub(v46.Text:gsub("%D", ""), 1, v15.DEFAULT_CODE_LENGTH);
            v28(v46.Text);
            v18.clearErrorMessage();
        end;
    end, 0.5), {
        v28
    });
    local function v48()
        return l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20.Global.Size_200)
            }), 
            ListLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v20.Global.Size_100)
            }), 
            FooterText = l_React_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v26.footerDescriptionKey, 
                TextSize = v20.Global.FontSize_100, 
                TextColor3 = v19.Theme.TextDefault.Color, 
                TextTransparency = v19.Theme.TextDefault.Transparency, 
                Font = v19.Font.Body.Font, 
                LayoutOrder = 4
            }), 
            LinkFrame = l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 5
            }, {
                LinkListLayout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                ChangeEmailButton = l_React_0.createElement(l_LinkButton_0, {
                    text = v26.changeEmailKey, 
                    onActivated = v18.returnToEnterEmail, 
                    layoutOrder = 6, 
                    position = UDim2.fromScale(0.25, 0)
                }), 
                Hyphen = l_React_0.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = "-", 
                    TextSize = v20.Global.FontSize_100, 
                    TextColor3 = v19.Theme.TextDefault.Color, 
                    TextTransparency = v19.Theme.TextDefault.Transparency, 
                    Font = v19.Font.Footer.Font, 
                    LayoutOrder = 7
                }), 
                HelpButton = l_React_0.createElement(l_LinkButton_0, {
                    text = v26.helpButtonKey, 
                    onActivated = v18.navigateToHelp, 
                    layoutOrder = 8, 
                    position = UDim2.fromScale(0.75, 0)
                })
            })
        });
    end;
    local function _()
        return (v17 and v18.complianceCheckboxMessageKey) and v18.complianceCheckboxMessageKey ~= "";
    end;
    l_React_0.useEffect(function()
        v33(tick(), v15.DEFAULT_TIMER_COOLDOWN);
        v13.sendPageLoadEvent(v14.ctx.enterOtp, v18.origin);
    end, {});
    l_React_0.useEffect(function()
        if string.len(v27) == v15.DEFAULT_CODE_LENGTH then
            if not v18.complianceCheckboxMessageKey then
                v18.onSubmitCode(v27);
            elseif v29 then
                v18.onSubmitCode(v27);
                return ;
            end;
        end;
    end, {
        v27, 
        (tostring(v29))
    });
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v18.enterCodeTitle, 
        screenSize = v18.screenSize, 
        buttonStackProps = v43(v26.buttonKey, v26.buttonDisabledKey, v15.DEFAULT_TIMER_COOLDOWN, v18.onResendCode), 
        footerContent = v48, 
        onCloseClicked = v18.onClose, 
        position = not not v18.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v18.keyboardHeight) or nil, 
        anchorPoint = not not v18.isKeyboardShowing and Vector2.new(0.5, 1) or nil
    }, {
        Middle = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20.Global.Size_300), 
                PaddingBottom = UDim.new(0, v20.Global.Size_300)
            }), 
            ListLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v20.Global.Size_150)
            }), 
            BodyText = l_React_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v45(v18.enterCodeDescription), 
                TextSize = v19.Font.BaseSize, 
                TextColor3 = v19.Theme.TextDefault.Color, 
                TextTransparency = v19.Theme.TextDefault.Transparency, 
                Font = v19.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, v21, 0, 0), 
                LayoutOrder = 1
            }), 
            ComplianceCheckboxContainer = ((v17 and v18.complianceCheckboxMessageKey) and v18.complianceCheckboxMessageKey ~= "") and l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, v21, 0, 0), 
                LayoutOrder = 4
            }, {
                Layout = l_React_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 8), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Checkbox = l_React_0.createElement(l_Checkbox_0, {
                    text = "", 
                    isSelected = v29, 
                    onActivated = function()
                        v30(not v29);
                    end, 
                    layoutOrder = 2
                }), 
                CheckboxBodyText = l_React_0.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = v26.complianceCheckboxMessageKey, 
                    TextSize = v19.Font.BaseSize, 
                    TextColor3 = v19.Theme.TextDefault.Color, 
                    TextTransparency = v19.Theme.TextDefault.Transparency, 
                    Font = v19.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v21 * 0.9, 0, 0), 
                    LayoutOrder = 3
                })
            }), 
            CodeInput = l_React_0.createElement(v16, {
                text = v27, 
                disabled = v18.isDisabled, 
                onChange = v47, 
                errorMessage = v18.errorMessage, 
                placeholder = v26.placeholderKey, 
                LayoutOrder = 3
            })
        })
    });
end;
