game:DefineFastFlag("OmniLoadMoreHeuristicMount2", false);
local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagRSFLoadMoreFix);
return function()
    return v0() and game:GetFastFlag("OmniLoadMoreHeuristicMount2");
end;
