local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.Roact);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local _ = require(l_Parent_0.Constants);
local v9 = {
    VRService = game:GetService("VRService"), 
    UpdateEvent = l_RunService_0.Heartbeat
};
return function(v10)
    local v11 = l_Object_0.assign({}, v9, v10);
    local l_LaserPointer_0 = v11.LaserPointer;
    local l_VRControllerModel_0 = v11.VRControllerModel;
    local l_VRService_0 = v11.VRService;
    local v15 = v4.useRef(nil);
    local v16 = v4.useRef(nil);
    local v17 = v4.useRef(nil);
    local l_status_0, l_result_0 = pcall(function()
        return l_VRService_0:GetPropertyChangedSignal("VRSessionState");
    end);
    local v20 = v4.useCallback(function()
        if not v15.current then
            v15.current = l_LaserPointer_0.new();
            v15.current:setMode(v15.current.Mode.DualPointer);
            v15.current:setEnableAmbidexterousPointer(true);
            v16.current = l_VRControllerModel_0.new(Enum.UserCFrame.LeftHand);
            v17.current = l_VRControllerModel_0.new(Enum.UserCFrame.RightHand);
        end;
        v16.current:setEnabled(l_VRService_0.VREnabled);
        v17.current:setEnabled(l_VRService_0.VREnabled);
        if l_VRService_0.VREnabled then
            l_ContextActionService_0:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        end;
    end, {
        v16, 
        v17, 
        v15, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v21 = nil;
    v21 = v4.useCallback(function()
        if v16.current then
            v16.current:setEnabled(false);
        end;
        if v17.current then
            v17.current:setEnabled(false);
        end;
        if v15.current then
            v15.current:setMode(v15.current.Mode.Disabled);
        end;
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
    end, {
        v16, 
        v17, 
        v15, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v24 = v4.useCallback(function()
        local v22 = true;
        if l_VRService_0.VRSessionState ~= Enum.VRSessionState.Idle then
            v22 = l_VRService_0.VRSessionState == Enum.VRSessionState.Visible;
        end;
        local v23 = not v22;
        if v15.current then
            if not v23 then
                v15.current:setMode(v15.current.Mode.Disabled);
            else
                v15.current:setMode(v15.current.Mode.DualPointer);
            end;
        end;
        if v16.current then
            v16.current:setEnabled(v23);
        end;
        if v17.current then
            v17.current:setEnabled(v23);
        end;
    end, {
        v16, 
        v17, 
        v15, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    v4.useEffect(function()
        if l_VRService_0.VREnabled then
            v20();
        end;
        return v21;
    end, {});
    return v4.createElement(v5.Portal, {
        target = workspace
    }, {
        UserCFrameChangedConnection = v4.createElement(l_EventConnection_0, {
            event = v11.UpdateEvent, 
            callback = function()
                if v15.current then
                    v15.current:update();
                end;
                if v16.current then
                    v16.current:update();
                end;
                if v17.current then
                    v17.current:update();
                end;
            end
        }), 
        VREnabledConnection = v4.createElement(l_EventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v20
        }), 
        VRSessionStateConnection = if not l_status_0 then nil else v4.createElement(l_EventConnection_0, {
            event = l_result_0, 
            callback = v24
        })
    });
end;
