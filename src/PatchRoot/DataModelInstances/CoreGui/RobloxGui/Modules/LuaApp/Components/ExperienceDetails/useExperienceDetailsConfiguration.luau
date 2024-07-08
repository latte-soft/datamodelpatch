local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
return function()
    local v6 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    return (v1.useMemo(function()
        return {
            showLogoTraySection = not v6, 
            showEventsList = not v6, 
            showCommunityLink = if not l_GetFFlagEnableDetailsPageCommunityLinks_0() then nil else not v6 and not l_IsVRAppBuild_0(), 
            showCornerGradientPropEnabled = v6
        };
    end, {
        v6
    }));
end;
