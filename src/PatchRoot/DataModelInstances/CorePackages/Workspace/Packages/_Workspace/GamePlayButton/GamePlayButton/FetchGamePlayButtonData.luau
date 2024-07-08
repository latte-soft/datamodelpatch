local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.GameDetailRodux);
local l_ApiFetchGameDetails_0 = v4.GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = v4.FetchGamePlayabilityAndProductInfo;
local l_FetchUserGameVotes_0 = require(l_Parent_0.GameVotesRodux).UserGameVotes.FetchUserGameVotes;
local l_SetNextDataExpirationTime_0 = require(l_Parent_0.NextDataExpirationTimeRodux).SetNextDataExpirationTime;
local l_ApiFetchShowAgeVerificationOverlay_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay;
local l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0 = require(l_Parent_0.SharedFlags).GetFFlagAgeVerificationFlowFromVoiceEligibleGames;
local l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 = require(l_Parent_0.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds;
local l_RunService_0 = game:GetService("RunService");
local v13 = {};
local function v20(v14, v15, v16, v17)
    local v18 = {};
    if l_ApiFetchGameDetails_0.GetFetchingStatus(v15:getState(), v16) ~= l_RetrievalStatus_0.Fetching and (v17 or v15:getState().GameDetails[v16] == nil) then
        table.insert(v18, v15:dispatch(l_ApiFetchGameDetails_0.Fetch(v14, {
            v16
        })));
    end;
    local v19 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v15:getState(), v16);
    if not (not v17 and v19 ~= l_RetrievalStatus_0.NotStarted) or v19 == l_RetrievalStatus_0.Failed then
        table.insert(v18, v15:dispatch(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v14, v16)));
    end;
    if (l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0() and l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v15:getState(), v16) ~= l_RetrievalStatus_0.Fetching) and (v17 or v15:getState().ShowAgeVerificationOverlay[v16] == nil) then
        table.insert(v18, v15:dispatch(l_ApiFetchShowAgeVerificationOverlay_0.Fetch(v14, v16)));
    end;
    if l_FetchUserGameVotes_0.GetFetchingStatus(v15:getState(), v16) ~= l_RetrievalStatus_0.Fetching and (v17 or v15:getState().UserGameVotes[v16] == nil) then
        v15:dispatch(l_FetchUserGameVotes_0.Fetch(v14, v16));
    end;
    return v18;
end;
v13.IsLoading = function(v21, v22)
    local v23 = l_ApiFetchGameDetails_0.GetFetchingStatus(v21, v22);
    if not (v23 ~= l_RetrievalStatus_0.NotStarted) or v23 == l_RetrievalStatus_0.Fetching then
        return true;
    else
        local v24 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v21, v22);
        if not (v24 ~= l_RetrievalStatus_0.NotStarted) or v24 == l_RetrievalStatus_0.Fetching then
            return true;
        else
            if l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0() then
                local v25 = l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v21, v22);
                if not (v25 ~= l_RetrievalStatus_0.NotStarted) or v25 == l_RetrievalStatus_0.Fetching then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v13.Fetch = function(v26, v27)
    return function(v28)
        local v29 = tick();
        local v30 = l_AppPage_0.GameDetail .. v27 .. "playability";
        local v31 = v28:getState().NextDataExpirationTime[v30];
        local v32 = false;
        if not (v31 ~= nil) or v31 < v29 then
            v32 = true;
        end;
        local v33 = v20(v26, v28, v27, v32);
        if #v33 > 0 then
            local v34 = nil;
            if not (not _G.__TESTEZ_RUNNING_TEST__ and not l_RunService_0:IsStudio()) then
                v34 = warn;
            end;
            return l_PromiseUtilities_0.Batch(v33, v34):andThen(function(v35)
                if l_PromiseUtilities_0.CountResults(v35).failureCount == 0 then
                    v29 = tick();
                    v31 = math.floor(v29 + l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0());
                    v28:dispatch(l_SetNextDataExpirationTime_0(v30, v31));
                end;
            end);
        else
            return ;
        end;
    end;
end;
return v13;
