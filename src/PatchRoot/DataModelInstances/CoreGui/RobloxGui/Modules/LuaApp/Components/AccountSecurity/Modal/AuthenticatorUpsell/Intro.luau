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
local v11 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local _ = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v13 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v19 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v5.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v5.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v26 = {
    action = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellSetupAuthenticatorButtonMessage", 
    descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
    descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity", 
    header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellWelcomeMessage", 
    keepBadActorsOutHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorHeadline", 
    keepBadActorsOutMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorMessage", 
    protectGamesRobuxHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxHeadline", 
    protectGamesRobuxMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxMessage", 
    twoFactorsBetterThanOneHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorHeadline", 
    twoFactorsBetterThanOneMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorMessage"
};
local v27 = v3.PureComponent:extend("Intro");
local l_XLarge_0 = l_IconSize_0.XLarge;
local v29 = (l_getIconSize_0(l_XLarge_0) + 6) - 13;
local v30 = UDim.new(0, 10);
local v31 = UDim.new(0, 3);
local v32 = UDim.new(6, 6);
v27.init = function(v33)
    v33:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v33.continueToAuthenticatorAppScreen = function(_)
        return function()
            v33:setState({
                requestInFlight = true
            });
            v33.props.navigateToModalState(v11.AuthenticatorUpsellInstallApps);
        end;
    end;
    v33.closeCallback = function()
        v33.props.updatePromptAssignment(v33.props.networking, v33.props.promptType, v13.DismissPrompt);
    end;
end;
v27.render = function(v35)
    local _ = v35.state.requestError;
    local l_requestInFlight_0 = v35.state.requestInFlight;
    return v5.Style.withStyle(function(v38)
        local _ = v38.Theme.SystemPrimaryDefault.Color;
        return v19(v26)(function(v40)
            return v3.createElement(v8, {
                title = v40.header, 
                closeCallback = v35.closeCallback, 
                makeBodyFragment = function(v41)
                    return v3.createFragment({
                        ROWS_WRAPPER = v3.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = 1
                        }, {
                            WrappingListWrapper = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = v30
                            }), 
                            FIRST_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListB = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v32
                                }), 
                                Left_ProtectGamesRobuxImage = v3.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/connectdevices_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v3.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v3.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v31
                                    }), 
                                    Right_TwoFactorsTextA = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.twoFactorsBetterThanOneHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_TwoFactorsTextB = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.twoFactorsBetterThanOneMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            }), 
                            SECOND_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListB = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v32
                                }), 
                                Left_ProtectGamesRobuxImage = v3.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/gamesanditems_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v3.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v3.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v31
                                    }), 
                                    Right_ProtectGamesRobuxHeadline = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.protectGamesRobuxHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_ProtectGamesRobuxMessage = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.protectGamesRobuxMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            }), 
                            THIRD_ROW = v3.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListC = v3.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v32
                                }), 
                                Left_KeepBadActorsImage = v3.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/blocktheft_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v3.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v3.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v31
                                    }), 
                                    Right_TwoFactorsTextA = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.keepBadActorsOutHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_TwoFactorsTextB = v3.createElement(v9, {
                                        contentWidth = v41 - v29, 
                                        text = v40.keepBadActorsOutMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            })
                        })
                    });
                end, 
                buttonConfig = v10({
                    {
                        isDisabled = l_requestInFlight_0, 
                        isLoading = l_requestInFlight_0, 
                        onActivated = v35.continueToAuthenticatorAppScreen(v40), 
                        text = v40.action, 
                        type = l_ButtonType_0.PrimarySystem
                    }
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v15, 
    networking = v16
})((v4.connect(function(_, _)
    return {};
end, function(v44)
    return {
        closeOverlay = function()
            return v44(v7());
        end, 
        updatePromptAssignment = function(v45, v46, v47)
            return v44(v18(v45, v46, v47));
        end
    };
end)(v27))));
