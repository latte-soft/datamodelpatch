local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local v8 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v13 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v14 = require(l_Modules_0.LuaApp.Components.Games.GameBasicStats);
local v15 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v15.Style.withStyle;
local l_Pillv2_0 = v15.App.Control.Pillv2;
local l_LoadableImage_0 = v15.App.Loading.LoadableImage;
local _ = v15.App.Text.StyledTextLabel;
local v20 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v21 = require(l_Modules_0.LuaApp.withLocalization);
local v22 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local l_Follow_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Follow;
local l_GameIconReducer_0 = v7.GameIcons.GameIconReducer;
local v25 = require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesHeader);
local v26 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailNotificationsButton);
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageContent);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageIXP);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAddNotificationsEnabledAgeGate);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixSendFollowEventParams);
local l_GetFFlagEDPContextRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEDPContextRedesign;
local v36 = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else 36;
local v37 = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else 16;
local v38 = if not l_GetFFlagEDPContextRedesign_0() then nil else 12;
local v39 = if not l_GetFFlagEDPContextRedesign_0() then nil else 56;
local v40 = v2.PureComponent:extend("GameHeader");
v40.init = function(v41)
    if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
        v41.toggleFollowExperience = function()
            local l_gameFollowings_0 = v41.props.gameFollowings;
            local l_universeId_0 = v41.props.universeId;
            local l_rootPlaceId_0 = v41.props.rootPlaceId;
            if not v34() then
                if l_gameFollowings_0 == nil then
                    return ;
                end;
            elseif not (l_gameFollowings_0 ~= nil and l_rootPlaceId_0 ~= nil) or l_universeId_0 == nil then
                return ;
            end;
            local l_isFollowed_0 = l_gameFollowings_0.isFollowed;
            local v46 = if not v32() then nil else v41.props.notificationsEnabled.count or 0;
            local v47 = if not v32() then nil else v41.props.notificationsEnabled.limit or 0;
            local l_networking_0 = v41.props.networking;
            local l_eventIngest_0 = v41.props.eventIngest;
            v41.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, v41.props.enableNotificationsDiscoverability, v46, v47);
            l_Follow_0(l_eventIngest_0, "GameDetailsGameHeader", l_rootPlaceId_0, not l_isFollowed_0);
        end;
    end;
    if l_GetFFlagEDPContextRedesign_0() then
        v41.renderSubtitle = function(v50, v51)
            local function _(v52)
                return l_withStyle_0(function(v53)
                    return v2.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = v52, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        Font = v53.Tokens.Semantic.Typography.Body.Font, 
                        TextSize = v53.Tokens.Global.FontSize_75, 
                        TextColor3 = v53.Tokens.Semantic.Color.Text.Muted.Color3, 
                        TextTransparency = v53.Tokens.Semantic.Color.Text.Muted.Transparency, 
                        LayoutOrder = v51, 
                        RichText = false, 
                        LineHeight = 1
                    });
                end);
            end;
            local l_hasVerifiedBadge_0 = v50.hasVerifiedBadge;
            local l_createElement_0 = v2.createElement;
            local l_EmojiWrapper_0 = v8.EmojiWrapper;
            local v58 = {
                emoji = not l_hasVerifiedBadge_0 and "" or v8.emoji.verified, 
                layoutOrder = v51
            };
            local v59 = {};
            local l_name_0 = v50.name;
            v59.subtitleText = l_withStyle_0(function(v61)
                return v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = l_name_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Font = v61.Tokens.Semantic.Typography.Body.Font, 
                    TextSize = v61.Tokens.Global.FontSize_75, 
                    TextColor3 = v61.Tokens.Semantic.Color.Text.Muted.Color3, 
                    TextTransparency = v61.Tokens.Semantic.Color.Text.Muted.Transparency, 
                    LayoutOrder = v51, 
                    RichText = false, 
                    LineHeight = 1
                });
            end);
            return l_createElement_0(l_EmojiWrapper_0, v58, v59);
        end;
    end;
