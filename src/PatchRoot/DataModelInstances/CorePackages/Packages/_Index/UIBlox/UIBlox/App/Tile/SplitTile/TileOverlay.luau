local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local v2 = require(l_Parent_0.Parent.React);
local v3 = require(l_Core_0.Control.Interactable);
local v4 = require(l_Core_0.Control.useControlState);
local v5 = require(l_Core_0.Style.useStyle);
local v6 = require(l_Core_0.Control.Enum.ControlState);
local v7 = require(l_Parent_0.Utility.setDefault);
local v8 = UDim.new(0, 8);
return function(v9)
    local l_onActivated_0 = v9.onActivated;
    local v11 = v7(v9.isVisible, true);
    local v12 = v7(v9.isActive, true);
    local v13 = v9.reservedBottomHeight or 0;
    local v14 = v13 > 0;
    if v11 or v12 then
        local v15, v16 = v4();
        local l_Theme_0 = v5().Theme;
        local v18 = nil;
        local v19 = 1;
        if not (not v11 or not v12) then
            if v15 == v6.Pressed then
                v18 = l_Theme_0.BackgroundOnPress.Color;
                v19 = l_Theme_0.BackgroundOnPress.Transparency;
            elseif v15 == v6.Hover then
                v18 = l_Theme_0.BackgroundOnHover.Color;
                v19 = l_Theme_0.BackgroundOnHover.Transparency;
            end;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = v9.zIndex
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v8
            }), 
            ClippingFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, not v14 and 0 or -v13), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Interactable = v2.createElement(v3, {
                    Size = UDim2.new(1, 0, 1, not v14 and 0 or v8.Offset), 
                    BackgroundColor3 = v18, 
                    BackgroundTransparency = v19, 
                    AutoButtonColor = false, 
                    onStateChanged = v16, 
                    [v2.Event.Activated] = if not v12 then nil else l_onActivated_0, 
                    ZIndex = 3
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = v8
                    })
                })
            })
        });
    else
        return nil;
    end;
end;
