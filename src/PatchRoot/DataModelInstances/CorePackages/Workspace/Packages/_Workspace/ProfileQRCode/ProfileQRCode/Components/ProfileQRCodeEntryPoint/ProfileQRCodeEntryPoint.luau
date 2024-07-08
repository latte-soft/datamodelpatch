local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v3 = require(l_script_FirstAncestor_0.Analytics);
local v4 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v6 = require(l_script_FirstAncestor_0.Components.ProfileQRCodePage.ProfileQRCodePage);
return function(v7)
    return v4.createElement(v3.Context.Provider, {
        value = {
            fireEvent = v3.setupFireEvent({
                analytics = if not v7.analyticsService then v2 else v7.analyticsService, 
                infoForAllEvents = {
                    uid = l_useLocalUserId_0(), 
                    source = v7.source
                }
            })
        }
    }, {
        Window = v4.createElement(v6, {
            appStorageService = v7.appStorageService, 
            robloxEventReceiver = v7.robloxEventReceiver, 
            onClose = v7.onClose, 
            openQrCodeScanner = v7.openQrCodeScanner
        })
    });
end;
