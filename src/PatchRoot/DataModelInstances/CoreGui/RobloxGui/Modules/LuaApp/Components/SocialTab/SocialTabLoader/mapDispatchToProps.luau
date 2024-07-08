local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0.RobloxGui.Modules;
local l_ReceivedCanShowUserAlias_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Http.RoduxAliases.Actions.ReceivedCanShowUserAlias;
return function(v4)
    return {
        receivedCanShowUserAlias = function(v5)
            v4(l_ReceivedCanShowUserAlias_0(v5));
        end
    };
end;
