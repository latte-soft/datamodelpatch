local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCard);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ExperienceCard);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.LookTile);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableExperienceWidgets);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v17 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v18 = game:DefineFastFlag("WidgetTileImpressionEvents", false);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagSupportLooksTileFooter);
return function(v20)
    local l_contentType_0 = v20.contentType;
    local l_contentId_0 = v20.contentId;
    local l_index_0 = v20.index;
    local l_refCache_0 = v20.refCache;
    local v27 = l_useSelector_0(function(v25)
        local v26 = v25.AvatarExperience.Common.Widgets.HydratedWidgetData[l_contentType_0];
        if not v26 then
            return nil;
        else
            return v26[tostring(l_contentId_0)];
        end;
    end);
    if v18 then
        local v28 = v13(v12);
        local v29 = (v20.widgetAnalyticsInfo and v20.widgetAnalyticsInfo.organicResultIds) and #v20.widgetAnalyticsInfo.organicResultIds > 0;
        v3.useEffect(function()
            if v29 then
                v28.widgetInteractionV2(v20.widgetAnalyticsInfo, v14.ActionType.ITEM_IMPRESSION);
            end;
        end, {
            v29
        });
    end;
    return v3.createElement(v4.Focusable.Frame, {
        Size = v20.size, 
        BackgroundTransparency = 1, 
        ref = l_refCache_0[l_index_0], 
        NextSelectionRight = if l_index_0 < v20.itemsPerRow then l_refCache_0[l_index_0 + 1] else nil, 
        NextSelectionLeft = if l_index_0 > 1 then l_refCache_0[l_index_0 - 1] else nil, 
        onFocusGained = v20.onFocusGained
    }, {
        WidgetItemTile = if not (l_contentType_0 ~= v7.ContentType.Asset) or l_contentType_0 == v7.ContentType.Bundle then v3.createElement(v8, {
            itemId = if not v27 then nil else tostring(v27.id), 
            itemType = if not v27 then nil else v27.type, 
            index = v20.index, 
            analyticsItemCountPerPage = v20.analyticsItemCountPerPage, 
            analyticsContext = v10.AnalyticsContext.Catalog, 
            widgetAnalyticsInfo = v20.widgetAnalyticsInfo, 
            itemDetailsPeekViewRefs = v20.itemDetailsPeekViewRefs, 
            resultsListRef = v20.resultsListRef, 
            hideItemName = if not v16() then nil else v20.hideItemName
        }) else nil, 
        WidgetLookTile = if l_contentType_0 == v7.ContentType.Look then v3.createElement(v11, {
            lookData = v27, 
            tileContentType = if not v17() then nil else v20.tileContentType, 
            widgetAnalyticsInfo = v20.widgetAnalyticsInfo, 
            isFocusedWidget = if not v19() then nil else v20.widgetFocused
        }) else nil, 
        WidgetExperienceTile = if not not v15() and l_contentType_0 == v7.ContentType.Experience then v3.createElement(v9, {
            universeId = l_contentId_0, 
            name = if not v27 then nil else v27.name, 
            totalUpVotes = if not v27 then nil else v27.totalUpVotes, 
            totalDownVotes = if not v27 then nil else v27.totalDownVotes, 
            playerCount = if not v27 then nil else v27.playerCount, 
            index = v20.index, 
            isHydrated = v27 ~= nil
        }) else nil
    });
end;
