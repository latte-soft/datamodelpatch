local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_VRConstants_0 = require(l_Parent_0.VrCompatibility).VRConstants;
local l_GetFFlagAdjustVRFloor_0 = require(l_Parent_0.SharedFlags).GetFFlagAdjustVRFloor;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_Constants_0 = v3.Core.VR.Constants;
local v8 = game:DefineFastFlag("RepositionInExperienceVRToasts", false);
return function(v9)
    local l_isConfirmModalOpen_0 = v9.isConfirmModalOpen;
    local l_isToastOpen_0 = v9.isToastOpen;
    local l_isCoreScript_0 = v9.isCoreScript;
    local l_ToastComponent_0 = v9.ToastComponent;
    local l_ConfirmationModalComponent_0 = v9.ConfirmationModalComponent;
    local v15 = v2.useRef(nil);
    local v16 = l_GuiService_0.CoreGuiFolder and l_GuiService_0.CoreGuiFolder:FindFirstChild(l_VRConstants_0.PositionLockedPanelName);
    if not v16 then
        v16 = v15.current;
    else
        v15.current = v16;
    end;
    local v17 = not v16 and 2.45 or v16.Size.Y;
    local v18 = {
        partSize = l_VRConstants_0.ToastSize, 
        offset = not not l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.ToastPosition or CFrame.lookAt(l_VRConstants_0.ToastPosition, l_VRConstants_0.DefaultCameraPosition), 
        virtualScreenSize = l_VRConstants_0.ToastResolution, 
        curvature = l_VRConstants_0.ToastCurvature, 
        panelName = "ToastNotifications", 
        hidden = not l_isToastOpen_0
    };
    if l_isCoreScript_0 then
        v18 = {
            panelName = "ToastNotifications", 
            partSize = if not v8 then Vector3.new(1.2, 0.6, 0) else Vector3.new(1, 0.5, 0), 
            virtualScreenSize = Vector2.new(300, 150), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isToastOpen_0, 
            tiltCallback = v2.useCallback(function(v19)
                if not v16 then
                    return v19.panelCFrame;
                elseif not v8 then
                    return (v16.CFrame * CFrame.new(0, v17 * -0.45, v17 * -0.15)) * CFrame.Angles(0.2, 0, 0);
                else
                    return (v16.CFrame * CFrame.new(0, v17 * -0.53, v17 * -0.15)) * CFrame.Angles(0.25, 0, 0);
                end;
            end, {
                v16, 
                v17
            })
        };
    end;
    return v2.createElement(v2.Fragment, nil, {
        v2.createElement(l_Panel3D_0, v18, {
            Toast = l_ToastComponent_0
        }), 
        v2.createElement(l_Panel3D_0, {
            panelName = "ConfirmationModal", 
            partSize = Vector3.new(3, 3, 0), 
            virtualScreenSize = Vector2.new(600, 600), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isConfirmModalOpen_0, 
            tiltCallback = v2.useCallback(function(v20)
                if not v16 then
                    return v20.panelCFrame;
                else
                    return v16.CFrame * CFrame.new(0, 0, -0.1);
                end;
            end, {
                v16
            })
        }, {
            DeeplinkConfirmationModal = l_ConfirmationModalComponent_0
        })
    });
end;
