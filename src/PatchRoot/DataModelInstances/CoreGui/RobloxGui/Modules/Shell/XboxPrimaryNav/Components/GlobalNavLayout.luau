local l_CorePackages_0 = game:GetService("CorePackages");
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local v2 = require(l_CorePackages_0.Packages.React);
local function v4(v3)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(v3.position == "right" and 1 or 0, 0, 0, 0), 
        AnchorPoint = Vector2.new(v3.position == "right" and 1 or 0, 0.5), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, v3.children);
end;
return (v2.forwardRef(function(v5, v6)
    local l_startSlot_0 = v5.startSlot;
    local l_endSlot_0 = v5.endSlot;
    v5.startSlot = nil;
    v5.endSlot = nil;
    return v2.createElement("Frame", l_Object_0.assign({
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ref = v6
    }, v5), {
        GlobalNavStart = v2.createElement(v4, {}, {
            StartSlot = l_startSlot_0
        }), 
        GlobalNavEnd = v2.createElement(v4, {
            position = "right"
        }, {
            EndSlot = l_endSlot_0
        })
    });
end));
