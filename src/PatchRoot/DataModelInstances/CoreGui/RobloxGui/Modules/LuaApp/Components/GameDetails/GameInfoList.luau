local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v12 = require(l_Modules_0.LuaApp.Components.GameDetails.GameInfoRow);
local v13 = require(l_Modules_0.LuaApp.Components.Passes.PassesGrid);
local v14 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks);
local l_ExperienceCommunityLink_0 = v14.Components.ExperienceCommunityLink;
local l_getCommunityUrl_0 = v14.Utils.getCommunityUrl;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v18 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v19 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v20 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v22 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v23 = require(l_Modules_0.LuaApp.Components.GameDetails.SocialMediaGroup);
local v24 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCameraChatFeatures);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCommunication);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCameraToU13);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsDecoupledCommunication);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy);
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagRenamePassesAndGearToSubscriptionsAndPasses);
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
local v36 = v3.PureComponent:extend("GameInfoList");
local v37 = {
    All = "Feature.GameDetails.Label.GenreAll", 
    Adventure = "Feature.GameDetails.Label.GenreAdventure", 
    Building = "Feature.GameDetails.Label.GenreBuilding", 
    Comedy = "Feature.GameDetails.Label.GenreComedy", 
    Fighting = "Feature.GameDetails.Label.GenreFighting", 
    FPS = "Feature.GameDetails.Label.GenreFPS", 
    Horror = "Feature.GameDetails.Label.LabelGenreHorror", 
    Medieval = "Feature.GameDetails.Label.GenreMedieval", 
    Military = "Feature.GameDetails.Label.GenreMilitary", 
    Naval = "Feature.GameDetails.Label.GenreNaval", 
    RPG = "Feature.GameDetails.Label.GenreRPG", 
    ["Sci-Fi"] = "Feature.GameDetails.Label.GenreSciFi", 
    Sports = "Feature.GameDetails.Label.LabelGenreSports", 
    ["Town and City"] = "Feature.GameDetails.Label.LabelGenreTownAndCity", 
    Western = "Feature.GameDetails.Label.GenreWestern"
};
v36.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v36.init = function(v38)
    v38.createGamePassPreviewRow = function(v39, v40, v41)
        local v42 = v38.props.gameDetail and v38.props.gameDetail.rootPlaceId;
        local l_passes_0 = v38.props.passes;
        if l_passes_0 and v42 then
            local l_withNewThemeProvider_0 = v38.props.withNewThemeProvider;
            local l_leftPadding_0 = v38.props.leftPadding;
            local l_rightPadding_0 = v38.props.rightPadding;
            return v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v40
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PassesAndGears = v3.createElement(v12, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v41.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = 1, 
                    placeId = v42, 
                    infoName = v41.infoName, 
                    infoData = v41.infoData, 
                    linkPage = v41.linkPage, 
                    linkView = v41.linkView, 
                    universeId = v39, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_rightPadding_0, 
                    analyticsSubPage = v41.analyticsSubPage, 
                    withNewThemeProvider = l_withNewThemeProvider_0
                }), 
                GamePassPreview = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, l_leftPadding_0), 
                        PaddingRight = UDim.new(0, l_rightPadding_0)
                    }), 
                    Grid = v3.createElement(v13, {
                        universeId = v39, 
                        passes = l_passes_0, 
                        numRows = 1, 
                        viewWidth = v38.props.width
                    })
                })
            });
        else
            return ;
        end;
    end;
    v38.checkCommunityLinkExposureLogging = function()
        if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not v38.props.communityLink) then
            l_IXPService_0:LogUserLayerExposure(v19.EDPCommunityLinksLayer);
        end;
    end;
