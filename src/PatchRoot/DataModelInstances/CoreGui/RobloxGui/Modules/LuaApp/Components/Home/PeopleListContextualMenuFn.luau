local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local v4 = require(l_Packages_0.React);
local v5 = require(l_Packages_0.UserProfiles);
local v6 = require(l_Modules_0.LuaApp.Components.Home.PeopleListContextualMenu);
return function(v7)
    local v8 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v7.user.id
        }, 
        query = v5.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    return v4.createElement(v6, v1.Dictionary.join(v7, {
        combinedName = if not v8.data then nil else v5.Selectors.getCombinedNameFromId(v8.data, v7.user.id)
    }));
end;
