local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v3.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2).name] = function(v5, v6)
        v4.isType(v6.itemTypeId, "string", "itemTypeId must be a string.");
        v4.isType(v6.items, "table", "items data must be a table.");
        local l_itemTypeId_0 = v6.itemTypeId;
        local l_items_0 = v6.items;
        local v9 = {};
        for _, v11 in l_items_0, nil, nil do
            local l_id_0 = v11.id;
            if l_id_0 then
                v9[#v9 + 1] = tostring(l_id_0);
            end;
        end;
        return v2.Dictionary.join(v5, {
            [l_itemTypeId_0] = v9
        });
    end
});
