local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(script.Parent.dependencies);
local l_PlayButtonReferralSource_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonReferralSource;
local v4 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(script.Parent.Parent.logGameDetailsDeepLinkEvent);
local v8 = require(script.Parent.Flags.FFlagShareLinkAddTrackingForStamp);
local _ = require(script.Parent.Types);
return function(v10, v11)
    local l_shareLinksAnalytics_0 = v11.analyticsImpls.shareLinksAnalytics;
    local v13 = tostring((l_getDeepValue_0(v10, "responseBody.experienceDetailsInviteData") or {}).universeId);
    local _ = nil;
    l_shareLinksAnalytics_0.resolveLink(if not v8 then {
        linkStatus = v4.Valid, 
        linkId = v10.linkId, 
        linkType = v10.linkType, 
        isViaAppsFlyer = v10.isViaAppsFlyer, 
        universeId = v13
    } else v6.Dictionary.join(v10, {
        responseBody = v6.None, 
        type = v6.None, 
        linkStatus = v4.Valid, 
        universeId = v13
    }));
    v7(v13, "GameDetailsShareLink");
    return {
        {
            {
                name = l_AppPage_0.Games
            }
        }, 
        {
            {
                name = l_AppPage_0.Games
            }, 
            {
                name = l_AppPage_0.GameDetail, 
                detail = v13, 
                extraProps = {
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    referralSource = l_PlayButtonReferralSource_0.ExperienceDetailsLink
                }
            }
        }
    };
end;
