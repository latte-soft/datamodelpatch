local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_FullPageModal_0 = v5.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v5.App.InputButton.Checkbox;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v10 = require(l_Modules_0.Common.Text);
local v11 = require(l_Modules_0.LuaApp.Models.UserModerationApi.ModerationDetail);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v13 = require(l_Modules_0.LuaApp.Constants);
local v14 = require(l_Modules_0.LuaApp.mutedError);
local v15 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationState);
local v16 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationType);
local v17 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v18 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationScrollview);
local v19 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationAbuseTypeStringTable);
local l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNotApprovedCheckBoxTextABTest;
local v21 = v2.PureComponent:extend("ModerationPrompt");
local v22 = {
    Warn = "Feature.Moderation.Title.Warn", 
    ["Ban 1 Day"] = "Feature.Moderation.Title.Ban1Day", 
    ["Ban 3 Days"] = "Feature.Moderation.Title.Ban3Day", 
    ["Ban 7 Days"] = "Feature.Moderation.Title.Ban7Day", 
    ["Ban 14 Days"] = "Feature.Moderation.Title.Ban14Day", 
    ["Ban 6 Months"] = "Feature.Moderation.Title.Ban6Months", 
    ["Ban 1 Year"] = "Feature.Moderation.Title.Ban1Year", 
    Delete = "Feature.Moderation.Title.Delete"
};
local v23 = {
    positive = "PositiveAgreeText", 
    negative = "NegativeAgreeText", 
    control = "AgreeText", 
    unavailable = "AgreeText"
};
v21.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    globalGuiInset = v4.table, 
    moderationDetails = v11.validateModel, 
    reactivateAccountActivated = v4.callback, 
    logoutCallback = v4.callback, 
    communityGuidelinesActivated = v4.callback, 
    termsActivated = v4.callback, 
    reportingAppealsPageActivated = v4.callback
});
v21.init = function(v24)
    v24.state = {
        agreed = false, 
        moderationState = v15.None, 
        modContentWidth = 0
    };
    v24.SetAgree = function(v25)
        v24:setState({
            agreed = v25
        });
    end;
end;
local function _(v26, v27, v28)
    if l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() then
        local v29 = (v27 - 26) - 8;
        local l_Font_0 = v26.Font;
        return (math.max(v10.GetTextHeight(v28, l_Font_0.Body.Font, l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, v29), 26));
    else
        return 26;
    end;
end;
v21.getDerivedStateFromProps = function(v32, _)
    local l_punishmentTypeDescription_0 = v32.moderationDetails.punishmentTypeDescription;
    local v35 = v16[l_punishmentTypeDescription_0];
    v3.isNotNil(v35, "moderationState should not be nil");
    if v35 == nil then
        v14("Invalid Moderation Type:" .. l_punishmentTypeDescription_0);
        v35 = v15.None;
    end;
    if v35 == v15.Banned then
        local l_endDate_0 = v32.moderationDetails.endDate;
        if l_endDate_0 then
            l_endDate_0 = DateTime.fromIsoDate(l_endDate_0);
            local v37 = DateTime.now();
            if not (not v37 or not l_endDate_0) and l_endDate_0.UnixTimestampMillis < v37.UnixTimestampMillis then
                v35 = v15.WasBanned;
            end;
        end;
    end;
    return {
        moderationState = v35
    };
