local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Cryo_0 = v0.Cryo;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local _ = game:GetService("StarterGui");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = game:GetService("StarterPlayer");
local _ = l_t_0.strictInterface({
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
local function v14(v12, v13)
    return l_Roact_0.createElement(l_ImageSetButton_0, {
        Visible = true, 
        AnchorPoint = v12.AnchorPoint, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/MenuBar/divider.png", 
        Position = UDim2.new(0, 1, 0, 1), 
        Size = UDim2.new(0, 28, 0, 36), 
        LayoutOrder = v12.layoutOrder, 
        SelectionImageObject = v13(l_CursorKind_0.RoundedRect), 
        [l_Roact_0.Event.Activated] = function()
        end, 
        [l_Roact_0.Event.SelectionGained] = v12.onSelectionGained, 
        [l_Roact_0.Event.SelectionLost] = v12.onSelectionLost, 
        [l_Roact_0.Ref] = v12.forwardRef
    });
end;
local function v17(v15)
    return l_withSelectionCursorProvider_0(function(v16)
        return v14(v15, v16);
    end);
end;
return l_Roact_0.forwardRef(function(v18, v19)
    return l_Roact_0.createElement(v17, l_Cryo_0.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);
