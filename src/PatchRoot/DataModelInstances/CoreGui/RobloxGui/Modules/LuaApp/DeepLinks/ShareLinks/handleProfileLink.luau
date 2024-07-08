local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(script.Parent.LinkStatus);
local l_ProfileTypes_0 = require(l_Modules_0.Profile).ProfileTypes;
local l_getDeepValue_0 = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
local _ = require(script.Parent.Types);
return function(v6, v7)
    local v8 = l_getDeepValue_0(v6, "responseBody.profileLinkResolutionResponseData") or {};
    local l_shareLinksAnalytics_0 = v7.analyticsImpls.shareLinksAnalytics;
    if not v8.userId then
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v2.Invalid, 
            linkId = v6.linkId, 
            linkType = v6.linkType, 
            isViaAppsFlyer = v6.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v1.Home
                }, 
                {
                    name = v1.ShareLinkInvalidModal
                }
            }
        };
    else
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v2.Valid, 
            linkId = v6.linkId, 
            linkType = v6.linkType, 
            isViaAppsFlyer = v6.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v1.Home
                }, 
                {
                    name = v1.ProfilePeekView, 
                    detail = tostring(v8.userId), 
                    extraProps = {
                        profileType = l_ProfileTypes_0.ProfileShare, 
                        shareLinkId = v6.linkId
                    }
                }
            }
        };
    end;
end;
