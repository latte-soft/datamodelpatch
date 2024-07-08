local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v10 = require(l_Modules_0.Personalization.Games.GameSortContainer);
local v11 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v12 = require(l_Modules_0.Personalization.Games.GameSortDataLoader);
local v13 = require(l_Modules_0.LuaApp.mutedError);
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local v17 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppDiscoverPageGrid);
local v18 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
local l_GetFFlagLuaAppUseTooltipsFromSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseTooltipsFromSort;
local v20 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local v21 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local v22 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v6.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v6.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v25 = v2.PureComponent:extend("GameCarouselFeedItem");
v25.validateProps = v4.strictInterface({
    [v11.key] = v11.interface, 
    sortIndex = v4.number, 
    isOmni = v4.boolean, 
    topicLayoutData = v4.optional(v4.table), 
    formFactor = v4.string, 
    sortName = v4.string, 
    itemRowData = v4.optional(v4.table)
});
v25.render = function(v26)
    local l_sortIndex_0 = v26.props.sortIndex;
    local l_sortName_0 = v26.props.sortName;
    local l_formFactor_0 = v26.props.formFactor;
    local l_scrollViewPositionChangedSignal_0 = v26.props[v11.key].scrollViewPositionChangedSignal;
    local l_appPage_0 = v26.props[v11.key].appPage;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = "Narrow";
    if v26.props.topicLayoutData then
        v34 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.ComponentType];
        if v34 then
            if v34 == v14.ComponentTypeDataKeys.EventTile then
                v37 = "Event";
            elseif v34 == v14.ComponentTypeDataKeys.GridTile then
                v37 = "Wide";
            end;
            local v38 = true;
            if v37 ~= "Wide" then
                v38 = v37 == "Event";
            end;
            v32 = v38;
        end;
        if v20 then
            v35 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.LinkPath];
        end;
        v33 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.PlayerCountStyle];
        if l_FFlagLuaAppPlayButtonStyle_0 then
            v36 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.PlayButtonStyle];
        end;
    end;
    local v39 = nil;
    if v26.props.topicLayoutData then
        local v40 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v41 = false;
        if v40 ~= nil then
            v41 = v40 == "true";
        end;
        v39 = v41;
    end;
    local v42 = nil;
    if not (not v18() or not v26.props.topicLayoutData) then
        local v43 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.HideSeeAll];
        local v44 = false;
        if v43 ~= nil then
            v44 = v43 == "true";
        end;
        v42 = v44;
    end;
    local v45 = if not not l_GetFFlagLuaAppUseTooltipsFromSort_0() and v26.props.topicLayoutData then v26.props.topicLayoutData[v14.TopicLayoutDataKeys.InfoText] else nil;
    local v46 = nil;
    if not (not v21 or not v26.props.topicLayoutData) then
        local v47 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.EndTimestamp];
        if v47 then
            v46 = tonumber(v47);
            if v46 == nil then
                v13(string.format("Unable to convert `endTimestamp` to number with value: %s", v47));
            end;
        end;
    end;
    local v48 = nil;
    if not (not v21 or not v26.props.topicLayoutData) then
        v48 = v26.props.topicLayoutData[v14.TopicLayoutDataKeys.CountdownString];
        if not (not (v48 ~= nil and v48 ~= "") or v48:find("{hours}") and v48:find("{minutes}")) then
            v13(string.format("Invalid `countdownString` missing placeholder strings {hours} or {minutes}: %s", v48));
            v48 = nil;
        end;
    end;
    local v49 = nil;
    if l_appPage_0 == v8.Home then
        v49 = true;
    elseif l_appPage_0 == v8.Games then
        v49 = not not v17() or nil;
    end;
    local _ = nil;
    local v51 = {
        gameSortId = l_sortName_0, 
        analyticsIndexOnPage = l_sortIndex_0, 
        itemRowData = if not v22 then nil else v26.props.itemRowData, 
        pageContext = l_appPage_0, 
        sideMargin = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
        scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
        tileHasFriendFooter = true, 
        gridSupportAllowed = v49, 
        useGridTiles = v32, 
        playerCountStyle = v33, 
        isSponsoredFooterAllowed = v39, 
        componentType = v34, 
        linkPath = v35, 
        hideSeeAll = if not v18() then nil else v42, 
        gameTileLayoutType = v37, 
        infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v45, 
        endTimestamp = if not v21 then nil else v46, 
        countdownString = if not v21 then nil else v48, 
        playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v36
    };
    if not v26.props.isOmni or not l_GetFFlagApolloClientFetchExperiences_0() then
        return v2.createElement(v10, v51);
    else
        return v2.createElement(v12, {
            gameSortId = l_sortName_0, 
            containerProps = v51
        });
    end;
end;
return (v3.connect(function(v52, v53)
    local v54 = v53[v11.key];
    local l_appPage_1 = v54.appPage;
    local v56 = nil;
    local v57 = nil;
    if not v53.isOmni then
        local v58 = nil;
        if l_appPage_1 == v8.Home then
            v58 = v6.GameSortGroups.HomeGames;
        elseif l_appPage_1 == v8.Games then
            v58 = v6.GameSortGroups.Games;
        else
            v13("Unsupported page for GameCarouselFeedItem data: " .. tostring(l_appPage_1));
        end;
        v56 = v52.GameSortGroups[v58].sorts[v53.sortIndex];
    else
        assert(l_appPage_1 == v8.Home);
        local v59 = v52.OmniRecommendations[v6.OmniRecommendationsPageType.PAGE_TYPE_HOME];
        local v60 = (not not v59 and v59.sorts or {})[v53.sortIndex];
        if not (not v60 or not v60.topicId) then
            v56 = tostring(v60.topicId);
        end;
    end;
    if v22 then
        v57 = (v52.Personalization.OmniItemsRowData[l_appPage_1] or {})[v54.feedItemPosition];
    end;
    return {
        sortName = v56, 
        itemRowData = if not v22 then nil else v57, 
        formFactor = v52.FormFactor
    };
end)(v25));
