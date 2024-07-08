local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local l_Dash_0 = v1.Dash;
local function v4()
end;
local v5 = {
    ProfilePeekView = v4, 
    ViewUserProfile = v4, 
    GameDetailsPeekView = v4, 
    Chat = v4, 
    JoinGame = v4, 
    ViewUserFriends = v4, 
    ViewUserFollowing = v4, 
    ViewUserFollowers = v4, 
    ItemDetails = v4, 
    ReportUser = v4, 
    PurchaseErrorToast = v4, 
    NetworkingErrorToast = v4, 
    ProfileQRCodePage = v4
};
return function(v6)
    return l_Dash_0.join(v5, v6 or {});
end;
