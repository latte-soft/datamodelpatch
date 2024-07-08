local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v7 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v8 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.ToCPopupOccurance);
local v9 = require(l_CorePackages_0.UIBlox);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseVNGUserAgreementsPopup);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withStyle_0 = v9.Core.Style.withStyle;
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local v15 = require(l_Modules_0.LuaApp.Http.Requests.AgreeUpdatedUserAgreements);
local l_UserAgreementErrorCodes_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementErrorCodes;
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v18 = require(l_CorePackages_0.FitFrame);
local v19 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v20 = require(l_Modules_0.LuaApp.Components.UserAgreement.VNGBalanceTransferPrompt);
local l_Button_0 = v9.App.Button.Button;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v9.App.InputButton.Checkbox;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_Images_0 = v9.App.ImageSet.Images;
local l_StyledTextLabel_0 = v9.App.Text.StyledTextLabel;
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local l_UserAgreementsList_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsList;
local v29 = Rect.new(8, 8, 9, 9);
local v30 = v2.PureComponent:extend("VNGUserAgreementsPopup");
v30.validateProps = v10.strictInterface({
    agreements = v10.array(v10.strictInterface({
        id = v10.string, 
        agreementType = v10.string, 
        clientType = v10.string, 
        displayUrl = v10.string, 
        regulationType = v10.string, 
        action = v10.optional(v10.string)
    })), 
    isSignup = v10.boolean, 
    formFactor = v10.string, 
    screenSize = v10.Vector2, 
    networking = v10.callback, 
    guiService = v10.union(v10.Instance, v10.table), 
    closePopup = v10.callback, 
    logout = v10.callback, 
    defaultChildRef = v10.optional(v10.any), 
    focusController = v10.optional(v10.any), 
    containerWidth = v10.optional(v10.integer), 
    closeCentralOverlayThunk = v10.optional(v10.callback), 
    agreementAccepted = v10.optional(v10.callback), 
    agreementDeclined = v10.optional(v10.callback)
});
v30.init = function(v31)
    local v32, v33 = v2.createBinding(false);
    v31.buttonPressed = v32;
    v31.updateButtonPressed = v33;
    v31.state = {
        agreementsChecked = false, 
        acceptingAgreements = false, 
        showBalanceTransferAlert = false, 
        showError = false
    };
    v31.SetAgreementsCheckBox = function(v34)
        v31:setState({
            agreementsChecked = v34
        });
    end;
    v31.SetAgreementsCheckBoxByTextButton = function()
        v31:setState({
            agreementsChecked = not v31.state.agreementsChecked
        });
    end;
    v31.xClose = function()
        if not v31.props.isSignup then
            v31.props.logout(v31.props.networking, v31.props.guiService);
            v31.props.closePopup();
        else
            v31.props.closePopup();
            if v31.props.agreementDeclined then
                v31.props.agreementDeclined();
                return ;
            end;
        end;
    end;
    v31.tryAgree = function()
        if v31.state.agreementsChecked then
            v31:setState({
                showError = false, 
                acceptingAgreements = true
            });
            local l_closePopup_0 = v31.props.closePopup;
            local l_agreements_0 = v31.props.agreements;
            if not v31.props.isSignup then
                v15(v31.props.networking, l_agreements_0, function(v37)
                    if v37 == l_UserAgreementErrorCodes_0.InvalidState then
                        v31:setState({
                            showBalanceTransferAlert = true
                        });
                    elseif v37 == l_UserAgreementErrorCodes_0.NoError then
                        l_closePopup_0();
                        if v31.props.agreementAccepted then
                            v31.props.agreementAccepted(l_agreements_0);
                        end;
                    else
                        v31:setState({
                            showError = true
                        });
                    end;
                    v31:setState({
                        acceptingAgreements = false
                    });
                end);
            else
                l_closePopup_0();
                if v31.props.agreementAccepted then
                    v31.props.agreementAccepted(l_agreements_0);
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v30.getLayoutInfo = function(_, v39, v40)
    if not v39 then
        return "Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v40.BackgroundUIDefault.Color
        };
    else
        return v19, {
            Size = UDim2.new(0, 540, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v40.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v29, 
            AutomaticSize = Enum.AutomaticSize.Y
        };
    end;
end;
v30.renderBalanceTransferPrompt = function(v41, _)
    return v2.createElement(v20, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = v41.props.screenSize, 
        doneActivated = function()
            v41:setState({
                showBalanceTransferAlert = false
            });
        end
    });
