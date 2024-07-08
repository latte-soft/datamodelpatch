local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local _ = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Actions.SetUserRobux);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.EconomyGetCurrency);
local v7 = game:DefineFastInt("LuaAppPollRobuxBalanceAttempts", 7);
local v8 = game:DefineFastInt("LuaAppPollRobuxBalanceIntervalSec", 2);
local function v9(v10, v11, v12, v13, v14, v15)
    return v6(v11, v12):andThen(function(v16)
        local l_responseBody_0 = v16.responseBody;
        if not (l_responseBody_0 ~= nil) or l_responseBody_0.robux == nil then
            v2.warn("Response from EconomyGetCurrency is malformed");
            v14(v13);
            return ;
        else
            local l_robux_0 = l_responseBody_0.robux;
            if l_robux_0 ~= v13 then
                v10:dispatch(v5(v12, l_robux_0));
                v14(l_robux_0);
                return ;
            elseif v15 > 0 then
                delay(v8, function()
                    v9(v10, v11, v12, v13, v14, v15 - 1);
                end);
                return ;
            else
                v14(v13);
                return ;
            end;
        end;
    end):catch(function()
        v14(v13);
    end);
end;
return function(v19, v20, v21, v22)
    return l_PerformFetch_0.Single("com.roblox.economy.users." .. v20 .. ".currency.poll", function(v23)
        return v9(v23, v19, v20, v21, v22, v7);
    end);
end;
