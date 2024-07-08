local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v7 = require(l_script_FirstAncestor_0.Analytics.sendButtonClickEvent);
local v8 = require(l_script_FirstAncestor_0.Common.AppScreens);
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_LinkButton_0 = v2.App.Button.LinkButton;
local l_idvWithQRCodeUpsellStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).idvWithQRCodeUpsellStrings;
local v13 = require(script.Parent.DirectionsTile);
local v14 = require(script.Parent.ProgressChecklist);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v17)
    local l_featureName_0 = v17.featureName;
    local v19 = l_useLocalization_0(l_idvWithQRCodeUpsellStrings_0);
    local v20 = l_useStyle_0();
    local l_onClose_0 = v17.onClose;
    local l_openPrivacyPolicyLink_0 = v17.openPrivacyPolicyLink;
    local l_Font_0 = v20.Font.Body.Font;
    local l_BaseSize_0 = v20.Font.BaseSize;
    local l_Transparency_0 = v20.Theme.TextEmphasis.Transparency;
    local v26 = l_BaseSize_0 * v20.Font.CaptionBody.RelativeSize;
    local v27 = v17.analyticsService or v6.EventStream;
    local l_idvLink_0 = v17.idvLink;
    local l_latestStepCompleted_0 = v17.latestStepCompleted;
    local v30 = l_latestStepCompleted_0 > 0;
    local l_openIdvLink_0 = v17.openIdvLink;
    return v3.createElement(l_PartialPageModal_0, {
        title = v19.title, 
        screenSize = l_useSelector_0(function(v32)
            return v32.ScreenSize;
        end), 
        onCloseClicked = v3.useCallback(function()
            v7(v27, v8.IDVDirectLinkUpsell, l_featureName_0, "CloseModal");
            l_onClose_0();
        end, {
            v27, 
            l_featureName_0
        }), 
        buttonStackProps = {
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttonHeight = 36, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = v3.useCallback(function()
                            v7(v27, v8.IDVDirectLinkUpsell, l_featureName_0, "CloseModal");
                            l_onClose_0();
                        end, {
                            v27, 
                            l_featureName_0
                        }), 
                        text = v19.cancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = v3.useCallback(function()
                            if l_idvLink_0 ~= nil then
                                v7(v27, v8.IDVDirectLinkUpsell, l_featureName_0, "OpenIdvLink");
                                l_openIdvLink_0(l_idvLink_0);
                            end;
                        end, {
                            l_openIdvLink_0, 
                            l_idvLink_0, 
                            v27, 
                            l_featureName_0
                        }), 
                        text = v19.startVerification
                    }
                }
            }
        }
    }, {
        DirectLinkViewFrame = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 24)
            }), 
            DirectionsFrameOrProgressChecklist = if v30 then v3.createElement(v14, {
                entryHeight = 18, 
                layoutOrder = 1, 
                latestStepCompleted = l_latestStepCompleted_0
            }) else v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundColor3 = v20.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = 0, 
                LayoutOrder = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                IDDirection = v3.createElement(v13, {
                    imagePath = "icons/menu/document", 
                    headerText = v19.idDirectionsHeader, 
                    descriptionText = v19.idDirectionsBody, 
                    frameHeight = 48
                })
            }), 
            DisclaimerFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 100), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Disclaimer = v3.createElement("TextLabel", {
                    Text = v19.disclaimer, 
                    Font = l_Font_0, 
                    TextSize = v26, 
                    TextColor3 = v20.Theme.TextDefault.Color, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                PrivacyPolicy = v4.createElement(l_LinkButton_0, {
                    text = v19.privacyLinkText, 
                    layoutOrder = 2, 
                    fontStyle = "CaptionBody", 
                    underlineAlwaysEnabled = true, 
                    onActivated = function()
                        v7(v27, v8.IDVDirectLinkUpsell, l_featureName_0, "OpenPrivacyPolicy");
                        l_openPrivacyPolicyLink_0();
                    end
                })
            })
        })
    });
end;
