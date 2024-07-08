local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local l_jest_0 = require(l_CorePackages_0.JestGlobals3).jest;
return function(v3)
    return v1.Dictionary.join({
        closeCentralOverlay = l_jest_0.fn(), 
        launchGame = l_jest_0.fn(), 
        resolveLinkFromLinkId = l_jest_0.fn().mockReturnValue({}), 
        analyticsImpls = {
            shareLinksAnalytics = {
                openAppViaShareLink = l_jest_0.fn(), 
                resolveLink = l_jest_0.fn(), 
                errorDialogButtonClick = l_jest_0.fn(), 
                errorJoinDialogButtonClick = l_jest_0.fn(), 
                launchGame = l_jest_0.fn()
            }
        }
    }, v3 or {});
end;
