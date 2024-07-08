local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local v5 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FFlagCalculateFriendsTileSize_0 = require(l_Parent_0.SharedFlags).FFlagCalculateFriendsTileSize;
local l_UIBlox_0 = v2.UIBlox;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local v13 = l_Roact_0.PureComponent:extend("AddFriendsGridView");
v13.validateProps = l_t_0.strictInterface({
    items = l_t_0.table, 
    windowSize = l_t_0.Vector2, 
    renderAddFriendsTile = l_t_0.callback, 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    itemMargin = l_t_0.optional(l_t_0.integer), 
    getItemMetrics = l_t_0.optional(l_t_0.callback), 
    tileHeightOffset = if not l_FFlagCalculateFriendsTileSize_0 then nil else l_t_0.number
});
v13.defaultProps = {
    layoutOrder = 1, 
    itemMargin = 12, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics
};
v13.init = function(v14)
    v14.renderItem = function(v15, v16)
        local l_itemWidth_0 = v14.props.getItemMetrics(v14.props.windowSize.X, v14.props.itemMargin).itemWidth;
        return v14.props.renderAddFriendsTile(v15, l_itemWidth_0, v14.getItemHeight(l_itemWidth_0), v16);
    end;
    v14.getItemHeight = function(v18)
        if not l_FFlagCalculateFriendsTileSize_0 then
            return v18 + 80;
        else
            return v18 + v14.props.tileHeightOffset;
        end;
    end;
end;
v13.render = function(v19)
    return l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
        getItemHeight = v19.getItemHeight, 
        items = v19.props.items, 
        getItemMetrics = v19.props.getItemMetrics, 
        renderItem = v19.renderItem, 
        itemPadding = Vector2.new(12, 12), 
        maxHeight = math.huge, 
        defaultChildIndex = 1, 
        LayoutOrder = v19.props.layoutOrder
    });
end;
local function v22(v20)
    local v21 = l_useDesignTokens_0();
    return l_Roact_0.createElement(v13, v5.Dictionary.join(v20, {
        tileHeightOffset = if not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) then v21.Global.Space_1000 else v21.Global.Space_800
    }));
end;
if not l_FFlagCalculateFriendsTileSize_0 then
    return v13;
else
    return v22;
end;
