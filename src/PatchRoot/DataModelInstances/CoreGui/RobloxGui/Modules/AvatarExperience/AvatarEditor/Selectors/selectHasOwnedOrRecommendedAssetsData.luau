local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils);
return function(v1)
    local l_OwnedItemIdsBySubtype_0 = v1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    local v3 = v0.getAvatarEditorCategoryInfoFromState(v1);
    local v4 = if not v3.SearchUuid then v3.Name else v3.SearchUuid;
    local v5 = v0.getRecommendedKey(v3);
    local v6 = false;
    if (l_OwnedItemIdsBySubtype_0 ~= nil and v4 ~= nil) and l_OwnedItemIdsBySubtype_0[v4] ~= nil then
        v6 = #l_OwnedItemIdsBySubtype_0[v4] > 0;
    end;
    return (not not v3 and not v3.RenderItemTiles or v6) or #(v1.AvatarExperience.AvatarEditor.RecommendedItems[v5] or {}) > 0;
end;
