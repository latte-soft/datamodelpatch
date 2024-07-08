local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.hasLayeredHair);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing);
return function()
    return function(v3)
        v3:dispatch(v2((v1(v3:getState()))));
    end;
end;
