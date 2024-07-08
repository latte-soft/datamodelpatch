local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_RoactRodux_0 = v1.RoactRodux;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_FormFactor_0 = require(l_Parent_1.FormFactor).Enums.FormFactor;
local l_FitFrame_0 = v1.FitFrame;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_CloseCentralOverlay_0 = v1.CentralOverlay.Thunks.CloseCentralOverlay;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useState_0 = l_React_0.useState;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_UserAgreementsList_0 = v1.UserAgreements.UserAgreementsList;
local v21 = require(l_Parent_0.KISAComplianceUtils);
local v22 = Rect.new(8, 8, 9, 9);
return (l_RoactRodux_0.connect(function(v23)
    return {
        screenSize = v23.ScreenSize, 
        formFactor = v23.FormFactor
    };
end, function(v24)
    return {
        closeCentralOverlay = function()
            return v24(l_CloseCentralOverlay_0());
        end
    };
end)(function(v25)
    v25.isUnderAgeFlow = v25.isUnderAgeFlow or false;
    local l_screenSize_0 = v25.screenSize;
    local v27 = l_useStyle_0();
    local l_Theme_0 = v27.Theme;
    local l_Font_0 = v27.Font;
    local v30 = tostring(v25.formFactor) == tostring(l_FormFactor_0.WIDE);
    local v31 = l_useDesignTokens_0();
    local l_AuthCompliance_0 = v31.LuaApps.AuthCompliance;
    local v33 = l_useLocalization_0({
        title = "Authentication.OneTimePasscode.Label.ConsentNeeded", 
        message = "CommonUI.UserAgreements.Popup.KISAMessage", 
        agreeButton = "CommonUI.UserAgreements.Popup.Agree2", 
        checkbox = "CommonUI.UserAgreements.Popup.CheckboxMessage", 
        errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage", 
        underAgeFlowTitle = "Authentication.OneTimePasscode.Label.ParentConsentNeeded", 
        underAgeFlowMessage = "Authentication.OneTimePasscode.Description.ReviewAndConsentToTerms"
    });
    local v34, v35 = l_useState_0({});
    local v36, v37 = l_useState_0({});
    if v25.agreements ~= v36 then
        v37(v25.agreements);
        local v38 = {};
        for _, v40 in pairs(v25.agreements) do
            v38[v40.id] = false;
        end;
        v35(v38);
    end;
    local v41, v42, v43 = v21.getCheckBoxStatusVariables(v34, v25.agreements);
    local v44 = not v41;
    local v47, v48 = (function(v45, v46)
        if not v45 then
            return "Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v46.BackgroundUIDefault.Color
            };
        else
            return l_ImageSetLabel_0, {
                Size = UDim2.new(0, 540, 0, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v46.BackgroundUIDefault.Color, 
                Image = "LuaApp/buttons/buttonFill", 
                ImageColor3 = v46.BackgroundUIDefault.Color, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v22, 
                AutomaticSize = Enum.AutomaticSize.Y
            };
        end;
    end)(v30, l_Theme_0);
    local _ = function(v49)
        local v50 = {};
        for v51, _ in pairs(v34) do
            v50[v51] = v49;
        end;
        v35(v50);
    end;
    local function _(v54)
        v25.onAgreeFunction(v54);
        v25.closeCentralOverlay();
    end;
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_screenSize_0.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = l_React_0.createElement(v47, v48, {
            ListLayout = v30 and l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_AuthCompliance_0.paddingTop), 
                PaddingBottom = UDim.new(0, l_AuthCompliance_0.paddingBottom)
            }), 
            Content = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_screenSize_0.Y - 150), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                Layout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Title = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    AreaAboveFirstDivider = l_React_0.createElement("Frame", {
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        ListLayout = l_React_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Padding = l_React_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                        }), 
                        CrossXButton = l_React_0.createElement(l_IconButton_0, {
                            layoutOrder = 1, 
                            anchorPoint = Vector2.new(0.5, 0.5), 
                            size = UDim2.new(0, tonumber(l_AuthCompliance_0.xButtonSize), 0, (tonumber(l_AuthCompliance_0.xButtonSize))), 
                            position = UDim2.new(0, 0, 0, 0), 
                            icon = l_Images_0["icons/navigation/close"], 
                            onActivated = function()
                                if v25.onAbandonFunction then
                                    v25.onAbandonFunction();
                                end;
                                v25.closeCentralOverlay();
                            end
                        }), 
                        TitleText = l_React_0.createElement(l_StyledTextLabel_0, {
                            layoutOrder = 2, 
                            size = UDim2.new(0.75, 0, 0, l_AuthCompliance_0.xButtonSize), 
                            text = if not v25.isUnderAgeFlow then v33.title else v33.underAgeFlowTitle, 
                            fontStyle = l_Font_0.Header1, 
                            colorStyle = l_Theme_0.TextEmphasis, 
                            textXAlignment = Enum.TextXAlignment.Center, 
                            textYAlignment = Enum.TextYAlignment.Center, 
                            textTruncate = Enum.TextTruncate.AtEnd
                        })
                    }), 
                    FirstDivider = l_React_0.createElement("Frame", {
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_React_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_AuthCompliance_0.dividerPaddingTop), 
                            PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                            PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                        }), 
                        Divider = l_React_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            AnchorPoint = Vector2.new(0, 0), 
                            BackgroundColor3 = v31.Semantic.Color.Ui.Default.Color3, 
                            BorderSizePixel = 0
                        })
                    })
                }), 
                Message = l_React_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, if not v30 then l_AuthCompliance_0.messagePaddingTopExtended else l_AuthCompliance_0.messagePaddingTopWideViewExtended), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, if not v30 then l_AuthCompliance_0.messagePaddingBottomReduced else l_AuthCompliance_0.messagePaddingBottomWideView), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    MessageText = l_React_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = if not v25.isUnderAgeFlow then v33.message else v33.underAgeFlowMessage, 
                        TextSize = l_AuthCompliance_0.messageSize, 
                        TextColor3 = v31.Semantic.Color.Text.Emphasis.Color3, 
                        TextTransparency = v27.Theme.TextDefault.Transparency, 
                        Font = v27.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0)
                    })
                }), 
                AgreementsContainer = l_React_0.createElement("Frame", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, l_AuthCompliance_0.checkboxPaddingBottom), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    CheckBox = l_React_0.createElement(l_Checkbox_0, {
                        text = "", 
                        isSelected = v43, 
                        onActivated = function()
                            local v56 = not v43;
                            local v57 = {};
                            for v58, _ in pairs(v34) do
                                v57[v58] = v56;
                            end;
                            v35(v57);
                        end
                    }), 
                    MessageButton = l_React_0.createElement("TextButton", {
                        Size = UDim2.new(1, -((tonumber(l_AuthCompliance_0.checkboxSize) or 0) + (tonumber(l_AuthCompliance_0.checkboxPadding) or 0)), 1, 0), 
                        Position = UDim2.new(0, (tonumber(l_AuthCompliance_0.checkboxSize) or 0) + (tonumber(l_AuthCompliance_0.checkboxPadding) or 0), 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Text = v33.checkbox, 
                        Font = l_Font_0.Body.Font, 
                        TextSize = l_AuthCompliance_0.messageSize, 
                        TextColor3 = l_Theme_0.TextMuted.Color, 
                        TextTransparency = l_Theme_0.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        [l_React_0.Event.Activated] = nil
                    })
                }), 
                SecondDivider = l_React_0.createElement("Frame", {
                    LayoutOrder = 4, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 0), 
                        PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                        PaddingBottom = UDim.new(0, 0), 
                        PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                    }), 
                    Divider = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = v31.Semantic.Color.Ui.Default.Color3, 
                        BorderSizePixel = 0
                    })
                }), 
                AgreementsList = l_React_0.createElement(l_UserAgreementsList_0, {
                    LayoutOrder = 5, 
                    agreements = v25.agreements, 
                    checkBoxStates = v34, 
                    setCheckBoxStates = v35, 
                    separateRequiredOptional = v42, 
                    margin = l_FitFrame_0.Rect.quad(l_AuthCompliance_0.paddingTop, l_AuthCompliance_0.paddingRight, l_AuthCompliance_0.listPaddingBottom, l_AuthCompliance_0.paddingLeft), 
                    verticalSpaceOffset = 300, 
                    isAgreeAllChecked = v43, 
                    useScrollableFrame = true
                })
            }), 
            AgreeZone = l_React_0.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -l_AuthCompliance_0.agreeButtonPaddingBottom), 
                AnchorPoint = Vector2.new(0.5, 1)
            }, {
                Padding = l_React_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingRight = UDim.new(0, l_AuthCompliance_0.paddingRight), 
                    PaddingBottom = UDim.new(0, l_AuthCompliance_0.agreeButtonPaddingBottom), 
                    PaddingLeft = UDim.new(0, l_AuthCompliance_0.paddingLeft)
                }); 
                l_React_0.createElement(l_FitFrame_0.FitFrameVertical, {
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ErrorLabel = nil, 
                    AgreeButton = l_React_0.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 0, l_AuthCompliance_0.agreeButtonHeight), 
                        anchorPoint = Vector2.new(0, 0), 
                        isDisabled = v44, 
                        layoutOrder = 2, 
                        text = v33.agreeButton, 
                        fontStyle = l_Font_0.SubHeader1, 
                        onActivated = function()
                            v25.onAgreeFunction(v34);
                            v25.closeCentralOverlay();
                        end
                    })
                })
            })
        })
    });
end));
