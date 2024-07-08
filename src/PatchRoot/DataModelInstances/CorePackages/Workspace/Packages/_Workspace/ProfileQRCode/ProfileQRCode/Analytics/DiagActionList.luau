local v0 = require(script.Parent.EventNames);
return {
    [v0.QRPageLoad] = {
        name = game:DefineFastString("ProfileQRPageLoad", "ProfileQRPageLoad")
    }, 
    [v0.QRCodeScannerOpened] = {
        name = game:DefineFastString("ProfileQRCodeScannerOpened", "ProfileQRCodeScannerOpened")
    }, 
    [v0.QRCodeScannerTooltipShown] = {
        name = game:DefineFastString("ProfileQRCodeScannerTooltipShown", "ProfileQRCodeScannerTooltipShown")
    }, 
    [v0.QRPageLoadFailed] = {
        name = game:DefineFastString("ProfileQRPageLoadFailed", "ProfileQRPageLoadFailed")
    }, 
    [v0.QRPageFriendRequestBannerShown] = {
        name = game:DefineFastString("ProfileQRPageFriendRequestBannerShown", "ProfileQRPageFriendRequestBannerShown")
    }, 
    [v0.QRPageFriendRequestBannerAccepted] = {
        name = game:DefineFastString("ProfileQRPageFriendRequestBannerAccepted", "ProfileQRPageFriendRequestBannerAccepted")
    }, 
    [v0.QRPageFriendRequestBannerDismissed] = {
        name = game:DefineFastString("ProfileQRPageFriendRequestBannerDismissed", "ProfileQRPageFriendRequestBannerDismissed")
    }
};
