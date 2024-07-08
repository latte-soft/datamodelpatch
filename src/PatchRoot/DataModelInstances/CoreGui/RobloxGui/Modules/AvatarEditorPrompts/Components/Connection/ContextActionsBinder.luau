local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(script.Parent.Parent.Parent.Thunks.CloseOpenPrompt);
local v7 = v3.PureComponent:extend("ContextActionsBinder");
v7.validateProps = v5.strictInterface({
    promptOpen = v5.boolean, 
    closeOpenPrompt = v5.callback
});
v7.init = function(v8)
    v8.actionsBound = false;
end;
v7.bindActions = function(v9)
    if not v9.actionsBound then
        v9.actionsBound = true;
        l_ContextActionService_0:BindCoreAction("CloseAvatarEditorPrompt", function(_, v11, _)
            if not l_GuiService_0.MenuIsOpen then
                if v11 ~= Enum.UserInputState.Begin then
                    return Enum.ContextActionResult.Pass;
                else
                    v9.props.closeOpenPrompt();
                    return Enum.ContextActionResult.Sink;
                end;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.Escape);
        return ;
    else
        return ;
    end;
end;
v7.unbindActions = function(v13)
    if v13.actionsBound then
        v13.actionsBound = false;
        l_ContextActionService_0:UnbindCoreAction("CloseAvatarEditorPrompt");
        return ;
    else
        return ;
    end;
end;
v7.didMount = function(v14)
    if v14.props.promptOpen then
        v14:bindActions();
    end;
end;
v7.render = function(_)
    return nil;
end;
v7.didUpdate = function(v16, v17, _)
    if v16.props.promptOpen ~= v17.promptOpen then
        if not v16.props.promptOpen then
            v16:unbindActions();
        else
            v16:bindActions();
            return ;
        end;
    end;
end;
v7.willUnmount = function(v19)
    if v19.actionsBound then
        v19:unbindActions();
    end;
end;
return v4.connect(function(v20)
    return {
        promptOpen = v20.promptInfo.promptType ~= nil
    };
end, function(v21)
    return {
        closeOpenPrompt = function()
            return v21(v6);
        end
    };
end)(v7);
