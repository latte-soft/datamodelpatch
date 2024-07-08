local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local l_Catalog_0 = l_AvatarExperience_0.Catalog;
local _ = require(l_Common_0.Types);
local v9 = require(l_Common_0.Constants);
local v10 = require(l_Common_0.Utils);
local v11 = require(l_Common_0.Components.LoadableGridView);
local v12 = require(l_Modules_0.AvatarExperience.Common.Hooks.useItemInfo);
local v13 = require(l_Catalog_0.Components.ItemsList.BaseItemCard);
local l_useStyle_0 = v4.Core.Style.useStyle;
return function(v15)
    local v16 = l_useStyle_0();
    local v17 = v12(v15.itemId, v15.itemType);
    if v17 then
        assert(v17, "silence type checker");
        local l_includedItems_0 = v17.includedItems;
        if not (l_includedItems_0 ~= nil) or #l_includedItems_0 == 0 then
            return nil;
        else
            assert(l_includedItems_0, "silence type checker");
            local l_LayoutOrder_0 = v15.LayoutOrder;
            local v20 = {};
            for _, v22 in l_includedItems_0, nil, nil do
                if v22.type == v9.ItemType.Asset then
                    table.insert(v20, v22);
                end;
            end;
            if #v20 == 0 then
                return nil;
            else
                local l_Font_0 = v16.Font;
                return v3.createElement(v11, {
                    renderItem = v3.useCallback(function(v24)
                        return v2.createElement(v13, {
                            itemId = v24.id, 
                            itemType = v24.type, 
                            onActivated = function()
                            end
                        });
                    end, {}), 
                    getItemHeight = v10.GridItemHeightGetter(v9.ItemTileType.BundleItemTile, l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize), 
                    items = v20, 
                    LayoutOrder = l_LayoutOrder_0, 
                    totalNumItems = #v20
                });
            end;
        end;
    else
        return nil;
    end;
end;
