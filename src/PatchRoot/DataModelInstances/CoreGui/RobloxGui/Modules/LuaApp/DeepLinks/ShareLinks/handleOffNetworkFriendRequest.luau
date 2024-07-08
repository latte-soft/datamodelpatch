local l_SocialLibraries_0 = require(script.Parent.dependencies).SocialLibraries;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local l_ProfileTypes_0 = require(l_Modules_0.Profile).ProfileTypes;
local v4 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local _ = require(script.Parent.Types);
return function(v7, v8)
    local v9 = l_getDeepValue_0(v7, "responseBody.friendInviteData") or {};
    local l_shareLinksAnalytics_0 = v8.analyticsImpls.shareLinksAnalytics;
    if not v9.senderUserId then
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v4.Invalid, 
            linkId = v7.linkId, 
            linkType = v7.linkType, 
            isViaAppsFlyer = v7.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ShareLinkInvalidModal
                }
            }
        };
    else
        local v11 = v9.friendingToken and v9.friendingToken ~= "";
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = if not v11 then v4.Expired else v4.Valid, 
            linkId = v7.linkId, 
            linkType = v7.linkType, 
            isViaAppsFlyer = v7.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ProfilePeekView, 
                    detail = tostring(v9.senderUserId), 
                    extraProps = if not v11 then {
                        profileType = l_ProfileTypes_0.Default
                    } else {
                        profileType = l_ProfileTypes_0.OffNetworkFriendRequest, 
                        offNetworkFriendRequestToken = v9.friendingToken, 
                        shareLinkId = v7.linkId, 
                        offNetworkFriendRequestLinkId = v7.linkId
                    }
                }
            }
        };
    end;
end;
