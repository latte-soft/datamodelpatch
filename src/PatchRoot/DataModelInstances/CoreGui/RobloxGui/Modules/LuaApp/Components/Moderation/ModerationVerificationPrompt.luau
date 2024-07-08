local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_FullPageModal_0 = v5.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_withStyle_0 = v5.Core.Style.withStyle;
local _ = require(l_Modules_0.LuaApp.Models.UserModerationApi.ModerationDetail);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.LuaApp.mutedError);
local _ = require(l_Modules_0.LuaApp.Components.Moderation.ModerationType);
local v14 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v15 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationVerificationScrollview);
local v16 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationAbuseTypeStringTable);
local v17 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local _ = require(l_CorePackages_0.Logging);
local v19 = game:DefineFastFlag("BanScreenConsoleFixEnabled", false);
return function(v20)
    local l_moderationDetails_0 = v20.moderationDetails;
    local l_screenSize_0 = v20.screenSize;
    local l_verificationCategory_0 = v20.verificationCategory;
    local _ = l_moderationDetails_0.punishmentTypeDescription;
    local l_globalGuiInset_0 = v20.globalGuiInset;
    l_globalGuiInset_0.bottom = v14();
    local v26 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v27 = UDim2.fromOffset(l_screenSize_0.X, (l_screenSize_0.Y - l_globalGuiInset_0.top) - l_globalGuiInset_0.bottom);
    local v29 = v17(function(v28)
        return v28.getWebViewSupport();
    end);
    local v30 = true;
    if not (not v19 or v29) then
        v30 = false;
    end;
    local v31 = {
        LogoutText = "Application.Logout.Action.Logout", 
        TitleText = "Feature.Moderation.Title.Ban", 
        SubTitleText = "Feature.Moderation.Messages.SubTitle", 
        ReviewedTitle = "Feature.Moderation.Messages.ReviewedTitle", 
        ModeratorNoteTitle = "Feature.Moderation.Messages.ModeratorNoteTitle", 
        CommunityGuidelineText = "Feature.Moderation.Messages.CommunityGuideline", 
        ReactivateAgreementText = "Feature.Moderation.Messages.ReactivateAgreement", 
        AccountDisabledUntilText = "Feature.Moderation.Messages.AccountDisabledUntil", 
        AccountTerminatedText = "Feature.Moderation.Messages.AccountTerminated", 
        AppealV2Text = "Feature.Moderation.Messages.AppealV2", 
        CommunityGuidelinesLinkText = "Feature.Moderation.Link.CommunityGuidelines", 
        TermsOfUseLinkText = "Feature.Moderation.Link.TermsOfUse", 
        ReportingAppealsLinkText = "CommonUI.Features.Label.ReportAppeals", 
        ParentVerificationButtonText = "Feature.NotApproved.Label.ParentVerificationButtonText", 
        ParentVerificationNotice = "Feature.NotApproved.Label.ParentVerificationNotice", 
        ParentReactivationNotice = "Feature.NotApproved.Label.ParentReactivationNoticeUA", 
        EmailVerificationButtonText = "Feature.NotApproved.Label.EmailVerificationButtonText", 
        EmailVerificationNotice = "Feature.NotApproved.Label.EmailVerificationNotice", 
        EmailReactivationNotice = "Feature.NotApproved.Label.EmailReactivationNoticeUA", 
        ConsoleDeviceNotice = "Feature.NotApproved.Label.ConsoleDeviceNoticeUA", 
        DSALearnMoreBody = "Feature.Moderation.DSATransparency.LearnMoreBody", 
        DSALearnMoreLink = "Feature.Moderation.DSATransparency.LearnMoreLink", 
        DSATransparencyLabel = "Feature.Moderation.DSATransparency.Label", 
        ReasonTitle = "Feature.Moderation.Messages.ReasonTitle", 
        OffensiveItemTitle = "Feature.Moderation.Messages.OffensiveItemTitle"
    };
    for v32, v33 in pairs(v16) do
        v31[v32] = v33;
    end;
    return v2.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = v11.DisplayOrder.AntiAddictionPrompt, 
        IgnoreGuiInset = true
    }, {
        OverlayFrame = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5, 
            BorderSizePixel = 0, 
            Selectable = false
        }, {
            Overlay = v2.createElement("Frame", {
                Position = v26, 
                Size = v27, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Content = l_withLocalization_0(v31)(function(v34)
                    return l_withStyle_0(function(v35)
                        local l_Theme_0 = v35.Theme;
                        local v37 = nil;
                        if l_verificationCategory_0 == "VPC" then
                            v37 = v34.ParentVerificationButtonText;
                        end;
                        if l_verificationCategory_0 == "Email" then
                            v37 = v34.EmailVerificationButtonText;
                        end;
                        return v2.createElement(l_FullPageModal_0, {
                            title = v34.TitleText, 
                            screenSize = v20.screenSize, 
                            buttonStackProps = {
                                forcedFillDirection = Enum.FillDirection.Vertical, 
                                disableRoactGamepadButtonSelection = true, 
                                buttons = {
                                    {
                                        props = {
                                            isDisabled = false, 
                                            onActivated = v20.logoutCallback, 
                                            text = v34.LogoutText
                                        }
                                    }, 
                                    if not v30 then nil else {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            onActivated = v20.parentVerificationActivated, 
                                            text = v37
                                        }
                                    }
                                }
                            }
                        }, {
                            ModContent = v2.createElement("Frame", {
                                Size = UDim2.fromScale(1, 1), 
                                BackgroundTransparency = 1
                            }, {
                                UIListLayout = v2.createElement("UIListLayout", {
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    FillDirection = Enum.FillDirection.Vertical, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                                    Padding = UDim.new(0, 0)
                                }), 
                                ModContentFrame = v2.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 1, -50), 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 1
                                }, {
                                    Scrollview = v2.createElement(v15, {
                                        moderationDetails = l_moderationDetails_0, 
                                        localizationTable = v34, 
                                        stylePalette = v35, 
                                        communityGuidelinesActivated = v20.communityGuidelinesActivated, 
                                        termsActivated = v20.termsActivated, 
                                        reportingAppealsPageActivated = v20.reportingAppealsPageActivated, 
                                        verificationCategory = v20.verificationCategory, 
                                        dsaLearnMoreActivated = v20.dsaLearnMoreActivated
                                    }), 
                                    ModContentGradientFrame = v2.createElement("Frame", {
                                        AnchorPoint = Vector2.new(0, 1), 
                                        Position = UDim2.fromScale(0, 1), 
                                        Size = UDim2.new(1, 0, 0, 24), 
                                        BorderSizePixel = 0, 
                                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                                        BackgroundTransparency = 0, 
                                        ZIndex = 2
                                    }, {
                                        Gradient = v2.createElement("UIGradient", {
                                            Rotation = 270, 
                                            Color = ColorSequence.new({
                                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
                                                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                                            }), 
                                            Transparency = NumberSequence.new({
                                                NumberSequenceKeypoint.new(0, 0), 
                                                NumberSequenceKeypoint.new(1, 1)
                                            })
                                        })
                                    })
                                }), 
                                Padding = v2.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 0, 12), 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 4
                                }), 
                                Divider = v2.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 0, 1), 
                                    BorderSizePixel = 0, 
                                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                                    LayoutOrder = 5
                                })
                            })
                        });
                    end);
                end)
            })
        })
    });
end;
