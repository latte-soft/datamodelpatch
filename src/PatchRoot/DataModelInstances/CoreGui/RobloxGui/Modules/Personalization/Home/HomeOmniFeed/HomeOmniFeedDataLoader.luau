local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ApolloClient);
local l_useQuery_0 = v2.useQuery;
local l_useReactiveVar_0 = v2.useReactiveVar;
local v5 = require(l_CorePackages_0.Workspace.Packages.ApolloLocalState);
local l_reactiveVars_0 = v5.reactiveVars;
local l_omniSessionId_0 = l_reactiveVars_0.omniSessionId;
local l_nextPageToken_0 = l_reactiveVars_0.nextPageToken;
local l_homeGameSorts_0 = l_reactiveVars_0.homeGameSorts;
local l_omniFeed_0 = v5.queries.omniFeed.omniFeed;
local l_supportedTreatmentTypes_0 = l_reactiveVars_0.supportedTreatmentTypes;
local l_localSorts_0 = l_reactiveVars_0.localSorts;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.Constants);
local v16 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v17 = require(script.Parent.Hooks.useOmniFeedItems);
local v18 = require(script.Parent.Hooks.useHomePageServices);
local v19 = {
    pageType = v15.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
    sorts = {}
};
return function(v20)
    local v21 = v18();
    local v22 = l_useNavigation_0();
    local v24 = v16(function(v23)
        return {
            isOmni = v23.getUseOmniRecommendation()
        };
    end);
    local v25 = l_useQuery_0(l_omniFeed_0, {
        fetchPolicy = "cache-only", 
        errorPolicy = "all", 
        variables = {
            sessionId = l_useReactiveVar_0(l_omniSessionId_0), 
            nextPageToken = l_useReactiveVar_0(l_nextPageToken_0), 
            pageType = v15.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
            supportedTreatmentTypes = l_useReactiveVar_0(l_supportedTreatmentTypes_0)
        }
    });
    local v26 = if not not v25.data and v25.data.omniFeed then v25.data.omniFeed else v19;
    local v27 = false;
    if v26.nextPageToken ~= nil then
        v27 = false;
        if v26.nextPageToken ~= "" then
            v27 = v24.isOmni;
        end;
    end;
    local v28, v29 = v17(v26, l_localSorts_0, l_homeGameSorts_0, v24.isOmni);
    return v1.createElement(v20.OmniFeedComponent, {
        hasNextPage = v27, 
        recommendationsRequestId = v26.recommendationsId, 
        omniSessionId = v26.omniSessionId, 
        omniFeedItems = v28, 
        hasLocalOmniItems = #v29 > 0, 
        omniItemsGlobalLayoutData = v26.globalLayoutData, 
        addLocalFeedItems = function(v30)
            l_localSorts_0(v30 or {});
        end, 
        isOmni = v24.isOmni, 
        navigation = v22, 
        appAnalytics = v21.appAnalytics, 
        networking = v21.networking, 
        eventIngest = v21.eventIngest, 
        loggingProtocol = v21.loggingProtocol, 
        prefetchProtocol = v21.prefetchProtocol, 
        sessionService = v21.sessionService, 
        appStartupSequence = v21.appStartupSequence
    });
end;
