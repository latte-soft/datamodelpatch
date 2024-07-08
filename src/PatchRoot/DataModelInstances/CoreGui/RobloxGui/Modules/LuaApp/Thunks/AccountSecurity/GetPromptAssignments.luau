local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetPromptAssignments);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return function(v4)
    return l_PerformFetch_0.Single("GetPromptAssignments", function(_)
        return v2(v4):andThen(function(v6)
            return v6.responseBody;
        end);
    end);
end;
