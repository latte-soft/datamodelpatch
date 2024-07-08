local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_CorePackages_0.Promise);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.UIBlox);
local v11 = require(l_Modules_0.Common.Text);
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v14 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v16 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_DeviceType_0 = v15.DeviceType;
local l_UiMode_0 = v15.UiMode;
local l_useUiModeInfo_0 = v16.useUiModeInfo;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v23 = require(l_Modules_0.LuaApp.AppPage);
local v24 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v25 = require(l_Modules_0.LuaApp.Common.Experience.getPlayButtonProps);
local v26 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v27 = require(l_Modules_0.LuaApp.Components.VirtualEvents.EventsListWrapper);
local l_GameStats_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameStats;
local v29 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_ExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Components.ExperienceCommunityLink;
local v31 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint);
local v32 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu;
local l_GetFFlagEnableMediaGalleryDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMediaGalleryDesignTokens;
local l_GetFFlagExpDetailsUseSelectionBumpers_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers;
local l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddExperienceGuidelinesToActionBar10ft;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local v41 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageContent);
local v42 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageIXP);
local v43 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local l_RetrievalStatus_0 = v10.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v10.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v10.App.Container.LoadingStateContainer;
local l_StyledTextLabel_0 = v10.App.Text.StyledTextLabel;
local l_withStyle_0 = v10.Core.Style.withStyle;
local l_DetailsPageSelector_0 = v10.App.Template.DetailsPage.DetailsPageSelector;
local l_ContentPosition_0 = v10.App.Template.DetailsPage.Enum.ContentPosition;
local l_Images_0 = v10.App.ImageSet.Images;
local l_PlayerCount_0 = v10.App.Indicator.PlayerCount;
local l_TooltipOrientation_0 = v10.App.Dialog.Enum.TooltipOrientation;
local v54 = require(script.Parent.ExperienceDescription);
local v55 = require(script.Parent.ExperienceRatings);
local v56 = require(script.Parent.ExperienceLogoTray);
local v57 = require(script.Parent.ExperienceInfoTable);
local v58 = require(script.Parent.ExperienceDetailsLoadingStatePage);
local v59 = require(script.Parent.RecommendedExperienceGrid);
local v60 = require(script.Parent.ExperienceMediaGallery);
local v61 = require(script.Parent.ExperienceGuidelinesLabel);
local v62 = require(script.Parent.Flags.GetFFlagEnableExperienceDetailsFuncComponent);
local v63 = require(script.Parent.Flags.FFlagEDPDescriptionFocusHideControllerBar10ft);
local v64 = require(script.Parent.Flags.FFlagEDPAddRatingTitle10ft);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v67 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAddNotificationsEnabledAgeGate);
local v68 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v69 = require(l_Modules_0.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
local v70 = v6.PureComponent:extend("ExperienceDetailsPage");
v70.validateProps = v9.strictInterface({
    universeId = v9.string, 
    referralSource = v9.optional(v9.string), 
    onClose = v9.callback, 
    thumbnail = v9.optional(v9.table), 
    bannerImageId = v9.optional(v9.string), 
    gameInfo = v9.optional(v9.table), 
    gameDetail = v9.optional(v9.table), 
    creatorVerified = v9.optional(v9.boolean), 
    gameDetailsPageDataStatus = v9.optional(v9.string), 
    gameProductInfo = v9.optional(v9.table), 
    socialLinks = v9.optional(v9.table), 
    ageRecommendations = v9.optional(v32.validateModel), 
    communityLink = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v9.optional(v9.table), 
    containsStrongLanguage = if not v40() then nil else v9.optional(v9.boolean), 
    gameFollowings = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v9.optional(v9.table), 
    isLocalUserUnder13 = if not v67() then nil else v9.optional(v9.boolean), 
    communityLinksEnabled = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v9.optional(v9.boolean), 
    communityLinkVariant = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v9.optional(v9.string), 
    isShowContainsStrongLanguageWarningEnabled = if not v42() then nil else v9.optional(v9.boolean), 
    enableNotificationsDiscoverability = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v9.optional(v9.boolean), 
    fetchGameDetailsPageData = v9.callback, 
    openLeaveRobloxAlertUIBlox = v9.callback, 
    openMoreContextualMenu = v9.callback, 
    openShareContextualMenu = v9.callback, 
    closeAlert = v9.callback, 
    openVerifiedBadgeModal = v9.optional(v9.callback), 
    openCreatorPage = v9.callback, 
    openExperienceGuidelinesExplained = if not l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() then nil else v9.callback, 
    toggleFollowExperience = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v9.optional(v9.callback), 
    linking = v9.table, 
    playabilityStatus = v9.optional(v9.table), 
    playButtonState = v9.string, 
    onPlayButtonActivated = v9.callback, 
    deviceType = v9.optional(v9.string), 
    detailsPageConfiguration = v9.optional(v9.table), 
    viewWidth = v9.optional(v9.number), 
    viewHeight = v9.optional(v9.number), 
    setControllerBarNavigation = v9.optional(v9.callback), 
    uiModeInfo = v9.optional(v9.any), 
    focusGuiObject = v9.optional(v9.callback), 
    tokens = v9.strictInterface({
        thumbnailSize = v9.optional(v9.number), 
        thumbnailMargin = v9.optional(v9.number), 
        thumbnailShadowHeight = v9.optional(v9.number), 
        sideMargin = v9.optional(v9.number), 
        headerItemPadding = v9.optional(v9.number), 
        headerDescriptionMaxRows = v9.optional(v9.number), 
        headerDescriptionLineHeight = v9.optional(v9.number), 
        actionBarButtonBackgroundColor = v9.optional(v9.table), 
        actionBarTextButtonPadding = v9.optional(v9.Vector2), 
        headerGradientHeight = v9.optional(v9.number), 
        headerBarBackgroundHeight = v9.optional(v9.number), 
        headerBottomMargin = v9.optional(v9.number), 
        animationConfig = v9.optional(v9.table), 
        itemPadding = v9.optional(v9.number), 
        safeAreaSize = v9.optional(v9.Vector2), 
        trailingWhitespace = v9.optional(v9.number), 
        iconSize = v9.optional(v9.number)
    }), 
    iconButtonSize = v9.optional(v9.UDim2), 
    textButtonSize = v9.optional(v9.UDim2), 
    playButtonSize = v9.optional(v9.UDim2), 
    actionBarHeight = v9.optional(v9.number), 
    statsAndInfoRef = v9.optional(v9.table)
});
local function _(v71)
    if not v71 then
        return "";
    else
        return "rbxassetid://" .. v71;
    end;
end;
local _ = function(v73)
    if v73 == nil then
        return false;
    else
        for _, v75 in pairs(v73) do
            if not (not (v75.name == "strong-language") or not v75.contains) then
                return true;
            end;
        end;
        return false;
    end;
end;
local v77 = {
    showEventsList = true, 
    showLogoTraySection = true, 
    showCornerGradientPropEnabled = false, 
    showCommunityLink = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else false
};
v70.init = function(v78)
    local v79 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v78.getAbbreviateCount = function(v80)
        return l_abbreviateCount_0(v80, v79:GetLocale());
    end;
    v78.upperString = function(v81)
        return string.upper(v79:Format(v81));
    end;
    v78.onPlayButtonActivated = function()
        return v78.props.onPlayButtonActivated();
    end;
    v78.openMoreContextualMenu = function(v82)
        local l_universeId_0 = v78.props.universeId;
        local v84 = nil;
        local v85 = nil;
        local v86 = v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if not l_GetFFlagEnableTenftUiDetailsMoreDropupMenu_0() or not v86 then
            v85 = UDim2.fromOffset((v82.AbsolutePosition.X + v82.AbsoluteSize.X) - 300, (v82.AbsolutePosition.Y + v82.AbsoluteSize.Y) + 12);
        else
            v84 = Vector2.new(0, 1);
            v85 = UDim2.fromOffset(v82.AbsolutePosition.X, v82.AbsolutePosition.Y - 12);
        end;
        return v78.props.openMoreContextualMenu(l_universeId_0, v85, v84);
    end;
    v78.getTextHeight = l_memoize_0(function(v87, v88, v89, v90)
        return v11.GetTextHeight(v87, v88, v89, v90);
    end);
    v78.openShareContextualMenu = function(v91)
        return v78.props.openShareContextualMenu(v78.props.universeId, (UDim2.fromOffset((v91.AbsolutePosition.X + v91.AbsoluteSize.X) - 300, (v91.AbsolutePosition.Y + v91.AbsoluteSize.Y) + 12)));
    end;
    v78.getPlaysAnsVisitsInfo = function(v92, v93)
        return {
            plays = (not not v92 and v92.playing or v93 and v93.playerCount) or 0, 
            visits = not not v92 and v92.visits or 0, 
            totalUpVotes = not not v93 and v93.totalUpVotes or 0, 
            totalDownVotes = not not v93 and v93.totalDownVotes or 1
        };
    end;
    v78.getStyledTextLabel = function(v94, v95, v96)
        if not v94 then
            return nil;
        else
            return v6.createElement(l_StyledTextLabel_0, {
                text = v94, 
                fontStyle = v95, 
                colorStyle = v96, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 1, 
                richText = false, 
                lineHeight = 1
            });
        end;
    end;
    v78.toggleFollowExperience = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else function()
        if v68() then
            v78:setState({
                isNotificationsTooltipActive = false
            });
        end;
        if v78.props.gameFollowings then
            local l_universeId_1 = v78.props.universeId;
            local l_isFollowed_0 = v78.props.gameFollowings.isFollowed;
            if v78.props.toggleFollowExperience then
                v78.props.toggleFollowExperience(l_universeId_1, not l_isFollowed_0);
            end;
            return ;
        else
            return ;
        end;
    end;
    v78.renderSubtitleTextOverride = function(v99, v100, v101, _, v103, v104)
        local function _(v105)
            return l_withStyle_0(function(v106)
                local v107 = if not v43 then v106.Font.Header2 else v106.Tokens.Semantic.Typography.Subheader;
                local v108 = if not v43 then v107.RelativeSize * v106.Font.BaseSize else v107.FontSize;
                local l_TextMuted_0 = v106.Theme.TextMuted;
                if not v105 or not v104 then
                    return v78.getStyledTextLabel(v105, v107, l_TextMuted_0);
                else
                    local v110 = {
                        name = v23.GenericWebPage, 
                        detail = v24.game.info.creator({
                            creatorType = v101, 
                            creatorId = v100
                        }), 
                        extraProps = {
                            title = v79:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v26.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v105, 
                        Font = v107.Font, 
                        TextColor3 = l_TextMuted_0.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v108, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function()
                            v78.props.openCreatorPage(v110);
                        end
                    });
                end;
            end);
        end;
        return v6.createElement(v14.EmojiWrapper, {
            emoji = not v103 and "" or v14.emoji.verified, 
            layoutOrder = 2, 
            onActivated = if not not v103 and v104 then v78.props.openVerifiedBadgeModal else nil
        }, {
            userText = l_withStyle_0(function(v112)
                local v113 = if not v43 then v112.Font.Header2 else v112.Tokens.Semantic.Typography.Subheader;
                local v114 = if not v43 then v113.RelativeSize * v112.Font.BaseSize else v113.FontSize;
                local l_TextMuted_1 = v112.Theme.TextMuted;
                if not v99 or not v104 then
                    return v78.getStyledTextLabel(v99, v113, l_TextMuted_1);
                else
                    local v116 = {
                        name = v23.GenericWebPage, 
                        detail = v24.game.info.creator({
                            creatorType = v101, 
                            creatorId = v100
                        }), 
                        extraProps = {
                            title = v79:Format("Feature.GameDetails.Label.Developer"), 
                            transitionAnimation = v26.SlideInFromRight
                        }
                    };
                    return v6.createElement("TextButton", {
                        Text = v99, 
                        Font = v113.Font, 
                        TextColor3 = l_TextMuted_1.Color, 
                        LayoutOrder = 2, 
                        AutoButtonColor = false, 
                        LineHeight = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextSize = v114, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = function()
                            v78.props.openCreatorPage(v116);
                        end
                    });
                end;
            end)
        });
    end;
    v78.renderTextOverride = function(v117, _, _, v120)
        local function _(v121)
            return l_withStyle_0(function(v122)
                return v78.getStyledTextLabel(v121, if not v43 then v122.Font.Header2 else v122.Tokens.Semantic.Typography.Subheader, v122.Theme.TextEmphasis);
            end);
        end;
        return v6.createElement(v14.EmojiWrapper, {
            emoji = not v120 and "" or v14.emoji.verified, 
            layoutOrder = 0, 
            size = UDim2.fromScale(0, 1)
        }, {
            userText = l_withStyle_0(function(v124)
                return v78.getStyledTextLabel(v117, if not v43 then v124.Font.Header2 else v124.Tokens.Semantic.Typography.Subheader, v124.Theme.TextEmphasis);
            end)
        });
    end;
    v78.renderExperienceGuidelines = l_memoize_0(function(v125, v126, v127, v128)
        if not v126 then
            return nil;
        elseif not v40() or not v127 and v42() then
            return v6.createElement(v61, {
                universeId = v125, 
                guidelinesText = v126, 
                layoutOrder = 1
            });
        elseif not v128 then
            return v6.createElement(v61, {
                universeId = v125, 
                guidelinesText = v126, 
                layoutOrder = 1
            });
        else
            return l_withLocalization_0({
                guidelinesTextWithWarning = {
                    "Feature.GameDetails.Label.ContainsStrongLanguageWarningWithGuideline"; 
                    guideline = v126
                }
            })(function(v129)
                return v6.createElement(v61, {
                    universeId = v125, 
                    guidelinesText = v129.guidelinesTextWithWarning, 
                    layoutOrder = 1
                });
            end);
        end;
    end);
    v78.renderInlinePlayerCountAndLikes = l_memoize_0(function(v130, v131, v132)
        return v6.createElement("Frame", {
            Size = UDim2.new(0, 120, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            GameStats = v6.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v130, 
                    totalUpVotes = v131, 
                    totalDownVotes = v132
                }
            })
        });
    end);
    v78.renderBriefDescription = function(v133, v134)
        return l_withStyle_0(function(v135)
            local l_Font_0 = v135.Font;
            local l_headerDescriptionLineHeight_0 = v133.headerDescriptionLineHeight;
            local v138 = (l_headerDescriptionLineHeight_0 * math.floor(l_Font_0.BaseSize * l_Font_0.Body.RelativeSize)) * v133.headerDescriptionMaxRows;
            return v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, (math.min(v78.getTextHeight(v134, if not v43 then l_Font_0.Body.Font else v135.Tokens.Semantic.Typography.Body.Font, if not v43 then l_Font_0.BaseSize * l_Font_0.Body.RelativeSize else v135.Tokens.Semantic.Typography.Body.FontSize, UDim2.new(1, 0, 0, v138)), v138))), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                ClipsDescendants = true
            }, {
                GameDescriptionText = v6.createElement(l_StyledTextLabel_0, {
                    text = v134, 
                    fontStyle = if not v43 then l_Font_0.Body else v135.Tokens.Semantic.Typography.Body, 
                    colorStyle = v135.Theme.TextEmphasis, 
                    size = UDim2.fromScale(1, 1), 
                    richText = false, 
                    fluidSizing = false, 
                    lineHeight = l_headerDescriptionLineHeight_0
                })
            });
        end);
    end;
    v78.renderInfoContent = function(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151)
        local v152 = v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        local v153 = not not v139 and v139.headerItemPadding or 0;
        local l_v152_0 = v152;
        if l_v152_0 then
            l_v152_0 = false;
            if v146 ~= nil then
                l_v152_0 = #v146 > 0;
            end;
        end;
        local v155 = not v152;
        return function()
            return v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v6.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, v153)
                }), 
                SubtitleText = v78.renderSubtitleTextOverride(v142, v143, v144, v140, v145), 
                Padding = if not v153 then nil else v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v153)
                }), 
                PlayStats = if not v152 then nil else v78.renderInlinePlayerCountAndLikes(v147, v148, v149), 
                Description = if not l_v152_0 then nil else v78.renderBriefDescription(v139, v146), 
                ExperienceGuidelinesComponent = if not v155 then nil else v78.renderExperienceGuidelines(v140, v141, if not v42() then nil else v150, if not v40() then nil else v151)
            });
        end;
    end;
    v78.renderPlaysAndVisits = l_memoize_0(function(v156, v157)
        return function()
            return v6.createElement(l_PlayerCount_0, {
                layoutOrder = 1, 
                countLeft = {
                    countText = v78.getAbbreviateCount(v156), 
                    labelText = v78.upperString("Feature.GameDetails.Label.Playing"), 
                    icon = l_Images_0["icons/status/games/people-playing_large"]
                }, 
                countRight = {
                    countText = v78.getAbbreviateCount(v157), 
                    labelText = v78.upperString("Feature.GameDetails.Label.Visits"), 
                    icon = l_Images_0["icons/status/games/sessions_large"]
                }
            });
        end;
    end);
    if v63 then
        v78.onFocusChanged = function(v158)
            if v78.props.setControllerBarNavigation then
                v78.props.setControllerBarNavigation(not v158);
            end;
        end;
    end;
    v78.renderDescription = l_memoize_0(function(v159, v160)
        return function()
            return v6.createElement(v54, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v159), 
                descriptionText = v160, 
                onFocusChanged = if not v63 then nil else v78.onFocusChanged
            });
        end;
    end);
    v78.renderLogoTray = l_memoize_0(function(v161)
        return function()
            return v6.createElement(v56, {
                socialLinks = v161, 
                linking = v78.props.linking, 
                openLeaveRobloxAlertUIBlox = v78.props.openLeaveRobloxAlertUIBlox, 
                closeAlert = v78.props.closeAlert
            });
        end;
    end);
    local function _(v162)
        if v78.props.setControllerBarNavigation then
            v78.props.setControllerBarNavigation(v162);
        end;
    end;
    v78.onMediaGalleryPreviewActivated = function(v164)
        local v165 = v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        if not ((v78.state.isFullscreen or not v165) or not v78.props.setControllerBarNavigation) then
            v78.props.setControllerBarNavigation(false);
        end;
        v78:setState({
            isFullscreen = true, 
            mediaGalleryShowIndex = v164, 
            currentIndex = if not v165 then nil else v164
        });
    end;
    v78.renderMediaGallery = l_memoize_0(function(v166, v167)
        if not (v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot) then
            return function()
                return v6.createElement(v60, {
                    deviceType = v78.props.deviceType, 
                    universeId = v166, 
                    onPreviewActivated = v78.onMediaGalleryPreviewActivated
                });
            end;
        else
            return function()
                return v6.createElement(v60, {
                    tokens = if not l_GetFFlagEnableMediaGalleryDesignTokens_0() then nil else v78.props.tokens, 
                    deviceType = v78.props.deviceType, 
                    universeId = v166, 
                    onPreviewActivated = v78.onMediaGalleryPreviewActivated, 
                    isFullscreenState = v167, 
                    exitFullscreen = v78.onClose, 
                    onSelectionGained = v78.onSelectionGained, 
                    mediaGalleryGainFocused = v78.mediaGalleryGainFocused, 
                    uiMode = v78.props.uiModeInfo.uiMode
                });
            end;
        end;
    end);
    v78.renderExperienceRating = l_memoize_0(function(v168)
        return function()
            return v6.createElement(v55, {
                universeId = v168, 
                uiMode = if not not v64 and v78.props.uiModeInfo then v78.props.uiModeInfo.uiMode else nil
            });
        end;
    end);
    v78.renderExperienceInfoTable = l_memoize_0(function(v169)
        return function()
            return v6.createElement("Folder", {
                [v6.Ref] = v78.props.statsAndInfoRef
            }, v6.createElement(v57, {
                renderTextOverride = v78.renderTextOverride, 
                universeId = v169, 
                key = "ExperienceInfoTable"
            }));
        end;
    end);
    v78.renderEventsList = l_memoize_0(function(v170)
        return function()
            return v6.createElement(v27, {
                universeId = v170, 
                referralSource = "expDetailsPage"
            });
        end;
    end);
    v78.renderRecommendedExperiences = l_memoize_0(function(v171, v172)
        return function()
            return v6.createElement(v59, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(v172), 
                universeId = v171
            });
        end;
    end);
    v78.renderCommunityLink = l_memoize_0(function(v173, v174, v175)
        return function()
            return v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16)
                }), 
                ExperienceCommunityLink = v5.createElement(l_ExperienceCommunityLink_0, {
                    communityInfo = v173, 
                    experienceName = v174 or "", 
                    universeId = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v175
                })
            });
        end;
    end);
    v78.getBodyComponentListProps = l_memoize_0(function(v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188)
        local v189 = (v186.showLogoTraySection and v182) and next(v182);
        local v190;
        if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then
            v190 = nil;
        else
            v190 = v186.showCommunityLink;
            if v190 then
                v190 = v184;
                if v190 then
                    v190 = false;
                    if v185 == "banner" then
                        v190 = v183;
                    end;
                end;
            end;
        end;
        return {
            MediaGallery = {
                portraitLayoutOrder = v188 and 1 or 2, 
                landscapeLayoutOrder = 1, 
                landscapePosition = l_ContentPosition_0.Right, 
                showCornerGradient = if not v186.showCornerGradientPropEnabled then nil else false, 
                useSelectionBumper = not not l_GetFFlagExpDetailsUseSelectionBumpers_0() or nil, 
                renderComponent = v78.renderMediaGallery(v176, v187)
            }, 
            Description = {
                portraitLayoutOrder = v188 and 2 or 1, 
                landscapeLayoutOrder = 1, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v78.renderDescription(v177, v178)
            }, 
            ExperienceRatings = {
                portraitLayoutOrder = 3, 
                landscapeLayoutOrder = 2, 
                landscapePosition = l_ContentPosition_0.Left, 
                useSelectionBumper = not not l_GetFFlagExpDetailsUseSelectionBumpers_0() or nil, 
                renderComponent = v78.renderExperienceRating(v176)
            }, 
            PlaysAndVisits = {
                portraitLayoutOrder = 4, 
                landscapeLayoutOrder = 3, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v78.renderPlaysAndVisits(v180, v181)
            }, 
            CommunityLink = if not v190 then nil else {
                portraitLayoutOrder = 5, 
                landscapeLayoutOrder = 4, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v78.renderCommunityLink(v183, v179, if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v176)
            }, 
            ExperienceInfoTable = {
                portraitLayoutOrder = 6, 
                landscapeLayoutOrder = 5, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v78.renderExperienceInfoTable(v176)
            }, 
            LogoTraySection = not not v189 and {
                portraitLayoutOrder = 7, 
                landscapeLayoutOrder = 6, 
                landscapePosition = l_ContentPosition_0.Left, 
                renderComponent = v78.renderLogoTray(v182)
            } or nil, 
            EventsList = if not v186.showEventsList then nil else {
                portraitLayoutOrder = 8, 
                landscapeLayoutOrder = 2, 
                landscapePosition = l_ContentPosition_0.Right, 
                renderComponent = v78.renderEventsList(v176)
            }, 
            RecommendedExperiences = {
                portraitLayoutOrder = 9, 
                landscapeLayoutOrder = 3, 
                landscapePosition = l_ContentPosition_0.Right, 
                useSelectionBumper = not not l_GetFFlagExpDetailsUseSelectionBumpers_0() or nil, 
                renderComponent = v78.renderRecommendedExperiences(v176, v177)
            }
        };
    end);
    v78.onClose = function()
        if not v78.state.isFullscreen then
            v78.props.onClose();
        else
            v78:setState({
                isFullscreen = false
            });
            if not (not (v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot) or not v78.props.setControllerBarNavigation) then
                v78.props.setControllerBarNavigation(true);
                return ;
            end;
        end;
    end;
    v78.renderFullscreenContent = l_memoize_0(function(v191, v192, v193, v194, v195, v196)
        if not (v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot) then
            return function()
                return v6.createElement(v60, {
                    universeId = v191, 
                    isFullscreen = true, 
                    fullscreenShowIndex = v192
                });
            end;
        else
            return function()
                return v6.createElement(v60, {
                    tokens = if not l_GetFFlagEnableMediaGalleryDesignTokens_0() then nil else v78.props.tokens, 
                    universeId = v191, 
                    isFullscreen = true, 
                    fullscreenShowIndex = v192, 
                    deviceType = v78.props.deviceType, 
                    isFullscreenState = v193, 
                    isCrossFade = v194, 
                    setCrossFade = v78.setCrossFade, 
                    nextIndex = v196, 
                    currentIndex = v195, 
                    setCurrentIndex = v78.setCurrentIndex, 
                    uiMode = v78.props.uiModeInfo.uiMode
                });
            end;
        end;
    end);
    v78.resolveTitleText = function(v197, v198)
        local v199 = (not not v197 and v197.name or v198 and v198.name) or nil;
        if l_GetFFlagEnableSwapToSourceButton_0() then
            if not (v197 and v197.sourceName) then
                local _ = nil;
            end;
            if v197 and v197.name ~= nil then
                return v197.name;
            else
                v199 = not not v198 and v198.name or nil;
            end;
        end;
        return v199;
    end;
    v78.checkCommunityLinkExposureLogging = function()
        if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not v78.props.communityLink) then
            l_IXPService_0:LogUserLayerExposure(v29.EDPCommunityLinksLayer);
        end;
    end;
    if v78.props.uiModeInfo and v78.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v78.state = {
            bannerImageId = v78.props.bannerImageId, 
            isCrossFade = false, 
            currentIndex = 1, 
            nextIndex = 1
        };
        v78.setCurrentIndex = function(v201)
            v78:setState({
                currentIndex = v201
            });
        end;
        v78.setCrossFade = function(v202)
            v78:setState({
                isCrossFade = v202
            });
        end;
        v78.onSelectionGained = function(v203, v204)
            if v78.state.nextIndex ~= v203 and v78.state.isCrossFade == false then
                v78.setCrossFade(true);
            end;
            v78:setState({
                bannerImageId = v204, 
                nextIndex = v203
            });
        end;
        v78.mediaGalleryGainFocused = function(v205)
            if not v205 then
                v78:setState({
                    bannerImageId = v78.props.bannerImageId
                });
            end;
        end;
    end;
    if v68() then
        v78.isMounted = false;
        local l_status_0, l_result_0 = pcall(function()
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        v78.showTooltip = not not l_status_0 and l_result_0 == "true";
        v78:setState({
            isNotificationsTooltipActive = v78.showTooltip
        });
    end;
end;
v70.didMount = function(v208)
    if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
        v208.checkCommunityLinkExposureLogging();
    end;
    if v68() then
        v208.isMounted = true;
        if v208.showTooltip then
            pcall(function()
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end);
        end;
        v8.delay(v69()):andThen(function()
            if v208.isMounted then
                v208:setState({
                    isNotificationsTooltipActive = false
                });
            end;
        end);
    end;
end;
v70.didUpdate = function(v209, v210)
    if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or v210.communityLink) then
        v209.checkCommunityLinkExposureLogging();
    end;
