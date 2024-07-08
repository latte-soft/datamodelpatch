game:DefineFastFlag("LuaAppShowPillContainsStrongLanguage", false);
local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagLuaAppShowPillContainsStrongLanguageIXP);
return function()
    return game:GetFastFlag("LuaAppShowPillContainsStrongLanguage") or v0();
end;
