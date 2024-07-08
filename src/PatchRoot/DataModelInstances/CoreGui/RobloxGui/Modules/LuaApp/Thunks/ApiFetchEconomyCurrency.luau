local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.EconomyGetCurrency);
local v6 = require(l_Modules_0.LuaApp.Actions.SetUserRobux);
return function(v7, v8, v9)
    if type(v8) ~= "string" then
        error("ApiFetchEconomyCurrency thunk expects userId to be a string");
    end;
    return l_PerformFetch_0.Single("com.roblox.economy.users." .. v8 .. ".currency", function(v10)
        local v11 = v10:getState().UserRobux[v8];
        if not v9 and v11 ~= nil then
            return v3.resolve();
        else
            return v5(v7, v8):andThen(function(v12)
                local l_responseBody_0 = v12.responseBody;
                if l_responseBody_0 ~= nil and l_responseBody_0.robux ~= nil then
                    v10:dispatch(v6(v8, l_responseBody_0.robux));
                    return v12;
                else
                    v2.warn("Response from EconomyGetCurrency is malformed");
                    return v3.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            end);
        end;
    end);
end;
