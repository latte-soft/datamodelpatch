local l_Parent_0 = script:FindFirstAncestor("TenFootUiControllerBar").Parent;
local v1 = require(l_Parent_0.React);
local l_ShortcutBar_0 = require(l_Parent_0.UIBlox).App.Navigation.ShortcutBar;
ControllerBar = function(v3)
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, if #v3.items > 0 then v1.createElement(l_ShortcutBar_0, {
        items = v3.items, 
        position = UDim2.fromScale(0.5, 0), 
        anchorPoint = Vector2.new(0.5, 0)
    }) else nil);
end;
return ControllerBar;
