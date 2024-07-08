local l_GetFFlagUIBloxHideActionBarWhenStickyBarActive_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxHideActionBarWhenStickyBarActive;
game:DefineFastFlag("LuaAppEnableNotificationsEDPTooltip", false);
return function()
    return l_GetFFlagUIBloxHideActionBarWhenStickyBarActive_0() and game:GetFastFlag("LuaAppEnableNotificationsEDPTooltip");
end;
