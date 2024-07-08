local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_Warning_0 = v2.Components.AlertViews.Warning;
local l_ResponseIndicator_0 = v2.Components.ResponseIndicator;
local v8 = {
    titleText = "Placeholder title", 
    bodyText = "Placeholder body", 
    cancelText = "TempCancel", 
    confirmText = "TempConfirm", 
    failureTitleText = "FailureTitle", 
    failureBodyText = "FailureBody", 
    failureButtonText = "FailureButton", 
    soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
    soakAreaTransparency = 0.8, 
    screenSize = Vector2.new(0, 0), 
    displayFailed = false, 
    isLoading = false, 
    onActivated = nil, 
    onModalClose = nil
};
CreateUnfilteredChatDialog = function(v9)
    local v10 = v4.Dictionary.join(v8, v9);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        InteractiveAlert = if not v10.isLoading then v5.createElement(l_Warning_0, v10) else nil, 
        ResponseIndicator = if not v10.isLoading then nil else v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = v10.soakAreaColor3, 
            soakAreaTransparency = v10.soakAreaTransparency
        })
    });
end;
return CreateUnfilteredChatDialog;