end;
v70.render = function(v211)
    return v6.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v211.props.gameDetailsPageDataStatus), 
        renderOnFailed = function()
            if not v211.props.gameInfo then
                return v211:renderOnFailed();
            else
                return v211:renderOnLoaded();
            end;
        end, 
        renderOnLoaded = function()
            return v211:renderOnLoaded();
        end, 
        renderOnLoading = function()
            return v211:renderOnLoading();
        end
    });
end;
v70.renderOnLoading = function(_)
    return v6.createElement(v58);
end;
v70.renderOnFailed = function(v213)
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v214)
        return v6.createElement(l_EmptyState_0, {
            onActivated = v213.props.fetchGameDetailsPageData, 
            text = v214.failedMessage
        });
    end);
end;
v70.willUnmount = function(v215)
    if v68() then
        v215.isMounted = false;
    end;
end;
v70.renderOnLoaded = function(v216)
    local l_deviceType_0 = v216.props.deviceType;
    local l_universeId_2 = v216.props.universeId;
    local l_gameInfo_0 = v216.props.gameInfo;
    local l_thumbnail_0 = v216.props.thumbnail;
    local l_tokens_0 = v216.props.tokens;
    local v222 = v216.props.uiModeInfo and v216.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local l_gameDetail_0 = v216.props.gameDetail;
    local v224 = not not l_gameDetail_0 and l_gameDetail_0.description or nil;
    local v225 = not not l_gameDetail_0 and l_gameDetail_0.name or nil;
    local v226 = v216.resolveTitleText(l_gameDetail_0, l_gameInfo_0);
    local v227 = not not l_gameDetail_0 and l_gameDetail_0.creator.name or nil;
    local v228 = not not l_gameDetail_0 and l_gameDetail_0.creator.id or nil;
    local v229 = not not l_gameDetail_0 and l_gameDetail_0.creator.type or nil;
    local v230 = nil;
    local v231 = nil;
    if v216.props.ageRecommendations then
        local l_summary_0 = v216.props.ageRecommendations.summary;
        v230 = if not not l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
        if not v41() then
            v231 = nil;
        else
            local l_descriptorUsages_0 = v216.props.ageRecommendations.descriptorUsages;
            if l_descriptorUsages_0 == nil then
                v231 = false;
            else
                for _, v235 in pairs(l_descriptorUsages_0) do
                    if not (not (v235.name == "strong-language") or not v235.contains) then
                        v231 = true;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v231 = false;
            end;
        end;
    end;
    ::label0::;
    local v236 = v216.getPlaysAnsVisitsInfo(l_gameDetail_0, l_gameInfo_0);
    local l_socialLinks_0 = v216.props.socialLinks;
    local v238 = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v216.props.communityLink;
    local v239 = if not v40() then nil else v216.props.containsStrongLanguage or v231;
    local v240 = if not v42() then nil else v216.props.isShowContainsStrongLanguageWarningEnabled;
    local v241 = v25(v216.props.playButtonState, v216.props.gameProductInfo);
    local l_text_0 = v241.text;
    local l_price_0 = v241.price;
    local l_icon_0 = v241.icon;
    local v245 = not not v68() and v216.state.isNotificationsTooltipActive;
    local l_isFullscreen_0 = v216.state.isFullscreen;
    local l_isCrossFade_0 = v216.state.isCrossFade;
    local l_currentIndex_0 = v216.state.currentIndex;
    local l_nextIndex_0 = v216.state.nextIndex;
    local l_mediaGalleryShowIndex_0 = v216.state.mediaGalleryShowIndex;
    local v251 = nil;
    local v252 = nil;
    local v253 = nil;
    if l_tokens_0 then
        v251 = l_tokens_0.thumbnailSize;
        v252 = l_tokens_0.sideMargin;
        v253 = l_tokens_0.headerBarBackgroundHeight;
    end;
    local v254 = nil;
    local v255 = nil;
    local v256 = nil;
    if l_deviceType_0 == l_DeviceType_0.Tablet then
        v254 = math.min(v216.props.viewHeight / 3, 500);
        v251 = 150;
        v255 = math.huge;
        v256 = false;
    elseif not v222 then
        v254 = 208;
        v255 = 1024;
    end;
    local v257 = not v222;
    local v258 = (l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() and v222) and v230;
    local v260 = v7.List.filter({
        not not v257 and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v216.openShareContextualMenu, 
                size = v216.props.iconButtonSize, 
                backgroundColor = not not l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        } or nil, 
        {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/common/more"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v216.openMoreContextualMenu, 
                size = v216.props.iconButtonSize, 
                backgroundColor = not not l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        }, 
        not (not (not not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges and v216.props.enableNotificationsDiscoverability) or if not v67() then nil else v216.props.isLocalUserUnder13) and {
            props = {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if not not v216.props.gameFollowings and v216.props.gameFollowings.isFollowed then l_Images_0["icons/common/notificationOn"] else l_Images_0["icons/common/notificationOff"], 
                userInteractionEnabled = true, 
                showBackground = true, 
                onActivated = v216.toggleFollowExperience, 
                size = v216.props.iconButtonSize, 
                backgroundColor = not not l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil, 
                [v6.Children] = if not v68() then nil else {
                    Tooltip = v5.createElement(v31, {
                        isActive = v245, 
                        preferredOrientation = l_TooltipOrientation_0.Bottom
                    })
                }
            }
        } or nil
    }, function(v259)
        return v259 ~= nil;
    end);
    local v261 = if not v258 then nil else {
        {
            props = {
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.fromScale(0, 0.5), 
                text = v230, 
                horizontalPadding = l_tokens_0.actionBarTextButtonPadding.X, 
                verticalPadding = l_tokens_0.actionBarTextButtonPadding.Y, 
                userInteractionEnabled = true, 
                showBackground = true, 
                size = v216.props.textButtonSize, 
                onActivated = function()
                    v216.props.openExperienceGuidelinesExplained(l_universeId_2, true);
                end, 
                backgroundColor = not not l_tokens_0 and l_tokens_0.actionBarButtonBackgroundColor or nil
            }
        }
    };
    return l_withLocalization_0({
        buttonText = l_text_0
    })(function(v262)
        local l_buttonText_0 = v262.buttonText;
        if l_price_0 then
            l_buttonText_0 = v216.getAbbreviateCount(l_price_0);
        end;
        local v264 = {
            deviceType = l_deviceType_0, 
            thumbnailImageUrl = l_thumbnail_0, 
            titleText = v226, 
            renderInfoContent = v216.renderInfoContent(l_tokens_0, l_universeId_2, v230, v227, v228, v229, v216.props.creatorVerified or false, v224, v236.plays, v236.totalUpVotes, v236.totalDownVotes, if not v42() then nil else v240, if not v40() then nil else v239), 
            onClose = v216.onClose
        };
        local v265 = v216.state.bannerImageId or v216.props.bannerImageId;
        v264.bannerImageUrl = not v265 and "" or "rbxassetid://" .. v265;
        v264.actionBarProps = {
            iconSize = v216.props.actionBarHeight, 
            buttonHeight = v216.props.actionBarHeight, 
            buttonPadding = l_tokens_0.headerItemPadding, 
            button = {
                props = {
                    onActivated = v216.onPlayButtonActivated, 
                    icon = l_Images_0[l_icon_0], 
                    text = l_buttonText_0, 
                    isLoading = v241.isLoading, 
                    size = v216.props.playButtonSize, 
                    feedbackType = if not l_GetFFlagEnableUISoundAndHaptics_0() then nil else "PlayExperienceButton"
                }
            }, 
            icons = v260, 
            textButtons = v261
        };
        v264.componentList = v216.getBodyComponentListProps(l_universeId_2, v216.props.gameDetailsPageDataStatus, v224, v225, v236.plays, v236.visits, l_socialLinks_0, v238, v216.props.communityLinksEnabled, v216.props.communityLinkVariant, v216.props.detailsPageConfiguration or v77, l_isFullscreen_0, v222);
        v264.isFullscreen = l_isFullscreen_0;
        v264.renderFullscreenContent = v216.renderFullscreenContent(l_universeId_2, l_mediaGalleryShowIndex_0, l_isFullscreen_0, l_isCrossFade_0, l_currentIndex_0, l_nextIndex_0);
        v264.sideMargin = v252;
        v264.startingOffsetPosition = v254;
        v264.thumbnailHeight = v251;
        v264.headerBarBackgroundHeight = v253;
        v264.dualPanelBreakpoint = v255;
        v264.bodyClipsDescendants = v256;
        v264.tokens = if (not not l_tokens_0 and v216.props.uiModeInfo) and v216.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then {
            thumbnailMargin = l_tokens_0.thumbnailMargin, 
            thumbnailShadowHeight = l_tokens_0.thumbnailShadowHeight, 
            headerGradientHeight = l_tokens_0.headerGradientHeight, 
            headerBottomMargin = l_tokens_0.headerBottomMargin, 
            animationConfig = l_tokens_0.animationConfig, 
            itemPadding = l_tokens_0.itemPadding, 
            safeAreaSize = l_tokens_0.safeAreaSize, 
            trailingWhitespace = l_tokens_0.trailingWhitespace, 
            actionBarHeight = v216.props.actionBarHeight
        } else nil;
        return v6.createElement(l_DetailsPageSelector_0, {
            deviceType = l_deviceType_0, 
            detailsPageProps = v264
        });
    end);
end;
if not v62() then
    return v70;
else
    return function(v266)
        local v267 = l_useUiModeInfo_0();
        local v268 = v12.useFocusGuiObject();
        local v269 = not v266.tokens and 0 or v266.tokens.iconSize;
        local v270 = v267.uiMode == l_UiMode_0.TenFoot;
        return v6.createElement(v70, v7.Dictionary.join({
            uiModeInfo = v267, 
            focusGuiObject = v268, 
            iconButtonSize = if not v270 then nil else UDim2.fromOffset(v269, v269), 
            textButtonSize = if not v270 then nil else UDim2.fromOffset(0, v269), 
            playButtonSize = if not v270 then nil else UDim2.new(1, 0, 0, v269), 
            actionBarHeight = if not v270 then nil else v269
        }, v266));
    end;
end;