end;
v30.renderWithProviders = function(v43, v44, v45)
    local l_Font_0 = v45.Font;
    local l_Theme_0 = v45.Theme;
    local l_screenSize_0 = v43.props.screenSize;
    local v49 = v43.props.formFactor == l_FormFactor_0.WIDE;
    local v50, v51 = v43:getLayoutInfo(v49, l_Theme_0);
    local l_title_0 = v44.title;
    local l_message_0 = v44.message;
    local l_agreeButton_0 = v44.agreeButton;
    local l_checkbox_0 = v44.checkbox;
    local l_errorMessage_0 = v44.errorMessage;
    v7.default:logRobloxTelemetryEvent(v8);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_screenSize_0.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement(v50, v51, {
            ListLayout = v49 and v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, not v49 and 60 or 0), 
                PaddingBottom = UDim.new(0, not v49 and 48 or 24)
            }), 
            Content = v2.createElement(v18.FitFrameVertical, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Title = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    v2.createElement(l_IconButton_0, {
                        anchorPoint = Vector2.new(0, 0.5), 
                        size = UDim2.new(0, 36, 0, 36), 
                        position = UDim2.new(0, 8, 0.5, 0), 
                        icon = l_Images_0["icons/navigation/close"], 
                        onActivated = v43.xClose
                    }); 
                    TitleText = v2.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, 0, 0, 36), 
                        text = l_title_0, 
                        fontStyle = l_Font_0.Header1, 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        textTruncate = Enum.TextTruncate.AtEnd
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                Message = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, not v49 and 48 or 24), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, not v49 and 48 or 12), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    MessageText = v2.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, 0, 0, 0), 
                        text = l_message_0, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        textTruncate = Enum.TextTruncate.None, 
                        automaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                AgreementsContainer = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    CheckBox = v2.createElement(l_Checkbox_0, {
                        text = "", 
                        isSelected = v43.state.agreementsChecked, 
                        onActivated = v43.SetAgreementsCheckBox
                    }), 
                    MessageButton = v2.createElement("TextButton", {
                        Size = UDim2.new(1, -34, 1, 0), 
                        Position = UDim2.new(0, 34, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = l_checkbox_0, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        [v2.Event.Activated] = v43.SetAgreementsCheckBoxByTextButton
                    })
                }), 
                SecondDivider = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 0), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    Divider = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0
                    })
                }), 
                AgreementsList = v2.createElement(l_UserAgreementsList_0, {
                    LayoutOrder = 5, 
                    agreements = v43.props.agreements, 
                    margin = v18.Rect.quad(0, 24, 24, 24)
                })
            }), 
            AgreeZone = v2.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -10), 
                AnchorPoint = Vector2.new(0.5, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 24)
                }); 
                v2.createElement(v18.FitFrameVertical, {
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ErrorLabel = not not v43.state.showError and v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = l_errorMessage_0, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = (l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) * 0.8, 
                        TextColor3 = l_Theme_0.Alert.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true
                    }) or nil, 
                    AgreeButton = v2.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 0, 48), 
                        anchorPoint = Vector2.new(0, 0), 
                        isDisabled = v43.state.acceptingAgreements or not v43.state.agreementsChecked, 
                        layoutOrder = 2, 
                        text = l_agreeButton_0, 
                        fontStyle = l_Font_0.SubHeader1, 
                        onActivated = v43.tryAgree
                    })
                })
            })
        })
    });
end;
v30.render = function(v57)
    return v14({
        title = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService", 
        message = not v57.props.isSignup and "CommonUI.UserAgreements.Popup.ConvertToVNMessage" or "CommonUI.UserAgreements.Popup.SignupMessage", 
        agreeButton = "CommonUI.UserAgreements.Popup.Agree2", 
        checkbox = "CommonUI.UserAgreements.Popup.CheckboxMessage", 
        errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage"
    })(function(v58)
        return l_withStyle_0(function(v59)
            if not v57.state.showBalanceTransferAlert then
                return (v57:renderWithProviders(v58, v59));
            else
                return (v57:renderBalanceTransferPrompt(v58));
            end;
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v5, 
    guiService = l_AppGuiService_0
})((v3.connect(function(v60)
    return {
        screenSize = v60.ScreenSize, 
        formFactor = v60.FormFactor
    };
end, function(v61)
    return {
        closePopup = function()
            v61(v11());
        end, 
        logout = function(v62, v63)
            v61(v27(v62, v63));
        end
    };
end)(v30))));
