local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.SetEquippedInTryOnManager);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_CorePackages_0.tutils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v9 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
return function(v11, v12, v13, v14)
    return function(v15)
        v15:dispatch(v3(v11, v12, if not v10() then nil else v14));
        local v16 = v15:getState();
        local l_Common_0 = v16.AvatarExperience.Common;
        local l_TryOnItems_0 = v16.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v19 = v5.fieldCount(l_TryOnItems_0);
        local v20 = l_TryOnItems_0[v11];
        local v21 = if not v20 then v6.ItemType.Asset else v20.itemType;
        local v22 = nil;
        local v23 = nil;
        if not v9 then
            local v24 = v7(l_Common_0, v11, v21);
            if v24 then
                v22 = v24.priceInRobux;
                v23 = v24.isOwned;
            end;
        else
            local v25 = v8(v16.AvatarExperience, v11, v21);
            if v25 then
                v22 = v25.priceInRobux;
                v23 = v25.isOwned;
            end;
        end;
        local l_TryOnManager_0 = v4.TryOnManager;
        if not v12 then
            v13.avatarShopUnequip(v11, v21, v22, false, v23, l_TryOnManager_0, v19);
            return ;
        else
            v13.avatarShopEquip(v11, v21, v22, false, v23, l_TryOnManager_0, v19);
            return ;
        end;
    end;
end;
