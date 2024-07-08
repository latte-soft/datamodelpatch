local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gamePlayIntent);
local l_getPlatformTarget_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget;
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_EventTypes_0 = v6.Analytics.Enums.EventTypes;
local l_Contexts_0 = v6.Analytics.Enums.Contexts;
local l_Pages_0 = v6.Analytics.Enums.Pages;
local v10 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.Types);
local v12 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.Flags.FFlagShareLinksFixTrackerForJoinClicks);
game:DefineFastString("ShareLinkAppOpen", "ShareLinkAppOpen");
game:DefineFastString("ShareLinkResolved", "ShareLinkResolved");
game:DefineFastString("ShareLinkErrorDialogCancelButtonClick", "ShareLinkErrorDialogCancelButtonClick");
game:DefineFastString("ShareLinkErrorDialogJoinButtonClick", "ShareLinkErrorDialogJoinButtonClick");
game:DefineFastString("ShareLinkLaunchGame", "ShareLinkLaunchGame");
local function _()
    return game:GetFastString("ShareLinkAppOpen");
end;
local function _()
    return game:GetFastString("ShareLinkResolved");
end;
local function _()
    return game:GetFastString("ShareLinkErrorDialogCancelButtonClick");
end;
local function _()
    return game:GetFastString("ShareLinkErrorDialogJoinButtonClick");
end;
local function _()
    return game:GetFastString("ShareLinkLaunchGame");
end;
return {
    get = function(v18)
        local v19 = v3.get(v18);
        return {
            openAppViaShareLink = function(v20)
                v19.EventStream:setRBXEventStream(l_Contexts_0.ShareLinks, l_EventTypes_0.AppOpenViaShareLink, v10.Dictionary.join({
                    target = l_getPlatformTarget_0()
                }, v20));
                v19.Diag:reportCounter(("%*%*%*"):format(game:GetFastString("ShareLinkAppOpen"), v20.linkType, not v20.isViaAppsFlyer and "" or "AppsFlyer"), 1);
            end, 
            resolveLink = function(v21)
                v19.EventStream:setRBXEventStream(l_Contexts_0.ShareLinks, l_EventTypes_0.LinkResolved, v10.Dictionary.join({
                    target = l_getPlatformTarget_0()
                }, v21));
                v19.Diag:reportCounter(game:GetFastString("ShareLinkResolved") .. v21.linkStatus .. v21.linkType, 1);
            end, 
            errorDialogButtonClick = function(v22)
                v19.EventStream:setRBXEventStream(l_Contexts_0.ShareLinks, l_EventTypes_0.ButtonClick, v10.Dictionary.join({
                    target = l_getPlatformTarget_0(), 
                    btn = "cancel", 
                    page = l_Pages_0.ShareLinkErrorDialog
                }, v22));
                v19.Diag:reportCounter(game:GetFastString("ShareLinkErrorDialogCancelButtonClick") .. v22.linkType, 1);
            end, 
            errorJoinDialogButtonClick = function(v23)
                v19.EventStream:setRBXEventStream(l_Contexts_0.ShareLinks, l_EventTypes_0.ButtonClick, v10.Dictionary.join({
                    target = l_getPlatformTarget_0(), 
                    btn = "join", 
                    page = l_Pages_0.ShareLinkErrorDialog
                }, v23));
                if not v12 then
                    v19.Diag:reportCounter(game:GetFastString("ShareLinkErrorDialogCancelButtonClick") .. v23.linkType, 1);
                    return ;
                else
                    v19.Diag:reportCounter(game:GetFastString("ShareLinkErrorDialogJoinButtonClick") .. v23.linkType, 1);
                    return ;
                end;
            end, 
            gameLaunch = function(v24)
                v4(v19.EventStream, l_Contexts_0.ShareLinks, {
                    placeId = v24.placeId, 
                    rootPlaceId = tonumber(v24.placeId), 
                    linkId = v24.linkId, 
                    linkType = v24.linkType, 
                    linkStatus = v24.linkStatus, 
                    joinAttemptId = v24.joinAttemptId
                });
                v19.Diag:reportCounter(game:GetFastString("ShareLinkLaunchGame") .. v24.linkType, 1);
            end
        };
    end
};
