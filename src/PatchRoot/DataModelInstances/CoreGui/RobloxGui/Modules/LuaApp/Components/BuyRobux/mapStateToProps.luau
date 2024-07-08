local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
local _ = require(l_Modules_0.LuaApp.Thunks.FetchNativeIAPProducts);
local v4 = game:GetService("GuiService"):IsTenFootInterface();
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v6 = require(script.Parent.RobuxPackage);
local v7 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableNativeRobuxProducts);
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
return function(v10, v11)
    local l_LocalUserId_0 = v10.LocalUserId;
    local v13 = ((not v4 and not l_IsVRAppBuild_0()) and v10.Users[l_LocalUserId_0]) and v10.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
    if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
        local v14 = false;
        if v11.enablePremiumUserFeatures ~= nil then
            v14 = (v11.enablePremiumUserFeatures and v10.Users[l_LocalUserId_0]) and v10.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
        end;
        v13 = v14;
    end;
    local v15 = v6.formatIapProducts(if not v13 then v10.IAPProducts.Robux else v10.IAPProducts.PremiumRobux);
    local l_Done_0 = v7.Done;
    if v8() then
        if v10.NativeRobuxProducts.Products ~= nil then
            v15 = v6.formatNativeRobuxProducts(v10.NativeRobuxProducts.Products);
        end;
        l_Done_0 = v10.NativeRobuxProducts.FetchingStatus;
    end;
    return {
        screenSize = v10.ScreenSize, 
        iapPurchase = v10.NativePurchase, 
        userId = l_LocalUserId_0, 
        isPremium = v13, 
        robuxBalance = v10.UserRobux[l_LocalUserId_0], 
        robuxPackages = v15, 
        iapProductsFetchingStatus = v2.GetFetchingStatus(v10), 
        nativeProductsFetchingStatus = l_Done_0
    };
end;
