local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCard);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixWidgetGamepadLastRow);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
return (v2.forwardRef(function(v13, v14)
    local v15 = v3.useRefCache();
    local v16 = l_useNavigation_0();
    local v18 = l_useSelector_0(function(v17)
        return v17.Search.SearchesInCatalog[v13.searchUuid];
    end);
    local v19 = v3.useFocusController();
    local l_entryRowIndex_0 = v13.entryRowIndex;
    local l_row_0 = v13.row;
    local l_itemsPerRow_0 = v13.itemsPerRow;
    local l_itemSize_0 = v13.itemSize;
    local l_key_0 = v16.state.key;
    local v25 = v6.ImpressionsEvents.AvatarItems .. (not l_key_0 and "" or string.gsub(l_key_0, "[-{}]", ""));
    local v26 = v18 and v18.keyword;
    local l_Catalog_0 = v7.AnalyticsContext.Catalog;
    if v13.fromSearch then
        l_Catalog_0 = v7.AnalyticsContext.CatalogSearch;
    end;
    local v28 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        })
    };
    for v29, v30 in l_row_0, nil, nil do
        v28[v29] = v2.createElement("Frame", {
            Size = UDim2.fromOffset(l_itemSize_0.X, l_itemSize_0.Y), 
            LayoutOrder = v29, 
            BackgroundTransparency = 1
        }, {
            ["GridItemFrame" .. (l_entryRowIndex_0 - 1) * l_itemsPerRow_0 + v29] = v2.createElement(v3.Focusable.Frame, {
                Size = UDim2.fromOffset(l_itemSize_0.X, l_itemSize_0.Y), 
                BackgroundTransparency = 1, 
                ref = v15[v29], 
                NextSelectionRight = if v29 < l_itemsPerRow_0 then v15[v29 + 1] else nil, 
                NextSelectionLeft = if v29 > 1 then v15[v29 - 1] else nil, 
                onFocusGained = function()
                    if v13.gamepadNavigationFocusPos:getValue().Y ~= v13.entryRowIndex then
                        return ;
                    else
                        v13.setGamepadNavigationFocusPos(Vector2.new(v29, v13.entryRowIndex));
                        if v13.onFocusGained then
                            v13.onFocusGained();
                        end;
                        return ;
                    end;
                end
            }, {
                CatalogItemCard = v2.createElement(v8, {
                    analyticsContext = l_Catalog_0, 
                    analyticsItemCountPerPage = v7.PageFetchLimit, 
                    index = (l_entryRowIndex_0 - 1) * l_itemsPerRow_0 + v29, 
                    itemType = v30.type, 
                    itemId = v30.id, 
                    adTrackingData = v30.encryptedAdTrackingData, 
                    isSponsoredItem = false, 
                    itemDetailsPeekViewRefs = v13.itemDetailsPeekViewRefs, 
                    resultsListRef = v13.gridRef, 
                    impressionsTag = v25, 
                    impressionsSchema = "defaultItem", 
                    impressionsGroup = nil, 
                    impressionsSearch = v26, 
                    impressionsId = v30.id, 
                    hideItemName = if not v11() then nil else v13.hideItemNames, 
                    thumbailAspectRatio = if not v12() then nil else v13.thumbnailAspectRatio, 
                    thumbnailScaleType = if not v12() then nil else v13.thumbnailScaleType, 
                    thumbnailSize = if not v12() then nil else v13.thumbnailSize
                })
            })
        });
    end;
    return v2.createElement(v3.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_itemSize_0.Y + 11), 
        ref = v14, 
        NextSelectionUp = v13.NextSelectionUp, 
        NextSelectionDown = v13.NextSelectionDown, 
        NextSelectionRight = v13.NextSelectionRight, 
        onFocusGained = function()
            v13.setGamepadNavigationFocusPos(Vector2.new(v13.gamepadNavigationFocusPos:getValue().X, v13.entryRowIndex));
            local l_X_0 = v13.gamepadNavigationFocusPos:getValue().X;
            v19.moveFocusTo(if not v10() then v15[l_X_0] else v15[math.min(l_X_0, #l_row_0)]);
        end
    }, v28);
end));
