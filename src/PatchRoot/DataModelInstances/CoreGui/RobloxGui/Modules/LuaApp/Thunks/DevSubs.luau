local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Actions.SetDevSubs);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetDevSubs);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v7 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v8 = require(l_Modules_0.LuaApp.Types.DevSubTypes);
local v9 = require(l_Modules_0.LuaApp.Models.DevSub);
local v10 = {};
local function v11(v12, v13, v14, v15, v16)
    v15 = v15 or {
        subscriptions = {}, 
        games = {}, 
        plans = {}
    };
    return v5(v12, v13, v14, v16):andThen(function(v17)
        if v8.SubscriptionsResponseCheck(v17.responseBody) then
            for _, v19 in pairs(v17.responseBody.data) do
                v15.subscriptions[v19.id] = v19;
            end;
            for _, v21 in pairs(v17.responseBody.auxiliaryData.plans) do
                v15.plans[v21.id] = v21;
            end;
            for _, v23 in pairs(v17.responseBody.auxiliaryData.universes) do
                v15.games[v23.id] = v23;
            end;
            local l_nextPageCursor_0 = v17.responseBody.nextPageCursor;
            if not l_nextPageCursor_0 then
                return v15, true;
            else
                return v11(v12, v13, v14, v15, l_nextPageCursor_0);
            end;
        else
            return nil, false;
        end;
    end);
end;
local function _(v25, v26)
    return v11(v25, v26, v7.Active):andThen(function(v27)
        return v11(v25, v26, v7.Inactive, v27);
    end);
end;
v10.Fetch = function(v29)
    local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
    assert(l_LocalPlayer_0);
    local l_UserId_0 = l_LocalPlayer_0.UserId;
    return l_PerformFetch_0.Single("DevSubs", function(v32)
        local l_v29_0 = v29;
        local l_l_UserId_0_0 = l_UserId_0;
        return v11(l_v29_0, l_l_UserId_0_0, v7.Active):andThen(function(v35)
            return v11(l_v29_0, l_l_UserId_0_0, v7.Inactive, v35);
        end):andThen(function(v36, v37)
            if v37 then
                local v38 = {};
                for v39, _ in pairs(v36.games) do
                    table.insert(v38, v39);
                end;
                v32:dispatch(l_ApiFetchGameIcons_0(v29, v38));
                local v41 = {};
                for _, v43 in pairs(v36.subscriptions) do
                    v43.planData = v36.plans[v43.planId];
                    if v43.planData then
                        v43.gameData = v36.games[v43.planData.universeId];
                        if v43.gameData then
                            table.insert(v41, v9.fromJsonData(v43));
                        end;
                    end;
                end;
                v32:dispatch(v4(v41));
                return v2.resolve();
            else
                return v2.resolve();
            end;
        end, function(v44)
            return v2.reject(v44);
        end);
    end);
end;
v10.GetFetchingStatus = function(v45)
    return l_PerformFetch_0.GetStatus(v45, "DevSubs");
end;
return v10;
