local l_Conversations_0 = require(game:GetService("CorePackages").Workspace.Packages.AppChat).Conversations;
local v1 = require(script.Parent.SendPolicies.SendGameLinkMessagePolicy);
local l_SendMessageUsingPolicy_0 = l_Conversations_0.Thunks.SendMessageUsingPolicy;
return function(v3, v4, v5, v6, v7)
    return l_SendMessageUsingPolicy_0((v1:new(v3, v4, nil, v5 or false, v6 or 0, v7 or 0)));
end;
