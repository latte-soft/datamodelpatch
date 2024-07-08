local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
return function(v6, v7, v8, v9)
    return v6(if not v5() then v2.economy.purchaseWarning.getPurchaseWarning(v7) else v2.economy.purchaseWarning.getPurchaseWarning(v7, v8, v9 == false), "GET");
end;
