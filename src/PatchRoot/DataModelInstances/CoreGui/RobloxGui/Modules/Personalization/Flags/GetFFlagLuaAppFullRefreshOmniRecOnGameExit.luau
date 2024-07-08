local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Flags.GetFFlagLuaAppFullRefreshOmniRecOnGameExitIXP);
game:DefineFastFlag("LuaAppFullRefreshOmniRecOnGameExit", false);
return function()
    return game:GetFastFlag("LuaAppFullRefreshOmniRecOnGameExit") or v0();
end;
