local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(script.Parent.Parent.Parent.Actions.SetPlayerListVisibility);
local v6 = v3.PureComponent:extend("ContextActionsBinder");
local v7 = {
    Enum.UserInputType.Gamepad1, 
    Enum.UserInputType.Gamepad2, 
    Enum.UserInputType.Gamepad3, 
    Enum.UserInputType.Gamepad4, 
    Enum.UserInputType.Gamepad5, 
    Enum.UserInputType.Gamepad6, 
    Enum.UserInputType.Gamepad7, 
    Enum.UserInputType.Gamepad8
};
v6.init = function(v8)
    v8.boundPlayerListActions = false;
end;
v6.bindActions = function(v9)
    l_ContextActionService_0:BindCoreAction("RbxPlayerListToggle", function(_, v11, _)
        if not l_GuiService_0.MenuIsOpen then
            if v11 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass;
            else
                v9.props.setVisibility(not v9.props.displayOptions.isVisible);
                return Enum.ContextActionResult.Sink;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.Tab);
    l_ContextActionService_0:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _)
        if not v9.props.displayOptions.isVisible or not v9.props.displayOptions.isTenFootInterface then
            return Enum.ContextActionResult.Pass;
        else
            return Enum.ContextActionResult.Sink;
        end;
    end, false, unpack(v7));
    l_ContextActionService_0:BindCoreAction("RbxPlayerListGamepadClose", function(_, v17, _)
        if v17 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        elseif not v9.props.displayOptions.isVisible or not v9.props.displayOptions.isTenFootInterface then
            return Enum.ContextActionResult.Pass;
        else
            v9.props.setVisibility(false);
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    v9.boundPlayerListActions = true;
end;
v6.unbindActions = function(v19)
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListToggle");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListStopMovement");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListGamepadClose");
    v19.boundPlayerListActions = false;
end;
v6.didMount = function(v20)
    v20:bindActions();
end;
v6.render = function(_)
    return nil;
end;
v6.willUnmount = function(v22)
    if v22.boundPlayerListActions then
        v22:unbindActions();
    end;
end;
return v4.connect(function(v23)
    return {
        displayOptions = v23.displayOptions
    };
end, function(v24)
    return {
        setVisibility = function(v25)
            return v24(v5(v25));
        end
    };
end)(v6);
