local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCard);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v10 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v15 = v3.PureComponent:extend("RecommendedItemCard");
v15.didUpdate = function(v16, v17)
    local l_getRecommendedItems_0 = v16.props.getRecommendedItems;
    local l_clearTryOns_0 = v16.props.clearTryOns;
    if v17.purchasingStatus == v10.Fetching and v16.props.purchasingStatus == v10.Done then
        l_getRecommendedItems_0();
        l_clearTryOns_0();
    end;
end;
v15.render = function(v20)
    return v3.createElement(v8, {
        itemId = v20.props.itemId, 
        itemType = v20.props.itemType, 
        index = v20.props.index, 
        analyticsItemCountPerPage = v6.NumRecommendedItems, 
        analyticsContext = v5.AnalyticsContext.AvatarEditorRecommendedItem, 
        itemDetailsPeekViewRefs = v20.props.itemDetailsPeekViewRefs, 
        resultsListRef = v20.props.resultsListRef
    });
end;
return v4.connect(function(v21, v22)
    local v23 = nil;
    if not v13 then
        local v24 = v7(v21.AvatarExperience.Common, v22.itemId, v22.itemType);
        v23 = (not not v24 and v24.product) and tostring(v24.product.id) or "";
    else
        local v25 = v14(v21.AvatarExperience, v22.itemId, v22.itemType);
        v23 = v25 and v25.productId;
    end;
    local v26 = nil;
    if v23 then
        v26 = l_PerformFetch_0.GetStatus(v21, v5.PurchaseProductKey .. v23);
    end;
    return {
        purchasingStatus = v26
    };
end, function(v27)
    return {
        clearTryOns = function()
            v27(v11());
        end
    };
end)(v15);
