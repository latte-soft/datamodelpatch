local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_FetchUserFriendsStarted_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsStarted;
local l_FetchUserFriendsFailed_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsFailed;
local l_FetchUserFriendsCompleted_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsCompleted;
local function v11(v7, v8, v9, v10)
    return l_Immutable_0.JoinDictionaries(v7, {
        [v8] = l_Immutable_0.JoinDictionaries(v7[v8] or {}, {
            [v9] = v10
        })
    });
end;
local function _(v12, v13, v14)
    return v11(v12, "retrievalStatus", v13, v14);
end;
local function _(v16, v17, v18)
    return v11(v16, "retrievalFailureResponse", v17, v18);
end;
return function(v20, v21)
    v20 = v20 or {
        retrievalStatus = {}, 
        retrievalFailureResponse = {}
    };
    if v21.type == l_FetchUserFriendsStarted_0.name then
        return (v11(v20, "retrievalStatus", v21.userId, l_RetrievalStatus_0.Fetching));
    elseif v21.type == l_FetchUserFriendsFailed_0.name then
        return (v11(v11(v20, "retrievalStatus", v21.userId, l_RetrievalStatus_0.Failed), "retrievalFailureResponse", v21.userId, v21.response));
    else
        if v21.type == l_FetchUserFriendsCompleted_0.name then
            v20 = v11(v20, "retrievalStatus", v21.userId, l_RetrievalStatus_0.Done);
        end;
        return v20;
    end;
end;
