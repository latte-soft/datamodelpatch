local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v2 = require(l_script_FirstAncestor_0.Conversations.Thunks.FetchChatSettings);
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingUsers);
local v4 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
return function(v5)
    assert(not v4(), "FetchInitialChatData should not be used when AppChatChannelsAPI is enabled. " .. "Use fetchChatMetadata instead.");
    v5:dispatch(function(v6)
        return v6:dispatch(v3.GetUserV2FromUserId.API(v6:getState().LocalUserId));
    end);
    return v5:dispatch(v2.API()):andThen(function()
        v5:dispatch(v1(true));
    end):catch(function(v7)
        warn("AppChat.Conversations.Thunks.FetchInitialChatData with error: ", (tostring(v7)));
    end);
end;
