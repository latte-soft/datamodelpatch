local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetInputType);
local v8 = require(l_Parent_0.Utility.ExternalEventConnection);
local l_InputTypeMap_0 = require(l_Parent_0.Resources.Constants).InputTypeMap;
local v10 = l_Roact_0.PureComponent:extend("LastInputTypeConnector");
v10.updateInputType = function(v11, v12)
    if l_VRService_0.VREnabled then
        v12 = l_InputTypeMap_0[Enum.UserInputType.MouseMovement];
    end;
    if v12 then
        v11.props.setInputType(v12);
    end;
end;
v10.init = function(v13)
    v13:updateInputType(l_InputTypeMap_0[l_UserInputService_0:GetLastInputType()]);
end;
v10.render = function(v14)
    return l_Roact_0.createElement(v8, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v15)
            v14:updateInputType(l_InputTypeMap_0[v15]);
        end
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16)
    return {
        setInputType = function(v17)
            return v16(v7(v17));
        end
    };
end)(v10);
