local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_FetchChatSettings_0 = require(l_script_FirstAncestor_0.Requests).FetchChatSettings;
local l_isAppChatChannelsAPIEnabled_0 = v1.AppChat.Flags.isAppChatChannelsAPIEnabled;
local v4 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
return function(v5, _)
    if not l_isAppChatChannelsAPIEnabled_0() then
        return {
            retrievalStatus = l_FetchChatSettings_0.getStatus(v5)
        };
    else
        return {
            retrievalStatus = v4.rodux.GetMetadata.getStatus(v5)
        };
    end;
end;
