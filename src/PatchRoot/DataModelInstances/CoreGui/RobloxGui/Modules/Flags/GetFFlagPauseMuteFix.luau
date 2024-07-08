local v0 = require(script.Parent.GetFFlagOldMenuNewIcons);
game:DefineFastFlag("PauseMuteFixV2", false);
return function()
    return v0() and game:GetFastFlag("PauseMuteFixV2");
end;
