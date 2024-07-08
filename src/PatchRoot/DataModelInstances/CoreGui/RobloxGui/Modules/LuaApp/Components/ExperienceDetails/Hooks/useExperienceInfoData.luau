local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_useUserExperiment_0 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment).useUserExperiment;
local v10 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_getCommunityUrl_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Utils.getCommunityUrl;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_clickCommunityLinkEvent_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.Common.safeGet);
local v17 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v18 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v19 = require(l_Modules_0.LuaApp.Hooks.useLocalTime);
local v20 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v21 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v22 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenExperienceGuidelinesExplained);
local v24 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v25 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Analytics.Constants;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCommunication);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsCameraChatFeatures);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameDetailsDecoupledCommunication);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCameraToU13);
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagRenamePassesAndGearToSubscriptionsAndPasses);
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
return function(v36)
    local v47 = l_useSelector_0(function(v37)
        local v38 = v37.GamePasses[v36];
        local v39 = v37.GameBadges[v36];
        local v40 = v37.VoiceChatOptInStatus.isUserOptIn or false;
        local v41 = false;
        local v42 = false;
        if v37.ShowAgeVerificationOverlay[v36] then
            v41 = v37.ShowAgeVerificationOverlay[v36].isUniverseEnabledForVoice;
            if not (not v30() and not v31()) then
                v42 = v37.ShowAgeVerificationOverlay[v36].isUniverseEnabledForAvatarVideo;
            end;
        end;
        local v43 = v16(v37.GameSocialLinks, v36, "groupLink");
        local v44 = if not v28() then v10.isCreatorOfGameVerified(v37, {
            universeId = v36
        }) else nil;
        local v45 = l_ApiFetchGameDetails_0.GetFetchingStatus(v37, v36);
        local v46 = nil;
        if l_GetFFlagEnableDetailsPageCommunityLinks_0() then
            v46 = v37.CommunityLinks.ExperienceCommunityLinks[v36] or nil;
        end;
        return {
            dataStatus = v45, 
            gameDetail = v37.GameDetails[v36] or {}, 
            creatorVerified = v44, 
            showPasses = not v38 or #v38 > 0, 
            showBadges = not v39 or #v39 > 0, 
            userVoiceEnabled = v40, 
            experienceVoiceEnabled = v41, 
            experienceVideoEnabled = v42, 
            groupLink = v43, 
            communityLink = v46, 
            isLocalUserUnder13 = v37.IsLocalUserUnder13, 
            ageRecommendations = v37.AgeRecommendations[v36]
        };
    end);
    local v48 = l_useDispatch_0();
    local v49 = v1.useCallback(function()
        v48(v23(v36));
    end, {
        v48, 
        v36
    });
    local v50 = v20(v21);
    local v51 = v1.useCallback(function()
        v48(v24(v50, v36));
    end, {
        v48, 
        v50, 
        v36
    });
    local v52 = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v20(v22);
    local v54 = v18(function(v53)
        return {
            showBadgesRow = v53.getGameInfoShowBadges(), 
            showCreatedRow = v53.getGameInfoShowCreated(), 
            showDeveloperRow = v53.getGameInfoListDeveloper(), 
            showRNVDeveloper = v53.getGameInfoListShowRNVDeveloper(), 
            showGamepassesRow = v53.getGameInfoShowGamepasses(), 
            showGenreRow = v53.getGameInfoShowGenre(), 
            showMaxPlayersRow = v53.getGameInfoShowMaxPlayers(), 
            showServersRow = v53.getGameInfoShowServers(), 
            showUpdatedRow = v53.getGameInfoShowUpdated(), 
            enableGroupLinks = v53.getSocialGroupLinks(), 
            webViewSupport = v53.getWebViewSupport(), 
            showAgeRecommendationRow = v53.getGameInfoShowAgeRecommendation(), 
            showVoiceAndChatFeaturesRow = v53.getGameInfoShowVoiceAndChatFeatures()
        };
    end);
    local v55 = l_useLocalization_0({
        yes = "Feature.GameDetails.Label.Yes", 
        no = "Feature.GameDetails.Label.No", 
        none = "Feature.GameDetails.Label.None", 
        unavailable = "Feature.GameDetails.Label.Unavailable", 
        ageGuidelines = "Feature.GameDetails.Label.AgeGuidelines", 
        developer = "Feature.GameDetails.Label.Developer", 
        maxPlayers = "Feature.GameDetails.Label.MaxPlayers", 
        genre = "Feature.GameDetails.Label.Genre", 
        created = "Feature.GameDetails.Label.Created", 
        updated = "Feature.GameDetails.Label.Updated", 
        voiceEnabled = "Feature.GameDetails.Label.VoiceEnabled", 
        microphone = "Feature.GameDetails.Label.Microphone", 
        camera = "Feature.GameDetails.Label.Camera", 
        chatFeatures = "Feature.GameDetails.Label.ChatFeatures", 
        communication = "Feature.AccountSettings.Heading.Communication", 
        passesAndGear = not v34() and "Feature.GameDetails.Label.PassesAndGear" or "Feature.GameDetails.Label.SubscriptionsAndPasses", 
        badges = "CommonUI.Features.Label.Badges", 
        servers = "Feature.GameDetails.Label.Servers", 
        group = "Feature.GameDetails.Label.Group", 
        community = "Feature.GameDetails.Label.Community"
    });
    local v56 = l_useLocalization_0({
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
    });
    local v58 = l_useUserExperiment_0({
        v25.EDPCommunityLinksLayer
    }, function(v57)
        if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then
            return {};
        else
            return (v57[v25.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {};
        end;
    end, false);
    local v61 = v1.useMemo(function()
        local l_inTreatment_0 = v58.inTreatment;
        local l_linkVariant_0 = v58.linkVariant;
        if not ((not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not l_inTreatment_0) or not v47.communityLink) and l_linkVariant_0 == "infolist" then
            return {
                infoName = v55.community, 
                infoIcon = l_GuildedLogoWhiteAsset_0, 
                linkUrl = l_getCommunityUrl_0(v47.communityLink.communityId), 
                linkClickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else function()
                    l_clickCommunityLinkEvent_0(v52, l_Constants_0.Context.ExperienceInfoList, {
                        guildedServerId = v47.communityLink.communityId, 
                        entityType = "universe", 
                        entityId = v36
                    });
                end
            };
        else
            return ;
        end;
    end, {
        v55.community, 
        v47.communityLink
    });
    local v63 = v1.useMemo(function()
        if not v54.showAgeRecommendationRow then
            return ;
        else
            local v62 = v16(v47.ageRecommendations, "summary", "ageRecommendation", "displayName");
            return {
                infoName = v55.ageGuidelines, 
                infoData = v62 or v55.unavailable, 
                navigateOverride = if not v62 then nil else v49, 
                analyticsSubPage = if not v62 then nil else v15.ExperienceGuidelinesExplained
            };
        end;
    end, {
        v54.showAgeRecommendationRow, 
        v55.ageGuidelines, 
        v55.unavailable, 
        v47.ageRecommendations, 
        v49
    });
    local v70 = v1.useMemo(function()
        local l_creator_0 = v47.gameDetail.creator;
        if not l_creator_0 or not v54.showDeveloperRow and (not v54.showRNVDeveloper or not l_creator_0.isRNVAccount) then
            return ;
        else
            local l_id_0 = l_creator_0.id;
            local l_name_0 = l_creator_0.name;
            local l_type_0 = l_creator_0.type;
            local v68 = if not v28() then v47.creatorVerified or false else l_creator_0.hasVerifiedBadge or false;
            return {
                infoName = v55.developer, 
                infoData = l_name_0, 
                infoDataOverride = function(v69)
                    return v69(l_name_0, l_id_0, v36, v68);
                end, 
                linkPage = if not v54.webViewSupport then nil else v17.game.info.creator({
                    creatorType = l_type_0, 
                    creatorId = l_id_0
                }), 
                analyticsSubPage = "Developer"
            };
        end;
    end, {
        v55.developer, 
        v54.showDeveloperRow, 
        v54.showRNVDeveloper, 
        v54.webViewSupport, 
        v36, 
        v47.gameDetail, 
        v47.creatorVerified
    });
    local v71 = v1.useMemo(function()
        if not v54.showMaxPlayersRow then
            return ;
        else
            return {
                infoName = v55.maxPlayers, 
                infoData = tostring(v47.gameDetail.maxPlayers or "--")
            };
        end;
    end, {
        v54.showMaxPlayersRow, 
        v47.gameDetail
    });
    local v72 = v1.useMemo(function()
        if not v54.showGenreRow then
            return ;
        else
            return {
                infoName = v55.genre, 
                infoData = if not v47.gameDetail.genre then nil else v56[v47.gameDetail.genre] or "--"
            };
        end;
    end, {
        v54.showGenreRow, 
        v47.gameDetail
    });
    local v73 = v19(v47.gameDetail.created);
    local v74 = v1.useMemo(function()
        if not v54.showCreatedRow then
            return ;
        else
            return {
                infoName = v55.created, 
                infoData = v73 or "--"
            };
        end;
    end, {
        v54.showCreatedRow, 
        v73
    });
    local v75 = v19(v47.gameDetail.updated);
    local v76 = v1.useMemo(function()
        if not v54.showUpdatedRow then
            return ;
        else
            return {
                infoName = v55.updated, 
                infoData = v75 or "--"
            };
        end;
    end, {
        v54.showUpdatedRow, 
        v75
    });
    local v78 = v1.useMemo(function()
        local v77 = (not v30() and not v31()) and v47.userVoiceEnabled;
        if not v54.showVoiceAndChatFeaturesRow or not v77 then
            return ;
        else
            return {
                infoName = v55.voiceEnabled, 
                infoData = if not v47.experienceVoiceEnabled then v55.no else v55.yes
            };
        end;
    end, {
        v54.showVoiceAndChatFeaturesRow, 
        v47.userVoiceEnabled, 
        v47.experienceVoiceEnabled
    });
    local v82 = v1.useMemo(function()
        if not v31() then
            local v79 = v30() and v47.userVoiceEnabled;
            if not v54.showVoiceAndChatFeaturesRow or not v79 then
                return nil;
            else
                local l_none_0 = v55.none;
                if v47.experienceVoiceEnabled then
                    l_none_0 = v55.microphone;
                    if v47.experienceVideoEnabled then
                        l_none_0 = l_none_0 .. ", " .. v55.camera;
                    end;
                end;
                return {
                    infoName = if not v29() then v55.chatFeatures else v55.communication, 
                    infoData = l_none_0
                };
            end;
        elseif not v47.isLocalUserUnder13 or v32() then
            local v81 = {};
            if not v32() then
                if v47.experienceVoiceEnabled then
                    table.insert(v81, v55.microphone);
                end;
            elseif not (not v47.experienceVoiceEnabled or v47.isLocalUserUnder13) then
                table.insert(v81, v55.microphone);
            end;
            if v47.experienceVideoEnabled then
                table.insert(v81, v55.camera);
            end;
            if #v81 < 1 then
                table.insert(v81, v55.none);
            end;
            return {
                infoName = v55.communication, 
                infoData = table.concat(v81, ", ")
            };
        else
            return nil;
        end;
    end, {
        v54.showVoiceAndChatFeaturesRow, 
        v47.userVoiceEnabled, 
        v47.experienceVoiceEnabled, 
        v47.experienceVideoEnabled, 
        v47.isLocalUserUnder13
    });
    local v83 = v1.useMemo(function()
        if (not v54.webViewSupport or not v54.showGamepassesRow) or not v47.showPasses then
            return ;
        else
            return {
                infoName = v55.passesAndGear, 
                linkPage = v17.game.info.store({
                    universeId = v36
                }), 
                analyticsSubPage = "PassesAndGear"
            };
        end;
    end, {
        v36, 
        v54.webViewSupport, 
        v54.showGamepassesRow, 
        v47.showPasses
    });
    local v84 = v1.useMemo(function()
        if (not v54.webViewSupport or not v54.showBadgesRow) or not v47.showBadges then
            return ;
        else
            return {
                infoName = v55.badges, 
                linkPage = v17.game.info.badges({
                    universeId = v36
                }), 
                analyticsSubPage = "Badges"
            };
        end;
    end, {
        v36, 
        v54.webViewSupport, 
        v54.showBadgesRow, 
        v47.showPasses
    });
    local v85 = v1.useMemo(function()
        if not v54.webViewSupport or not v54.showServersRow then
            return ;
        else
            return {
                infoName = v55.servers, 
                linkPage = v17.game.info.servers({
                    universeId = v36
                }), 
                analyticsSubPage = "Servers"
            };
        end;
    end, {
        v36, 
        v54.webViewSupport, 
        v54.showServersRow
    });
    local v86 = v1.useMemo(function()
        if (not v54.webViewSupport or not v54.enableGroupLinks) or not v47.groupLink then
            return ;
        else
            return {
                infoName = v55.group, 
                linkPage = v47.groupLink.url, 
                analyticsSubPage = "Group"
            };
        end;
    end, {
        v36, 
        v54.webViewSupport, 
        v54.enableGroupLinks, 
        v47.groupLink
    });
    v1.useEffect(function()
        if v47.dataStatus == l_RetrievalStatus_0.NotStarted then
            v51();
        end;
    end);
    return {
        rootPlaceId = tostring(v47.gameDetail.rootPlaceId), 
        rows = v2.append({
            v61
        }, {
            v63
        }, {
            v70
        }, {
            v71
        }, {
            v72
        }, {
            v74
        }, {
            v76
        }, {
            v78
        }, {
            v82
        }, {
            v83
        }, {
            v84
        }, {
            v85
        }, {
            v86
        })
    }, v47.dataStatus, v51;
end;
