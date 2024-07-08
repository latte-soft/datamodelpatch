local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_ControlState_0 = v2.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v2.App.ImageSet.getIconSize;
local l_useCursor_0 = v2.App.SelectionCursor.useCursor;
local function v13(v10, v11)
    local v12 = {
        Color = v11.Theme.SystemPrimaryDefault.Color, 
        Transparency = v11.Theme.SystemPrimaryDefault.Transparency
    };
    if not (v10 ~= l_ControlState_0.Disabled) or v10 == l_ControlState_0.Pressed then
        v12.Transparency = 0.5 * v12.Transparency + 0.5;
    end;
    return v12;
end;
return function(v14)
    local v15 = l_useStyle_0();
    local v16 = l_useCursor_0(UDim.new(0.5, 0), 0);
    local v17, v18 = v1.useState(l_ControlState_0.Initialize);
    local v19 = v13(v17, v15);
    local v20 = l_getIconSize_0(l_IconSize_0.Medium, v15);
    return v1.createElement(l_Interactable_0, {
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.fromOffset(v20 + 2 * v15.Tokens.Global.Size_150, v20 + 2 * v15.Tokens.Global.Size_50), 
        onStateChanged = v18, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v14.onActivated, 
        SelectionImageObject = v16
    }, v1.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v20, v20), 
        BackgroundTransparency = 1, 
        Image = v14.icon, 
        ImageColor3 = v19.Color, 
        ImageTransparency = v19.Transparency
    }));
end;
