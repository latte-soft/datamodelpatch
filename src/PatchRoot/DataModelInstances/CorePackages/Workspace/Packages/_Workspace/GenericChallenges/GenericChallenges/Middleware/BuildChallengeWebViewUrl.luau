local _ = require(script.Parent.ChallengeHeaders);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v2 = require(l_script_FirstAncestor_0.Utils.constants);
local v3 = require(l_script_FirstAncestor_0.Utils.Base64);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local function v12(v8)
    local v9 = "";
    for v10, v11 in pairs(v8) do
        v9 = v9 .. string.format("%s=%s&", v10, v11);
    end;
    return v9;
end;
local function _()
    if not (string.lower(l_NotificationService_0.SelectedTheme) == "dark") then
        return "false";
    else
        return "true";
    end;
end;
local function v16()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v15 = "unknown";
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return "android";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return "ios";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        return "windows";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        return "osx";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
        return "uwp";
    else
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
            v15 = "xbox";
        end;
        return v15;
    end;
end;
return function(v17)
    assert(string.len(v17.challengeId) > 0, "challenge id does not exist");
    assert(v17.challengeType.typed ~= nil, "challenge is of an unknown type");
    return l_UrlBuilder_0.fromString("www:challenge/cdn/hybrid?" .. v12({
        [v2.appTypeQueryParam] = v16(), 
        [v2.challengeTypeQueryParam] = v2.genericChallengeType, 
        [v2.darkModeQueryParam] = not (string.lower(l_NotificationService_0.SelectedTheme) == "dark") and "false" or "true"
    }) .. v12({
        [v2.genericChallengeIdQueryParam] = v17.challengeId, 
        [v2.genericChallengeTypeQueryParam] = v17.challengeType.raw, 
        [v2.challengeMetadataJsonQueryParam] = v3.EncodeUrl(v17.challengeMetadata.decoded)
    }))();
end;
