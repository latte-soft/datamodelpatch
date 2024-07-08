local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Rodux);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
return v3.createReducer({
    retrievalStatus = l_RetrievalStatus_0.NotStarted, 
    chatEnabled = true
}, {
    [require(l_script_FirstAncestor_0.Actions.FetchChatSettingsCompleted).name] = function(v6, v7)
        return l_Immutable_0.JoinDictionaries(l_Immutable_0.Set(v6, "retrievalStatus", l_RetrievalStatus_0.Done), v7.settings);
    end, 
    [require(l_script_FirstAncestor_0.Conversations.Thunks.FetchChatSettings).Succeeded.name] = function(v8, v9)
        return l_Immutable_0.JoinDictionaries(v8, v9.responseBody);
    end, 
    [v2.rodux.GetMetadata.Succeeded.name] = function(v10, v11)
        return l_Immutable_0.JoinDictionaries(v10, {
            chatEnabled = v11.responseBody.isChatEnabled, 
            retrievalStatus = l_RetrievalStatus_0.Done
        });
    end
});
