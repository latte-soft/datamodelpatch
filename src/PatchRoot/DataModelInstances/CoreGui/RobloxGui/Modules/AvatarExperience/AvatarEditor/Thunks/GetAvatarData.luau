local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Logging);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v9 = game:DefineFastInt("DebugAvatarDataDelay", 0);
return function(v10)
    v5.isType(v10, "function", "GetAvatarData thunk expects networkImpl to be a function");
    return l_PerformFetch_0.Single(v7.GetAvatarDataKey, function(_)
        return v8.GetAvatarData(v10):andThen(function(v12)
            if v9 > 0 then
                task.wait(v9);
            end;
            return v12.responseBody;
        end, function(v13)
            v3.warn("WebApi failure in GetAvatarData: " .. tostring(v13));
            return v6.reject(v13);
        end);
    end);
end;
