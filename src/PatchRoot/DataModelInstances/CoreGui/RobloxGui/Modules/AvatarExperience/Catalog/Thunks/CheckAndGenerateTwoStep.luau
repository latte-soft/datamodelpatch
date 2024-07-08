local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Thunks.SpendFriction.FetchTwoStepStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.SpendFriction.GenerateTwoStepChallenge);
return function(v6, v7)
    return l_PerformFetch_0.Single("CheckAndGenerateTwoStep", function(v8)
        return v8:dispatch(v4(v6, v7)):andThen(function(v9)
            if v9 then
                return v8:dispatch(v5(v6)):andThen(function(v10)
                    return v2.resolve({
                        is2SVEnabled = v9, 
                        challengeToken = v10
                    });
                end, function(v11)
                    return v2.reject(v11);
                end);
            else
                return v2.resolve({
                    is2SVEnabled = v9
                });
            end;
        end, function(v12)
            return v2.reject(v12);
        end);
    end);
end;
