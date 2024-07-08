local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagDispatchGraphqlFeedToRodux);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
game:DefineFastFlag("UseHomeOmniFeedDataLoader5", false);
return function()
    return (v1() and game:GetFastFlag("UseHomeOmniFeedDataLoader5")) and not l_IsPrefetchOneCopyEnabled_0();
end;
