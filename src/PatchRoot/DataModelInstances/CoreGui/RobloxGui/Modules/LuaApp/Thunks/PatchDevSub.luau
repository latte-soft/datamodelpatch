local _ = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.LuaApp.Promise);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.DevSubsPatchDevSub);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return {
    Patch = function(v7, v8, v9)
        return l_PerformFetch_0.Single("luaapp.devsubs.cancelsubscription", function(_)
            return v5(v7, v8, v9);
        end);
    end, 
    GetPatchingStatus = function(v11)
        return l_PerformFetch_0.GetStatus(v11, "luaapp.devsubs.cancelsubscription");
    end
};
