local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.AppPolicyContext);
return function()
    local v2 = v0.Component:extend("PolicyProvider");
    v2.init = function(v3, v4)
        assert(type(v4.policy) == "table", "Provider expects props.policy to be a table");
        v3.policy = {
            presentationPolicy = v4.policy, 
            staticExternalPolicy = v4.policyData
        };
    end;
    v2.render = function(v5)
        return v0.createElement(v1.Provider, {
            value = v5.policy
        }, v5.props[v0.Children]);
    end;
    return v2;
end;
