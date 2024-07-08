local l_CompleteExternalNavigationIntoChat_0 = require(game:GetService("CorePackages").Workspace.Packages.AppChat).Actions.CompleteExternalNavigationIntoChat;
return function(v1)
    return {
        completeExternalNavigation = function(v2)
            v1(l_CompleteExternalNavigationIntoChat_0(v2));
        end
    };
end;
