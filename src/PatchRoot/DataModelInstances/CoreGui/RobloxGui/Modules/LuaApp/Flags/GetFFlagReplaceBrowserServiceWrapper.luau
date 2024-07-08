local l_GetFFlagEnableUnifiedWebViews_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
game:DefineFastFlag("ReplaceBrowserServiceWrapper", false);
return function()
    return l_GetFFlagEnableUnifiedWebViews_0() and game:GetFastFlag("ReplaceBrowserServiceWrapper");
end;
