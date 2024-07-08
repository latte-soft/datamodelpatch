local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(script:FindFirstAncestor("ShareTargetGame").dependencies);
local l_Common_0 = l_CoreGui_0.RobloxGui.Modules.Common;
local l_formatAlias_0 = v3.SocialLibraries.Utils.formatAlias;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Constants;
local v7 = require(l_Common_0.Functional);
local l_Conversation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Models.Conversation;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v10, v11, v12)
    local v13 = tostring(l_Players_0.LocalPlayer.UserId);
    local v15 = v7.Filter(v11.participants, function(v14)
        return v14 ~= v13;
    end);
    local v16 = v11.conversationType == l_Conversation_0.Type.ONE_TO_ONE_CONVERSATION;
    local v17 = nil;
    local v18 = nil;
    local v19 = "";
    if v16 then
        local v20 = v10[v15[1]];
        if v20 then
            v18 = v20.presence;
            v17 = v20.lastLocation;
            local v21 = v12.byUserId[v20.id] or "";
            if v21 ~= "" then
                v19 = l_formatAlias_0(v21);
            end;
        end;
    end;
    local v22 = {};
    for _, v24 in pairs(v11.participants) do
        if not ((not v16 or v24 == v13) and v16) then
            table.insert(v22, (l_getStandardSizeAvatarHeadShotRbxthumb_0(v24)));
        end;
    end;
    local _ = nil;
    return {
        oneToOne = v16, 
        lastUpdated = not v11.lastUpdated and 0 or v11.lastUpdated:GetUnixTimestamp(), 
        conversationId = v11.id, 
        lastLocation = v17, 
        presence = v18, 
        presenceImage = not v16 and "" or (l_Constants_0.PresenceIndicatorImagesBySize[l_Constants_0:GetPresenceIndicatorSizeKey(14)][v18] or ""), 
        title = v11.title, 
        thumbnails = v22, 
        participants = v11.participants, 
        alias = v19
    };
end;
