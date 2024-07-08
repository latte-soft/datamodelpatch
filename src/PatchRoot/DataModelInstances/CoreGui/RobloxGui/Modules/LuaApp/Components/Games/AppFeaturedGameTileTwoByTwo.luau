local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withGridConfig_DEPRECATED_0 = require(l_CorePackages_0.UIBlox).Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_SponsoredGamesRecordClick_0 = v7.SponsoredGamesRecordClick;
local l_AppExperienceActionRow_0 = v7.AppExperienceActionRow;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_BigGameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).BigGameIcons.BigGameIconReducer;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v18 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v19 = require(l_Modules_0.LuaApp.getRatingText);
local v20 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedTile);
local v21 = require(l_Modules_0.LuaApp.Components.Games.FeaturedContentPanel);
local v22 = require(l_Modules_0.LuaApp.Components.Games.FeaturedStaticPanel);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local l_GAME_GRID_CHILD_PADDING_0 = v16.GAME_GRID_CHILD_PADDING;
local v25 = v16.GAME_GRID_CHILD_PADDING * 2;
local v26 = v1.PureComponent:extend("AppFeaturedGameTileTwoByTwo");
v26.validateProps = v3.strictInterface({
    entry = v3.table, 
    index = v3.optional(v3.number), 
    layoutOrder = v3.optional(v3.number), 
    reportGameDetailOpened = v3.optional(v3.callback), 
    reportExperienceLaunched = v3.optional(v3.callback), 
    size = v3.optional(v3.Vector2), 
    position = v3.optional(v3.Vector2), 
    source = v3.optional(v3.string), 
    referralSource = v3.optional(v3.string), 
    hasBackground = v3.optional(v3.boolean), 
    hasActionRow = v3.optional(v3.boolean), 
    isDynamic = v3.optional(v3.boolean), 
    impressionsTag = v3.optional(v3.string), 
    launchExperienceEventContext = v3.optional(v3.string), 
    universeId = v3.optional(v3.string), 
    name = v3.optional(v3.string), 
    creatorName = v3.optional(v3.string), 
    placeId = v3.optional(v3.string), 
    totalUpVotes = v3.optional(v3.number), 
    totalDownVotes = v3.optional(v3.number), 
    gameDetail = v3.optional(v3.table), 
    thumbnail = v3.optional(v3.table), 
    openGameDetails = v3.callback, 
    fetchGameDetails = v3.callback, 
    navigation = v3.any, 
    networking = v3.callback, 
    shouldShowFeaturedTileCreatorName = v3.optional(v3.boolean)
});
v26.init = function(v27)
    v27.isMounted = false;
    v27.gameTileRef = v1.createRef();
    v27.onActivated = function()
        if v27.isMounted then
            v27.props.openGameDetails(v27.props.universeId, {
                source = v27.props.source, 
                index = v27.props.index, 
                onPeekViewClosed = v27.props.onPeekViewClosed
            }, v27.props.navigation);
            local l_index_0 = v27.props.index;
            local l_reportGameDetailOpened_0 = v27.props.reportGameDetailOpened;
            if not (not l_index_0 or not l_reportGameDetailOpened_0) then
                l_reportGameDetailOpened_0(l_index_0);
            end;
            local l_networking_0 = v27.props.networking;
            local l_entry_0 = v27.props.entry;
            if l_entry_0.isSponsored then
                l_SponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
            end;
            return ;
        else
            return ;
        end;
    end;
    v27.renderActionRow = function()
        return v1.createElement(l_AppExperienceActionRow_0, {
            universeId = v27.props.universeId, 
            referralSource = v27.props.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = v27.props.reportExperienceLaunched, 
            openGameDetails = v27.onActivated, 
            entry = v27.props.entry, 
            launchExperienceEventContext = v27.props.launchExperienceEventContext
        });
    end;
    v27.renderBottomPanel = function()
        local l_entry_1 = v27.props.entry;
        local l_name_0 = v27.props.name;
        local l_totalUpVotes_0 = v27.props.totalUpVotes;
        local l_totalDownVotes_0 = v27.props.totalDownVotes;
        local l_gameDetail_0 = v27.props.gameDetail;
        local v37 = (l_gameDetail_0 and l_gameDetail_0.creator) and l_gameDetail_0.creator.hasVerifiedBadge;
        local v38 = (l_gameDetail_0 and l_gameDetail_0.creator) and l_gameDetail_0.creator.id;
        local v39 = not not l_gameDetail_0 and l_gameDetail_0.description or "";
        local l_shouldShowFeaturedTileCreatorName_0 = v27.props.shouldShowFeaturedTileCreatorName;
        local l_isDynamic_0 = v27.props.isDynamic;
        return l_withGridConfig_DEPRECATED_0({
            featuredContentRows = 4
        })(function(v42)
            local v43 = {
                hasBackground = v27.props.hasBackground, 
                contentRows = if not l_isDynamic_0 then nil else v42.featuredContentRows, 
                padding = 8, 
                title = l_name_0, 
                creatorName = if not l_shouldShowFeaturedTileCreatorName_0 then nil else v27.props.creatorName, 
                creatorVerified = v37, 
                creatorId = v38, 
                description = v39, 
                footerData = {
                    rating = v19(l_totalUpVotes_0, l_totalDownVotes_0), 
                    playingCount = l_entry_1.playerCount
                }
            };
            if not l_isDynamic_0 then
                return v1.createElement(v22, v43);
            else
                return v1.createElement(v21, v43);
            end;
        end);
    end;
