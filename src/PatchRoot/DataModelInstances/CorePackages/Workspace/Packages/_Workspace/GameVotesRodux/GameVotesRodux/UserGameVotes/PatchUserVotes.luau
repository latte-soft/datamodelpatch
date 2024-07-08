local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v5 = require(l_script_FirstAncestor_0.Enums.ReasonForNotVoteable);
local v6 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local v7 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v8 = require(l_script_FirstAncestor_0.UserGameVotes.GamesPatchUserVotes);
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v11 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local function v19(v14, v15, v16)
    if v15 == v16 then
        return v14;
    else
        local v17 = v14 and v14.upVotes;
        local v18 = v14 and v14.downVotes;
        if v16 == v6.VotedUp then
            v17 = v17 + 1;
            if v15 == v6.VotedDown then
                v18 = v18 - 1;
            end;
        elseif v16 == v6.VotedDown then
            v18 = v18 + 1;
            if v15 == v6.VotedUp then
                v17 = v17 - 1;
            end;
        elseif v16 == v6.NotVoted then
            if v15 == v6.VotedUp then
                v17 = v17 - 1;
            elseif v15 == v6.VotedDown then
                v18 = v18 - 1;
            end;
        end;
        return {
            upVotes = v17, 
            downVotes = v18
        };
    end;
end;
local function _(v20)
    local l_v20_0 = v20;
    if l_v20_0 then
        l_v20_0 = false;
        if v20.HttpError == Enum.HttpError.OK then
            l_v20_0 = v20.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS;
        end;
    end;
    return l_v20_0;
end;
local function v28(v23)
    if (v23 and v23.HttpError == Enum.HttpError.OK) and v23.StatusCode == l_StatusCodes_0.FORBIDDEN then
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpService_0:JSONDecode(v23.Body);
        end);
        if not ((not l_status_0 or not l_result_0) or not l_result_0.errors) then
            for _, v27 in ipairs(l_result_0.errors) do
                if v27.code == 6 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
local function _(v29)
    return "luaapp.gamesapi.patch-user-votes" .. v29;
end;
return {
    getNewGameVotes = v19, 
    Patch = function(v31, v32, v33, v34)
        assert(type(v32) == "string", string.format("PatchUserVotes thunk expects universeId to be a string, was %s", (type(v32))));
        assert(type(v33) == "string", string.format("PatchUserVotes thunk expects vote to be a string, was %s", (type(v33))));
        assert(type(v34) == "string", string.format("PatchUserVotes thunk expects curVote to be a string, was %s", (type(v34))));
        if v33 == v34 then
            return v3.resolve();
        else
            return l_PerformFetch_0.Single("luaapp.gamesapi.patch-user-votes" .. v32, function(v35)
                return v8(v31, v32, v33):andThen(function(v36)
                    local v37 = v19(v35:getState().GameVotes[v32], v34, v33);
                    v35:dispatch(v11(v32, v37.upVotes, v37.downVotes));
                    v35:dispatch(v7(v32, true, v33, ""));
                    return v3.resolve(v36);
                end, function(v38)
                    local l_v38_0 = v38;
                    if l_v38_0 then
                        l_v38_0 = false;
                        if v38.HttpError == Enum.HttpError.OK then
                            l_v38_0 = v38.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS;
                        end;
                    end;
                    if not l_v38_0 then
                        if not v28(v38) then
                            v35:dispatch(l_SetNetworkingErrorToast_0(v38));
                            return v3.reject(v38);
                        else
                            v35:dispatch(v7(v32, false, v34, v5.PlayGame));
                            v35:dispatch(l_SetCurrentToastMessage_0({
                                toastType = l_ToastType_0.NetworkingError, 
                                toastMessage = "Feature.Toast.VoteError.PlayGame"
                            }));
                            return v3.reject(v38);
                        end;
                    else
                        v35:dispatch(v7(v32, false, v34, v5.FloodCheckThresholdMet));
                        v35:dispatch(l_SetCurrentToastMessage_0({
                            toastType = l_ToastType_0.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet"
                        }));
                        return v3.reject(v38);
                    end;
                end);
            end);
        end;
    end, 
    GetPatchingStatus = function(v40, v41)
        return l_PerformFetch_0.GetStatus(v40, "luaapp.gamesapi.patch-user-votes" .. v41);
    end
};
