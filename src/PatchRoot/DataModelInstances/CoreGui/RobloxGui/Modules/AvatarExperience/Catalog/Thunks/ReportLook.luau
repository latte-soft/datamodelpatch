local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_CorePackages_0.Logging);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v8 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v10 = require(l_CorePackages_0.Packages.Promise);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v12 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v13 = {
    toastMessage = "Feature.Catalog.Response.ReportSubmitted", 
    isLocalized = false, 
    toastType = v11.SuccessConfirmation
};
local v14 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmitFailure", 
    isLocalized = false, 
    toastType = v11.InformationMessage
};
return function(v15)
    return l_PerformFetch_0.Single("reportLookKey", function(v16)
        local v17 = v16:getState();
        local l_LocalUserId_0 = v17.LocalUserId;
        local l_LookId_0 = v17.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        local v20 = v17.AvatarExperience.Common.Widgets.HydratedWidgetData[v8.ContentType.Look];
        local v21 = if not not v20 and l_LookId_0 then v20[l_LookId_0] else nil;
        local v23 = if not v21 then nil else v4.List.map(v21.assets, function(v22)
            return (tostring(v22.id));
        end);
        if l_LookId_0 then
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v25 = "unknown";
            if not l_IsVRAppBuild_0() then
                if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows) or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                    v25 = "desktop";
                elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Android) or l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                    v25 = "mobile";
                elseif not ((((l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS3) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS5) or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                    v25 = "console";
                end;
            else
                v25 = "vr";
            end;
            return v9.AbuseReport(v15, {
                ENTRY_POINT = v25, 
                REPORTED_ABUSE_CATEGORY = "ABUSE_TYPE_OTHER", 
                REPORTED_ABUSE_VECTOR = "LOOK", 
                REPORTER_COMMENT = "", 
                SUBMITTER_USER_ID = l_LocalUserId_0, 
                REPORT_TARGET_LOOK_ID = l_LookId_0, 
                REPORT_TARGET_LOOK_INCLUDED_ASSET_ID = v23
            }):andThen(function(_)
                v16:dispatch(v12(v13));
            end, function(v27)
                v6.warn("WebApi failure in AbuseReport: " .. tostring(v27));
                v16:dispatch(v12(v14));
            end);
        else
            return v10.reject("Attempt to report a look, but no look is currently displayed");
        end;
    end);
end;