end;
v21.render = function(v38)
    local l_moderationDetails_0 = v38.props.moderationDetails;
    local l_moderationState_0 = v38.state.moderationState;
    local l_screenSize_0 = v38.props.screenSize;
    if l_moderationState_0 == v15.None then
        return nil;
    else
        local l_globalGuiInset_0 = v38.props.globalGuiInset;
        l_globalGuiInset_0.bottom = v17();
        local v43 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
        local v44 = UDim2.fromOffset(l_screenSize_0.X, (l_screenSize_0.Y - l_globalGuiInset_0.top) - l_globalGuiInset_0.bottom);
        local v45 = false;
        if not (l_moderationState_0 ~= v15.Warning) or l_moderationState_0 == v15.WasBanned then
            v45 = true;
        end;
        local v46 = {
            LogoutText = "Application.Logout.Action.Logout", 
            ReactivateText = "Feature.Moderation.Action.Reactivate", 
            AgreeText = "Feature.Moderation.Action.Agree", 
            TitleText = v22[l_moderationDetails_0.punishmentTypeDescription], 
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
            DSALearnMoreBody = "Feature.Moderation.DSATransparency.LearnMoreBody", 
            DSALearnMoreLink = "Feature.Moderation.DSATransparency.LearnMoreLink", 
            DSATransparencyLabel = "Feature.Moderation.DSATransparency.Label", 
            ReportingAppealsLinkText = "CommonUI.Features.Label.ReportAppeals"
        };
        if l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() then
            v46[v23.positive] = "Feature.Moderation.NAPContent.CheckboxPositive";
            v46[v23.negative] = "Feature.Moderation.NAPContent.CheckboxNegative";
        end;
        v46.ReasonTitle = "Feature.Moderation.Messages.ReasonTitle";
        v46.OffensiveItemTitle = "Feature.Moderation.Messages.OffensiveItemTitle";
        for v47, v48 in pairs(v19) do
            v46[v47] = v48;
        end;
        return v2.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v13.DisplayOrder.AntiAddictionPrompt, 
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
                    Position = v43, 
                    Size = v44, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Content = l_withLocalization_0(v46)(function(v49)
                        local l_AgreeText_0 = v49.AgreeText;
                        if not (not l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() or not l_moderationDetails_0.agreedCheckBoxExperimentVariant) then
                            local l_agreedCheckBoxExperimentVariant_0 = l_moderationDetails_0.agreedCheckBoxExperimentVariant;
                            local v52 = v23[l_agreedCheckBoxExperimentVariant_0];
                            if not v52 then
                                v14("Invalid agreedCheckBoxExperimentVariant:" .. l_agreedCheckBoxExperimentVariant_0);
                            else
                                l_AgreeText_0 = v49[v52];
                            end;
                        end;
                        return l_withStyle_0(function(v53)
                            local l_Theme_0 = v53.Theme;
                            local l_modContentWidth_0 = v38.state.modContentWidth;
                            local l_l_AgreeText_0_0 = l_AgreeText_0;
                            local v57;
                            if l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() then
                                local v58 = (l_modContentWidth_0 - 26) - 8;
                                local l_Font_1 = v53.Font;
                                v57 = math.max(v10.GetTextHeight(l_l_AgreeText_0_0, l_Font_1.Body.Font, l_Font_1.Body.RelativeSize * l_Font_1.BaseSize, v58), 26);
                            else
                                v57 = 26;
                            end;
                            return v2.createElement(l_FullPageModal_0, {
                                title = v49.TitleText, 
                                screenSize = v38.props.screenSize, 
                                buttonStackProps = {
                                    forcedFillDirection = Enum.FillDirection.Vertical, 
                                    disableRoactGamepadButtonSelection = true, 
                                    buttons = {
                                        {
                                            props = {
                                                isDisabled = false, 
                                                onActivated = v38.props.logoutCallback, 
                                                text = v49.LogoutText
                                            }
                                        }, 
                                        not not v45 and {
                                            buttonType = l_ButtonType_0.PrimarySystem, 
                                            props = {
                                                isDisabled = not v38.state.agreed, 
                                                onActivated = v38.props.reactivateAccountActivated, 
                                                text = v49.ReactivateText
                                            }
                                        } or nil
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
                                        Size = UDim2.new(1, 0, 1, -v57 - 24), 
                                        BackgroundTransparency = 1, 
                                        LayoutOrder = 1, 
                                        [v2.Change.AbsoluteSize] = not not l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() and function(v60)
                                            v38:setState({
                                                modContentWidth = v60.AbsoluteSize.X
                                            });
                                        end or nil
                                    }, {
                                        Scrollview = v2.createElement(v18, {
                                            moderationState = l_moderationState_0, 
                                            moderationDetails = l_moderationDetails_0, 
                                            localizationTable = v49, 
                                            stylePalette = v53, 
                                            communityGuidelinesActivated = v38.props.communityGuidelinesActivated, 
                                            termsActivated = v38.props.termsActivated, 
                                            dsaLearnMoreActivated = v38.props.dsaLearnMoreActivated, 
                                            reportingAppealsPageActivated = v38.props.reportingAppealsPageActivated
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
                                    AgreedCheckBox = not not v45 and v2.createElement(l_Checkbox_0, {
                                        text = not not l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() and l_AgreeText_0 or v49.AgreeText, 
                                        isSelected = v38.state.agreed, 
                                        onActivated = v38.SetAgree, 
                                        layoutOrder = 3, 
                                        size = not not l_GetFFlagEnableNotApprovedCheckBoxTextABTest_0() and UDim2.fromOffset(v38.state.modContentWidth, v57) or nil
                                    }) or nil, 
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
end;
return v21;
