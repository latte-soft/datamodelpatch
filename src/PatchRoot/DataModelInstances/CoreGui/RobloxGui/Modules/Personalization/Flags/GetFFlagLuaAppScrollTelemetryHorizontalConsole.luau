local l_GetFFlagUIBloxResponsiveBaseRowScrollingFrameRef_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxResponsiveBaseRowScrollingFrameRef;
game:DefineFastFlag("LuaAppScrollTelemetryHorizontalConsole", false);
return function()
    return l_GetFFlagUIBloxResponsiveBaseRowScrollingFrameRef_0() and game:GetFastFlag("LuaAppScrollTelemetryHorizontalConsole");
end;
