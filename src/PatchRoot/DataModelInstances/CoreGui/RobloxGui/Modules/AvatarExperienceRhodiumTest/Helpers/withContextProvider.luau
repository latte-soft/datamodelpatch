local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Cryo);
return function(v3, v4, v5)
    return v1.forwardRef(function(v6, v7)
        return v1.createElement(v4, {
            value = v5
        }, {
            component = v1.createElement(v3, v2.Dictionary.join(v6, {
                [v1.Ref] = v7
            }))
        });
    end);
end;
