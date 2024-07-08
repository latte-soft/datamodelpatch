local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local v3 = require(script.Parent.Parent.Analytics.BtnValues);
local v4 = require(script.Parent.EventNames);
local l_Enums_0 = v2.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
return {
    [v4.QRPageLoad] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            shareLinkId = v1.identity
        }
    }, 
    [v4.QRCodeScannerOpened] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.QRCodeScannerOpened
        }
    }, 
    [v4.QRCodeScannerTooltipShown] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.ProfileQRCodeTooltipShown
    }, 
    [v4.QRPageLoadFailed] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.PageLoadFailed, 
        formatRulesForAdditionalInfo = {
            errorReason = v1.identity
        }
    }, 
    [v4.QRPageFriendRequestBannerShown] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.ProfileQRCodeNotificationBannerShown, 
        formatRulesForAdditionalInfo = {
            qrCodeBannerQueueSize = v1.identity
        }
    }, 
    [v4.QRPageFriendRequestBannerAccepted] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.FriendRequestBannerAccepted
        }, 
        formatRulesForAdditionalInfo = {
            qrCodeBannerQueueSize = v1.identity
        }
    }, 
    [v4.QRPageFriendRequestBannerDismissed] = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.FriendRequestBannerDismissed
        }, 
        formatRulesForAdditionalInfo = {
            qrCodeBannerQueueSize = v1.identity
        }
    }
};
