local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_VerticalTile_0 = v2.App.Tile.VerticalTile;
local l_VerticalTileThumbnail_0 = v2.App.Tile.VerticalTileThumbnail;
return function(v5)
    local v6 = v5.hasBackground or false;
    local v7 = 0;
    if v5.renderActionRow then
        v7 = not v5.hasBackground and 40 or 48;
    end;
    return v1.createElement(l_VerticalTile_0, {
        hasOutline = v5.hasOutline, 
        hasBackground = v6, 
        isHoverEnabled = v6, 
        isOverlayVisible = v6, 
        onActivated = v5.onActivated, 
        renderTopContent = v1.useCallback(function()
            return v1.createElement(l_VerticalTileThumbnail_0, {
                aspectRatio = 1, 
                isTopRounded = true, 
                isBottomRounded = not v6, 
                thumbnail = v5.thumbnail
            });
        end, {
            v5.hasBackground, 
            v5.thumbnail
        }), 
        renderBottomContent = v5.renderBottomPanel, 
        renderFooterRow = v5.renderActionRow, 
        reservedBottomHeight = v7
    });
end;
