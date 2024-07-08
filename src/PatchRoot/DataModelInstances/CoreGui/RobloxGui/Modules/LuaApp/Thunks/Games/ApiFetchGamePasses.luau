local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Actions.Games.SetGamePasses);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPassesThumbnails);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetPasses);
return function(v7, v8)
    return l_PerformFetch_0.Single("ApiFetchGamePasses" .. v8, function(v9)
        return v6(v7, v8):andThen(function(v10)
            local l_data_0 = v10.responseBody.data;
            v9:dispatch(v2(v8, l_data_0));
            if #l_data_0 > 0 then
                local v12 = {};
                for _, v14 in ipairs(l_data_0) do
                    table.insert(v12, v14.id);
                end;
                v9:dispatch(v5(v7, v12));
            end;
            return v3.resolve(v10);
        end);
    end);
end;
