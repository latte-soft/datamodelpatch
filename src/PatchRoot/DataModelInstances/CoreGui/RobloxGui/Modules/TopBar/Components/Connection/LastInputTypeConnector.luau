local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Parent.Common.EventConnection);
local v6 = require(l_Parent_0.Actions.SetInputType);
local l_InputType_0 = require(l_Parent_0.Constants).InputType;
local v8 = v2.PureComponent:extend("LastInputTypeConnector");
local v9 = {
    [Enum.UserInputType.MouseButton2] = l_InputType_0.MouseAndKeyBoard, 
    [Enum.UserInputType.MouseButton3] = l_InputType_0.MouseAndKeyBoard, 
    [Enum.UserInputType.MouseWheel] = l_InputType_0.MouseAndKeyBoard, 
    [Enum.UserInputType.MouseMovement] = l_InputType_0.MouseAndKeyBoard, 
    [Enum.UserInputType.Keyboard] = l_InputType_0.MouseAndKeyBoard, 
    [Enum.UserInputType.Gamepad1] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad2] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad3] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad4] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad5] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad6] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad7] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Gamepad8] = l_InputType_0.Gamepad, 
    [Enum.UserInputType.Touch] = l_InputType_0.Touch
};
v8.didMount = function(v10)
    local v11 = v9[l_UserInputService_0:GetLastInputType()];
    if v11 then
        v10.props.setInputType(v11);
    end;
end;
v8.render = function(v12)
    return v2.createElement(v5, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v13)
            local v14 = v9[v13];
            if v14 then
                v12.props.setInputType(v14);
            end;
        end
    });
end;
return v3.UNSTABLE_connect2(nil, function(v15)
    return {
        setInputType = function(v16)
            return v15(v6(v16));
        end
    };
end)(v8);
