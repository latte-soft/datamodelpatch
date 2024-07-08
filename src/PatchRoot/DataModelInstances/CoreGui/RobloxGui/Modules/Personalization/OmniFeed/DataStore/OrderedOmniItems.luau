local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v5 = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v9 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed);
local v10 = require(l_Modules_0.Personalization.OmniFeed.DataStore.OrderedOmniItemsUtility);
local v11 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v13 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v14 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v15 = require(l_CorePackages_0.Logging);
local v16 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled);
local v17 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppAddSortsTopicLayoutDataInAppend);
local v18 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local v19 = require(l_Modules_0.LuaApp.mutedError);
local v20 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
return function(v21, v22)
    v21 = v21 or {};
    if v22.type == v3.name then
        for v23, v24 in pairs(v22.recommendations) do
            if v23 == v6.OmniRecommendationsPageType.PAGE_TYPE_HOME then
                assert(v23 == v24.pageType);
                local l_Home_0 = v7.Home;
                local v26 = v21[l_Home_0] or {};
                if v20() and v22.omniResponseType == v13.OmniResponseType.PartialFeed then
                    local v27 = {};
                    local v28 = {};
                    for v29 = 1, #v26.allItems do
                        local v30 = v26.allItems[v29];
                        local l_v30_0 = v30;
                        if v30.dataSource == v13.DataSource.DiscoveryApi then
                            local l_topicId_0 = v30.itemId.topicId;
                            local l_sortIndex_0 = v30.itemId.sortIndex;
                            if not v27[l_topicId_0] then
                                local v34 = v14.getSortDataForTopicId(l_topicId_0, v22.recommendations[l_Home_0].sorts);
                                if v34 then
                                    local l_retrievalStatus_0 = v34.retrievalStatus;
                                    if l_retrievalStatus_0 == v13.OmniSortRetrievalStatus.Success then
                                        l_v30_0 = v11.fromDiscoveryApi(l_sortIndex_0, v34);
                                        v27[l_topicId_0] = true;
                                    elseif l_retrievalStatus_0 ~= v13.OmniSortRetrievalStatus.Exception then
                                        v15.warn("Unexpected retrievalStatus from omni-recommendations API");
                                    end;
                                end;
                                table.insert(v28, l_v30_0);
                            end;
                        else
                            table.insert(v28, l_v30_0);
                        end;
                    end;
                    v26.allItems = v28;
                    return (v2.Dictionary.join(v21, {
                        [l_Home_0] = v26
                    }));
                else
                    local l_sorts_0 = v24.sorts;
                    local v37 = {};
                    local v38 = nil;
                    local v39 = nil;
                    v38 = #l_sorts_0;
                    v39 = v26.omniRecommendationsSortsCount or 0;
                    for v40, v41 in ipairs(l_sorts_0) do
                        if not v20() and v22.isAppend or v20() and v22.omniResponseType == v13.OmniResponseType.Append then
                            v40 = v40 + v39;
                        end;
                        table.insert(v37, (v11.fromDiscoveryApi(v40, v41)));
                    end;
                    local v42 = nil;
                    if not v20() and v22.isAppend or v20() and v22.omniResponseType == v13.OmniResponseType.Append then
                        v37 = v2.List.join(v26.allItems or {}, v37);
                        v42 = v39 + v38;
                    else
                        v42 = v38;
                    end;
                    v21 = v2.Dictionary.join(v21, {
                        [l_Home_0] = v2.Dictionary.join(v26, {
                            allItems = v10.combineOmniFeedItems(v26.localItems or {}, v37), 
                            omniRecommendationsSortsCount = v42
                        })
                    });
                end;
            end;
        end;
        return v21;
    else
        if v22.type == v4.name then
            local v43 = nil;
            if v22.groupId == v6.GameSortGroups.HomeGames then
                v43 = v7.Home;
            elseif v22.groupId == v6.GameSortGroups.Games then
                v43 = v7.Games;
            end;
            if v43 ~= nil then
                local v44 = {};
                for v45, v46 in ipairs(v22.sorts) do
                    table.insert(v44, (v11.fromGamesApi(v45, v46, v22.sortsTopicLayoutData and v22.sortsTopicLayoutData[v45])));
                end;
                local v47 = v21[v43] or {};
                return (v2.Dictionary.join(v21, {
                    [v43] = v2.Dictionary.join(v47, {
                        allItems = v10.combineOmniFeedItems(v47.localItems or {}, v44)
                    })
                }));
            end;
        elseif v16() and v22.type == v5.name then
            if v22.groupId ~= v6.GameSortGroups.Games then
                v19("Appending sort groups is only supported for the games group");
                return v21;
            else
                local l_Games_0 = v7.Games;
                local v49 = v21[l_Games_0] and v21[l_Games_0].allItems;
                local v50 = 0;
                if v49 then
                    v50 = #v49;
                end;
                local v51 = {};
                for v52, v53 in ipairs(v22.sorts) do
                    local v54 = nil;
                    if v17() then
                        v54 = v22.sortsTopicLayoutData and v22.sortsTopicLayoutData[v52];
                    end;
                    table.insert(v51, (v11.fromGamesApi(v50 + v52, v53, if not v17() then nil else v54)));
                end;
                if v49 then
                    v51 = v2.List.join(v49, v51);
                end;
                local v55 = v21[l_Games_0] or {};
                return (v2.Dictionary.join(v21, {
                    [l_Games_0] = v2.Dictionary.join(v55, {
                        allItems = v10.combineOmniFeedItems(v55.localItems or {}, v51)
                    })
                }));
            end;
        elseif v22.type == v8.name then
            local v56 = {};
            if v22.localItems then
                for _, v58 in ipairs(v22.localItems) do
                    table.insert(v56, (v11.fromLocalData(v58.orderIndex, v58.treatmentType, v58.treatmentProps, if not v18 then nil else v58.numberOfRows)));
                end;
            end;
            table.sort(v56, function(v59, v60)
                if v59.orderHint ~= nil and v60.orderHint ~= nil then
                    return v59.orderHint < v60.orderHint;
                elseif v59.orderHint ~= nil then
                    return true;
                else
                    return false;
                end;
            end);
            local v61 = v21[v22.appPage] or {};
            return (v2.Dictionary.join(v21, {
                [v22.appPage] = v2.Dictionary.join(v61, {
                    hasLocalItems = true, 
                    localItems = v56, 
                    allItems = v10.combineOmniFeedItems(v56, v61.allItems)
                })
            }));
        elseif v22.type == v9.name then
            local v62 = {
                allItems = {}, 
                localItems = {}
            };
            if not v21[v7.SearchPage] then
                v21 = v2.Dictionary.join(v21, {
                    [v7.SearchPage] = {
                        [v22.searchUuid] = v62
                    }
                });
            elseif not v21[v7.SearchPage][v22.searchUuid] then
                v21[v7.SearchPage][v22.searchUuid] = v62;
            else
                for _, v64 in ipairs(v21[v7.SearchPage][v22.searchUuid].allItems) do
                    if v22.topicId == v64.treatmentProps.topicId then
                        return v21;
                    end;
                end;
            end;
            v21 = v2.Dictionary.join(v21, {
                [v7.SearchPage] = v2.Dictionary.join(v21[v7.SearchPage], {
                    [v22.searchUuid] = {
                        allItems = v2.List.join(v21[v7.SearchPage][v22.searchUuid].allItems, {
                            (v11.fromSearchApi(v22.contentGroupType, v22.searchUuid, v22.topicId))
                        }), 
                        localItems = {}
                    }
                })
            });
        end;
        return v21;
    end;
end;
