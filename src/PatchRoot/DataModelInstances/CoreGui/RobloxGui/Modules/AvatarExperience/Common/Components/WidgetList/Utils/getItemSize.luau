local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v5, v6, v7, v8)
    local l_Font_0 = v5.Font;
    return Vector2.new(v7, v2.GridItemHeightGetter(if not v3() then v1.ItemTileType.CatalogItemTile else v8 or v1.ItemTileType.CatalogItemTile, l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, v6)(v7));
end;