end;
v40.render = function(v62)
    local l_enableNotificationsDiscoverability_0 = v62.props.enableNotificationsDiscoverability;
    local l_appTheme_0 = v62.props.appTheme;
    local l_gameDetail_0 = v62.props.gameDetail;
    local l_gameInfo_0 = v62.props.gameInfo;
    local l_votes_0 = v62.props.votes;
    local v68 = l_gameDetail_0 and l_gameDetail_0.visits;
    local v69 = if not l_GetFFlagEDPContextRedesign_0() then nil else l_gameDetail_0 and l_gameDetail_0.creator;
    local v70 = if not l_enableNotificationsDiscoverability_0 then nil else l_gameDetail_0 and l_gameDetail_0.rootPlaceId;
    local l_LayoutOrder_0 = v62.props.LayoutOrder;
    local l_showSubtitle_0 = v62.props.showSubtitle;
    local v73 = if not l_GetFFlagEnableSwapToSourceButton_0() then nil else v62.props.showSource;
    local l_ageSummary_0 = v62.props.ageSummary;
    local v75 = not not l_ageSummary_0 or false;
    local v76 = if not v30() then nil else v62.props.isShowContainsStrongLanguageWarningEnabled;
    local v77 = if not v28() then nil else v62.props.containsStrongLanguage;
    local l_showVisits_0 = v62.props.showVisits;
    local v79 = if not v33() then nil else v62.props.isLocalUserUnder13;
    local v80 = l_votes_0 ~= nil and l_votes_0.upVotes or nil;
    local v81 = l_votes_0 ~= nil and l_votes_0.downVotes or nil;
    local v82 = (not not l_gameDetail_0 and l_gameDetail_0.name or l_gameInfo_0 and l_gameInfo_0.name) or nil;
    local v83 = (not not l_gameDetail_0 and l_gameDetail_0.playing or l_gameInfo_0 and l_gameInfo_0.playerCount) or nil;
    if l_GetFFlagEnableSwapToSourceButton_0() then
        local v84 = not not l_gameDetail_0 and l_gameDetail_0.sourceName or nil;
        v82 = if not not v73 and v84 ~= nil then v84 else if l_gameDetail_0 and l_gameDetail_0.name ~= nil then l_gameDetail_0.name else not not l_gameInfo_0 and l_gameInfo_0.name or nil;
    end;
    local l_withNewThemeProvider_0 = v62.props.withNewThemeProvider;
    local v87 = l_withStyle_0(function(v86)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Title = if not l_enableNotificationsDiscoverability_0 then l_withNewThemeProvider_0 and v2.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v82, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Font = v86.Font.Title.Font, 
                TextSize = v86.Font.BaseSize * v86.Font.Title.RelativeSize, 
                TextColor3 = v86.Theme.TextEmphasis.Color, 
                TextTransparency = v86.Theme.TextEmphasis.Transparency
            }) or v2.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v82, 
                Font = l_appTheme_0.GameDetails.Text.BoldFont, 
                TextSize = 32, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_appTheme_0.GameDetails.Text.Color.Main, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }) else v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                TitleHeader = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, -v36, 0, 0)
                }, {
                    TitleLabel = not not l_withNewThemeProvider_0 and v2.createElement(v13, {
                        Size = UDim2.new(1, -v36, 0, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Text = v82, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        Font = v86.Font.Title.Font, 
                        TextSize = v86.Font.BaseSize * v86.Font.Title.RelativeSize, 
                        TextColor3 = v86.Theme.TextEmphasis.Color, 
                        TextTransparency = v86.Theme.TextEmphasis.Transparency
                    }) or v2.createElement(v13, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v82, 
                        Font = l_appTheme_0.GameDetails.Text.BoldFont, 
                        TextSize = 32, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_appTheme_0.GameDetails.Text.Color.Main, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    PaddingRight = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v37)
                    })
                }), 
                GameDetailNotificationsButton = not v79 and v2.createElement(v26, {
                    position = UDim2.new(1, -v36, 0, 0), 
                    universeId = v62.props.universeId, 
                    gameFollowings = v62.props.gameFollowings, 
                    rootPlaceId = v70, 
                    toggleFollowExperience = v62.toggleFollowExperience
                }) or nil
            }), 
            SubTitle = l_showSubtitle_0 and v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BasicStats = v2.createElement(v14, {
                    playerCount = v83, 
                    upVotes = v80, 
                    downVotes = v81, 
                    visits = if not l_showVisits_0 then nil else v68, 
                    themeInfo = l_appTheme_0.GameDetails.GameBasicStats, 
                    layoutType = v11.GameBasicStatsLayoutType.GameDetails, 
                    withNewThemeProvider = l_withNewThemeProvider_0
                }), 
                ExperienceGuidelinesHeader = v75 and v2.createElement(v25, {
                    ageSummary = l_ageSummary_0
                })
            })
        });
    end);
    if not v28() or not v76 and v30() then
        return v87;
    else
        return v21({
            containsStrongLanguageText = "Feature.GameDetails.Label.ContainsStrongLanguagePillWarning"
        })(function(v88)
            return l_withStyle_0(function(v89)
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ListLayout = if not l_GetFFlagEDPContextRedesign_0() then v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }) else v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v38)
                    }), 
                    GameIcon = if not l_GetFFlagEDPContextRedesign_0() then nil else v2.createElement(l_LoadableImage_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(v39, v39), 
                        Image = v62.props.gameIcon.url, 
                        cornerRadius = UDim.new(0, 8)
                    }), 
                    HeaderText = if not l_GetFFlagEDPContextRedesign_0() then nil else v2.createElement("Frame", {
                        Size = UDim2.new(1, -(v39 + v38) - (v36 + v38), 1, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        TextListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 4)
                        }), 
                        Title = v2.createElement("TextLabel", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Text = v82, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = true, 
                            BackgroundTransparency = 1, 
                            Font = v89.Tokens.Semantic.Typography.Header.Font, 
                            TextSize = v89.Tokens.Semantic.Typography.Header.FontSize, 
                            TextColor3 = v89.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v89.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                            LayoutOrder = 1
                        }), 
                        Subtitle = (l_showSubtitle_0 and v69) and v62.renderSubtitle(v69, 2)
                    }), 
                    GameDetailNotificationsButton = if not not l_GetFFlagEDPContextRedesign_0() and l_enableNotificationsDiscoverability_0 then v2.createElement(v26, {
                        position = UDim2.new(1, -v36, 0, 0), 
                        universeId = v62.props.universeId, 
                        gameFollowings = v62.props.gameFollowings, 
                        rootPlaceId = v70, 
                        toggleFollowExperience = v62.toggleFollowExperience, 
                        layoutOrder = 3
                    }) else nil, 
                    Title = not l_GetFFlagEDPContextRedesign_0() and if l_enableNotificationsDiscoverability_0 then v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        TitleHeader = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, -v36, 0, 0)
                        }, {
                            TitleLabel = not not l_withNewThemeProvider_0 and v2.createElement(v13, {
                                Size = UDim2.new(1, -v36, 0, 0), 
                                Position = UDim2.new(0, 0, 0, 0), 
                                Text = v82, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextWrapped = true, 
                                BackgroundTransparency = 1, 
                                Font = v89.Font.Title.Font, 
                                TextSize = v89.Font.BaseSize * v89.Font.Title.RelativeSize, 
                                TextColor3 = v89.Theme.TextEmphasis.Color, 
                                TextTransparency = v89.Theme.TextEmphasis.Transparency
                            }) or v2.createElement(v13, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                Text = v82, 
                                Font = l_appTheme_0.GameDetails.Text.BoldFont, 
                                TextSize = 32, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextColor3 = l_appTheme_0.GameDetails.Text.Color.Main, 
                                TextWrapped = true, 
                                BackgroundTransparency = 1
                            }), 
                            PaddingRight = v2.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, v37)
                            })
                        }), 
                        GameDetailNotificationsButton = v2.createElement(v26, {
                            position = UDim2.new(1, -v36, 0, 0), 
                            universeId = v62.props.universeId, 
                            gameFollowings = v62.props.gameFollowings, 
                            rootPlaceId = v70, 
                            toggleFollowExperience = v62.toggleFollowExperience
                        })
                    }) else l_withNewThemeProvider_0 and v2.createElement(v13, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v82, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Font = v89.Font.Title.Font, 
                        TextSize = v89.Font.BaseSize * v89.Font.Title.RelativeSize, 
                        TextColor3 = v89.Theme.TextEmphasis.Color, 
                        TextTransparency = v89.Theme.TextEmphasis.Transparency
                    }) or v2.createElement(v13, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v82, 
                        Font = l_appTheme_0.GameDetails.Text.BoldFont, 
                        TextSize = 32, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_appTheme_0.GameDetails.Text.Color.Main, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }), 
                    SubTitle = if l_GetFFlagEDPContextRedesign_0() then nil else l_showSubtitle_0 and v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        BasicStats = v2.createElement(v14, {
                            playerCount = v83, 
                            upVotes = v80, 
                            downVotes = v81, 
                            visits = if not l_showVisits_0 then nil else v68, 
                            themeInfo = l_appTheme_0.GameDetails.GameBasicStats, 
                            layoutType = v11.GameBasicStatsLayoutType.GameDetails, 
                            withNewThemeProvider = l_withNewThemeProvider_0
                        }), 
                        ExperienceGuidelinesHeader = v75 and v2.createElement(v25, {
                            ageSummary = l_ageSummary_0
                        })
                    }); 
                    if not v77 then nil else v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        PaddingTop = if not v29() then nil else v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 8)
                        }); 
                        v2.createElement(l_Pillv2_0, {
                            BackgroundTransparency = 1, 
                            text = v88.containsStrongLanguageText
                        })
                    })
                });
            end);
        end);
    end;
