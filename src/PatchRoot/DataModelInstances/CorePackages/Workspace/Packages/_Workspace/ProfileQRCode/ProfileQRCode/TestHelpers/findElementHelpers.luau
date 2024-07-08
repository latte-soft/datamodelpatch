local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.SocialTestHelpers);
local l_findElementWithAssert_0 = v1.TestHelpers.findElementWithAssert;
local l_findImageSet_0 = v1.TestHelpers.findImageSet;
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
return {
    findQRCodeView = l_findElementWithAssert_0({
        Name = "QRCodeView"
    }), 
    findQRCode = l_findElementWithAssert_0({
        Name = "QRCode"
    }), 
    findDescription = l_findElementWithAssert_0({
        Text = v4.Description
    }), 
    findTopBarTitle = l_findElementWithAssert_0({
        Text = v4.Title
    }), 
    findTopBar = l_findElementWithAssert_0({
        Name = "TopBar"
    }), 
    findPlayerAvatar = l_findElementWithAssert_0({
        Name = "PlayerAvatar"
    }), 
    findCrossButton = l_findElementWithAssert_0(l_findImageSet_0("icons/navigation/close")), 
    findBackButton = l_findElementWithAssert_0(l_findImageSet_0("icons/navigation/pushBack")), 
    findRetryButton = l_findElementWithAssert_0(l_findImageSet_0("icons/common/refresh")), 
    findLoadingElement = l_findElementWithAssert_0({
        Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer.png"
    }), 
    findQRCodeIcon = l_findElementWithAssert_0({
        Name = "QRImage"
    }), 
    findUsername = l_findElementWithAssert_0({
        Name = "Username"
    }), 
    findNotificationDescription = l_findElementWithAssert_0({
        Name = "Description"
    }), 
    findCloseButton = l_findElementWithAssert_0({
        Name = "CloseButton"
    }), 
    findAcceptButton = l_findElementWithAssert_0({
        Name = "AcceptButton"
    }), 
    findAlertView = l_findElementWithAssert_0({
        Name = "FriendsInvite"
    }), 
    findToastView = l_findElementWithAssert_0({
        Name = "FriendAcceptToast"
    })
};
