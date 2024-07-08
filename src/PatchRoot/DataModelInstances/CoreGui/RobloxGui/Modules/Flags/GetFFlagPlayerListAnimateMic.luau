local v0 = require(script.Parent.GetFFlagOldMenuNewIcons);
game:DefineFastFlag("PlayerListAnimateMic", false);
return function()
    return v0() and game:GetFastFlag("PlayerListAnimateMic");
end;
