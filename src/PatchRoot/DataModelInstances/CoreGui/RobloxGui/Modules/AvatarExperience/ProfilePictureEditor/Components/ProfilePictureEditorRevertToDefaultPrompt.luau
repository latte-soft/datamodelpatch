local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v16 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig);
local v17 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local function v19(v18)
    return v18.ScreenSize;
end;
local function v21(v20)
    return v20.AvatarExperience.ProfilePictureEditor;
end;
return (v11((v10(function(v22)
    local v23 = l_useDispatch_0();
    local v24 = v6(v17);
    local v25 = l_useSelector_0(v19);
    local v26 = l_useSelector_0(v21);
    local function v27()
        v12.closeOverlay(v22.navigation);
    end;
    local function v31()
        local l_lastSuccessfulPoseEmoteAssetId_0 = v26.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local v29 = v15.getYRotDegFromSliderValue(v26.CameraSliders.rotateSliderValue);
        local v30 = v26.ProfilePictureParams.fieldOfViewDeg or 30;
        v23(v16(v24, v14.Closeup, l_lastSuccessfulPoseEmoteAssetId_0, -1, v29, v30));
        v23(v16(v24, v14.FullBody, l_lastSuccessfulPoseEmoteAssetId_0, -1, v29, v30));
    end;
    local function v32()
        v31();
        if not v22.onBack then
            v22.navigation.navigate(v13.Catalog);
            return ;
        else
            v22.onBack();
            return ;
        end;
    end;
    local v33 = l_useLocalization_0({
        titleText = "Feature.Avatar.Title.RevertToDefault", 
        bodyText = "Feature.Avatar.Message.RevertToDefault", 
        revertButtonText = "Feature.Avatar.Action.Revert", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v33.titleText, 
        bodyText = v33.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v27, 
                        text = v33.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v32, 
                        text = v33.revertButtonText
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        screenSize = v25
    });
end))));
