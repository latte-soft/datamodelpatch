local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.LayoutValuesContext);
return {
    Provider = function(v2)
        return v0.createElement(v1.Provider, {
            value = v2.layoutValues
        }, v0.oneChild(v2[v0.Children]));
    end, 
    Consumer = v1.Consumer, 
    WithLayoutValues = function(v3)
        assert(type(v3) == "function", "Expect withLayoutValues callback to be a function.");
        return v0.createElement(v1.Consumer, {
            render = v3
        });
    end
};
