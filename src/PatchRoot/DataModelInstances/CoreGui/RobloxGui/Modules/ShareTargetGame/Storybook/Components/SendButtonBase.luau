local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.Components.SendButton);
local v3 = l_Roact_0.PureComponent:extend("SendButtonBase");
v3.init = function(v4)
    v4.state = {
        sentStatus = nil
    };
    v4.send = function()
        v4:setState({
            sentStatus = v4.props.sentStatus
        });
    end;
end;
v3.render = function(v5)
    return l_Roact_0.createElement(v2, {
        sentStatus = v5.state.sentStatus, 
        onActivated = v5.send
    });
end;
return v3;
