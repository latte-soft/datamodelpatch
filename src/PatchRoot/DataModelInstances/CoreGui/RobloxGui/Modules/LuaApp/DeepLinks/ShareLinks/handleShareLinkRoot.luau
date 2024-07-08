local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_RoduxShareLinks_0 = require(script.Parent.dependencies).RoduxShareLinks;
local v5 = require(script.Parent.handleExperienceInviteLinkResponse);
local v6 = require(script.Parent.handleInvalidLink);
local v7 = require(script.Parent.handleOffNetworkFriendRequest);
local v8 = require(script.Parent.handleExperienceDetailsLink);
local v9 = require(script.Parent.handleNotificationExperienceInviteLink);
local v10 = require(script.Parent.handleProfileLink);
local l_LinkStatus_0 = l_RoduxShareLinks_0.Enums.LinkStatus;
local v12 = require(script.Parent.ShareLinkTypes);
local _ = require(script.Parent.Types);
local v14 = require(l_CorePackages_0.Cryo);
local v15 = require(script.Parent.Flags.FFlagShareLinkAddTrackingForStamp);
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagShareLinkGameDetailsSupport);
return function(v17, v18)
    local v19 = string.lower(v17.type or v12.Unknown);
    local l_code_0 = v17.code;
    local l_shareLinksAnalytics_0 = v18.analyticsImpls.shareLinksAnalytics;
    v18.closeCentralOverlay();
    if not v15 then
        l_shareLinksAnalytics_0.openAppViaShareLink({
            linkType = v19, 
            linkId = l_code_0, 
            isViaAppsFlyer = v17.isViaAppsFlyer
        });
    else
        l_shareLinksAnalytics_0.openAppViaShareLink(v14.Dictionary.join(v17, {
            code = v14.None, 
            linkId = l_code_0, 
            linkType = v19, 
            type = v14.None
        }));
    end;
    if v19 == string.lower(v12.Home) then
        return {
            {
                {
                    name = v2.Home
                }
            }
        };
    elseif v19 == string.lower(v12.Unknown) then
        return v6({
            type = v19, 
            code = v17.code, 
            isViaAppsFlyer = v17.isViaAppsFlyer, 
            stamp = v17.stamp
        }, v18);
    else
        return v18.resolveLinkFromLinkId(l_code_0, v19):andThen(function(v22)
            local v23 = nil;
            v23 = if not v15 then {
                linkId = l_code_0, 
                linkType = v19, 
                responseBody = v22.responseBody, 
                isViaAppsFlyer = v17.isViaAppsFlyer
            } else v14.Dictionary.join(v17, {
                code = v14.None, 
                linkType = v19, 
                linkId = l_code_0, 
                responseBody = v22.responseBody
            });
            if not (v19 ~= string.lower(v12.ExperienceInviteLinkType)) or v19 == string.lower(v12.PrivateServerLinkType) then
                return (v5(v23, v18));
            elseif v19 == string.lower(v12.ScreenshotInviteLinkType) then
                return v5(v23, v18);
            elseif v19 == string.lower(v12.OffNetworkFriendRequestLinkType) then
                return v7(v23, v18);
            elseif v16 and v19 == string.lower(v12.ExperienceDetails) then
                return v8(v23, v18);
            elseif v19 == string.lower(v12.Profile) then
                return v10(v23, v18);
            elseif v19 == string.lower(v12.NotificationExperienceInviteLinkType) then
                return v9(v23, v18);
            else
                return nil;
            end;
        end):catch(function()
            return {
                {
                    {
                        name = v2.Games
                    }
                }, 
                {
                    {
                        name = v2.Games
                    }, 
                    {
                        name = v2.ShareLinkInvalidModal, 
                        extraProps = {
                            closeModal = function()
                                l_shareLinksAnalytics_0.errorJoinDialogButtonClick({
                                    linkId = l_code_0, 
                                    linkType = v19, 
                                    linkStatus = l_LinkStatus_0.Invalid.rawValue()
                                });
                            end
                        }
                    }
                }
            };
        end);
    end;
end;
