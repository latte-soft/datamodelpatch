local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.Constants);
return function(v1, v2)
    local v3 = if not not v1 and v1.InviteUser ~= 0 then v1.InviteUser else nil;
    local v4, v5 = v2(if not v3 then v0.Triggers.DeveloperMultiple else v0.Triggers.DeveloperSingle, v3);
    if v4 then
        local v6 = {};
        if not (not v5 or not v1) then
            if v1.InviteMessageId ~= "" then
                v6.inviteMessageId = v1.InviteMessageId;
            end;
            if v1.InviteUser ~= 0 then
                v6.inviteUserId = v1.InviteUser;
            end;
            if v1.PromptMessage ~= "" then
                v6.promptMessage = v1.PromptMessage;
            end;
            if v1.LaunchData ~= "" then
                v6.launchData = v1.LaunchData;
            end;
        end;
        return v6;
    else
        return nil;
    end;
end;
