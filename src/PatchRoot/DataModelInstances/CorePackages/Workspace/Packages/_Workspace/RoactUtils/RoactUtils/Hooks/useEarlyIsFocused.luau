local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(script.Parent.useNavigation);
return function()
    local v4 = v3();
    local v5, v6 = v1.useState(v4.isFocused());
    v1.useEffect(function()
        v6(v4.isFocused());
        local v7 = v4.addListener(v2.Events.WillFocus, function()
            v6(true);
        end);
        local v8 = v4.addListener(v2.Events.WillBlur, function()
            v6(false);
        end);
        return function()
            v7.remove();
            v8.remove();
        end;
    end, {
        v4
    });
    return v5;
end;
