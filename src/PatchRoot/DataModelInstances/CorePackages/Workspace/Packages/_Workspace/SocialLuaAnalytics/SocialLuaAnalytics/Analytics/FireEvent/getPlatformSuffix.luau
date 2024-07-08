local l_IsVRAppBuild_0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.AppCommonLib).IsVRAppBuild;
local v1 = require(script.Parent.getUserInputService);
local v2 = require(script.Parent.Parent.Enums.PlatformBuckets);
local v3 = require(script.Parent.Parent.Enums.PlatformSpecificity);
local v4 = {
    [Enum.Platform.Windows] = v2.Windows, 
    [Enum.Platform.OSX] = v2.Mac, 
    [Enum.Platform.IOS] = v2.IOS, 
    [Enum.Platform.Android] = v2.Android, 
    [Enum.Platform.UWP] = v2.Windows, 
    [Enum.Platform.XBox360] = v2.XBox, 
    [Enum.Platform.XBoxOne] = v2.XBox, 
    [Enum.Platform.PS3] = v2.Playstation, 
    [Enum.Platform.PS4] = v2.Playstation, 
    [Enum.Platform.PS5] = v2.Playstation, 
    [Enum.Platform.None] = v2.None
};
return function(v5)
    local v6 = v1();
    local v7 = nil;
    pcall(function()
        v7 = v6:GetPlatform() or Enum.Platform.None;
    end);
    if v5 == v3.All then
        if not l_IsVRAppBuild_0() then
            local v8 = tostring(v7):match(".*%.(.*)");
            if v8 then
                return v8;
            else
                return v2.None;
            end;
        else
            return v2.Quest;
        end;
    elseif v5 == v3.BucketsOnly then
        if not l_IsVRAppBuild_0() then
            return v4[v7] or v2.None;
        else
            return v2.Quest;
        end;
    else
        return "";
    end;
end;
