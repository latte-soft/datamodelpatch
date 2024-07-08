local v0 = require(script.Parent.GetFFlagLuaAppSortSubtitlesEnabled);
game:DefineFastFlag("TenFootUiSupportSortSubtitle2", false);
return function()
    return v0() and game:GetFastFlag("TenFootUiSupportSortSubtitle2");
end;
