local v0 = require(script.Parent.GetFFlagEnableUniversalAppGameInviteUnification);
game:DefineFastFlag("EnableGameInviteModalVRSupportV2", false);
return function()
    return game:GetFastFlag("EnableGameInviteModalVRSupportV2") and v0();
end;
