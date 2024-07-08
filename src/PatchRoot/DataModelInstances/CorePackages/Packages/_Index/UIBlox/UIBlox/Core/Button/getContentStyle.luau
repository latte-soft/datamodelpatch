local v0 = require(script.Parent.Parent.Control.Enum.ControlState);
return function(v1, v2, v3)
    local v4 = v1[v2] or v1[v0.Default];
    local v5 = {
        Color = v3.Theme[v4].Color, 
        Transparency = v3.Theme[v4].Transparency
    };
    if not (v2 ~= v0.Disabled) or v2 == v0.Pressed then
        v5.Transparency = 0.5 * v5.Transparency + 0.5;
    end;
    return v5;
end;
