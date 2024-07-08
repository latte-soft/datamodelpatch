local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.DiscoveryApi.OmniRecommendationsMetadata);
local v4 = require(l_Actions_0.Games.AddContentMetadata);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Actions_0.Games.SetOmniRecommendationsMetadataRequestStatus);
local v7 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendationsMetadata);
local v8 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v9 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchIconsForOmniData);
local v10 = require(l_Modules_0.Personalization.Games.DataStore.GenerateTopicContents);
local v11 = require(l_Modules_0.LuaApp.ArgCheck);
local v12 = require(script.Parent.ApiFetchOmniRecommendationsMetadataGraphql);
local l_SetGameIcons_0 = require(game:GetService("CorePackages").Workspace.Packages.GameIconRodux).GameIcons.SetGameIcons;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchThumbnails;
local v17 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local function _(v18, v19, v20)
    local v21 = v8.storeForContentType(v18, v19);
    if v21 == nil then
        return nil;
    else
        return v21[tostring(v20)];
    end;
end;
local function _(v23, v24, v25)
    if v23.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
        return nil;
    else
        local v26 = v23.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[v24];
        if v26 == nil then
            return nil;
        else
            return v26[tostring(v25)];
        end;
    end;
end;
local function v66(v28, v29, v30, v31, v32)
    local v33 = v28:getState();
    local v34 = (not not v33.OmniRecommendations and v33.OmniRecommendations[v30]) and v33.OmniRecommendations[v30].sorts[v31] or nil;
    if v34 then
        local v35 = nil;
        local l_topicId_0 = v34.topicId;
        if l_topicId_0 == nil then
            return v5.reject("TopicId for sortIndex " .. tostring(v31) .. " doesn't exist");
        else
            l_topicId_0 = tostring(l_topicId_0);
            v35 = not not v33.Personalization.TopicContents and v33.Personalization.TopicContents[l_topicId_0] or nil;
            if v35 then
                v11.assert(v35 ~= nil, "sortIndexContents always exists after this point");
                if v35.hasMoreRows then
                    local v37 = {};
                    local v38 = #v35.entries + 1;
                    for v39 = v38, math.min(v38 + v32, #v33.OmniRecommendations[v30].sorts[v31].recommendations) do
                        local v40 = v33.OmniRecommendations[v30].sorts[v31].recommendations[v39];
                        local l_contentType_0 = v40.contentType;
                        local l_contentId_0 = v40.contentId;
                        local v43;
                        if v33.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
                            v43 = nil;
                        else
                            local v44 = v33.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[l_contentType_0];
                            v43 = if v44 == nil then nil else v44[tostring(l_contentId_0)];
                        end;
                        l_contentType_0 = false;
                        if v43 ~= nil then
                            l_contentType_0 = v43 == v2.Fetching;
                        end;
                        local l_contentType_1 = v40.contentType;
                        local l_contentId_1 = v40.contentId;
                        local v47 = v8.storeForContentType(v33, l_contentType_1);
                        if not (not (if v47 == nil then nil else v47[tostring(l_contentId_1)] == nil) or l_contentType_0) then
                            table.insert(v37, v40);
                        end;
                    end;
                    if #v37 == 0 then
                        return v5.resolve("nothing new to fetch");
                    else
                        local v48 = {};
                        for _, v50 in ipairs(v37) do
                            if v48[v50.contentType] == nil then
                                v48[v50.contentType] = {};
                            end;
                            v48[v50.contentType][tostring(v50.contentId)] = v2.Fetching;
                        end;
                        v28:dispatch(v6(v48));
                        local v51 = nil;
                        if l_GetFFlagApolloClientFetchExperiences_0() then
                            v51 = if not not v33.ApolloClient and v33.ApolloClient.apolloClient then v33.ApolloClient.apolloClient else v17;
                        end;
                        return (if not l_GetFFlagApolloClientFetchExperiences_0() then v3(v29, v37) else v12(v51, l_topicId_0, v37)):andThen(function(v52)
                            local v53 = if not l_GetFFlagApolloClientFetchExperiences_0() then v52.responseBody else v52.data;
                            v7.fromJsonData(v53):match(function(v54)
                                v28:dispatch(v4(v54));
                                v28:dispatch(v10(v30, l_topicId_0));
                                if l_GetFFlagApolloClientFetchThumbnails_0() then
                                    v28:dispatch(l_SetGameIcons_0(v53.icons));
                                end;
                                v28:dispatch(v9(v29, v54.metadata));
                                local v55 = {};
                                for v56, v57 in pairs(v48) do
                                    v55[v56] = {};
                                    for v58, _ in pairs(v57) do
                                        v55[v56][tostring(v58)] = v2.Failed;
                                    end;
                                end;
                                for v60, v61 in pairs(v54.metadata) do
                                    if not v55[v60] then
                                        v55[v60] = {};
                                    end;
                                    for v62, _ in pairs(v61) do
                                        v55[v60][tostring(v62)] = v2.Done;
                                    end;
                                end;
                                v28:dispatch(v6(v55));
                            end):matchError(function(v64)
                                v28:dispatch(v6(v48, v2.Failed));
                                warn(v64);
                            end);
                            return v5.resolve();
                        end, function(v65)
                            v28:dispatch(v6(v37, v2.Failed));
                            warn(v65);
                            return v5.reject(v65);
                        end);
                    end;
                else
                    return v5.resolve("no more rows to fetch");
                end;
            else
                return v5.reject("TopicContents for id: " .. l_topicId_0 .. " doesn't exist");
            end;
        end;
    else
        return v5.reject("pageType, sortIndex combo doesn't exist");
    end;
end;
return function(v67, v68, v69, v70)
    return function(v71)
        return v66(v71, v67, v68, v69, v70);
    end;
end;
