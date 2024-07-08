local v0 = require(game:GetService("CorePackages").Logging);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v6 = require(l_script_FirstAncestor_0.UserGameVotes.GetUserGameVotes);
local v7 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v8 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local function _(v9)
    if v9 == true then
        return v8.VotedUp;
    elseif v9 == false then
        return v8.VotedDown;
    elseif v9 == nil then
        return v8.NotVoted;
    else
        return nil;
    end;
end;
local v11 = {};
local function _(v12)
    return "luaapp.gamesapi.user-game-votes" .. v12;
end;
v11.Fetch = function(v14, v15)
    assert(type(v15) == "string", string.format("FetchUserGameVotes thunk expects universeId to be a string, was %s", (type(v15))));
    return l_PerformFetch_0.Single("luaapp.gamesapi.user-game-votes" .. v15, function(v16)
        return v6(v14, v15):andThen(function(v17)
            local l_responseBody_0 = v17.responseBody;
            if (l_responseBody_0 ~= nil and l_responseBody_0.canVote ~= nil) and l_responseBody_0.reasonForNotVoteable ~= nil then
                local l_userVote_0 = l_responseBody_0.userVote;
                local v20 = if l_userVote_0 == true then v8.VotedUp else if l_userVote_0 == false then v8.VotedDown else if l_userVote_0 == nil then v8.NotVoted else nil;
                if not v20 then
                    v0.warn("Response from GetUserGameVotes is malformed");
                    return v3.reject({
                        HttpError = Enum.HttpError.OK
                    });
                else
                    v16:dispatch(v7(v15, l_responseBody_0.canVote, v20, l_responseBody_0.reasonForNotVoteable));
                    return v3.resolve(v17);
                end;
            else
                v0.warn("Response from GetUserGameVotes is malformed");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v21)
            v16:dispatch(l_SetNetworkingErrorToast_0(v21));
            return v3.reject(v21);
        end);
    end);
end;
v11.GetFetchingStatus = function(v22, v23)
    return l_PerformFetch_0.GetStatus(v22, "luaapp.gamesapi.user-game-votes" .. v23);
end;
return v11;
