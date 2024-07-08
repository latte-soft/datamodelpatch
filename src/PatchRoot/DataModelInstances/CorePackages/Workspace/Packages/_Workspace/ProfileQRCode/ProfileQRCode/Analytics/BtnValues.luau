return require(script:FindFirstAncestor("ProfileQRCode").Parent.Enumerate)(script.Name, {
    FriendRequestBannerAccepted = "friendRequestBannerAccepted", 
    FriendRequestBannerDismissed = "friendRequestBannerDismissed", 
    QRCodeScannerOpened = "qrCodeScannerOpened"
});
