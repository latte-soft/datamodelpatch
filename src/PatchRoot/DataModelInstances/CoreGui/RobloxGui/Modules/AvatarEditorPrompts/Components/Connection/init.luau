local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.ContextActionsBinder);
local v2 = v0.PureComponent:extend("Connection");
v2.render = function(_)
    return v0.createFragment({
        ContextActionsBinder = v0.createElement(v1)
    });
end;
return v2;
