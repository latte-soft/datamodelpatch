local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Roact);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v8 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks);
local v9 = game:DefineFastFlag("VRFixScrollingAfterPurchase", false);
return (v8(function(v10)
    local v11 = false;
    local function v16(_, _, v14)
        if not v11 then
            v11 = true;
            l_RunService_0:BindToRenderStep("VRAvatarEditorJoystickRotate", Enum.RenderPriority.Input.Value, function(v15)
                l_GamepadUtils_0.rotateAndZoom(v14, v15, v10.setAngularVelocityByPixels, v10.rotateByRadians);
            end);
        end;
        if not v9 then
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end;
    local function v17()
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
        l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
        v11 = false;
    end;
    local function v18()
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
        l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
        v11 = false;
        l_ContextActionService_0:BindCoreAction("RotateAvatarWithGamepadVR_R", v16, false, Enum.KeyCode.Thumbstick2);
        l_ContextActionService_0:BindCoreAction("RotateAvatarWithGamepadVR_L", v16, false, Enum.KeyCode.Thumbstick1);
    end;
    v5.useEffect(function()
        return function()
            l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
            l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
            l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
            v11 = false;
        end;
    end, {});
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v6.Event.MouseEnter] = v18, 
        [v6.Event.MouseLeave] = v17
    });
end));
