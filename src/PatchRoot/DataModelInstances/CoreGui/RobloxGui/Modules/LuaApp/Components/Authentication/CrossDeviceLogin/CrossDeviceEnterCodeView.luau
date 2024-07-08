local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v14 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v15 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v16 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAlternateXDLStrings);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v19 = require(l_Modules_0.LuaApp.FitChildren);
local v20 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v21 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_TextInputBoxWithBorder_0 = v21.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v21.Components.AuthStatefulRoundCornerBorder;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout);
local v27 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout);
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v6.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v32 = l_Images_0["icons/graphic/lock_xxlarge"];
local _ = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
game:DefineFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments", false);
game:DefineFastFlag("EnableXDLCodeValidationExperiment", false);
local v34 = v3.PureComponent:extend("CrossDeviceEnterCodePage");
v34.init = function(v35)
    v35:setState({
        inputCode = "", 
        inputErrorKey = "", 
        placeholderTextOverride = "", 
        disableSubmissionForBadCode = false, 
        isConfirming = false, 
        isFocused = false
    });
    v35.onFocus = function()
        v35:setState({
            inputErrorKey = "", 
            isFocused = true
        });
    end;
    v35.onFocusLost = function(_, v37)
        if v37 and #v35.state.inputCode == 6 then
            v35.confirmButtonPressed();
            return ;
        else
            v35:setState({
                isFocused = false
            });
            return ;
        end;
    end;
    v35.onTextChanged = function(v38)
        local v39 = v38.Text:gsub("[^%w]", ""):upper():sub(1, 6);
        if v39 ~= v38.Text then
            v38.Text = v39;
            return ;
        else
            v35:setState({
                inputCode = v38.Text
            });
            return ;
        end;
    end;
    v35.attemptDeeplinkCode = true;
    v35.confirmingCode = false;
    v35.confirmButtonPressed = function()
        if not v35.confirmingCode then
            v35.confirmingCode = true;
            v35:setState({
                isConfirming = true, 
                isFocused = false
            });
            local v40 = nil;
            local v41 = nil;
            if (not v18() or not v35.attemptDeeplinkCode) or not v35.props.code then
                v40 = v35.state.inputCode;
                v41 = "alphaNumericCode";
            else
                v40 = v35.props.code;
                v41 = "qrCode";
            end;
            v35.attemptDeeplinkCode = false;
            if not v18() then
                v35.props.authAnalytics.reportButtonClicked(v15.Context.QuickLogin, v15.Button.EnterDeviceCode);
            else
                v35.props.authAnalytics.reportButtonClickedWithCType(v15.Context.QuickLogin, v15.Button.EnterDeviceCode, v41);
            end;
            do
                local l_v40_0 = v40;
                v35.props.validateCode(v35.props.networking, l_v40_0):andThen(function(v43)
                    v35.acceptInputCode(l_v40_0, v43.DeviceInfo);
                end, v35.clearInputCode);
            end;
        end;
    end;
    local v44, v45 = v3.createBinding("");
    v35.inputText = v44;
    v35.setInputText = v45;
    v35.clearInputCode = function(v46)
        v35.confirmingCode = false;
        v35.setInputText("");
        local v47 = "Authentication.Login.Response.SomethingWentWrong";
        if v46.StatusMessage == "CodeInvalid" then
            v47 = "Authentication.CrossDevice.Response.InvalidCode";
        elseif v46.Body == "\"InvalidLocation\"" then
            v47 = "Authentication.CrossDevice.Label.InvalidLocationError";
        end;
        v35:setState({
            inputCode = "", 
            inputErrorKey = v47, 
            isConfirming = false
        });
    end;
    v35.acceptInputCode = function(v48, v49)
        if v35.props.confirmDeviceCode then
            v35.props.confirmDeviceCode(v48, v49);
        end;
    end;
end;
v34.didMount = function(v50)
    if v50.props.code then
        v50.setInputText(v50.props.code);
        v50.confirmButtonPressed();
    end;
    v50.isMounted = true;
    v50.props.authAnalytics.reportScreenLoaded(v15.Context.QuickLogin);
    if game:GetFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments") then
        v16(v50.props.networking, "PlayerApp.CrossDeviceLogin.ConfirmCode", {
            "HintTextOverride"
        }):andThen(function(v51)
            local v52 = v51 and v51.responseBody;
            if not (not v52 or not v50.isMounted) then
                v50:setState({
                    placeholderTextOverride = v52.HintTextOverride or "", 
                    disableSubmissionForBadCode = v52.ShouldDisableSubmissionForBadCode or false
                });
            end;
        end, function()
        end);
    end;
end;
v34.willUnmount = function(v53)
    v53.isMounted = false;
