local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_SetNextDataExpirationTime_0 = require(l_CorePackages_0.Workspace.Packages.NextDataExpirationTimeRodux).SetNextDataExpirationTime;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local v10 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia);
local l_ApiFetchBigGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).BigGameIcons.ApiFetchBigGameIcons;
local v12 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameIsFavorite);
local v13 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameFollowingStatus);
local v14 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameSocialLinks);
local v15 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v16 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameBadges);
local l_ApiFetchVoiceChatOptInStatus_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).OptInStatus.ApiFetchVoiceChatOptInStatus;
local v18 = require(l_Modules_0.LuaApp.Thunks.ApiFetchNativeLocaleName);
local l_FetchGameVotes_0 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux).GameVotes.FetchGameVotes;
local v20 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v21 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAgeRecommendations);
local v22 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAssetTextFilterSettings);
local v23 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchPrivateServersEnabled);
local l_ApiFetchExperienceCommunityLink_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Thunks.ApiFetchExperienceCommunityLink;
local l_FetchGamePlayButtonData_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).FetchGamePlayButtonData;
local l_BigGameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).BigGameIcons.BigGameIconReducer;
local v27 = tonumber(settings():GetFVariable("LuaAppGameDetailsRefreshIntervalInSeconds"));
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguage);
local function v39(v33, v34, v35, v36, v37)
    local v38 = {};
    if v37 or v34:getState().GameDetails[v35] == nil then
        table.insert(v38, v34:dispatch(l_ApiFetchGameDetails_0.Fetch(v33, {
            v35
        })));
    end;
    if v37 or v34:getState().VoiceChatOptInStatus == nil then
        v34:dispatch(l_ApiFetchVoiceChatOptInStatus_0.Fetch(v33));
    end;
    if v37 or v34:getState().GameMedia[v35] == nil then
        table.insert(v38, v34:dispatch(v10.Fetch(v33, v35)));
    end;
    if not ((not v31() or not v30()) or not (v36 and v36.uiMode == l_UiMode_0.TenFoot)) and (v37 or v34:getState()[l_BigGameIconReducer_0.key][v35] == nil) then
        v34:dispatch(l_ApiFetchBigGameIcons_0(v33, {
            v35
        }));
    end;
    return v38;
end;
local function v44(v40, v41, v42, v43)
    if l_GetFFlagEnableSwapToSourceButton_0() and (not (not v43 and v41:getState().NativeLocaleName ~= "") or v41:getState().NativeLocaleName == nil) then
        v41:dispatch(v18.Fetch(v40));
    end;
    if v43 or v41:getState().GameVotes[v42] == nil then
        v41:dispatch(l_FetchGameVotes_0.Fetch(v40, v42));
    end;
    if v43 or v41:getState().GameFavorites[v42] == nil then
        v41:dispatch(v12(v40, v42));
    end;
    if v43 or v41:getState().GameFollowings[v42] == nil then
        v41:dispatch(v13(v40, v42));
    end;
    if v43 or v41:getState().GameSocialLinks[v42] == nil then
        v41:dispatch(v14(v40, v42));
    end;
    if v43 or v41:getState().RecommendedGameEntries[v42] == nil then
        v41:dispatch(v20.Fetch(v40, v42, false, {
            maxRows = v4.MAX_RECOMMENDED_GAMES_FETCH_COUNT
        }));
    end;
    if v43 or v41:getState().GamePasses[v42] == nil then
        v41:dispatch(v15(v40, v42));
    end;
    if v43 or v41:getState().GameBadges[v42] == nil then
        v41:dispatch(v16(v40, v42));
    end;
    if v43 or v41:getState().AgeRecommendations[v42] == nil then
        v41:dispatch(v21.Fetch(v40, v42));
    end;
    if v32() and (v43 or v41:getState().AssetTextFilterSettings[v42] == nil) then
        v41:dispatch(v22.Fetch(v40, v42));
    end;
    if v43 or v41:getState().GamePrivateServersEnabled[v42] == nil then
        v41:dispatch(v23(v40, v42));
    end;
    if not (not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not l_getAppFeaturePolicies_0().getCommunityLinksEnabled()) and (v43 or v41:getState().CommunityLinks.ExperienceCommunityLinks[v42] == nil) then
        v41:dispatch(l_ApiFetchExperienceCommunityLink_0(v40, v42));
    end;
end;
return function(v45, v46, v47)
    if type(v46) ~= "string" then
        error(string.format("FetchGameDetailsPageData thunk expects universeId to be a string. Got type: '%s', value: '%s'", type(v46), (tostring(v46))));
    end;
    return function(v48)
        local v49 = false;
        local v50 = v3.GameDetail .. v46;
        local v51 = tick();
        local v52 = v48:getState().NextDataExpirationTime[v50];
        if not (v52 ~= nil) or v52 < v51 then
            v49 = true;
        end;
        v48:dispatch(l_FetchGamePlayButtonData_0.Fetch(v45, v46));
        local v53 = v39(v45, v48, v46, v47, v49);
        if #v53 > 0 then
            local v54 = nil;
            if not (not _G.__TESTEZ_RUNNING_TEST__ and not l_RunService_0:IsStudio()) then
                v54 = warn;
            end;
            return v5.Batch(v53, v54):andThen(function(v55)
                v5.CountResults(v55);
                if v48:getState().GameDetails[v46] ~= nil then
                    v51 = tick();
                    v52 = math.floor(v51 + v27);
                    v48:dispatch(l_SetNextDataExpirationTime_0(v50, v52));
                end;
                v44(v45, v48, v46, v49);
            end);
        else
            v44(v45, v48, v46, v49);
            return ;
        end;
    end;
end;
