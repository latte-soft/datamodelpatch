local v0 = require(game:GetService("CorePackages").Logging);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v6 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
local v7 = require(l_script_FirstAncestor_0.GameVotes.GetGameVotes);
local v8 = {};
local function _(v9)
    return "luaapp.gamesapi.game-votes" .. v9;
end;
v8.Fetch = function(v11, v12)
    assert(type(v12) == "string", string.format("FetchGameVotes thunk expects universeId to be a string, was %s", (type(v12))));
    return l_PerformFetch_0.Single("luaapp.gamesapi.game-votes" .. v12, function(v13)
        return v7(v11, v12):andThen(function(v14)
            local l_responseBody_0 = v14.responseBody;
            if (l_responseBody_0 ~= nil and l_responseBody_0.upVotes ~= nil) and l_responseBody_0.downVotes ~= nil then
                v13:dispatch(v6(v12, l_responseBody_0.upVotes < 0 and 0 or l_responseBody_0.upVotes, l_responseBody_0.downVotes < 0 and 0 or l_responseBody_0.downVotes));
                return v3.resolve(v14);
            else
                v0.warn("Response from GetGameVotes is malformed");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v16)
            v13:dispatch(l_SetNetworkingErrorToast_0(v16));
            return v3.reject(v16);
        end);
    end);
end;
v8.GetFetchingStatus = function(v17, v18)
    return l_PerformFetch_0.GetStatus(v17, "luaapp.gamesapi.game-votes" .. v18);
end;
return v8;
