local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.FocusContext);
local function v5(v2)
    return v0.createElement(v1.Consumer, {
        render = function(v3)
            local _ = nil;
            return v2.render(if not v3 then nil else v3.focusNode.focusController);
        end
    });
end;
return function(v6)
    return v0.createElement(v5, {
        render = v6
    });
end;
