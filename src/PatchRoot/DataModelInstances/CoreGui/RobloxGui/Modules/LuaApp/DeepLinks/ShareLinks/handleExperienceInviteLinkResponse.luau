local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.ExperienceService).GameProtocol.default;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage);
local v3 = require(script.Parent.dependencies);
local v4 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = v3.SocialLibraries.Dictionary.getDeepValue;
local _ = require(script.Parent.Types);
local v7 = require(script.Parent.ShareLinkTypes);
local v8 = {
    [string.lower(v7.ExperienceInviteLinkType)] = {
        expiredLinkStr = "ExperienceInviteExpiredLink", 
        linkType = v7.ExperienceInviteLinkType, 
        responseInviteDataPath = "responseBody.experienceInviteData", 
        validLinkStr = "ExperienceInviteValidLink", 
        invalidLinkPage = v2.InviteLinkExpiredModal
    }, 
    [string.lower(v7.ScreenshotInviteLinkType)] = {
        expiredLinkStr = "ScreenshotInviteExpiredLink", 
        linkType = v7.ScreenshotInviteLinkType, 
        responseInviteDataPath = "responseBody.screenshotInviteData", 
        validLinkStr = "ScreenshotInviteValidLink", 
        invalidLinkPage = v2.InviteLinkExpiredModal
    }, 
    [string.lower(v7.PrivateServerLinkType)] = {
        expiredLinkStr = "PrivateServerExpiredLink", 
        linkType = v7.PrivateServerLinkType, 
        responseInviteDataPath = "responseBody.privateServerInviteData", 
        validLinkStr = "PrivateServerValidLink", 
        invalidLinkPage = v2.ShareLinkInvalidModal
    }
};
return function(v9, v10)
    local v11 = v8[string.lower(v9.linkType)];
    local l_linkType_0 = v11.linkType;
    local l_expiredLinkStr_0 = v11.expiredLinkStr;
    local l_responseInviteDataPath_0 = v11.responseInviteDataPath;
    local l_validLinkStr_0 = v11.validLinkStr;
    local l_invalidLinkPage_0 = v11.invalidLinkPage;
    local v17 = l_HttpService_0:GenerateGUID(false);
    local l_shareLinksAnalytics_0 = v10.analyticsImpls.shareLinksAnalytics;
    local v19 = l_getDeepValue_0(v9, l_responseInviteDataPath_0) or {};
    local v20 = tostring(v19.status);
    local v21 = {
        linkStatus = v20, 
        linkId = v9.linkId, 
        linkType = v9.linkType, 
        isViaAppsFlyer = v9.isViaAppsFlyer, 
        placeId = v19.placeId, 
        joinAttemptId = v17
    };
    l_shareLinksAnalytics_0.resolveLink(v21);
    local function v23(v22)
        l_shareLinksAnalytics_0.gameLaunch({
            linkId = v9.linkId, 
            linkType = v9.linkType, 
            linkStatus = v20, 
            placeId = v19.placeId, 
            joinAttemptId = v22
        });
    end;
    local v24 = v20 == v4.Valid;
    local v25 = v19.launchData and v19.launchData ~= "";
    local l_launchData_0 = v19.launchData;
    if not v24 then
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
                    name = l_invalidLinkPage_0, 
                    extraProps = {
                        launchGame = function()
                            v10.launchGame(v19.placeId, l_linkType_0, {
                                launchData = if not v25 then nil else l_launchData_0
                            }, l_default_0, l_expiredLinkStr_0, v23);
                        end, 
                        closeModal = function(v27)
                            if not v27 then
                                l_shareLinksAnalytics_0.errorDialogButtonClick(v21);
                                return ;
                            else
                                l_shareLinksAnalytics_0.errorJoinDialogButtonClick(v21);
                                return ;
                            end;
                        end, 
                        universeId = tostring(v19.universeId), 
                        linkStatus = v20
                    }
                }
            }
        };
    else
        v10.launchGame(v19.placeId, l_linkType_0, {
            gameInstanceId = v19.instanceId, 
            joinAttemptId = v17, 
            linkCode = v19.linkCode, 
            launchData = if not v25 then nil else l_launchData_0
        }, l_default_0, l_validLinkStr_0, v23);
        return nil;
    end;
end;
