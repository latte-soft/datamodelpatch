local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.Common.memoize);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v6.App.Grid.DefaultMetricsGridView;
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.LuaApp.Components.Passes.PassTile);
local l_GAME_GRID_CHILD_PADDING_0 = v9.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v9.GAME_GRID_TILE_FOOTER_HEIGHT;
local v13 = v2.PureComponent:extend("PassesGrid");
v13.validateProps = v5.strictInterface({
    universeId = v5.string, 
    passes = v5.optional(v5.table), 
    numRows = v5.optional(v5.number), 
    viewWidth = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    passTiles = v5.optional(v5.table)
});
v13.init = function(v14)
    v14.renderPass = function(v15)
        return v2.createElement(v10, v15);
    end;
    v14.getPassesGridItemHeight = function(v16)
        return v16 + l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
    end;
end;
v13.render = function(v17)
    return v2.createElement(l_DefaultMetricsGridView_0, {
        renderItem = v17.renderPass, 
        getItemHeight = v17.getPassesGridItemHeight, 
        getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
        itemPadding = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0), 
        items = v17.props.passTiles, 
        LayoutOrder = v17.props.layoutOrder
    });
end;
local v26 = v4(function(v18, v19, v20, v21)
    local v22 = {};
    if v21 and v21 == 0 then
        return v22;
    else
        if v18 then
            for _, v24 in ipairs(v18) do
                if v24.price ~= nil then
                    local v25 = "";
                    if not (not v19 or not v19[tostring(v24.id)]) then
                        v25 = v19[tostring(v24.id)].url;
                    end;
                    table.insert(v22, {
                        universeId = v20, 
                        pass = v24, 
                        passThumbnail = v25
                    });
                    if not (not v21 or v21 > #v22) then
                        break;
                    end;
                end;
            end;
        end;
        return v22;
    end;
end);
return (v3.connect(function(v27, v28)
    local l_passes_0 = v28.passes;
    local l_universeId_0 = v28.universeId;
    local l_numRows_0 = v28.numRows;
    local l_viewWidth_0 = v28.viewWidth;
    local l_PassesThumbnails_0 = v27.PassesThumbnails;
    local v34 = nil;
    if l_numRows_0 then
        v34 = l_GridMetrics_0.getSmallMetrics(l_viewWidth_0, l_GAME_GRID_CHILD_PADDING_0).itemsPerRow * l_numRows_0;
    end;
    return {
        passTiles = v26(l_passes_0, l_PassesThumbnails_0, l_universeId_0, v34)
    };
end)(v13));
