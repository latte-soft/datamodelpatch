return require(script:FindFirstAncestor("ProfileQRCode").Parent.Enumerate)(script.Name, {
    QRPageLoad = "QRPageLoad", 
    QRPageLoadFailed = "QRPageLoadFailed", 
    QRPageFriendRequestBannerShown = "QRPageFriendRequestBannerShown", 
    QRPageFriendRequestBannerAccepted = "QRPageFriendRequestBannerAccepted", 
    QRPageFriendRequestBannerDismissed = "QRPageFriendRequestBannerDismissed", 
    QRCodeScannerOpened = "QRCodeScannerOpened", 
    QRCodeScannerTooltipShown = "QRCodeScannerTooltipShown"
});
