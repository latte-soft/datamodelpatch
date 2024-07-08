local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Components.Generic.GridView);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local v10 = require(l_Modules_0.LuaApp.Components.UserSearch.UserSearchTileUniversalWrapper.Container);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GetFFlagTenFootUiPlayerSearch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiPlayerSearch;
local l_GetFFlagFixTenFootUiPlayerSearchTileHeight_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixTenFootUiPlayerSearchTileHeight;
local l_GAME_GRID_CHILD_PADDING_0 = v6.GAME_GRID_CHILD_PADDING;
local l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0 = v6.PLAYER_GRID_TILE_FOOTER_HEIGHT;
local v17 = v3.PureComponent:extend("PlayerGrid");
v17.validateProps = v5.strictInterface({
    entries = v5.table, 
    LayoutOrder = v5.optional(v5.integer), 
    numberOfRowsToShow = v5.optional(v5.integer), 
    windowSize = v5.Vector2, 
    horizontalAlignment = v5.optional(v5.enum(Enum.HorizontalAlignment)), 
    searchParameters = v5.table, 
    impressionsTag = v5.string, 
    mappedProfilesInsights = v5.optional(v5.table), 
    uiModeInfo = if not l_GetFFlagTenFootUiPlayerSearch_0() then nil else v5.table, 
    cellSpacingHorizontal = if not l_GetFFlagTenFootUiPlayerSearch_0() then nil else v5.integer, 
    cellSpacingVertical = if not l_GetFFlagTenFootUiPlayerSearch_0() then nil else v5.integer, 
    tileHeightOffset = if not not l_GetFFlagTenFootUiPlayerSearch_0() and l_GetFFlagFixTenFootUiPlayerSearchTileHeight_0() then v5.integer else nil, 
    Analytics = v5.any
});
v17.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    mappedProfilesInsights = {}
};
v17.renderItem = function(v18, v19, v20, v21)
    return v3.createElement(v10, {
        index = v21, 
        user = v19, 
        size = UDim2.new(0, v20.X, 0, v20.Y), 
        searchParameters = v18.props.searchParameters, 
        hasEmphasis = v19.featured or false, 
        impressionsTag = v18.props.impressionsTag, 
        profileInsight = v18.props.mappedProfilesInsights[v19.id], 
        Analytics = v18.props.Analytics
    });
end;
v17.render = function(v22)
    local l_entries_0 = v22.props.entries;
    local l_LayoutOrder_0 = v22.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v22.props.numberOfRowsToShow;
    local l_windowSize_0 = v22.props.windowSize;
    local l_horizontalAlignment_0 = v22.props.horizontalAlignment;
    local v28 = nil;
    local l_itemWidth_0 = l_GridMetrics_0.getMediumMetrics(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
    local v30 = Vector2.new(l_itemWidth_0, (math.floor(l_itemWidth_0 + l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0)));
    local v31 = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0 * 2);
    if #l_entries_0 == 1 then
        v28 = {
            v4.Dictionary.join(l_entries_0[1], {
                featured = true
            })
        };
        local l_itemWidth_1 = l_GridMetrics_0.getLargeMetrics(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
        v30 = Vector2.new(l_itemWidth_1, l_itemWidth_1 + l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0);
    end;
    if l_GetFFlagTenFootUiPlayerSearch_0() and v22.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        l_itemWidth_0 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v22.props.cellSpacingHorizontal, 6).itemWidth;
        v30 = Vector2.new(l_itemWidth_0, (math.floor(l_itemWidth_0 + (not l_GetFFlagFixTenFootUiPlayerSearchTileHeight_0() and 124 or v22.props.tileHeightOffset))));
        v31 = Vector2.new(v22.props.cellSpacingHorizontal, v22.props.cellSpacingVertical);
    end;
    return v3.createElement(v7, {
        layoutOrder = l_LayoutOrder_0, 
        items = v28 or l_entries_0, 
        renderItem = function(...)
            return v22:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_0, 
        itemAbsoluteSize = v30, 
        cellPaddingOffset = v31, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0
    });
end;
if l_GetFFlagTenFootUiPlayerSearch_0() then
    local l_v17_0 = v17;
    v17 = function(v34)
        local v35 = l_useDesignTokens_0();
        return v3.createElement(l_v17_0, (v4.Dictionary.join(v34, {
            uiModeInfo = l_useUiModeInfo_0(), 
            cellSpacingHorizontal = v35.Global.Space_300, 
            cellSpacingVertical = v35.Global.Space_400, 
            tileHeightOffset = if not l_GetFFlagFixTenFootUiPlayerSearchTileHeight_0() then nil else v35.Global.Space_800
        })));
    end;
end;
return v17;
