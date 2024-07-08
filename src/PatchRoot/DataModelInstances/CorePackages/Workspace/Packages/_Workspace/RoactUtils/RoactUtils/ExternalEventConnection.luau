local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if not l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    local v3 = require(l_Parent_0.Roact);
    local v4 = v3.Component:extend("ExternalEventConnection");
    v4.init = function(v5)
        v5.connection = nil;
    end;
    v4.render = function(v6)
        return v3.oneChild(v6.props[v3.Children]);
    end;
    v4.didMount = function(v7)
        v7.connection = v7.props.event:Connect(v7.props.callback);
    end;
    v4.didUpdate = function(v8, v9)
        if not (v8.props.event == v9.event) or v8.props.callback ~= v9.callback then
            v8.connection:Disconnect();
            v8.connection = v8.props.event:Connect(v8.props.callback);
        end;
    end;
    v4.willUnmount = function(v10)
        if v10.connection then
            v10.connection:Disconnect();
            v10.connection = nil;
        end;
    end;
    return v4;
else
    return v2.EventConnection;
end;
