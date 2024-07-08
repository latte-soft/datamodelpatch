local l_CorePackages_0 = game:GetService("CorePackages");
game:DefineFastFlag("DispatchGraphqlFeedToRodux6", false);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
return function()
    return game:GetFastFlag("DispatchGraphqlFeedToRodux6") and not l_IsPrefetchOneCopyEnabled_0();
end;