end;
v26.didMount = function(v44)
    v44.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v44.gameTileRef, v44.props.impressionsTag, v44.props.index);
    v44.props.fetchGameDetails(v44.props.networking, v44.props.universeId);
end;
v26.willUnmount = function(v45)
    v45.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v45.gameTileRef, v45.props.impressionsTag, v45.props.index);
end;
v26.didUpdate = function(v46, v47)
    if not (v47.impressionsTag == v46.props.impressionsTag) or v47.index ~= v46.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v46.gameTileRef, v47.impressionsTag, v47.index);
        l_ImpressionsTagUtility_0.AddTag(v46.gameTileRef, v46.props.impressionsTag, v46.props.index);
    end;
end;
v26.render = function(v48)
    local l_layoutOrder_0 = v48.props.layoutOrder;
    local l_size_0 = v48.props.size;
    local l_position_0 = v48.props.position;
    local l_thumbnail_0 = v48.props.thumbnail;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local v53 = if not l_size_0 then nil else l_size_0.X;
    local v54 = if not l_size_0 then nil else l_size_0.Y;
    local v55 = if not l_size_0 then nil else v53 * 2 + l_GAME_GRID_CHILD_PADDING_0;
    local v56 = if not l_size_0 then nil else v54 * 2 + v25;
    local l_hasBackground_0 = v48.props.hasBackground;
    local v58 = v1.createElement(v20, {
        hasBackground = l_hasBackground_0, 
        hasOutline = l_hasBackground_0, 
        thumbnail = l_thumbnail_0, 
        renderActionRow = if not v48.props.hasActionRow then nil else v48.renderActionRow, 
        renderBottomPanel = v48.renderBottomPanel, 
        onActivated = v48.onActivated
    });
    return v1.createElement("Frame", {
        Position = if not not l_size_0 and l_position_0 then UDim2.fromOffset(l_position_0.X, l_position_0.Y) else nil, 
        Size = if not l_size_0 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v53, 0, v54), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        ref = v48.gameTileRef
    }, {
        FeaturedTile = if not l_size_0 then v58 else v1.createElement("Frame", {
            Size = UDim2.new(0, v55, 0, v56), 
            Position = UDim2.new(0, 0, 0, -v54 - v25), 
            BackgroundTransparency = 1
        }, {
            Tile = v58
        })
    });
end;
return (v17.connectUserLayer({
    not not v23() and v18.PlayerAppSearchResultsPageUXLayer or nil
}, function(v59, _)
    return {
        shouldShowFeaturedTileCreatorName = (v59[v18.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
    };
end)((l_RoactServices_0.connect({
    networking = v15
})((l_withNavigation_0((v2.connect(function(v61, v62)
    local l_universeId_0 = v62.entry.universeId;
    local v64 = v61.Games[l_universeId_0];
    return {
        universeId = l_universeId_0, 
        name = v64.name, 
        creatorName = v64.creatorName, 
        placeId = v64.placeId, 
        totalUpVotes = v64.totalUpVotes, 
        totalDownVotes = v64.totalDownVotes, 
        gameDetail = v61.GameDetails[l_universeId_0], 
        thumbnail = v61[l_BigGameIconReducer_0.key][l_universeId_0]
    };
end, function(v65)
    return {
        openGameDetails = function(v66, v67, v68)
            v65(l_OpenGameDetails_0(v66, v68, v67));
        end, 
        fetchGameDetails = function(v69, v70)
            v65(l_ApiFetchGameDetails_0.Fetch(v69, {
                v70
            }));
        end
    };
end)(v26))))))));
