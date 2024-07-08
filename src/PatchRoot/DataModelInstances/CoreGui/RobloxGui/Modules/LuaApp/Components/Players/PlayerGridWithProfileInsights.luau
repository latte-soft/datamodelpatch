local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(script.Parent.PlayerGrid);
local l_ProfileInsightsContextFetchWrapper_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).ProfileInsightsContextFetchWrapper;
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
return function(v7)
    return v2.createElement(l_ProfileInsightsContextFetchWrapper_0, {
        users = v7.entries, 
        searchParameters = v7.searchParameters, 
        renderComponent = function(v8)
            return v2.createElement(v4, v3.Dictionary.join(v7, {
                mappedProfilesInsights = v8
            }));
        end
    });
end;
