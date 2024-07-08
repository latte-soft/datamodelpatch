local l_RunService_0 = game:GetService("RunService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact).Component:extend("RenderStep");
v1.render = function(_)
    return nil;
end;
v1.didMount = function(v3)
    l_RunService_0:BindToRenderStep(v3.props.name, v3.props.priority, v3.props.callback);
end;
v1.didUpdate = function(v4, v5)
    if not (v4.props.callback == v5.callback) or v4.props.name ~= v5.name then
        l_RunService_0:UnbindFromRenderStep(v5.name);
        l_RunService_0:BindToRenderStep(v4.props.name, v4.props.priority, v4.props.callback);
    end;
end;
v1.willUnmount = function(v6)
    l_RunService_0:UnbindFromRenderStep(v6.props.name);
end;
return v1;
