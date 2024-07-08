local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
return function(v5, v6)
    return v5(v2.economy.purchaseWarning.ackPurchaseWarning(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            acknowledgement = v6
        })
    });
end;
