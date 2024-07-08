local v0 = require(script:FindFirstAncestor("Responsive").Parent.React);
local v1 = require(script.Parent.Parent.HardwareSafeAreaInsets);
return function()
    local v2, v3 = v0.useState(v1.deviceInsets());
    v0.useLayoutEffect(function()
        local v4 = v1:connect(v3);
        if v1.diffInsets(v2, v1.deviceInsets()) then
            v3(v1.deviceInsets);
        end;
        return v4;
    end, {});
    return v2;
end;
