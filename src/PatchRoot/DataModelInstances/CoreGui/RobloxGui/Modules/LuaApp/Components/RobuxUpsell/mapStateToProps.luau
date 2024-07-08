local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
return function(v4, v5)
    local l_LocalUserId_0 = v4.LocalUserId;
    local v7 = if not v2() then nil else v4.Users[l_LocalUserId_0] and v4.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
    if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
        v7 = if not v2() then nil else (v5.enablePremiumUserFeatures and v4.Users[l_LocalUserId_0]) and v4.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
    end;
    return {
        screenSize = v4.ScreenSize, 
        iapPurchase = v4.NativePurchase, 
        userId = l_LocalUserId_0, 
        isPremium = v7
    };
end;
