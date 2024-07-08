local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeAsset);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v5, v6, v7)
    return function(v8)
        local l_EquippedAssets_0 = v8:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        v5 = tostring(v5);
        v6 = tostring(v6);
        if v3.isAssetEquipped(v6, v5, l_EquippedAssets_0) then
            v8:dispatch(v2(v5, v6, v7));
        end;
        v8:dispatch(v1(v5, v6));
    end;
end;
