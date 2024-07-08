local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Core.Control.Enum.ControlState);
local _ = require(l_Parent_0.App.Style.StyleTypes);
return function(v3, v4)
    if v3 == v1.Initialize then
        return v4.Initialize;
    elseif v3 == v1.Default then
        return v4.Default;
    elseif v3 == v1.Pressed then
        return v4.Pressed;
    elseif v3 == v1.Hover then
        return v4.Hover;
    elseif v3 == v1.Selected then
        return v4.Selected;
    elseif v3 == v1.SelectedPressed then
        return v4.SelectedPressed;
    elseif v3 == v1.Disabled then
        return v4.Disabled;
    else
        return nil;
    end;
end;
