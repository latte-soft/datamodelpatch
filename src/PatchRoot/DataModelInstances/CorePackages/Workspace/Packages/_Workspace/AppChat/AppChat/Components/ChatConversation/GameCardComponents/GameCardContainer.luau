local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Cryo);
local l_EventStream_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventStream;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v14 = require(l_Parent_0.Loggers).Logger:new("GameCardContainer");
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_GameParams_0 = require(l_Parent_0.ExperienceService).GameParams;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v21 = require(script.Parent.ReportAnEvent);
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v26 = require(script.Parent.GameCard);
local l_AppGame_0 = l_RoactServices_0.AppGame;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_UseExperienceService_0 = require(l_Parent_0.ExperienceService).Flags.UseExperienceService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local v32 = require(l_Parent_0.HttpRequest);
local v46 = {
    networkImpl = v32.config({
        requestFunction = function(v33, v34, v35)
            v14:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v34, v33));
            return v32.requestFunctions.HttpRbxApi(v33, v34, v35);
        end
    }), 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    placeId = nil, 
    universeId = nil, 
    conversationId = nil, 
    luaChatPlayTogetherEnabled = nil, 
    onDetailsOpened = function()
    end, 
    onPlayButtonActivated = function(v36)
        local l_placeId_0 = v36.placeId;
        local l_senderUserId_0 = v36.senderUserId;
        l_SetGamePlaySession_0(v36.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromChat, true);
        v21(v36, "clickBtnFromLinkCardInChat", "touch");
        if l_placeId_0 then
            local function v40(v39)
                v36 = v6.Dictionary.join(v36, {
                    joinAttemptId = v39
                });
                v21(v36, "gamePlayIntent", "PlayGameFromLinkCard");
            end;
            local v41 = l_GameParams_0.fromParams({
                userId = l_senderUserId_0, 
                placeId = l_placeId_0
            });
            if not l_UseExperienceService_0() then
                v36.game:launchGame(v41, "PlayGameFromLinkCard", v40);
            else
                l_ExperienceService_0:LaunchExperience(v41, "PlayGameFromLinkCard", v40);
            end;
        end;
    end, 
    openDetails = function(v42)
        local l_universeId_0 = v42.universeId;
        local l_placeId_1 = v42.placeId;
        v21(v42, "clickLinkCardInChat", "touch");
        v42.onDetailsOpened();
        v42.openGameDetailsPage(l_universeId_0, "LuaChatAssetCard");
        local v45 = v42.analytics and v42.analytics.reportOpenGameDetailFromChat;
        if v45 then
            v45(l_placeId_1, v42.conversationId, l_universeId_0, "GameDetailFromLinkCard");
        end;
    end
};
local function _(v47, v48)
    local v49 = v47[l_GameIconReducer_0.key][v48];
    if not v49 then
        return "";
    else
        return v49.url;
    end;
end;
local function _(v51, v52)
    return v51.GameDetails[v52] or {};
end;
local function _(v54, v55)
    return v54.PlayabilityStatus[v55] or {};
end;
GameCardContainer = function(v57)
    local v58 = v6.Dictionary.join(v46, v57);
    if not v58.universeId then
        assert("universeId does not exist", "universeId does not exist");
    end;
    local v60 = l_useSelector_0(l_useCallback_0(function(v59)
        return v59.GameDetails[v58.universeId] or {};
    end, l_dependencyArray_0(v58.universeId)));
    local v62 = l_useSelector_0(l_useCallback_0(function(v61)
        return v61.PlayabilityStatus[v58.universeId] or {};
    end, l_dependencyArray_0(v58.universeId)));
    local v65 = l_useSelector_0(l_useCallback_0(function(v63)
        local v64 = v63[l_GameIconReducer_0.key][v58.universeId];
        if not v64 then
            return "";
        else
            return v64.url;
        end;
    end, l_dependencyArray_0(v58.universeId)));
    local v66 = v58.placeId or v60.rootPlaceId;
    local l_name_0 = v60.name;
    local v68 = v60.description or "";
    local v69 = v60.price or 0;
    local v70 = l_useDispatch_0();
    local function v73(v71, v72)
        v70(l_ApiFetchGameIcons_0(v71, {
            v72
        }));
        v70(l_ApiFetchGameDetails_0.Fetch(v71, {
            v72
        }));
        v70(l_ApiFetchPlayabilityStatus_0.Fetch(v71, {
            v72
        }));
    end;
    local function _()
        if not (not (((not v66 or not l_name_0) or not v68) or not v62) and v62.isPlayable ~= nil) or not v69 then
            return false;
        else
            return true;
        end;
    end;
    l_useEffect_0(function()
        local l_universeId_1 = v58.universeId;
        if l_universeId_1 then
            v73(v58.networkImpl, l_universeId_1);
            return ;
        else
            return ;
        end;
    end, {});
    local function v78(v76, v77)
        if v76.universeId then
            return v5.createElement(v26, v6.Dictionary.join(v76, v77, {
                isLoading = not (not not v66 and if (l_name_0 and v68) and v62 then v62.isPlayable ~= nil and (v69 and true or false) else false)
            }));
        else
            return v5.createElement(v26, v77);
        end;
    end;
    return l_withLocalization_0({
        purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame", 
        viewDetailsText = "Feature.Chat.Action.ViewAssetDetails", 
        playText = "Common.VisitGame.Label.Play", 
        noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
    })(function(v79)
        return v78(v6.Dictionary.join(v58, {
            details = v60, 
            playabilityStatus = v62, 
            gameIcon = v65, 
            placeId = v66, 
            gameName = l_name_0, 
            gameDescription = v68, 
            gamePrice = v69, 
            fetchGameData = v73
        }), v79);
    end);
end;
return l_RoactServices_0.connect({
    game = l_AppGame_0, 
    sessionService = l_AppSessionService_0, 
    analytics = l_RoactAnalyticsCommonGameEvents_0
})(l_memo_0(GameCardContainer));
