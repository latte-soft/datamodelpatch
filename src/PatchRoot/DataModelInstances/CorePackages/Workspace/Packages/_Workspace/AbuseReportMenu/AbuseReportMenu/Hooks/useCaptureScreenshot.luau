local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_Parent_0.AvatarIdentification);
local v5 = require(l_Parent_0.AdIdentification);
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local l_AvatarIdentification_0 = v4.AvatarIdentification;
local l_AdIdentification_0 = v5.AdIdentification;
return function(v9, v10, v11)
    return v2.useCallback(function()
        l_ScreenshotManager_0:TakeScreenshotWithCallback(v10, v9);
        local v12, v13 = l_AvatarIdentification_0.getVisibleAvatars();
        local v14, v15 = l_AdIdentification_0.getVisibleAds();
        v11({
            identifiedAvatars = v12, 
            identifiedAds = v14, 
            avatarIDStats = v13, 
            adIDStats = v15
        });
    end, {
        v10, 
        v9, 
        v11
    });
end;
