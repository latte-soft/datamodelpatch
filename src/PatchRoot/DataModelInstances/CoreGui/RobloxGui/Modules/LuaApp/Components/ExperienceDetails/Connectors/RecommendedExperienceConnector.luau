local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v4.RoactNetworking;
local l_RoactAnalyticsCommonGameEvents_0 = v4.RoactAnalyticsCommonGameEvents;
local l_AppEventIngestService_0 = v4.AppEventIngestService;
local v8 = require(l_CorePackages_0.Packages.t);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_CorePackages_0.Packages.Dash);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v12 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v12.AppPage;
local l_UiMode_0 = v12.UiMode;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_AppGameTile_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).AppGameTile;
local v17 = require(l_CorePackages_0.Cryo);
local l_gamePlayIntent_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceAnalytics).Events.gamePlayIntent;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v22 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local v23 = require(script.Parent.Parent.RecommendedGridRowSettings);
local v24 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v25 = require(l_Modules_0.LuaApp.Constants);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_DEFAULT_RECOMMENDED_GAMES_FETCH_COUNT_0 = v25.DEFAULT_RECOMMENDED_GAMES_FETCH_COUNT;
local l_HomeGames_0 = v25.GameSortGroups.HomeGames;
local v31 = UDim.new(1, 82);
return {
    connect = function(v32, v33)
        return function(v34)
            local v35 = v1.PureComponent:extend("RecommendedExperienceConnector(" .. tostring(v34) .. ")");
            v35.validateProps = v8.strictInterface({
                componentProps = v8.table, 
                universeId = v8.string, 
                recommendEntries = v8.optional(v8.table), 
                sortPageId = v8.optional(v8.string), 
                dispatchGetRecommendedExperiences = v8.callback, 
                openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v8.callback, 
                navigation = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v8.any, 
                networking = v8.callback, 
                eventIngest = v8.table, 
                gameAnalytics = v8.table, 
                gridCarouselHoverTilesEnabled = v8.boolean, 
                relativeHeightWithFooter = if not v26() then nil else v8.UDim
            });
            v35.init = function(v36)
                v36.fetchRecommendedExperiences = function()
                    return v36.props.dispatchGetRecommendedExperiences(v36.props.networking, v36.props.universeId);
                end;
                if l_FFlagLuaAppRefactorOpenGameDetail_0 then
                    v36.navigateToGameDetails = function(v37, v38)
                        v36.props.openGameDetails(v37, v38, v36.props.navigation);
                    end;
                end;
                v36.getItem = function(v39, v40, v41)
                    if not (v40 <= v41.columns) or not v39[v40] then
                        return ;
                    else
                        return v10.assign({
                            index = v40, 
                            count = #v39
                        }, v39[v40]);
                    end;
                end;
                v36.renderItem = function(v42, v43)
                    return v1.createElement(l_AppGameTile_0, {
                        entry = v42, 
                        reportGameDetailOpened = function()
                            v36.props.gameAnalytics.reportOpenGameDetailWithId(v42.placeId, nil, nil, 0, v42.index, v42.count, v42.isSponsored, v42.universeId, l_AppPage_0.ExperienceDetail);
                        end, 
                        showFriendActivity = false, 
                        friendFooterEnabled = true, 
                        hideGameStats = false, 
                        useHoverTile = v36.props.gridCarouselHoverTilesEnabled, 
                        impressionsTag = v43, 
                        index = v42.index, 
                        reportExperienceLaunched = function()
                            l_gamePlayIntent_0(v36.props.eventIngest, v25.AnalyticsContext.ExperienceTile, {
                                placeId = v42.placeId, 
                                rootPlaceId = tonumber(v42.placeId), 
                                sortIndex = tostring(0), 
                                sortEntryIndex = tostring(v42.index)
                            });
                        end, 
                        launchExperienceEventContext = v25.AnalyticsContext.ExperienceTile, 
                        navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v36.navigateToGameDetails
                    });
                end;
            end;
            v35.render = function(v44)
                return l_withLocalization_0({
                    headerTitleText = "Feature.GameDetails.Heading.Recommended"
                })(function(v45)
                    local l_componentProps_0 = v44.props.componentProps;
                    return v1.createElement(v34, v10.assign({}, l_componentProps_0, v33({
                        gridInfo = {
                            headerText = v45.headerTitleText, 
                            kind = v23.Kind.Experiences, 
                            relativeHeight = if not v26() then v31 else v44.props.relativeHeightWithFooter, 
                            data = v44.props.recommendEntries or {}, 
                            getItem = v44.getItem, 
                            renderItem = v44.renderItem
                        }
                    }, l_componentProps_0)));
                end);
            end;
            v35.didMount = function(v47)
                if not (v47.props.recommendEntries ~= nil) or next(v47.props.recommendEntries) == nil then
                    v47.fetchRecommendedExperiences();
                end;
            end;
            v35.didUpdate = function(v48, v49, _)
                if v49.universeId ~= v48.props.universeId and (not (v48.props.recommendEntries ~= nil) or next(v48.props.recommendEntries) == nil) then
                    v48.fetchRecommendedExperiences();
                end;
            end;
            v35 = l_RoactAppPolicy_0.connect(function(v51, _)
                return {
                    gridCarouselHoverTilesEnabled = v51.useGridPageLayout()
                };
            end)((v2.connect(function(v53, v54)
                local l_universeId_0 = v54.universeId;
                return {
                    universeId = l_universeId_0, 
                    recommendEntries = v53.RecommendedGameEntries[l_universeId_0], 
                    sortPageId = v53.GameSortGroups[l_HomeGames_0].pageId
                };
            end, function(v56)
                return {
                    dispatchGetRecommendedExperiences = function(v57, v58)
                        return v56(v24.Fetch(v57, v58, false, {
                            maxRows = l_DEFAULT_RECOMMENDED_GAMES_FETCH_COUNT_0
                        }));
                    end, 
                    openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else function(v59, v60, v61)
                        v56(l_OpenGameDetails_0(v59, v61, v60));
                    end
                };
            end)(v35)));
            if l_FFlagLuaAppRefactorOpenGameDetail_0 then
                v35 = l_withNavigation_0(v35);
            end;
            if v26() then
                local l_v35_0 = v35;
                v35 = function(v63)
                    return v1.createElement(l_v35_0, (v17.Dictionary.join(v63, {
                        relativeHeightWithFooter = if not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) then v31 else UDim.new(1, not l_GetUIBloxEnableFontNameMapping_0() and 96 or 98)
                    })));
                end;
            end;
            return v22(function(v64, v65)
                return v1.createElement(v64, {
                    componentProps = v65, 
                    universeId = v32(v65).universeId
                });
            end)((l_RoactServices_0.connect({
                networking = l_RoactNetworking_0, 
                eventIngest = l_AppEventIngestService_0, 
                gameAnalytics = l_RoactAnalyticsCommonGameEvents_0
            })(v35)));
        end;
    end
};
