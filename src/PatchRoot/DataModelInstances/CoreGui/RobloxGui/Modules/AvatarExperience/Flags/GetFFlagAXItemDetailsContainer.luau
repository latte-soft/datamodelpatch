local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
game:DefineFastFlag("AXItemDetailsContainer", false);
local v1 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
return function()
    if v1 then
        return game:GetFastFlag("AXItemDetailsContainer");
    else
        return false;
    end;
end;
