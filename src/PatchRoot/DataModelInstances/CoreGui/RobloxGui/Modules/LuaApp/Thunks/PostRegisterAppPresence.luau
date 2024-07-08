local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.PostRegisterAppPresence);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local function _()
    return "luaapp.presenceapi.register-app-presence";
end;
return function(v5, v6)
    assert(type(v6) == "string", string.format("PostRegisterAppPresence thunk expects locationId to be a string, was %s", (type(v6))));
    return l_PerformFetch_0.Single("luaapp.presenceapi.register-app-presence", function(_)
        return v2(v5, v6);
    end);
end;
