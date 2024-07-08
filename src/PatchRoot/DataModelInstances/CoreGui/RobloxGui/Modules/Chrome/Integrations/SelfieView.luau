local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.Parent.Service);
local v3 = require(script.Parent.Parent.Service.ChromeUtils);
local v4 = require(script.Parent.Parent.Service.LocalStore);
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v8 = require(script.Parent.CommonIcon);
local l_MappedSignal_0 = v3.MappedSignal;
local l_SelfieView_0 = script.Parent.Parent.Parent.SelfieView;
local v11 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewEnabled);
local v12 = require(script.Parent.Parent.Flags.GetFFlagTweakedMicPinning);
local v13 = require(script.Parent.Parent.Flags.GetFFlagSelfViewFixes)();
local v14 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeFTUX)();
local v15 = game:DefineFastFlag("FixSelfViewPopin", false);
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local v17 = require(script.Parent.Parent.Flags.GetFFlagUseSelfieViewFlatIcon);
local v18 = require(l_SelfieView_0);
local v19 = require(l_SelfieView_0.Utils.FaceChatUtils);
local v20 = require(l_SelfieView_0.Utils.SizingUtils);
local l_AvailabilitySignalState_0 = require(script.Parent.Parent.Service.ChromeUtils).AvailabilitySignalState;
local v22 = require(script.Parent.Parent.Service.WindowSizeSignal);
local v23 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal.new();
local v24 = require(script.Parent.Parent.Service.ViewportUtil);
local v25 = v20.getSize(v24.screenSize:get(), false);
local v26 = v22.new(v25.X, v25.Y);
local v27 = require(script.Parent.Parent.Unibar.Constants);
local v28 = UDim2.new(0, v27.ICON_SIZE, 0, v27.ICON_SIZE);
local v29 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.SelfView.Analytics).new();
local v30 = UDim2.new(1, -95, 0, 165);
local v31 = l_MappedSignal_0.new(v2:onIntegrationStatusChanged(), function()
    return v2:isWindowOpen("selfie_view");
end);
v2:updateWindowPosition("selfie_view", v30);
local v40 = v2:register({
    id = "selfie_view", 
    label = "CoreScripts.TopBar.SelfViewLabel", 
    windowSize = v26, 
    startingWindowPosition = v30, 
    initialAvailability = l_AvailabilitySignalState_0.Unavailable, 
    activated = function()
        if v14 then
            v4.storeForLocalPlayer("selfie_view", true);
        end;
        v2:toggleWindow("selfie_view");
    end, 
    draggable = true, 
    cachePosition = true, 
    components = {
        Icon = not v17() and function(_)
            if not l_GetFFlagSelfViewVisibilityFix_0() then
                return (v1.createElement(v18.Icon, {
                    activatedSignal = v23
                }, {}));
            else
                return (v1.createElement(v18.Icon, {
                    activatedSignal = v23, 
                    outerContainerFrameName = "selfie_view"
                }, {}));
            end;
        end or function(_)
            return v1.createElement("Frame", {
                Size = v28, 
                BackgroundTransparency = 1
            }, {
                v8("icons/controls/selfieOff", "icons/controls/selfie", v31); 
                CameraStatusDot = not not v18.useCameraOn() and v1.createElement(v18.CameraStatusDot, {
                    Position = UDim2.fromScale(0.8, 0.7), 
                    ZIndex = 2
                }) or nil
            }, {});
        end, 
        Window = function(_)
            local v35 = v2:dragConnection("selfie_view");
            local l_createElement_0 = v1.createElement;
            local l_Window_0 = v18.Window;
            local v38 = {
                id = "selfie_view", 
                windowSize = v26
            };
            local v39;
            if not v13 then
                v39 = v35 ~= nil;
            else
                v39 = false;
                if v35 ~= nil then
                    v39 = v35.connection ~= nil;
                end;
            end;
            v38.isDraggedOut = v39;
            return l_createElement_0(l_Window_0, v38, {});
        end
    }
});
v24.screenSize:connect(function(v41)
    if not v2:isWindowOpen("selfie_view") then
        local v42 = v20.getSize(v41, v26:getIsLarge());
        v26:requestSize(v42.X, v42.Y);
    end;
end, true);
local function v47()
    if l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) then
        local v43 = v19.getPermissions();
        local v44 = v43.placeCamEnabled or v43.placeMicEnabled;
        local v45 = v43.userCamEligible or v43.userMicEligible;
        if v44 and v45 then
            local _ = nil;
            if not if not v12() then if v15 then l_FaceAnimatorService_0:IsStarted() and (l_FaceAnimatorService_0.VideoAnimationEnabled or l_FaceAnimatorService_0.AudioAnimationEnabled) else l_FaceAnimatorService_0.VideoAnimationEnabled or l_FaceAnimatorService_0.AudioAnimationEnabled else if not v15 then l_FaceAnimatorService_0.VideoAnimationEnabled else l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled or v17() then
                v40.availability:available();
                return ;
            else
                v40.availability:pinned();
                return ;
            end;
        else
            v40.availability:unavailable();
            return ;
        end;
    else
        v40.availability:unavailable();
        return ;
    end;
end;
local function _()
    local v48 = v19.getPermissions();
    v29:reportExperienceSettings(true, v48.placeCamEnabled, v48.placeMicEnabled);
    v29:reportUserAccountSettings(v48.userCamEnabled, v48.userMicEnabled);
end;
if not (not v11() or not game:GetEngineFeature("VideoCaptureService")) then
    v47();
    l_VideoCaptureService_0.Started:Connect(v47);
    l_VideoCaptureService_0.Stopped:Connect(v47);
    l_VideoCaptureService_0.DevicesChanged:Connect(v47);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v47);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v47);
    local v50 = v19.getPermissions();
    v29:reportExperienceSettings(true, v50.placeCamEnabled, v50.placeMicEnabled);
    v29:reportUserAccountSettings(v50.userCamEnabled, v50.userMicEnabled);
end;
l_StarterGui_0.CoreGuiChangedSignal:Connect(v47);
return v40;