end;
v34.render = function(v54)
    local l_isWideView_0 = v54.props.isWideView;
    local l_inputCode_0 = v54.state.inputCode;
    local v57 = v54.state.inputErrorKey == "";
    local l_isConfirming_0 = v54.state.isConfirming;
    local l_isFocused_0 = v54.state.isFocused;
    return l_withStyle_0(function(v60)
        return v8({
            tabletHeader = "Authentication.CrossDevice.Heading.LoginAnotherDevice", 
            warningHeader = "Authentication.CrossDevice.Heading.LoginWarning", 
            warning1 = "Authentication.CrossDevice.Label.Warning1", 
            warning2 = "Authentication.CrossDevice.Label.Warning2", 
            placeholderText = not v17() and "Authentication.CrossDevice.Label.EnterCode" or "Authentication.CrossDevice.Label.EnterOtherDeviceCode", 
            enter = "Authentication.CrossDevice.Action.Enter", 
            inputError = not v57 and v54.state.inputErrorKey or nil
        })(function(v61)
            local l_designTokens_0 = v54.props.designTokens;
            local v63 = UDim2.fromOffset(l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local l_headerPadding_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerPadding;
            local l_Font_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local _ = Enum.VerticalAlignment.Center;
            local l_Font_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_0 = v60.Font.BaseSize;
            local v77 = v54.state.placeholderTextOverride ~= "" and v54.state.placeholderTextOverride or v61.placeholderText;
            local l_createElement_0 = v3.createElement;
            local v79 = not not l_isWideView_0 and v27 or v26;
            local v80 = {
                TabletHeaderText = v61.tabletHeader, 
                Style = v60, 
                HighKeyboardMode = v54.props.highKeyboardMode, 
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Size = v63, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v32, 
                    ImageColor3 = v60.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                WarningText = v3.createElement(v19.FitFrame, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -20, 0, 0), 
                    fitAxis = v19.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    Align = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, 6), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TopWarning = v3.createElement(v20, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.warningHeader, 
                        TextWrapped = true, 
                        Font = l_Font_0, 
                        TextSize = l_FontSize_0, 
                        TextColor3 = l_Color3_0, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = not not l_isWideView_0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Padding = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, l_headerPadding_0), 
                        BackgroundTransparency = 1
                    }), 
                    BulletPoint1 = v3.createElement(v20, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.warning1, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    BulletPoint2 = v3.createElement(v20, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.warning2, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v19.FitAxis.Height, 
                        BackgroundTransparency = 1
                    })
                }), 
                InputBox = v3.createElement(l_TextInputBoxWithBorder_0, {
                    layoutOrder = 3, 
                    placeholderText = v77, 
                    borderState = (not v57 and l_AuthStatefulRoundCornerBorder_0.BorderState.Error or l_isFocused_0 and l_AuthStatefulRoundCornerBorder_0.BorderState.Focused) or l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                    text = v54.inputText, 
                    onFocused = v54.onFocus, 
                    onFocusLost = v54.onFocusLost, 
                    onChangeTextCallback = v54.onTextChanged
                }), 
                InputWarning = not v57 and v3.createElement(v20, {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, -6, 0, l_FontSize_2), 
                    Position = UDim2.new(0, 3, 1, 3), 
                    BackgroundTransparency = 1, 
                    Font = l_Font_2, 
                    TextSize = l_FontSize_2, 
                    TextColor3 = l_Color3_2, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v61.inputError, 
                    TextWrapped = true, 
                    fitAxis = v19.FitAxis.Height
                })
            };
            local l_createElement_1 = v3.createElement;
            local l_l_Button_0_0 = l_Button_0;
            local v83 = {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, 0, 1, 0), 
                text = v61.enter, 
                [v3.Ref] = v54.props.continueButtonRef, 
                onActivated = v54.confirmButtonPressed, 
                isLoading = l_isConfirming_0
            };
            local v84;
            if not (not game:GetFastFlag("EnableXDLCodeValidationExperiment") or not v54.state.disableSubmissionForBadCode) then
                v84 = true;
                if not (#l_inputCode_0 >= 6) then
                    goto label0;
                end;
            end;
            v84 = l_inputCode_0 == "";
            ::label0::;
            v83.isDisabled = v84;
            v80.ConfirmCodeButton = l_createElement_1(l_l_Button_0_0, v83);
            v80.ConfirmCodeButtonWidth = l_Text_0.GetTextWidth(v61.enter, l_Font_1, l_BaseSize_0) + 40;
            return l_createElement_0(v79, v80);
        end);
    end);
end;
local v85 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v86 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v94 = v5.connect(function(v87, _)
    return {
        screenSize = v87.ScreenSize
    };
end, function(v89)
    return {
        validateCode = function(v90, v91)
            return v89(v13.EnterCode(v90, v91));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10, 
    authAnalytics = v14
})((v85.connectUserLayer({
    v86.ExposureLayer, 
    v86.AccessLayer
}, function(_, _)
    return {};
end)(v34)))));
return function(v95)
    return v4.createElement(v94, v2.Dictionary.join(v95, {
        designTokens = l_useDesignTokens_0()
    }));
end;
