local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local l_Requests_0 = l_Modules_0.LuaApp.Http.Requests;
local v4 = require(l_Requests_0.GamesApi.GamesGetSorts);
local v5 = require(l_Requests_0.ExploreApi.ExploreGetSorts);
local v6 = require(l_Requests_0.ExploreApi.ExploreGetSortsMetadata);
local l_ReportToDiagByCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).ReportToDiagByCountryCode;
local v8 = require(l_Actions_0.Games.AddGameSorts);
local v9 = require(l_Actions_0.Games.AppendGameSortsInGroup);
local v10 = require(l_Actions_0.Games.SetGameSortsInGroup);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.LuaApp.Models.GameSort);
local v14 = require(l_Modules_0.LuaApp.Promise);
local v15 = require(l_Actions_0.Games.SetGameSortTokenFetchingStatus);
local v16 = require(l_Modules_0.LuaApp.Actions.Games.SetNextTokenRefreshTime);
local v17 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortStatus);
local v18 = require(l_Modules_0.Personalization.Games.Discovery.SetDiscoveryNextPageId);
local v19 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v20 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local l_homeGameSorts_0 = require(l_CorePackages_0.Workspace.Packages.ApolloLocalState).reactiveVars.homeGameSorts;
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseHomeOmniFeedDataLoader);
local v23 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledByDefault);
local v24 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppAddSortsTopicLayoutDataInAppend);
local v25 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v26 = require(script.Parent.updateGamesSortData);
local l_min_0 = math.min;
local v28 = tonumber(settings():GetFVariable("PercentReportingGamesSortsRTT"));
local function v40(v29, v30, v31)
    local l_responseBody_0 = v31.responseBody;
    if not l_responseBody_0.sorts then
        return -1;
    else
        local v33 = {};
        local v34 = {};
        local v35 = {};
        local v36 = nil;
        local v37 = l_responseBody_0.pageContext and l_responseBody_0.pageContext.pageId;
        for _, v39 in ipairs(l_responseBody_0.sorts) do
            v33[#v33 + 1] = v13.fromJsonData(v39);
            v34[#v34 + 1] = v39.name;
            v35[#v35 + 1] = v39.topicLayoutData;
            if v36 then
                v36 = l_min_0(v36, v39.tokenExpiryInSeconds);
            else
                v36 = v39.tokenExpiryInSeconds;
            end;
        end;
        v30:dispatch(v8(v33));
        if v22() and v29 == v12.GameSortGroups.HomeGames then
            l_homeGameSorts_0(v34 or {});
        end;
        v30:dispatch(v10(v29, v34, v37, v35));
        return v36;
    end;
end;
local function v52(v41, v42, v43, v44, v45)
    if not v44 or #v44 == 0 then
        return v14.reject("No sort data found in response.");
    else
        local v46 = {};
        local v47 = {};
        local v48 = {};
        for v49, v50 in ipairs(v44) do
            local v51 = v13.fromExploreJsonData(v50);
            v46[v49] = v51;
            v47[v49] = v51.name;
            v48[v49] = v51.topicLayoutData;
            if v50.games then
                v26(v41, v42, v50);
                v42:dispatch(v17(v51.name, v19.Done));
            end;
        end;
        v42:dispatch(v8(v46));
        if not v45 then
            v42:dispatch(v10(v43, v47, "", v48));
        else
            v42:dispatch(v9(v43, v47, if not v24() then nil else v48));
        end;
        return v14.resolve();
    end;
end;
local function v66(v53, v54, v55, v56, v57)
    local v58 = v23() or v57;
    local v59 = v56 and v56 ~= "";
    if v58 and v55 == v12.GameSortGroups.GamesList then
        return v6(v53, v25:Get()):andThen(function(v60)
            return v52(v53, v54, v55, (v60 and v60.responseBody) and v60.responseBody.sortMetadata):andThen(function()
                v54:dispatch(v15(v55, v19.Done));
            end);
        end):catch(function()
            v54:dispatch(v15(v55, v19.Failed));
        end);
    elseif v58 and v55 == v12.GameSortGroups.Games then
        if not v59 then
            v25:Refresh();
        end;
        return v5(v53, v56, v25:Get()):andThen(function(v61)
            if not (not v61 or not v61.responseBody) and v61.responseBody.sorts then
                local l_sorts_0 = v61.responseBody.sorts;
                v54:dispatch(v18(v61.responseBody.nextSortsPageToken or ""));
                v54:dispatch(v20(v11.Games));
                return v52(v53, v54, v55, l_sorts_0, v59):andThen(function()
                    return v54:dispatch(v15(v55, v19.Done));
                end);
            else
                return v14.reject("Invalid response");
            end;
        end):catch(function()
            v54:dispatch(v15(v55, v19.Failed));
            return v14.reject("Update failed");
        end);
    else
        return v4(v53, v55):andThen(function(v63)
            local v64 = v40(v55, v54, v63);
            if v64 < 0 then
                v54:dispatch(v15(v55, v19.Failed));
                return v14.reject("No sort data found in response.");
            else
                v54:dispatch(v16(v55, tick() + v64));
                v54:dispatch(v15(v55, v19.Done));
                l_ReportToDiagByCountryCode_0("GamesSorts", "RoundTripTime", v63.responseTimeMs, v28);
                if v55 == v12.GameSortGroups.HomeGames then
                    v54:dispatch(v20(v11.Home));
                elseif v55 == v12.GameSortGroups.Games then
                    v54:dispatch(v20(v11.Games));
                end;
                return v14.resolve();
            end;
        end, function(v65)
            v54:dispatch(v15(v55, v19.Failed));
            return v14.reject(v65);
        end);
    end;
end;
return function(v67, v68, v69, v70)
    return function(v71)
        if v71:getState().RequestsStatus.GameSortTokenFetchingStatus[v68] == v19.Fetching then
            return v14.resolve("Data is fetching.");
        else
            v71:dispatch(v15(v68, v19.Fetching));
            return v66(v67, v71, v68, v69, v70);
        end;
    end;
end;
