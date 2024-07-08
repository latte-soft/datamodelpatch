local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local v3 = l_Roact_0.PureComponent:extend("RootedConnection");
v3.validateProps = l_t_0.strictInterface({
    render = l_t_0.callback
});
v3.init = function(v4)
    v4.state = {
        isRooted = false
    };
    v4.rootRef = l_Roact_0.createRef();
    v4.onAncestryChanged = function(v5)
        if v5:IsDescendantOf(game) then
            v4:setState({
                isRooted = true
            });
        end;
    end;
end;
v3.render = function(v6)
    return l_Roact_0.createFragment({
        Content = v6.props.render(v6.state.isRooted), 
        Folder = l_Roact_0.createElement("Folder", {
            [l_Roact_0.Event.AncestryChanged] = v6.onAncestryChanged, 
            [l_Roact_0.Ref] = v6.rootRef
        })
    });
end;
v3.didMount = function(v7)
    if v7.rootRef:getValue():IsDescendantOf(game) then
        v7:setState({
            isRooted = true
        });
    end;
end;
return v3;
