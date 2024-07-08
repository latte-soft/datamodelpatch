local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
local l_GetUnreadConversationCount_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).Requests.GetUnreadConversationCount;
return function(v5)
    return function(v6)
        local v7 = v6:getState().Users[v5];
        if v7 then
            v6:dispatch(l_UpdateUsers_0({
                (l_Immutable_0.Set(v7, "isFriend", false))
            }));
            v6:dispatch(l_GetUnreadConversationCount_0.API());
        end;
    end;
end;
