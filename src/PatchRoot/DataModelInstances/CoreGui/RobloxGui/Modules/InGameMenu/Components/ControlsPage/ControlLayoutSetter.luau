local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Controls);
local v7 = require(l_Parent_0.Actions.SetControlLayout);
local v8 = l_Roact_0.PureComponent:extend("ControlLayoutSetter");
v8.init = function(v9)
    local v10 = v6.inputToControlTypeMap[l_UserInputService_0:GetLastInputType()];
    if v10 then
        v9.props.dispatchSetControlLayout(v10);
    end;
end;
v8.render = function(_)
    return nil;
end;
v8.didMount = function(v12)
    v12.inputChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v13)
        local v14 = v6.inputToControlTypeMap[v13];
        if v14 then
            v12.props.dispatchSetControlLayout(v14);
        end;
    end);
end;
v8.willUnmount = function(v15)
    if v15.inputChangedConnection then
        v15.inputChangedConnection:Disconnect();
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16)
    return {
        dispatchSetControlLayout = function(v17)
            v16(v7(v17));
        end
    };
end)(v8);
