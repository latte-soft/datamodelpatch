local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v3 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.LockCharacterUpdates);
local v4 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v5 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
return function(v6, v7, v8, v9)
    return function(v10)
        local v11 = v10:getState();
        if not (v11.AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates or not v11.AvatarExperience.AvatarEditor.Character.EquippedAssets) then
            v10:dispatch(v2(v7.opaque.name));
            v10:dispatch(v4(v8.avatarRefineButtonTap));
            if v9 then
                v9();
            end;
            v10:dispatch(v5(function()
                v10:dispatch(v3());
                v6.navigate(v1.LayeredClothingSort);
            end));
            return ;
        else
            return ;
        end;
    end;
end;
