local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
return function(v5, v6)
    return l_PerformFetch_0.Single("luaapp.economy.fetchtwostepstatus", function(_)
        return v4.configuration(v5, v6):andThen(function(v8)
            local l_responseBody_0 = v8.responseBody;
            if l_responseBody_0.methods ~= nil then
                for _, v11 in ipairs(l_responseBody_0.methods) do
                    if v11.enabled == true then
                        return v2.resolve(true);
                    end;
                end;
            end;
            return v2.resolve(false);
        end, function(v12)
            return v2.reject(v12);
        end);
    end);
end;
