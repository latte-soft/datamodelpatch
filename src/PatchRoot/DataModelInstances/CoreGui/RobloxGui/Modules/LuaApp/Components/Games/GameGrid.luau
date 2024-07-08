local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local l_GridMetrics_0 = v1.App.Grid.GridMetrics;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_getExperienceTileRelativeHeight_0 = v1.App.Tile.getExperienceTileRelativeHeight;
local l_AspectRatioModeEnum_0 = v1.App.Tile.AspectRatioModeEnum;
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_AppGameTile_0 = v8.AppGameTile;
local l_WideGameTileViewConfig_0 = v8.WideGameTileViewConfig;
local v11 = require(l_CorePackages_0.Symbol);
local v12 = require(l_CorePackages_0.RoactRodux);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.Components.Generic.GridView);
local v22 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local l_FFlagLuaAppGameTileProps_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileProps;
local l_GetFFlagTenFootUiSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSeeAll;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local v26 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppGridTileTabletLayout);
local v27 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local l_getFFlagLuaAppSingleHoveredGridTile_0 = v8.Flags.getFFlagLuaAppSingleHoveredGridTile;
local v31 = v6.PureComponent:extend("GameGrid");
local l_GAME_GRID_CHILD_PADDING_0 = v20.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v20.GAME_GRID_TILE_FOOTER_HEIGHT;
local l_NarrowColumnCount_0 = v20.GridTiles.NarrowColumnCount;
local l_NarrowTileMargin_0 = v20.GridTiles.NarrowTileMargin;
local l_NarrowTileAdditionalOffset_0 = v20.GridTiles.NarrowTileAdditionalOffset;
local v37 = v11.named("TilePlaceHolder");
local l_Square_0 = l_AspectRatioModeEnum_0.Square;
v31.defaultProps = {
    friendFooterEnabled = false, 
    useGridTiles = false, 
    getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    searchResultGrid = false, 
    gameEmphasis = false, 
    source = nil, 
    showFriendActivity = false
};
if l_FFlagLuaAppRefactorOpenGameDetail_0 then
    v31.init = function(v39)
        v39.navigateToGameDetails = function(v40, v41)
            v39.props.openGameDetails(v40, v41, v39.props.navigation);
        end;
    end;
end;
v31.renderItem = function(v42, v43, v44, v45, v46)
    local l_reportGameDetailOpened_0 = v42.props.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v42.props.reportExperienceLaunched;
    local l_source_0 = v42.props.source;
    local l_hideGameStats_0 = v42.props.hideGameStats;
    if not (type(v43) == "table") or not v43.featured then
        if type(v43) == "userdata" and v43 == v37 then
            return v6.createElement("Frame", {
                LayoutOrder = v45, 
                Size = UDim2.new(0, v44.X, 0, v44.Y), 
                BackgroundTransparency = 1
            });
        else
            return v6.createElement(l_AppGameTile_0, {
                layoutOrder = v45, 
                entry = v43, 
                size = if l_FFlagLuaAppGameTileProps_0 then nil else v44, 
                Size = if not l_FFlagLuaAppGameTileProps_0 then nil else UDim2.new(0, v44.X, 0, v44.Y), 
                index = v43.realGameEntryIndex or v45, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hideGameStats = l_hideGameStats_0, 
                referralSource = v42.props.referralSource, 
                rowNum = v46, 
                showFriendActivity = v42.props.showFriendActivity, 
                impressionsTag = v42.props.impressionsTag, 
                friendFooterEnabled = if not v42.props.useGridTiles then nil else v42.props.friendFooterEnabled, 
                useGridTile = v42.props.useGridTiles, 
                launchExperienceEventContext = v42.props.launchExperienceEventContext, 
                playerCountStyle = v42.props.playerCountStyle, 
                isSponsoredFooterAllowed = v42.props.isSponsoredFooterAllowed, 
                topicId = v42.props.topicId, 
                gameTileLayoutType = if not l_getFFlagLuaAppSingleHoveredGridTile_0() then nil else v42.props.gameTileLayoutType, 
                navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v42.navigateToGameDetails, 
                playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v42.props.playButtonStyle
            });
        end;
    else
        return v6.createElement(v22, {
            layoutOrder = v45, 
            entry = v43, 
            size = v44, 
            index = v43.realGameEntryIndex or v45, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            impressionsTag = v42.props.impressionsTag, 
            launchExperienceEventContext = v42.props.launchExperienceEventContext
        });
    end;
