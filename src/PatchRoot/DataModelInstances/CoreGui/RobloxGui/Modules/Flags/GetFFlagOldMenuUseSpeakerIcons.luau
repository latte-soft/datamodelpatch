local v0 = require(script.Parent.GetFFlagOldMenuNewIcons);
game:DefineFastFlag("OldMenuUseSpeakerIcons", false);
return function()
    return v0() and game:GetFastFlag("OldMenuUseSpeakerIcons");
end;