end;
v36.makeGameInfoListData = function(v47)
    local l_localization_0 = v47.props.localization;
    local l_universeId_0 = v47.props.universeId;
    local l_maxPlayers_0 = v47.props.gameDetail.maxPlayers;
    local l_creator_0 = v47.props.gameDetail.creator;
    local l_id_0 = v47.props.gameDetail.creator.id;
    local l_type_0 = v47.props.gameDetail.creator.type;
    local l_name_0 = v47.props.gameDetail.creator.name;
    local l_creatorVerified_0 = v47.props.creatorVerified;
    local l_genre_0 = v47.props.gameDetail.genre;
    local v57 = DateTime.fromIsoDate(v47.props.gameDetail.created);
    local v58 = DateTime.fromIsoDate(v47.props.gameDetail.updated);
    local l_showPasses_0 = v47.props.showPasses;
    local l_showBadges_0 = v47.props.showBadges;
    local l_groupLink_0 = v47.props.groupLink;
    local v62 = nil;
    if v47.props.ageRecommendations then
        local l_summary_0 = v47.props.ageRecommendations.summary;
        v62 = if not not l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
    end;
    local l_enableGroupLinks_0 = v47.props.enableGroupLinks;
    local l_showBadgesRow_0 = v47.props.showBadgesRow;
    local l_showCreatedRow_0 = v47.props.showCreatedRow;
    local l_showDeveloperRow_0 = v47.props.showDeveloperRow;
    local l_showRNVDeveloper_0 = v47.props.showRNVDeveloper;
    local l_showGamepassesRow_0 = v47.props.showGamepassesRow;
    local l_showGenreRow_0 = v47.props.showGenreRow;
    local l_showMaxPlayersRow_0 = v47.props.showMaxPlayersRow;
    local v72 = if not v32() then v47.props.showGamepassesRow else v47.props.showServersRow;
    local l_showUpdatedRow_0 = v47.props.showUpdatedRow;
    local v74 = false;
    if v28() then
        v74 = v47.props.userVoiceEnabled;
    end;
    if not v30() then
        if v31() then
            v74 = not v47.props.isLocalUserUnder13;
        end;
    else
        v74 = true;
    end;
    local v75 = not v74 and v47.props.userVoiceEnabled;
    local l_experienceVoiceEnabled_0 = v47.props.experienceVoiceEnabled;
    local l_experienceVideoEnabled_0 = v47.props.experienceVideoEnabled;
    local l_enableGamePassPreview_0 = v47.props.enableGamePassPreview;
    if l_showBadgesRow_0 == false then
        l_showBadges_0 = false;
    end;
    if l_showGamepassesRow_0 == false then
        l_showPasses_0 = false;
    end;
    v47.gameInfoListData = {};
    local l_l_localization_0_Locale_0 = l_localization_0:GetLocale();
    local v80 = v57:FormatLocalTime("l", l_l_localization_0_Locale_0);
    local v81 = v58:FormatLocalTime("l", l_l_localization_0_Locale_0);
    if not (not l_showPasses_0 or not l_enableGamePassPreview_0) then
        table.insert(v47.gameInfoListData, {
            renderFunction = v47.createGamePassPreviewRow, 
            itemInfo = {
                infoName = not v34() and "Feature.GameDetails.Label.PassesAndGear" or "Feature.GameDetails.Label.SubscriptionsAndPasses", 
                infoData = "", 
                linkView = v10.PassesPage, 
                analyticsSubPage = "PassesAndGear"
            }
        });
    end;
    local l_communityLink_0 = v47.props.communityLink;
    local l_communityLinksEnabled_0 = v47.props.communityLinksEnabled;
    local l_communityLinkVariant_0 = v47.props.communityLinkVariant;
    if not (not (not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not l_communityLinksEnabled_0) and l_communityLinkVariant_0 == "infolist") or not l_communityLink_0) then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Community", 
            infoData = "", 
            infoIcon = l_GuildedLogoWhiteAsset_0, 
            linkUrl = l_getCommunityUrl_0(l_communityLink_0.communityId), 
            linkClickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else function()
                l_clickCommunityLinkEvent_0(v47.props.eventIngest, l_Constants_0.Context.ExperienceInfoList, {
                    guildedServerId = l_communityLink_0.communityId, 
                    entityType = "universe", 
                    entityId = l_universeId_0
                });
            end
        });
    end;
    table.insert(v47.gameInfoListData, {
        infoName = "Feature.GameDetails.Label.AgeGuidelines", 
        infoData = if not v62 then l_localization_0:Format("Feature.GameDetails.Label.Unavailable") else v62, 
        linkView = if not v62 then nil else v10.ExperienceGuidelinesExplained, 
        analyticsSubPage = v10.ExperienceGuidelinesExplained
    });
    if not (not l_showDeveloperRow_0 and (not l_showRNVDeveloper_0 or not l_creator_0.isRNVAccount)) then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Developer", 
            infoData = l_name_0, 
            linkPage = v20.game.info.creator({
                creatorType = l_type_0, 
                creatorId = l_id_0
            }), 
            analyticsSubPage = "Developer", 
            useVerifiedBadgeEmojiWrapper = l_creatorVerified_0
        });
    end;
    if l_showMaxPlayersRow_0 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.MaxPlayers", 
            infoData = tostring(l_maxPlayers_0)
        });
    end;
    local v85 = v37[l_genre_0];
    if v85 ~= nil then
        l_genre_0 = l_localization_0:Format(v85);
    end;
    if l_showGenreRow_0 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Genre", 
            infoData = l_genre_0
        });
    end;
    if l_showCreatedRow_0 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Created", 
            infoData = v80
        });
    end;
    if l_showUpdatedRow_0 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Updated", 
            infoData = v81
        });
    end;
    if v75 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.VoiceEnabled", 
            infoData = not not l_experienceVoiceEnabled_0 and l_localization_0:Format("Feature.GameDetails.Label.Yes") or l_localization_0:Format("Feature.GameDetails.Label.No")
        });
    end;
    if v74 then
        local v86 = l_localization_0:Format("Feature.GameDetails.Label.None");
        local v87 = nil;
        if not v31() then
            if l_experienceVoiceEnabled_0 then
                v86 = l_localization_0:Format("Feature.GameDetails.Label.Microphone") .. if not not v28() and l_experienceVideoEnabled_0 then ", " .. l_localization_0:Format("Feature.GameDetails.Label.Camera") else "";
                if not v28() then
                    v87 = "rbxasset://textures/ui/VoiceChat/Blank.png";
                end;
            end;
            table.insert(v47.gameInfoListData, {
                infoName = not v29() and "Feature.GameDetails.Label.ChatFeatures" or "Feature.AccountSettings.Heading.Communication", 
                infoData = v86, 
                infoIcon = v87
            });
        else
            local v88 = {};
            if not (not l_experienceVoiceEnabled_0 or v47.props.isLocalUserUnder13) then
                table.insert(v88, l_localization_0:Format("Feature.GameDetails.Label.Microphone"));
            end;
            if l_experienceVideoEnabled_0 then
                table.insert(v88, l_localization_0:Format("Feature.GameDetails.Label.Camera"));
            end;
            if #v88 < 1 then
                table.insert(v88, l_localization_0:Format("Feature.GameDetails.Label.None"));
            end;
            table.insert(v47.gameInfoListData, {
                infoName = "Feature.AccountSettings.Heading.Communication", 
                infoData = table.concat(v88, ", "), 
                infoIcon = v87
            });
        end;
    end;
    if not (l_enableGamePassPreview_0 or not l_showPasses_0) then
        table.insert(v47.gameInfoListData, {
            infoName = not v34() and "Feature.GameDetails.Label.PassesAndGear" or "Feature.GameDetails.Label.SubscriptionsAndPasses", 
            infoData = "", 
            linkView = v10.PassesPage, 
            analyticsSubPage = "PassesAndGear"
        });
    end;
    if l_showBadges_0 then
        table.insert(v47.gameInfoListData, {
            infoName = "CommonUI.Features.Label.Badges", 
            infoData = "", 
            linkPage = v20.game.info.badges({
                universeId = l_universeId_0
            }), 
            analyticsSubPage = "Badges"
        });
    end;
    if v72 then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Servers", 
            infoData = "", 
            linkPage = v20.game.info.servers({
                universeId = l_universeId_0
            }), 
            analyticsSubPage = "Servers"
        });
    end;
    if not (not l_groupLink_0 or not l_enableGroupLinks_0) then
        table.insert(v47.gameInfoListData, {
            infoName = "Feature.GameDetails.Label.Group", 
            infoData = "", 
            linkPage = l_groupLink_0.url, 
            analyticsSubPage = "Group"
        });
    end;
