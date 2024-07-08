local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Actions.SetGameBadges);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.BadgesGetBadges);
return function(v6, v7)
    return l_PerformFetch_0.Single("ApiFetchGameBadges" .. v7, function(v8)
        return v5(v6, v7):andThen(function(v9)
            v8:dispatch(v2(v7, v9.responseBody.data));
            return v3.resolve(v9);
        end);
    end);
end;