end;
v40 = v3.connect(function(v90, v91)
    local v92 = v90.Games[v91.universeId];
    return {
        gameDetail = v90.GameDetails[v91.universeId], 
        gameInfo = v92, 
        gameIcon = if not l_GetFFlagEDPContextRedesign_0() then nil else v90[l_GameIconReducer_0.key][v91.universeId], 
        gameFollowings = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v90.GameFollowings[v91.universeId], 
        votes = v90.GameVotes[v91.universeId], 
        rootPlaceId = if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else v92 and v92.placeId, 
        notificationsEnabled = if not v32() then nil else v90.ExperienceNotificationsEnabled or {}, 
        isLocalUserUnder13 = if not v33() then nil else v90.IsLocalUserUnder13
    };
end, if not l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then nil else function(v93)
    return {
        sendGameFollow = function(v94, v95, v96, v97, v98, v99)
            return v93(v22(v94, v95, v96, v97, v98, v99));
        end
    };
end)((v20(v40)));
if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
    v40 = l_RoactServices_0.connect({
        networking = v9, 
        eventIngest = v10
    })(v40);
end;
v40 = l_RoactAppPolicy_0.connect(function(v100, _)
    return {
        showSubtitle = v100.getGameDetailsSubtitle()
    };
end)(v40);
if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
    v40 = v5.connectUserLayer({
        v12.ExperienceDetailsPageLayer
    }, function(v102, _)
        return {
            enableNotificationsDiscoverability = ((v102[v12.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2
        };
    end)(v40);
end;
return v40;