end;
v36.createSocialMediaRow = function(v89, v90, v91)
    return v3.createElement("Frame", {
        LayoutOrder = v91, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v89.props.leftPadding), 
            PaddingRight = UDim.new(0, v89.props.rightPadding), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        SocialMediaGroup = v3.createElement(v23, {
            universeId = v90
        })
    });
end;
v36.createCommunityRow = function(v92, v93)
    return v3.createElement("Frame", {
        LayoutOrder = v93, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v92.props.leftPadding), 
            PaddingRight = UDim.new(0, v92.props.rightPadding), 
            PaddingTop = UDim.new(0, 30), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        ExperienceCommunityLink = v3.createElement(l_ExperienceCommunityLink_0, {
            communityInfo = v92.props.communityLink, 
            experienceName = v92.props.gameDetail.name, 
            universeId = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v92.props.universeId
        })
    });
end;
v36.render = function(v94)
    v94:makeGameInfoListData();
    local _ = v94.props.gameDetail;
    local l_rootPlaceId_0 = v94.props.gameDetail.rootPlaceId;
    local l_universeId_1 = v94.props.universeId;
    local l_showSocial_0 = v94.props.showSocial;
    local l_GameInfoList_0 = v94.props.appTheme.GameDetails.GameInfoList;
    local l_LayoutOrder_0 = v94.props.LayoutOrder;
    local l_leftPadding_1 = v94.props.leftPadding;
    local l_rightPadding_1 = v94.props.rightPadding;
    local l_withNewThemeProvider_1 = v94.props.withNewThemeProvider;
    local v104 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    return l_withStyle_0(function(v105)
        local v106 = not not l_withNewThemeProvider_1 and v105.Theme.Divider.Color or l_GameInfoList_0.DividerColor;
        local v107 = not not l_withNewThemeProvider_1 and v105.Theme.Divider.Transparency or 0;
        local v108 = 0;
        local v109 = #v94.gameInfoListData;
        for v110, v111 in ipairs(v94.gameInfoListData) do
            local l_renderFunction_0 = v111.renderFunction;
            v108 = v108 + 1;
            if not l_renderFunction_0 then
                v104["GameInfoRow" .. v110] = v3.createElement(v12, {
                    Size = UDim2.new(1, 0, 0, 57), 
                    useVerifiedBadgeEmojiWrapper = v111.useVerifiedBadgeEmojiWrapper, 
                    LayoutOrder = v108, 
                    placeId = l_rootPlaceId_0, 
                    infoName = v111.infoName, 
                    infoData = v111.infoData, 
                    infoIcon = v111.infoIcon, 
                    linkPage = v111.linkPage, 
                    linkView = v111.linkView, 
                    linkUrl = v111.linkUrl, 
                    linkClickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v111.linkClickCallback, 
                    universeId = l_universeId_1, 
                    leftPadding = l_leftPadding_1, 
                    rightPadding = l_rightPadding_1, 
                    analyticsSubPage = v111.analyticsSubPage, 
                    withNewThemeProvider = l_withNewThemeProvider_1
                });
            else
                v104["GameInfoRow" .. v110] = l_renderFunction_0(l_universeId_1, v108, v111.itemInfo);
            end;
            v108 = v108 + 1;
            v104["Divider" .. v110] = v3.createElement("Frame", {
                Size = UDim2.new(1, -l_leftPadding_1, 0, 1), 
                BackgroundColor3 = v106, 
                BackgroundTransparency = v107, 
                BorderSizePixel = 0, 
                LayoutOrder = v108
            });
        end;
        local l_communityLinksEnabled_1 = v94.props.communityLinksEnabled;
        local l_communityLinkVariant_1 = v94.props.communityLinkVariant;
        if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not l_communityLinksEnabled_1) and l_communityLinkVariant_1 == "banner" then
            local v115 = not not v94.props.communityLink and v94:createCommunityRow(v108 + 1) or nil;
            if v115 ~= nil then
                v109 = v109 + 1;
                v108 = v108 + 1;
                v104["GameInfoRow" .. v109] = v115;
            end;
        end;
        local v116 = not not l_showSocial_0 and v94:createSocialMediaRow(l_universeId_1, v108 + 1) or nil;
        if v116 ~= nil then
            v104["GameInfoRow" .. v109 + 1] = v116;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, l_leftPadding_1 + l_rightPadding_1, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            ClipsDescendants = false
        }, v104);
    end);
