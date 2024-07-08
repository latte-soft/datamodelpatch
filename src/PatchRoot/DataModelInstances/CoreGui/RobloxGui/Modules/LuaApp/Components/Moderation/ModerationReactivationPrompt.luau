local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v5 = require(l_CorePackages_0.UIBlox);
local l_PartialPageModal_0 = v5.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_Modules_0.LuaApp.Constants);
local v11 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v12 = require(l_Modules_0.LuaApp.Http.Requests.ReactivateDeactivatedAccount);
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeactivatedUserReactivation;
return function(v14)
    local v15 = l_useRoactService_0(l_RoactNetworking_0);
    local v16, v17 = v2.useState(false);
    local v18 = l_useLocalization_0({
        LogoutText = "Application.Logout.Action.Logout", 
        TitleText = "Feature.AccountReactivation.Heading.AccountDeactivated", 
        NotesText = "Feature.AccountReactivation.Content.AccountDeactivatedMessage", 
        ReactivateButtonText = "Feature.AccountReactivation.Label.Reactivate", 
        ErrorMessage = "Feature.AccountReactivation.Label.DefaultError"
    });
    local function v21()
        v17(false);
        v12(v15):andThen(function(_)
            v14.completedCallback();
        end, function(_)
            v17(true);
        end);
    end;
    local l_screenSize_0 = v14.screenSize;
    local v23 = l_useStyle_0();
    local l_Theme_0 = v23.Theme;
    local l_Font_0 = v23.Font;
    local l_globalGuiInset_0 = v14.globalGuiInset;
    l_globalGuiInset_0.bottom = v11();
    return v2.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = v10.DisplayOrder.AntiAddictionPrompt, 
        IgnoreGuiInset = true
    }, {
        OverlayFrame = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageTransparency = 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Selectable = false
        }, {
            Overlay = v2.createElement("Frame", {
                Position = UDim2.fromOffset(0, l_globalGuiInset_0.top), 
                Size = UDim2.fromOffset(l_screenSize_0.X, (l_screenSize_0.Y - l_globalGuiInset_0.top) - l_globalGuiInset_0.bottom), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Content = v2.createElement(l_PartialPageModal_0, {
                    title = v18.TitleText, 
                    screenSize = l_screenSize_0, 
                    buttonHeight = 48, 
                    buttonStackProps = {
                        buttons = {
                            {
                                props = {
                                    isDisabled = false, 
                                    onActivated = v14.logoutCallback, 
                                    text = v18.LogoutText
                                }
                            }, 
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = false, 
                                    onActivated = v21, 
                                    text = v18.ReactivateButtonText
                                }
                            }
                        }
                    }
                }, {
                    Body = v2.createElement("Frame", {
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 60), 
                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        LayoutOrder = 1
                    }, {
                        CustomInner = v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v18.NotesText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            Font = l_Font_0.Body.Font, 
                            Size = UDim2.new(1, 0, 1, 0)
                        })
                    }), 
                    Error = v2.createElement("Frame", {
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 40), 
                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        LayoutOrder = 2
                    }, {
                        CustomInner = not not v16 and v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v18.ErrorMessage, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            Font = l_Font_0.Body.Font, 
                            Size = UDim2.new(1, 0, 1, 0)
                        }) or nil
                    })
                })
            })
        })
    });
end;
