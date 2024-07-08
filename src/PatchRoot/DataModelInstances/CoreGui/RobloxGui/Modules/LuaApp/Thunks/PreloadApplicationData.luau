local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_NetworkProfiler_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkProfiler;
local v10 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v11 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local l_HttpCanceller_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.HttpCanceller;
local v13 = require(l_Modules_0.LuaApp.Components.EventReceivers.EventNetworking);
local v14 = require(l_Modules_0.LuaApp.Thunks.FetchNotificationCount);
local v15 = require(l_Modules_0.LuaApp.Thunks.ApiFetchSiteMessage);
local v16 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteLocalCache);
local v17 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local l_ReportToDiagByCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).ReportToDiagByCountryCode;
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.usersFriendsPresenceOnAppStartup);
local v20 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v21 = require(l_Modules_0.LuaApp.Thunks.FetchHomePageData);
local v22 = require(l_Modules_0.LuaApp.Thunks.FetchGamesPageData);
local v23 = require(l_Modules_0.LuaApp.FlagSettings);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompletePreloadedCacheVarIXP);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v26 = require(l_Modules_0.Personalization.Flags.getFIntLuaAppInitialGameSortsFetchCount);
local v27 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledIXP);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v29 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppExploreSortsConfigurableIXPLayer);
local v30 = require(l_Modules_0.Personalization.Flags.FStringLuaAppExploreApiSortsMigrationLayer);
local _ = function(_)
    return {};
end;
local function v51(v33)
    local l_networkImpl_0 = v33.networkImpl;
    local l_analytics_0 = v33.analytics;
    local l_store_0 = v33.store;
    local l_userId_0 = v33.userId;
    local l_loggingProtocol_0 = v33.loggingProtocol;
    local l_omniRecommendationsRequest_0 = v33.omniRecommendationsRequest;
    local l_prefetchProtocol_0 = v33.prefetchProtocol;
    local v41 = {};
    if l_store_0:getState().Startup.HomePageDataStatus == v8.NotStarted then
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_loading_home");
        end;
        local _ = nil;
        table.insert(v41, (l_store_0:dispatch(v21(l_networkImpl_0, l_omniRecommendationsRequest_0, l_analytics_0, l_userId_0, v33.policyData.getUseOmniRecommendation(), l_loggingProtocol_0, l_prefetchProtocol_0, v20.OmniRecommendationsRequestIntent.LogIn))));
    elseif l_store_0:getState().Startup.FetchHomePageDataStatusAll == v8.Fetching then
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_home_already_loading");
        end;
        local v43 = nil;
        do
            local l_v43_0 = v43;
            table.insert(v41, (v6.new(function(v45, v46)
                l_v43_0 = l_store_0.changed:connect(function(v47, v48)
                    if v48.Startup.FetchHomePageDataStatusAll == v8.Fetching and v47.Startup.FetchHomePageDataStatusAll ~= v48.Startup.FetchHomePageDataStatusAll then
                        if l_v43_0 ~= nil then
                            l_v43_0:disconnect();
                            l_v43_0 = nil;
                        end;
                        if v47.Startup.FetchHomePageDataStatusAll == v8.Done then
                            v45();
                            return ;
                        else
                            v46();
                        end;
                    end;
                end);
            end)));
        end;
    end;
    return v7.Batch(v41):andThen(function(v49)
        if l_loggingProtocol_0 then
            l_loggingProtocol_0:logEventOnce("preload_first_class_end");
        end;
        local l_failureCount_0 = v7.CountResults(v49).failureCount;
        if l_failureCount_0 ~= 0 then
            warn(string.format("%d of %d first-class preloading operations failed", l_failureCount_0, #v41));
            if l_loggingProtocol_0 then
                l_loggingProtocol_0:logEventOnce("preload_first_class_error");
            end;
        end;
    end);
end;
local function v61(v52)
    if v52.loggingProtocol then
        v52.loggingProtocol:logEventOnce("preload_second_class_begin");
    end;
    local l_networkImpl_1 = v52.networkImpl;
    local l_analytics_1 = v52.analytics;
    local l_store_1 = v52.store;
    local l_platform_0 = v52.platform;
    local v57 = {};
    table.insert(v57, l_store_1:dispatch(v14(l_networkImpl_1)));
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if not v24() then
        table.insert(v57, l_store_1:dispatch(v16.Fetch(l_networkImpl_1, 0, l_RobloxLocaleId_0)));
    else
        table.insert(v57, (l_store_1:dispatch(v11(l_IXPService_0, v52.userId)):andThen(function()
            return l_store_1:dispatch(v16.Fetch(l_networkImpl_1, 0, l_RobloxLocaleId_0, l_IXPService_0:GetUserLayerVariables(v10.SearchAutocompleteLayer).variationId));
        end)));
    end;
    if v23.IsLuaGamesPagePreloadingEnabled(l_platform_0) and l_store_1:getState().Startup.GamesPageDataStatus == v8.NotStarted then
        if not v27() then
            table.insert(v57, (l_store_1:dispatch(v22(l_networkImpl_1, l_analytics_1, v26(), nil, nil))));
        else
            table.insert(v57, (l_store_1:dispatch(v11(l_IXPService_0, v52.userId)):andThen(function()
                return l_store_1:dispatch(v22(l_networkImpl_1, l_analytics_1, v26(), nil, if not v27() then nil else l_IXPService_0:GetUserLayerVariables(if not v29() then v10.DiscoverPageAccessLayer else v30).IsExploreApiSortsEnabled));
            end)));
        end;
    end;
    v57 = v5.Dictionary.join(v57, {});
    table.insert(v57, (l_store_1:dispatch(v17(l_networkImpl_1, v52.userId, true))));
    table.insert(v57, l_store_1:dispatch(v15(l_networkImpl_1)));
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        table.insert(v57, (l_store_1:dispatch(v13.NetworkingSquads.GetSquadActive.API({}))));
    end;
    return v7.Batch(v57):andThen(function(v59)
        local l_failureCount_1 = v7.CountResults(v59).failureCount;
        if l_failureCount_1 ~= 0 then
            warn(string.format("%d of %d second-class preloading operations failed", l_failureCount_1, #v57));
        end;
    end);
end;
return function(v62, v63, v64, v65, v66, v67, v68)
    return function(v69)
        if v66 then
            v66:logEventOnce("preload_first_class_begin");
        end;
        local v70 = l_HttpCanceller_0.currentSession();
        local v71 = {
            networkImpl = v62, 
            analytics = v64, 
            store = v69, 
            policyData = v65, 
            platform = v69:getState().Platform, 
            userId = tostring(l_Players_0.LocalPlayer.UserId), 
            loggingProtocol = v66, 
            prefetchProtocol = v68, 
            omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else v63
        };
        return v51(v71):andThen(function()
            l_NetworkProfiler_0:report(l_ReportToDiagByCountryCode_0);
            v19(v69:getState(), v64);
            if v70 ~= l_HttpCanceller_0.currentSession() then
                return ;
            elseif not (not v67 or v67.isInteractive) then
                return v6.new(function(v72)
                    local v73 = nil;
                    v73 = v67.changed:connect(function()
                        if v67.isInteractive then
                            if v73 ~= nil then
                                v73:disconnect();
                                v73 = nil;
                            end;
                            if v70 ~= l_HttpCanceller_0.currentSession() then
                                return ;
                            else
                                v72(v61(v71));
                            end;
                        end;
                    end);
                end);
            else
                return v61(v71);
            end;
        end);
    end;
end;