end;
v31.render = function(v51)
    local l_entries_0 = v51.props.entries;
    local l_LayoutOrder_0 = v51.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v51.props.numberOfRowsToShow;
    local l_windowSize_0 = v51.props.windowSize;
    local l_screenSize_0 = v51.props.screenSize;
    local l_horizontalAlignment_0 = v51.props.horizontalAlignment;
    local l_searchResultGrid_0 = v51.props.searchResultGrid;
    local v59 = nil;
    local v60 = not not l_searchResultGrid_0 and l_GridMetrics_0.getMediumMetrics or v51.props.getItemMetrics;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if not v51.props.useGridTiles then
        local l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
        v63 = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0 * 2);
        if l_GetFFlagTenFootUiSeeAll_0() and v51.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v63 = Vector2.new(v51.props.cellSpacingHorizontal, v51.props.cellSpacingVertical);
            v61 = if not v27 then l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0, 8).itemWidth else l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v63.X, 8).itemWidth;
        else
            v61 = v60(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
        end;
        if v25() then
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_getExperienceTileRelativeHeight_0(v51.props.style, l_Square_0, 2).Offset;
        end;
        v62 = math.floor(v61 + l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0);
    else
        local v65 = nil;
        local v66 = nil;
        if not v26() then
            v61 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, l_NarrowTileMargin_0, l_NarrowColumnCount_0).itemWidth;
        elseif not v27 then
            v61 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, l_NarrowTileMargin_0, if v51.props.formFactor == l_FormFactor_0.WIDE then v20.GridTiles.WideColumnCount else v20.GridTiles.NarrowColumnCount).itemWidth;
        else
            local v67 = nil;
            if v51.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
                v67 = 5;
                v65 = v51.props.designTokens.Global.Space_300;
                v66 = 51;
            elseif v51.props.formFactor == l_FormFactor_0.WIDE then
                v67 = v20.GridTiles.WideColumnCount;
                v65 = l_NarrowTileMargin_0;
                v66 = l_NarrowTileMargin_0 * 2 + l_NarrowTileAdditionalOffset_0;
            else
                v67 = v20.GridTiles.NarrowColumnCount;
                v65 = l_NarrowTileMargin_0;
                v66 = l_NarrowTileMargin_0 * 2 + l_NarrowTileAdditionalOffset_0;
            end;
            v61 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v65, v67).itemWidth;
        end;
        v62 = l_WideGameTileViewConfig_0.getTileHeight(v51.props.designTokens, v61);
        v63 = if not v27 then Vector2.new(l_NarrowTileMargin_0, l_NarrowTileMargin_0 * 2 + l_NarrowTileAdditionalOffset_0) else Vector2.new(v65, v66);
    end;
    local v68 = Vector2.new(v61, v62);
    if not (not (l_searchResultGrid_0 and #l_entries_0 > 0) or not v51.props.gameEmphasis) then
        v59 = {};
        table.insert(v59, v37);
        table.insert(v59, v37);
        local v69 = math.floor((l_windowSize_0.X + v63.X) / (v68.X + v63.X)) - 2;
        local v70 = 2;
        while v70 < 2 + v69 do
            if v70 <= #l_entries_0 then
                table.insert(v59, v7.Dictionary.join(l_entries_0[v70], {
                    realGameEntryIndex = v70
                }));
            else
                table.insert(v59, v37);
            end;
            v70 = v70 + 1;
        end;
        table.insert(v59, v7.Dictionary.join(l_entries_0[1], {
            featured = true, 
            realGameEntryIndex = 1
        }));
        table.insert(v59, v37);
        for v71 = v70, #l_entries_0 do
            table.insert(v59, v7.Dictionary.join(l_entries_0[v71], {
                realGameEntryIndex = v71
            }));
        end;
    end;
    return v6.createElement(v21, {
        layoutOrder = l_LayoutOrder_0, 
        items = v59 or l_entries_0, 
        renderItem = function(...)
            return v51:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_0, 
        screenSize = l_screenSize_0, 
        itemAbsoluteSize = v68, 
        cellPaddingOffset = v63, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v51.props.onItemsPerRowChanged
    });
end;
if v26() then
    v31 = v12.connect(function(v72, _)
        return {
            formFactor = v72.FormFactor
        };
    end, if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else function(v74)
        return {
            openGameDetails = function(v75, v76, v77)
                v74(l_OpenGameDetails_0(v75, v77, v76));
            end
        };
    end)(v31);
end;
if l_FFlagLuaAppRefactorOpenGameDetail_0 then
    v31 = l_withNavigation_0(v31);
end;
local l_v31_0 = v31;
local l_l_v31_0_0 = l_v31_0 --[[ copy: 39 -> 40 ]];
v31 = function(v80)
    local v81 = l_useDesignTokens_0();
    return v6.createElement(l_l_v31_0_0, (v7.Dictionary.join(v80, {
        uiModeInfo = l_useUiModeInfo_0(), 
        cellSpacingHorizontal = v81.Global.Space_300, 
        cellSpacingVertical = v81.Global.Space_400, 
        designTokens = v81
    })));
end;
if v25() then
    l_v31_0 = v31;
    v31 = function(v82)
        return v6.createElement(l_v31_0, (v7.Dictionary.join(v82, {
            style = l_useStyle_0()
        })));
    end;
end;
return v31;
