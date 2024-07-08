local l_ContextActionService_0 = game:GetService("ContextActionService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact).Component:extend("ContextActionEvent");
v1.render = function(_)
    return nil;
end;
v1.didMount = function(v3)
    if not v3.props.actionPriority then
        l_ContextActionService_0:BindCoreAction(v3.props.name, v3.props.callback, false, unpack(v3.props.binds));
        return ;
    else
        l_ContextActionService_0:BindCoreActionAtPriority(v3.props.name, v3.props.callback, false, 2000 + v3.props.actionPriority, unpack(v3.props.binds));
        return ;
    end;
end;
v1.didUpdate = function(v4, v5)
    if not (v4.props.callback == v5.callback) or v4.props.name ~= v5.name then
        l_ContextActionService_0:UnbindCoreAction(v5.name);
        if not v4.props.actionPriority then
            l_ContextActionService_0:BindCoreAction(v4.props.name, v4.props.callback, false, unpack(v4.props.binds));
        else
            l_ContextActionService_0:BindCoreActionAtPriority(v4.props.name, v4.props.callback, false, 2000 + v4.props.actionPriority, unpack(v4.props.binds));
            return ;
        end;
    end;
end;
v1.willUnmount = function(v6)
    l_ContextActionService_0:UnbindCoreAction(v6.props.name);
end;
return v1;
