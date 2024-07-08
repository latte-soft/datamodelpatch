local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = require(script.Parent.Hooks.useIsGamepad);
return function(v4)
    return function(v5)
        return v1.createElement(v4, v2.join(v5, {
            isGamepadInput = v3()
        }));
    end;
end;
