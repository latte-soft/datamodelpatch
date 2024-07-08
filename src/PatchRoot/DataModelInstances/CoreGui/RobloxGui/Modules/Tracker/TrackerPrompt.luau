local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("ContentProvider");
local v5 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_Toast_0 = v5.App.Dialog.Toast;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v10 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v11 = require(l_CorePackages_0.Roact);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v14 = game:DefineFastFlag("TrackerPromptNewCopyForCameraPerformanceEnabled", false);
local v15 = game:DefineFastString("CameraUnavailableUrl", "https://help.roblox.com/hc/articles/17877687557396");
local v16 = v11.PureComponent:extend("TrackerPrompt");
v16.validateProps = v12.strictInterface({
    promptType = v12.optional(v12.string)
});
local v17 = {
    [v13.None] = "", 
    [v13.VideoNoPermission] = v9:FormatByKey("Feature.FaceChat.Heading.UnableToAccessCamera"), 
    [v13.NotAvailable] = v9:FormatByKey("Feature.FaceChat.Heading.NotAvailable"), 
    [v13.FeatureDisabled] = v9:FormatByKey("Feature.FaceChat.Heading.FacialAnimation"), 
    [v13.LODCameraRecommendDisable] = if not v14 then v9:FormatByKey("Feature.FaceChat.Heading.VideoPerformancePromptDisable") else v9:FormatByKey("Feature.FaceChat.Heading.LowPerformanceDetected"), 
    [v13.NoDynamicHeadEquipped] = v9:FormatByKey("Feature.FaceChat.Heading.PromptNoDynamicHeadEquipped"), 
    [v13.VideoUnsupported] = v9:FormatByKey("Feature.FaceChat.Heading.VideoUnsupported"), 
    [v13.UnsupportedDevice] = v9:FormatByKey("Feature.FaceChat.Heading.NotAvailable"), 
    [v13.CameraUnavailable] = v9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
};
local v18 = {
    [v13.None] = "", 
    [v13.VideoNoPermission] = v9:FormatByKey("Feature.FaceChat.Subtitle.UnableToAccessCamera"), 
    [v13.NotAvailable] = v9:FormatByKey("Feature.FaceChat.Subtitle.NotAvailable"), 
    [v13.FeatureDisabled] = v9:FormatByKey("Feature.FaceChat.Subtitle.FeatureDisabled"), 
    [v13.LODCameraRecommendDisable] = v9:FormatByKey("Feature.FaceChat.Subtitle.VideoPerformancePromptDisable"), 
    [v13.NoDynamicHeadEquipped] = v9:FormatByKey("Feature.FaceChat.Subtitle.PromptNoDynamicHeadEquipped"), 
    [v13.VideoUnsupported] = v9:FormatByKey("Feature.FaceChat.Subtitle.VideoUnsupported"), 
    [v13.UnsupportedDevice] = v9:FormatByKey("Feature.FaceChat.Subtitle.UnsupportedDevice"), 
    [v13.CameraUnavailable] = v9:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.CameraUnavailable")
};
local v19 = {
    FullScreen = 0, 
    FormSheet = 2
};
local function v21(v20)
    l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
        title = if not game:GetEngineFeature("SetWebViewTitle") then nil else v9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable"), 
        presentationStyle = v19.FormSheet, 
        visible = true, 
        url = v20
    }), 20);
end;
v16.init = function(v22)
    v22.promptType = v22.props.promptType;
end;
v16.render = function(v23)
    v23.promptType = v23.props.promptType;
    local l_createElement_0 = v11.createElement;
    local v25 = "Frame";
    local v26 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    };
    local v27 = {};
    local v28 = false;
    if v23.promptType ~= v13.None then
        v28 = v11.createElement(l_Toast_0, {
            duration = 8, 
            toastContent = {
                iconImage = l_Images_0["icons/status/alert"], 
                toastTitle = v17[v23.promptType], 
                toastSubtitle = v18[v23.promptType], 
                onDismissed = function()
                end, 
                onActivated = function()
                    if v23.promptType == v13.CameraUnavailable then
                        v21(v15);
                    end;
                end
            }
        });
    end;
    v27.Toast = v28;
    return v11.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = 10, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Content = v10({
            TrackerPrompt = l_createElement_0(v25, v26, v27)
        })
    });
end;
return v16;
