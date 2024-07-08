local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(script.Parent.ApiFetchOmniRecommendationsGraphql);
local v8 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v9 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_MakeOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.GraphQlShared).MakeOmniRecommendationsRequest;
local v11 = require(l_Actions_0.Games.AddOmniRecommendations);
local v12 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendations);
local v13 = require(l_Modules_0.LuaApp.Promise);
local v14 = require(l_Actions_0.Games.SetOmniRecommendationsRequestStatus);
local v15 = require(l_Actions_0.Games.SetOmniRecommendationsRefreshTime);
local v16 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchIconsForOmniData);
local v17 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v18 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v19 = require(script.Parent.ApiFetchOmniIconsGraphql);
local v20 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local v21 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v22 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagDispatchGraphqlFeedToRodux);
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchThumbnails;
local v26 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local function v51(v28, v29, v30, v31, v32, v33, v34)
    if v28:getState().RequestsStatus.OmniRecommendationsRetrievalStatus[v31] == v9.Fetching then
        return v13.resolve("Data is fetching");
    else
        v28:dispatch(v14(v31, v9.Fetching));
        local v35 = nil;
        v35 = v33 or l_HttpService_0:GenerateGUID(false):lower();
        local v36 = nil;
        if v32 then
            local v37 = v28:getState().OmniRecommendations[v31];
            if v37 then
                v36 = v37.nextPageToken;
                v35 = v37.omniSessionId;
            end;
            if v23() and (not (v36 ~= nil) or v36 == "") then
                v28:dispatch(v14(v31, v9.Done));
                return v13.resolve("nextPageToken is empty");
            end;
        end;
        local v38 = nil;
        if v24() then
            local v39 = v28:getState();
            v38 = if not not v39.ApolloClient and v39.ApolloClient.apolloClient then v39.ApolloClient.apolloClient else v8;
        end;
        local v40 = {};
        for _, v42 in pairs(v18) do
            table.insert(v40, v42);
        end;
        local v43 = nil;
        if not l_IsPrefetchOneCopyEnabled_0() then
            if not v24() then
                v43 = l_MakeOmniRecommendationsRequest_0(v29, v31, v35, v36, v40, v34);
            else
                v22.assert(false, "requestIntent needs to be implemented for GraphQL");
                v43 = v7(v38, v31, v35, v36, v40);
            end;
        else
            v43 = v30(v29, v31, v35, v36, v40, v34);
        end;
        return v43:andThen(function(v44)
            local v45 = if not v24() then v44.responseBody else v44.data.omniFeed;
            if not ((v45 ~= nil and v45.sorts ~= nil) and #v45.sorts ~= 0) or v31 ~= v45.pageType then
                v28:dispatch(v14(v31, v9.Failed));
                return v13.reject("No sort data found in response.");
            else
                (if not v24() then v12.fromJsonData(v45, v35) else v12.fromGraphqlData(v45, v38)):match(function(v46)
                    local v47 = nil;
                    if not v32 then
                        v47 = tick();
                    end;
                    local v48 = nil;
                    if not v26() or not v32 then
                        if not (not v26() or not v45.isPartialFeed) then
                            v48 = v21.OmniResponseType.PartialFeed;
                        end;
                    else
                        v48 = v21.OmniResponseType.Append;
                    end;
                    v28:dispatch(v11(v46, v32, v48));
                    v28:dispatch(v17(v31, nil, v47));
                    if l_GetFFlagApolloClientFetchThumbnails_0() then
                        task.defer(function()
                            v19(v38, v28, v46.metadata);
                        end);
                    end;
                    v28:dispatch(v16(v29, v46.metadata));
                    v28:dispatch(v15(v31, v46.sortsExpirationTime));
                    v28:dispatch(v14(v31, v9.Done));
                    if not (not (v31 == v6.OmniRecommendationsPageType.PAGE_TYPE_HOME) or v32) then
                        v28:dispatch(v20(v5.Home));
                    end;
                end):matchError(function(v49)
                    v28:dispatch(v14(v31, v9.Failed));
                    warn(v49);
                end);
                return v13.resolve();
            end;
        end, function(v50)
            v28:dispatch(v14(v31, v9.Failed));
            return v13.reject(v50);
        end);
    end;
end;
return function(v52, v53, v54, v55, v56, v57)
    return function(v58)
        return v51(v58, v52, v53, v54, v55, v56, v57);
    end;
end;
