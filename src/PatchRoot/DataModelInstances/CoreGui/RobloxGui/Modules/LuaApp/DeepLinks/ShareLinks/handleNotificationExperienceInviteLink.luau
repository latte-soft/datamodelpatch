local l_CorePackages_0 = game:GetService("CorePackages");
local l_EnableOptionalPlaceIdForUserIdGameJoins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).EnableOptionalPlaceIdForUserIdGameJoins;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local l_ExperienceInviteStatus_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).RoduxShareLinks.config({}).Enums.ExperienceInviteStatus;
local l_SocialContextToastIxpConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).SocialContextToastIxpConfig;
local v5 = require(script.Parent.ShareLinkTypes);
local _ = require(script.Parent.Types);
return function(v7, v8)
    local l_notificationExperienceInviteData_0 = v7.responseBody.notificationExperienceInviteData;
    if l_notificationExperienceInviteData_0 and l_notificationExperienceInviteData_0.placeId then
        local v10 = l_notificationExperienceInviteData_0.launchData and l_notificationExperienceInviteData_0.launchData ~= "";
        local v11 = not l_EnableOptionalPlaceIdForUserIdGameJoins_0();
        if v11 then
            v11 = false;
            if tostring(l_notificationExperienceInviteData_0.status) == tostring(l_ExperienceInviteStatus_0.Valid) then
                v11 = l_notificationExperienceInviteData_0.instanceId;
            end;
        end;
        v8.launchGame(l_notificationExperienceInviteData_0.placeId, v5.NotificationExperienceInviteLinkType, {
            gameInstanceId = if not v11 then nil else l_notificationExperienceInviteData_0.instanceId, 
            launchData = if not v10 then nil else l_notificationExperienceInviteData_0.launchData, 
            userId = if not (l_EnableOptionalPlaceIdForUserIdGameJoins_0() and l_SocialContextToastIxpConfig_0.CheckIsFallbackPlaceIdParamEnabled()) then nil else l_notificationExperienceInviteData_0.inviterId
        }, l_default_0, "NotificationExperienceInviteLink");
        return ;
    else
        return ;
    end;
end;
