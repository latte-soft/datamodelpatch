local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
game:DefineFastFlag("LuaAppFixHideSeeAllRefresh", false);
return function()
    return v0() and game:GetFastFlag("LuaAppFixHideSeeAllRefresh");
end;
