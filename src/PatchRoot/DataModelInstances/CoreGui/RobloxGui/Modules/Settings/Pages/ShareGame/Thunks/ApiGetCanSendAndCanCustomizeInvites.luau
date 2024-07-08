local l_GetCanSendAndCanCustomizeInvites_0 = require(game:GetService("CorePackages").Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v2 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest);
return function(v3, v4)
    local v5, v6 = l_GetCanSendAndCanCustomizeInvites_0(v2(l_HttpRbxApiService_0), v3, v4):await();
    if (not v5 or not v6) or not v6.responseBody then
        return false, false;
    else
        return v6.responseBody.canPrompt, v6.responseBody.canCustomize;
    end;
end;
