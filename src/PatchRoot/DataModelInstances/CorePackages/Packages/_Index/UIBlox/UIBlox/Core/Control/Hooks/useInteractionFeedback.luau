local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.Parent.React);
local v3 = require(l_Parent_0.FeedbackManagerInjectionContext);
local v4 = require(l_Parent_1.Control.Enum.ControlState);
local function v8(v5, v6)
    local _ = nil;
    if not (v6 ~= v4.Pressed) or v6 == v4.SelectedPressed then
        return "Press";
    elseif (not (v6 ~= v4.Hover) or v6 == v4.Selected) and v5 == v4.Default then
        return "Hover";
    elseif (not (v5 ~= v4.Pressed) or v5 == v4.SelectedPressed) and v6 ~= v4.Disabled then
        return "Release";
    else
        return nil;
    end;
end;
return function()
    local v9 = v2.useContext(v3);
    return v2.useCallback(function(v10, v11, v12)
        local v13 = v8(v11, v12);
        if v13 then
            v9(v10 or "Default", v13);
        end;
    end, {
        v9
    });
end;
