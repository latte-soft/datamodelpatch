local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local _ = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.AuthenticatorUpsellImage);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v13 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v14 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v20 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v5.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v26 = {
    action = "Feature.AccountSecurityPrompt.Action.AuthenticatorUpsellNextButtonMessage", 
    downloadInstruction = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellDownloadInstruction", 
    header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellDownloadAuthenticator", 
    googleAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellGoogleOption", 
    microsoftAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellMicrosoftOption", 
    twilioAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwilioOption", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v27 = v3.PureComponent:extend("InstallApps");
local l_Medium_0 = l_IconSize_0.Medium;
local v29 = l_Images_0["icons/status/success"];
local v30 = UDim.new(0, 10);
v27.init = function(v31)
    v31:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v31.continueToAuthenticatorAppScreen = function(v32)
        return function()
            v31:setState({
                requestInFlight = true
            });
            v31.props.openWebView(v14.getWebViewUrlAccountSettings(), v32.settingsTitle);
            v31.props.closeOverlay();
            v31.props.updatePromptAssignment(v31.props.networking, v31.props.promptType, v13.DismissPrompt);
        end;
    end;
    v31.closeCallback = function()
        v31.props.updatePromptAssignment(v31.props.networking, v31.props.promptType, v13.DismissPrompt);
    end;
end;
v27.render = function(v33)
    local _ = v33.state.requestError;
    local l_requestInFlight_0 = v33.state.requestInFlight;
    return v5.Style.withStyle(function(v36)
        local l_Color_0 = v36.Theme.SystemPrimaryDefault.Color;
        return v20(v26)(function(v38)
            return v3.createElement(v8, {
                title = v38.header, 
                closeCallback = v33.closeCallback, 
                makeBodyFragment = function(v39)
                    return v3.createFragment({
                        BEFORE_TEXT = v3.createElement(v9, {
                            layoutOrder = 1, 
                            contentWidth = v39, 
                            text = v38.downloadInstruction, 
                            useBold = true
                        }), 
                        ROWS_WRAPPER = v3.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = 1, 
                            LayoutOrder = 2
                        }, {
                            WrappingListWrapper = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                Padding = v30
                            }), 
                            FIRST_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListA = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v30
                                }), 
                                CheckmarkIconA = v3.createElement(l_ImageSetLabel_0, {
                                    Image = v29, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                MicrosoftAuthenticator = v3.createElement(v9, {
                                    contentWidth = 0, 
                                    text = v38.microsoftAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            }), 
                            SECOND_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListB = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v30
                                }), 
                                CheckmarkIconB = v3.createElement(l_ImageSetLabel_0, {
                                    Image = v29, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                GoogleAuthenticator = v3.createElement(v9, {
                                    contentWidth = 0, 
                                    text = v38.googleAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            }), 
                            THIRD_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListC = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v30
                                }), 
                                CheckmarkIconC = v3.createElement(l_ImageSetLabel_0, {
                                    Image = v29, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                TwilioAuthenticator = v3.createElement(v9, {
                                    contentWidth = 0, 
                                    text = v38.twilioAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            })
                        })
                    });
                end, 
                buttonConfig = v10({
                    {
                        isDisabled = l_requestInFlight_0, 
                        isLoading = l_requestInFlight_0, 
                        onActivated = v33.continueToAuthenticatorAppScreen(v38), 
                        text = v38.action, 
                        type = l_ButtonType_0.PrimarySystem
                    }
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v16, 
    networking = v17
})((v4.connect(function(_, _)
    return {};
end, function(v42)
    return {
        closeOverlay = function()
            return v42(v7());
        end, 
        openWebView = function(v43, v44)
            return v42(v12(v43, v44));
        end, 
        updatePromptAssignment = function(v45, v46, v47)
            return v42(v19(v45, v46, v47));
        end
    };
end)(v27))));
