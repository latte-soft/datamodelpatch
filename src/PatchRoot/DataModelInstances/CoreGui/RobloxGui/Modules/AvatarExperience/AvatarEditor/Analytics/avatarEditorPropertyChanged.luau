local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
return function(v1, v2, v3, v4, v5, v6, v7)
    assert(type(v2) == "string", "Expected eventContext to be a string");
    assert(type(v3) == "string", "Expected propertyName to be a string");
    local v8 = true;
    if type(v4) ~= "string" then
        v8 = type(v4) == "number";
    end;
    assert(v8, "Expected propertyValue to be a string");
    assert(type(v5) == "number", "Expected currentCategoryIndex to be a number");
    assert(type(v6) == "number", "Expected tabIndex to be a number");
    local v9 = nil;
    if v2 == "EquipAsset" then
        v9 = v0.ActionType.ITEM_CLICK;
    elseif v2 == "UnequipAsset" then
        v9 = v0.ActionType.ITEM_DESELECTED;
    end;
    v1:setRBXEventStream(v2, "marketplaceOrganicFELog", {
        requestId = v7, 
        itemId = v4, 
        actionType = v9, 
        surface = v0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    });
    v1:setRBXEventStream(v2, "avatarEditorPropertyChanged", {
        prop = v3, 
        val = v4, 
        ci = v5, 
        ti = v6
    });
end;
