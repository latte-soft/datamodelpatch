local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v2 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local l_isSubjectToDesktopPolicies_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v5 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local v6 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
local v7 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsAlwaysWithFindFriends);
local v22 = {
    fromLocalData = function(v8, v9, v10, v11)
        return {
            orderHint = v8, 
            treatmentType = v9, 
            treatmentProps = v10, 
            numberOfRows = if not v5 then nil else v11 or 1, 
            dataSource = v1.DataSource.Local
        };
    end, 
    fromGamesApi = function(v12, v13, v14)
        return {
            treatmentType = v2.Carousel, 
            numberOfRows = if not v5 then nil else 1, 
            itemId = {
                sortName = v13, 
                sortIndex = v12
            }, 
            treatmentProps = {
                sortIndex = v12, 
                isOmni = false, 
                topicLayoutData = v14
            }, 
            dataSource = v1.DataSource.GamesApi
        };
    end, 
    fromDiscoveryApi = function(v15, v16)
        local l_treatmentType_0 = v16.treatmentType;
        local v18 = {
            treatmentType = l_treatmentType_0, 
            numberOfRows = if not v5 then nil else v16.numberOfRows, 
            dataSource = v1.DataSource.DiscoveryApi, 
            itemId = if not v6() then nil else {
                topicId = v16.topicId, 
                sortIndex = v15
            }
        };
        if not (l_treatmentType_0 ~= v2.Carousel) or l_treatmentType_0 == v2.AvatarCarousel then
            if not v6() then
                v18.itemId = {
                    topicId = v16.topicId, 
                    sortIndex = v15
                };
            end;
            v18.treatmentProps = {
                sortIndex = v15, 
                topicLayoutData = v16.topicLayoutData, 
                isOmni = true
            };
            return v18;
        elseif l_treatmentType_0 == v2.HomeGameGrid then
            if not v6() then
                v18.itemId = {
                    topicId = v16.topicId, 
                    sortIndex = v15
                };
            end;
            v18.treatmentProps = {
                sortIndex = v15, 
                topicId = v16.topicId, 
                topicName = v16.topic, 
                topicLayoutData = v16.topicLayoutData, 
                numberOfRows = v16.numberOfRows
            };
            return v18;
        elseif l_treatmentType_0 == v2.JoinYourFriendsCarousel then
            v18.treatmentProps = {
                topicId = v16.topicId, 
                topicLayoutData = if not v7() then nil else v16.topicLayoutData
            };
            return v18;
        else
            if not l_isSubjectToDesktopPolicies_0() and l_treatmentType_0 == v2.FriendRecommendationCarousel then
                v18.treatmentProps = {
                    sortIndex = v15, 
                    carouselTitle = v16.topic, 
                    topicLayoutData = v16.topicLayoutData
                };
            end;
            return v18;
        end;
    end, 
    getUniqueNameForAnalytics = function(v19)
        if v19 then
            if v19.treatmentType then
                if v19.treatmentType == v2.Carousel then
                    local l_itemId_0 = v19.itemId;
                    if not l_itemId_0.topicId then
                        if l_itemId_0.sortName then
                            return "sortId:" .. l_itemId_0.sortName .. "_" .. l_itemId_0.sortIndex;
                        end;
                    else
                        return "topicId:" .. l_itemId_0.topicId .. "_" .. l_itemId_0.sortIndex;
                    end;
                end;
                if v19.treatmentType == v2.HomeGameGrid then
                    local l_itemId_1 = v19.itemId;
                    if l_itemId_1.topicId then
                        return "GameGrid_topicId:" .. l_itemId_1.topicId .. "_" .. l_itemId_1.sortIndex;
                    end;
                end;
                return "type:" .. v19.treatmentType;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end
};
v22.getUniqueNameForFeed = function(v23)
    return v22.getUniqueNameForAnalytics(v23);
end;
v22.fromSearchApi = function(v24, v25, v26)
    return {
        treatmentType = if v24 == "Game" then v2.SearchGameGrid else if v24 == "Text" then v2.SearchText else nil, 
        itemId = v26, 
        treatmentProps = {
            searchUuid = v25, 
            topicId = v26
        }, 
        dataSource = v1.DataSource.SearchApi
    };
end;
return v22;
