local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_ControlState_0 = v2.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
HoverButtonBackground = function()
    local l_BackgroundOnHover_0 = l_useStyle_0().Theme.BackgroundOnHover;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = l_BackgroundOnHover_0.Color, 
        BackgroundTransparency = l_BackgroundOnHover_0.Transparency, 
        ZIndex = -1
    }, {
        corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 21)
        })
    });
end;
local function v15(v10, v11, v12)
    local v13 = v10[v11] or v10[l_ControlState_0.Default];
    local v14 = {
        Color = v12.Theme[v13].Color, 
        Transparency = v12.Theme[v13].Transparency
    };
    if not (v11 ~= l_ControlState_0.Disabled) or v11 == l_ControlState_0.Pressed then
        v14.Transparency = 0.5 * v14.Transparency + 0.5;
    end;
    return v14;
end;
local function v20(v16)
    local v17, v18 = v1.useState(l_ControlState_0.Initialize);
    return v17, (v1.useCallback(function(v19)
        if v16 and v17 ~= v19 then
            v16(v17, v19);
        end;
        v18(v17);
    end, {
        v17, 
        v16
    }));
end;
GlobalNavOption = function(v21)
    local v22 = l_useStyle_0();
    local v23 = l_useSelectionCursor_0(l_CursorKind_0.LargePill);
    local v24, v25 = v20(v21.stateChangeCallback);
    local v26 = v15({
        [l_ControlState_0.Default] = "SystemPrimaryDefault", 
        [l_ControlState_0.Hover] = "SystemPrimaryDefault"
    }, v24, v22);
    return v1.createElement(l_Interactable_0, {
        AnchorPoint = Vector2.new(0, 0), 
        LayoutOrder = 0, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.fromOffset(86, 54), 
        onStateChanged = v25, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v21.onActivated, 
        SelectionImageObject = v23
    }, {
        imageLabel = v1.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(42, 42), 
            BackgroundTransparency = 1, 
            Image = v21.icon, 
            ImageColor3 = v26.Color, 
            ImageTransparency = v26.Transparency
        }, v21.children), 
        hoverBackground = v24 == l_ControlState_0.Hover and v1.createElement(HoverButtonBackground) or nil
    });
end;
return GlobalNavOption;
