local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local _ = require(l_Modules_0.LuaApp.Result);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetLocale);
local v6 = require(l_Modules_0.LuaApp.Actions.SetNativeLocaleName);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return {
    GetFetchingStatus = function(v8)
        return l_PerformFetch_0.GetStatus(v8, "luaapp.localesapi.nativelocalename");
    end, 
    Fetch = function(v9)
        return l_PerformFetch_0.Single("luaapp.localesapi.nativelocalename", function(v10)
            return v5(v9):andThen(function(v11)
                if not v11 or not v11[1] then
                    v2.warn("Response from GetLocale is malformed");
                else
                    v10:dispatch(v6(v11[1].generalExperience.nativeName));
                end;
                return v3.resolve({});
            end, function(_)
                return v3.resolve({});
            end);
        end);
    end
};
