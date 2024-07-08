local v0 = require(script.Parent.Parent.Flags.getFFlagLuaLinkingSwitchToSettingsApp);
game:DefineFastFlag("EnableToSwitchToSettingsAppWithRouteLua", false);
return function()
    return game:GetFastFlag("EnableToSwitchToSettingsAppWithRouteLua") and v0();
end;
