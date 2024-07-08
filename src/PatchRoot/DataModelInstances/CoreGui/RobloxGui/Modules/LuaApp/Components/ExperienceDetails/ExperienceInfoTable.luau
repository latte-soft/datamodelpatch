local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Hooks.useExperienceInfoData);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppRefactorExperienceInfoTable);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy);
local v12 = require(l_Modules_0.Common.RoactRodux);
local v13 = require(l_CorePackages_0.Packages.t);
local v14 = require(l_CorePackages_0.UIBlox);
local v15 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v17 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v19 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v21 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v22 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v24 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment);
local v25 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v26 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local l_getCommunityUrl_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Utils.getCommunityUrl;
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local v31 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v32 = require(l_Modules_0.LuaApp.Thunks.OpenExperienceGuidelinesExplained);
local v33 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v34 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCameraChatFeatures);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsDecoupledCommunication);
local v38 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCommunication);
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppExperienceInfoPanel);
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCameraToU13);
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
local v43 = require(l_Modules_0.LuaApp.Flags.GetFFlagRenamePassesAndGearToSubscriptionsAndPasses);
local l_ListTable_0 = v14.App.Table.ListTable;
local v45 = require(script.Parent.ExperienceInfoTableRow);
local v46 = require(l_Modules_0.LuaApp.AppPage);
local v47 = require(script.Parent.ExperienceDetailsPanel);
if not v10() then
    local v48 = v2.PureComponent:extend("ExperienceInfoTable");
    v48.validateProps = v13.interface({
        universeId = v13.string, 
        renderTextOverride = v13.optional(v13.callback), 
        ageRecommendations = v13.optional(v26.validateModel)
    });
    local v49 = {
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
    v48.init = function(v50)
        v50.getCells = l_memoize_0(function(v51, _, _)
            local v54 = {};
            if v51 then
                local l_localization_0 = v50.props.localization;
                local l_l_localization_0_Locale_0 = l_localization_0:GetLocale();
                local l_universeId_0 = v50.props.universeId;
                local l_rootPlaceId_0 = v51.rootPlaceId;
                local l_eventIngest_0 = v50.props.eventIngest;
                local l_navigateDown_0 = v50.props.navigateDown;
                local l_showBadgesRow_0 = v50.props.showBadgesRow;
                local l_showCreatedRow_0 = v50.props.showCreatedRow;
                local l_showDeveloperRow_0 = v50.props.showDeveloperRow;
                local l_showRNVDeveloper_0 = v50.props.showRNVDeveloper;
                local l_showGamepassesRow_0 = v50.props.showGamepassesRow;
                local l_showGenreRow_0 = v50.props.showGenreRow;
                local l_showMaxPlayersRow_0 = v50.props.showMaxPlayersRow;
                local v68 = if not v11() then v50.props.showGamepassesRow else v50.props.showServersRow;
                local l_showUpdatedRow_0 = v50.props.showUpdatedRow;
                local v70 = false;
                if not v36() then
                    if not v40() then
                        if v37() then
                            v70 = not v50.props.isLocalUserUnder13;
                        end;
                    else
                        v70 = true;
                    end;
                else
                    v70 = v50.props.userVoiceEnabled;
                end;
                local v71 = not v70 and v50.props.userVoiceEnabled;
                local l_experienceVoiceEnabled_0 = v50.props.experienceVoiceEnabled;
                local l_experienceVideoEnabled_0 = v50.props.experienceVideoEnabled;
                local l_showPasses_0 = v50.props.showPasses;
                local l_showBadges_0 = v50.props.showBadges;
                local l_webViewSupport_0 = v50.props.webViewSupport;
                if not l_showBadgesRow_0 then
                    l_showBadges_0 = false;
                end;
                if not l_showGamepassesRow_0 then
                    l_showPasses_0 = false;
                end;
                local l_communityLinksEnabled_0 = v50.props.communityLinksEnabled;
                local l_communityLinkVariant_0 = v50.props.communityLinkVariant;
                if not ((not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not l_communityLinksEnabled_0) or not v50.props.communityLink) and l_communityLinkVariant_0 == "infolist" then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Community"), 
                        infoData = "", 
                        infoIcon = l_GuildedLogoWhiteAsset_0, 
                        externalLinkProps = {
                            linkUrl = l_getCommunityUrl_0(v50.props.communityLink.communityId), 
                            openLeaveRobloxAlert = v50.props.openLeaveRobloxAlert, 
                            closeAlert = v50.props.closeAlert, 
                            linking = v50.props.linking, 
                            clickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else function()
                                l_clickCommunityLinkEvent_0(l_eventIngest_0, l_Constants_0.Context.ExperienceInfoList, {
                                    guildedServerId = v50.props.communityLink.communityId, 
                                    entityType = "universe", 
                                    entityId = l_universeId_0
                                });
                            end
                        }
                    }));
                end;
                if v50.props.ageRecommendations then
                    local l_summary_0 = v50.props.ageRecommendations.summary;
                    local v80 = if not not l_summary_0 and l_summary_0.ageRecommendation then l_summary_0.ageRecommendation.displayName else nil;
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.AgeGuidelines"), 
                        infoData = v80 or l_localization_0:Format("Feature.GameDetails.Label.Unavailable"), 
                        linkProps = if not v80 then nil else {
                            analyticsSubPage = v46.ExperienceGuidelinesExplained, 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = v50.props.openExperienceGuidelinesExplained, 
                            navigateProps = l_universeId_0
                        }
                    }));
                end;
                local l_creator_0 = v51.creator;
                local v82 = if not v35() then v50.props.creatorVerified else l_creator_0.hasVerifiedBadge;
                local l_renderTextOverride_0 = v50.props.renderTextOverride;
                if not (not l_showDeveloperRow_0 and (not l_showRNVDeveloper_0 or not l_creator_0.isRNVAccount)) then
                    local l_id_0 = l_creator_0.id;
                    local l_name_0 = l_creator_0.name;
                    local l_type_0 = l_creator_0.type;
                    local l_l_name_0_0 = l_name_0 --[[ copy: 32 -> 34 ]];
                    local l_l_id_0_0 = l_id_0 --[[ copy: 31 -> 35 ]];
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Developer"), 
                        infoData = l_name_0, 
                        renderTextOverride = function()
                            if not l_renderTextOverride_0 then
                                return nil;
                            else
                                return l_renderTextOverride_0(l_l_name_0_0, l_l_id_0_0, l_universeId_0, v82);
                            end;
                        end, 
                        linkProps = if not l_webViewSupport_0 then nil else {
                            linkPage = v15.game.info.creator({
                                creatorType = l_type_0, 
                                creatorId = l_id_0
                            }), 
                            analyticsSubPage = "Developer", 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = l_navigateDown_0
                        }, 
                        externalLinkProps = if l_webViewSupport_0 then nil else {
                            linkUrl = v15.game.info.creator({
                                creatorType = l_type_0, 
                                creatorId = l_id_0
                            }), 
                            openLeaveRobloxAlert = v50.props.openLeaveRobloxAlert, 
                            closeAlert = v50.props.closeAlert, 
                            linking = v50.props.linking
                        }
                    }));
                end;
                if l_showMaxPlayersRow_0 then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.MaxPlayers"), 
                        infoData = tostring(v51.maxPlayers)
                    }));
                end;
                if l_showGenreRow_0 then
                    local l_genre_0 = v51.genre;
                    local v90 = v49[l_genre_0];
                    if v90 ~= nil then
                        l_genre_0 = l_localization_0:Format(v90);
                    end;
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Genre"), 
                        infoData = l_genre_0
                    }));
                end;
                if l_showCreatedRow_0 then
                    local v91 = DateTime.fromIsoDate(v51.created);
                    assert(v91, "invalid GameDetail created date");
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Created"), 
                        infoData = v91:FormatLocalTime("l", l_l_localization_0_Locale_0)
                    }));
                end;
                if l_showUpdatedRow_0 then
                    local v92 = DateTime.fromIsoDate(v51.updated);
                    assert(v92, "invalid GameDetail updated date");
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Updated"), 
                        infoData = v92:FormatLocalTime("l", l_l_localization_0_Locale_0)
                    }));
                end;
                if v71 then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.VoiceEnabled"), 
                        infoData = not not l_experienceVoiceEnabled_0 and l_localization_0:Format("Feature.GameDetails.Label.Yes") or l_localization_0:Format("Feature.GameDetails.Label.No")
                    }));
                end;
                if v70 then
                    local v93 = l_localization_0:Format("Feature.GameDetails.Label.None");
                    local v94 = nil;
                    if not v37() then
                        if l_experienceVoiceEnabled_0 then
                            v93 = l_localization_0:Format("Feature.GameDetails.Label.Microphone");
                            if not v36() then
                                v94 = "rbxasset://textures/ui/VoiceChat/Blank.png";
                            elseif l_experienceVideoEnabled_0 then
                                v93 = v93 .. ", " .. l_localization_0:Format("Feature.GameDetails.Label.Camera");
                            end;
                        end;
                        table.insert(v54, v2.createElement(v45, {
                            infoName = l_localization_0:Format(not v38() and "Feature.GameDetails.Label.ChatFeatures" or "Feature.AccountSettings.Heading.Communication"), 
                            infoData = v93, 
                            infoIcon = v94
                        }));
                    else
                        local v95 = {};
                        if not v40() then
                            if l_experienceVoiceEnabled_0 then
                                table.insert(v95, l_localization_0:Format("Feature.GameDetails.Label.Microphone"));
                            end;
                        elseif not (not l_experienceVoiceEnabled_0 or v50.props.isLocalUserUnder13) then
                            table.insert(v95, l_localization_0:Format("Feature.GameDetails.Label.Microphone"));
                        end;
                        if l_experienceVideoEnabled_0 then
                            table.insert(v95, l_localization_0:Format("Feature.GameDetails.Label.Camera"));
                        end;
                        if #v95 < 1 then
                            table.insert(v95, l_localization_0:Format("Feature.GameDetails.Label.None"));
                        end;
                        table.insert(v54, v2.createElement(v45, {
                            infoName = l_localization_0:Format("Feature.AccountSettings.Heading.Communication"), 
                            infoData = table.concat(v95, ", "), 
                            infoIcon = v94
                        }));
                    end;
                end;
                if not (not l_showPasses_0 or not l_webViewSupport_0) then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format(not v43() and "Feature.GameDetails.Label.PassesAndGear" or "Feature.GameDetails.Label.SubscriptionsAndPasses"), 
                        infoData = "", 
                        linkProps = {
                            linkPage = v15.game.info.store({
                                universeId = l_universeId_0
                            }), 
                            analyticsSubPage = "PassesAndGear", 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = l_navigateDown_0
                        }
                    }));
                end;
                if not (not l_showBadges_0 or not l_webViewSupport_0) then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("CommonUI.Features.Label.Badges"), 
                        infoData = "", 
                        linkProps = {
                            linkPage = v15.game.info.badges({
                                universeId = l_universeId_0
                            }), 
                            analyticsSubPage = "Badges", 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = l_navigateDown_0
                        }
                    }));
                end;
                if not (not v68 or not l_webViewSupport_0) then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Servers"), 
                        infoData = "", 
                        linkProps = {
                            linkPage = v15.game.info.servers({
                                universeId = l_universeId_0
                            }), 
                            analyticsSubPage = "Servers", 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = l_navigateDown_0
                        }
                    }));
                end;
                local l_groupLink_0 = v50.props.groupLink;
                local l_enableGroupLinks_0 = v50.props.enableGroupLinks;
                if not ((not l_groupLink_0 or not l_enableGroupLinks_0) or not l_webViewSupport_0) then
                    table.insert(v54, v2.createElement(v45, {
                        infoName = l_localization_0:Format("Feature.GameDetails.Label.Group"), 
                        infoData = "", 
                        linkProps = {
                            linkPage = l_groupLink_0.url, 
                            analyticsSubPage = "Group", 
                            rootPlaceId = l_rootPlaceId_0, 
                            eventIngest = l_eventIngest_0, 
                            navigate = l_navigateDown_0
                        }
                    }));
                end;
                return v54;
            else
                return v54;
            end;
        end);
    end;
    v48.render = function(v98)
        return v2.createElement(l_ListTable_0, {
            cells = v98.getCells(v98.props.gameDetail, v98.props.ageRecommendations, v98.props.communityLink), 
            automaticSize = Enum.AutomaticSize.Y
        });
    end;
    v48 = v12.connect(function(v99, v100)
        local l_universeId_1 = v100.universeId;
        local v102 = v99.GamePasses[l_universeId_1];
        local v103 = v99.GameBadges[l_universeId_1];
        local v104 = true;
        local v105 = true;
        if v102 and #v102 == 0 then
            v104 = false;
        end;
        if v103 and #v103 == 0 then
            v105 = false;
        end;
        local v106 = v99.VoiceChatOptInStatus.isUserOptIn or false;
        local v107 = false;
        local v108 = false;
        if v99.ShowAgeVerificationOverlay[l_universeId_1] then
            v107 = v99.ShowAgeVerificationOverlay[l_universeId_1].isUniverseEnabledForVoice;
            if not (not v36() and not v37()) then
                v108 = v99.ShowAgeVerificationOverlay[l_universeId_1].isUniverseEnabledForAvatarVideo;
            end;
        end;
        local v109 = v99.GameSocialLinks[l_universeId_1];
        local v110 = v109 and v109.groupLink;
        local v111 = if not v35() then v17.isCreatorOfGameVerified(v99, v100) else nil;
        local v112 = nil;
        if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
            v112 = v99.CommunityLinks.ExperienceCommunityLinks[l_universeId_1] or nil;
        end;
        return {
            gameDetail = v99.GameDetails[l_universeId_1], 
            creatorVerified = v111, 
            showPasses = v104, 
            showBadges = v105, 
            userVoiceEnabled = v106, 
            experienceVoiceEnabled = v107, 
            experienceVideoEnabled = v108, 
            groupLink = v110, 
            communityLink = v112, 
            isLocalUserUnder13 = v99.IsLocalUserUnder13, 
            ageRecommendations = v99.AgeRecommendations[l_universeId_1]
        };
    end, function(v113)
        return {
            navigateDown = function(v114)
                return v113(v31(v114));
            end, 
            openExperienceGuidelinesExplained = function(v115)
                v113(v32(v115));
            end, 
            openLeaveRobloxAlert = function(v116)
                v113(v33(v116));
            end, 
            closeAlert = function()
                v113(v34());
            end
        };
    end)(v48);
    if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
        v48 = v24.connectUserLayer({
            v25.EDPCommunityLinksLayer
        }, function(v117)
            local v118 = (v117[v25.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
            return {
                communityLinksEnabled = v118.inTreatment, 
                communityLinkVariant = v118.linkVariant
            };
        end, false)(v48);
    end;
    return l_RoactServices_0.connect({
        localization = v21, 
        eventIngest = v22, 
        linking = l_AppLinking_0
    })((l_RoactAppPolicy_0.connect(function(v119)
        return {
            showBadgesRow = v119.getGameInfoShowBadges(), 
            showCreatedRow = v119.getGameInfoShowCreated(), 
            showDeveloperRow = v119.getGameInfoListDeveloper(), 
            showRNVDeveloper = v119.getGameInfoListShowRNVDeveloper(), 
            showGamepassesRow = v119.getGameInfoShowGamepasses(), 
            showGenreRow = v119.getGameInfoShowGenre(), 
            showMaxPlayersRow = v119.getGameInfoShowMaxPlayers(), 
            showServersRow = v119.getGameInfoShowServers(), 
            showUpdatedRow = v119.getGameInfoShowUpdated(), 
            enableGroupLinks = v119.getSocialGroupLinks(), 
            webViewSupport = v119.getWebViewSupport(), 
            showChatFeaturesRow = v119.getGameInfoShowChatFeatures()
        };
    end)(v48)));
else
    return v2.forwardRef(function(v120, v121)
        local v122 = v9(v120.universeId);
        local v123 = v8(v22);
        local v124 = l_useDispatch_0();
        local v126 = v2.useCallback(function(v125)
            v124(v31(v125));
        end);
        local v127 = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v8(l_AppLinking_0);
        local v129 = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v2.useCallback(function(v128)
            v124(v33(v128));
        end, {
            v124
        });
        local v130 = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else v2.useCallback(function()
            v124(v34());
        end, {
            v124
        });
        local v132 = v19(function(v131)
            return v131.enableExperienceDetailsPanel();
        end);
        local v133 = l_useLocalization_0({
            StatsInfoTitle = "Feature.ExperienceDetails.Body.StatsInfoTitle"
        });
        local v135 = v2.createElement(l_ListTable_0, {
            cells = v3.map(v122.rows, function(v134)
                return v2.createElement(v45, {
                    infoName = v134.infoName, 
                    infoData = v134.infoData or "", 
                    infoIcon = v134.infoIcon, 
                    renderTextOverride = (not not v134.infoDataOverride and v120.renderTextOverride) and function()
                        return v134.infoDataOverride(v120.renderTextOverride);
                    end or nil, 
                    linkProps = if v134.linkPage or v134.navigateOverride then {
                        eventIngest = v123, 
                        rootPlaceId = v122.rootPlaceId, 
                        linkPage = v134.linkPage, 
                        linkUrl = v134.linkUrl, 
                        navigate = v134.navigateOverride or v126, 
                        analyticsSubPage = v134.analyticsSubPage
                    } else nil, 
                    externalLinkProps = if not not l_GetFFlagEnableDetailsPageCommunityLinks_0() and v134.linkUrl then {
                        linkUrl = v134.linkUrl, 
                        openLeaveRobloxAlert = v129, 
                        closeAlert = v130, 
                        linking = v127, 
                        clickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v134.linkClickCallback
                    } else nil
                });
            end), 
            automaticSize = Enum.AutomaticSize.Y
        });
        if not v39() or not v132 then
            return v135;
        else
            return v2.createElement(v47, {
                ref = v121, 
                title = v133.StatsInfoTitle, 
                roundContentCorners = true
            }, v135);
        end;
    end);
end;
