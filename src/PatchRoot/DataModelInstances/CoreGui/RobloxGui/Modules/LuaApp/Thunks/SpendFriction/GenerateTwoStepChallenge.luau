local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepSpendFrictionRequests);
return function(v5)
    return l_PerformFetch_0.Single("luaapp.economy.generatetwostepchallenge", function(_)
        return v4.generate(v5):andThen(function(v7)
            return v2.resolve(v7.responseBody);
        end, function(v8)
            return v2.reject(v8);
        end);
    end);
end;
