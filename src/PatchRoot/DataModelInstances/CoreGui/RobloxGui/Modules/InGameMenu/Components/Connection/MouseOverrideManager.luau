local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_CorePackages_0.Symbol);
local v4 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Utility.ExternalEventConnection);
local v12 = v3.named("InGameMenuCursorOverride");
local l_InputType_0 = v10.InputType;
local v14 = l_Roact_0.PureComponent:extend("MouseOverrideManager");
v14.validateProps = l_t_0.strictInterface({
    menuOpen = l_t_0.boolean, 
    exitModalOpen = l_t_0.boolean, 
    inputType = l_t_0.string
});
v14.render = function(v15)
    local l_exitModalOpen_0 = v15.props.exitModalOpen;
    return l_Roact_0.createElement(v11, {
        event = l_UserInputService_0:GetPropertyChangedSignal("OverrideMouseIconBehavior"), 
        callback = function()
            if not (not v15.props.menuOpen and not l_exitModalOpen_0) and l_UserInputService_0.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
                v15:updateMouseIconOverride();
            end;
        end
    });
end;
v14.init = function(v17)
    v17.didOverrideMouse = false;
end;
v14.updateMouseIconOverride = function(v18)
    local l_exitModalOpen_1 = v18.props.exitModalOpen;
    if not v18.props.menuOpen and not l_exitModalOpen_1 then
        if v18.didOverrideMouse then
            v18.didOverrideMouse = false;
            v4.pop(v12);
        end;
        return ;
    else
        v18.didOverrideMouse = true;
        if v18.props.inputType ~= l_InputType_0.Gamepad and not l_VRService_0.VREnabled then
            v4.push(v12, Enum.OverrideMouseIconBehavior.ForceShow);
            return ;
        else
            v4.push(v12, Enum.OverrideMouseIconBehavior.ForceHide);
            return ;
        end;
    end;
end;
v14.didMount = function(v20)
    v20:updateMouseIconOverride();
end;
v14.didUpdate = function(v21)
    v21:updateMouseIconOverride();
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v22)
    return {
        menuOpen = v22.isMenuOpen, 
        exitModalOpen = v22.nativeClosePrompt.closingApp, 
        inputType = v22.displayOptions.inputType
    };
end, nil)(v14);
