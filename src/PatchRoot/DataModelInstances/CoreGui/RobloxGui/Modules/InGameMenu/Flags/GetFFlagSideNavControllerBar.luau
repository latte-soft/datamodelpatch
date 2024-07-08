game:DefineFastFlag("SideNavControllerBar", false);
local v0 = require(script.Parent.GetFFlagIGMGamepadSelectionHistory);
return function()
    return game:GetFastFlag("SideNavControllerBar") and v0();
end;