end;
v36.didMount = function(v117)
    if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
        v117.checkCommunityLinkExposureLogging();
    end;
end;
v36.didUpdate = function(v118, v119, _)
    local l_topPage_0 = v118.props.topPage;
    local l_topPage_1 = v119.topPage;
    if (l_topPage_0.name ~= l_topPage_1.name and l_topPage_1.name == v10.GenericWebPage) and if not l_topPage_1.extraProps then nil else l_topPage_1.extraProps.passOwned == false then
        v118.props.fetchGamePasses(v118.props.networking, v118.props.universeId);
    end;
    if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or v119.communityLink) then
        v118.checkCommunityLinkExposureLogging();
    end;
end;
local v127 = v6(function(v123)
    local v124 = {};
    if v123 then
        for _, v126 in ipairs(v123) do
            if v126.price ~= nil then
                table.insert(v124, v126);
            end;
        end;
        return v124;
    else
        return v124;
    end;
end);
local function _(v128)
    local l_history_0 = v128.Navigation.history;
    local v130 = l_history_0[#l_history_0];
    return v130[#v130];
end;
v36 = v5.connect(function(v132, v133)
    local v134 = v132.GamePasses and v127(v132.GamePasses[v133.universeId]);
    local v135 = v132.GameBadges[v133.universeId];
    local v136 = true;
    local v137 = true;
    local v138 = v132.GameSocialLinks[v133.universeId];
    local v139 = v138 and v138.groupLink;
    local v140 = false;
    local v141 = v24.isCreatorOfGameVerified(v132, v133);
    local v142 = nil;
    if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
        v142 = v132.CommunityLinks.ExperienceCommunityLinks[v133.universeId] or nil;
    end;
    if v134 and #v134 == 0 then
        v136 = false;
    end;
    if v135 and #v135 == 0 then
        v137 = false;
    end;
    local v143 = v132.VoiceChatOptInStatus.isUserOptIn or false;
    local v144 = false;
    if v132.ShowAgeVerificationOverlay[v133.universeId] ~= nil then
        v140 = v132.ShowAgeVerificationOverlay[v133.universeId].isUniverseEnabledForVoice or false;
        if not (not v28() and not v31()) then
            v144 = v132.ShowAgeVerificationOverlay[v133.universeId].isUniverseEnabledForAvatarVideo or false;
        end;
    end;
    local v145 = {
        gameDetail = v132.GameDetails[v133.universeId], 
        creatorVerified = v141, 
        showPasses = v136, 
        passes = v134, 
        showBadges = v137, 
        groupLink = v139, 
        communityLink = v142, 
        userVoiceEnabled = v143, 
        experienceVoiceEnabled = v140, 
        experienceVideoEnabled = v144, 
        isLocalUserUnder13 = v132.IsLocalUserUnder13
    };
    local l_history_1 = v132.Navigation.history;
    local v147 = l_history_1[#l_history_1];
    v145.topPage = v147[#v147];
    return v145;
end, function(v148)
    return {
        fetchGamePasses = function(v149, v150)
            return v148(v11(v149, v150));
        end
    };
end)((v22(v36)));
if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
    v36 = v18.connectUserLayer({
        v19.EDPCommunityLinksLayer
    }, function(v151)
        local v152 = (v151[v19.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
        return {
            communityLinksEnabled = v152.inTreatment, 
            communityLinkVariant = v152.linkVariant
        };
    end, false)(v36);
end;
return l_RoactServices_0.connect({
    localization = v4, 
    networking = v8, 
    eventIngest = v9
})((l_RoactAppPolicy_0.connect(function(v153, _)
    return {
        enableGroupLinks = v153.getSocialGroupLinks(), 
        showBadgesRow = v153.getGameInfoShowBadges(), 
        showCreatedRow = v153.getGameInfoShowCreated(), 
        showDeveloperRow = v153.getGameInfoListDeveloper(), 
        showRNVDeveloper = v153.getGameInfoListShowRNVDeveloper(), 
        showGamepassesRow = v153.getGameInfoShowGamepasses(), 
        showGenreRow = v153.getGameInfoShowGenre(), 
        showMaxPlayersRow = v153.getGameInfoShowMaxPlayers(), 
        showServersRow = v153.getGameInfoShowServers(), 
        showUpdatedRow = v153.getGameInfoShowUpdated(), 
        showChatFeaturesRow = v153.getGameInfoShowChatFeatures()
    };
end)(v36)));
