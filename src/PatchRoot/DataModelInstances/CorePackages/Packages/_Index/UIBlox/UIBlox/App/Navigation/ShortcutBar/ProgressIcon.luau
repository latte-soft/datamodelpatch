local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_1.Core.Style.useStyle);
local v5 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_2.UIBlox.App.ImageSet.Images);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
local _ = require(l_Parent_1.App.Style.StyleTypes);
local function v17(v9, v10)
    local l_layoutOrder_0 = v9.layoutOrder;
    local l_isLeft_0 = v9.isLeft;
    local l_rotation_0 = v9.rotation;
    local l_progressImage_0 = v9.progressImage;
    local l_IconDefault_0 = v10.Theme.IconDefault;
    local l_Divider_0 = v10.Theme.Divider;
    return v3.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.fromScale(0.5, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        CircleImage = v3.createElement(v5.Label, {
            Size = UDim2.fromScale(2, 1), 
            AnchorPoint = if not l_isLeft_0 then Vector2.new(0.5, 0) else nil, 
            Image = l_progressImage_0, 
            BackgroundTransparency = 1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = l_rotation_0, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, l_IconDefault_0.Color), 
                    ColorSequenceKeypoint.new(0.499, l_IconDefault_0.Color), 
                    ColorSequenceKeypoint.new(0.5, l_Divider_0.Color), 
                    ColorSequenceKeypoint.new(1, l_Divider_0.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, l_IconDefault_0.Transparency), 
                    NumberSequenceKeypoint.new(0.499, l_IconDefault_0.Transparency), 
                    NumberSequenceKeypoint.new(0.5, l_Divider_0.Transparency), 
                    NumberSequenceKeypoint.new(1, l_Divider_0.Transparency)
                })
            })
        })
    });
end;
return function(v18)
    local l_progress_0 = v18.progress;
    local l_isHolding_0 = v18.isHolding;
    local v21 = if not l_isHolding_0 then v18.icon else v18.iconHolding;
    local v22 = if not l_isHolding_0 then v6["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"] else v6["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"];
    local v23 = if not l_isHolding_0 then v6["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"] else v6["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"];
    local v24 = v4();
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        Progress = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Left = v17({
                layoutOrder = 1, 
                isLeft = true, 
                progressImage = v22, 
                rotation = v3.useMemo(function()
                    return l_progress_0:map(function(v25)
                        return (math.clamp((v25 or 0) * 314 + 23, 180, 337));
                    end);
                end, {
                    l_progress_0
                })
            }, v24), 
            Right = v17({
                layoutOrder = 2, 
                progressImage = v22, 
                rotation = v3.useMemo(function()
                    return l_progress_0:map(function(v26)
                        return (math.clamp((v26 or 0) * 314 + 23, 23, 180));
                    end);
                end, {
                    l_progress_0
                })
            }, v24)
        }), 
        Icon = v3.createElement(v5.Label, {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v21, 
            ImageColor3 = v24.Theme.IconEmphasis.Color, 
            ImageTransparency = v3.useMemo(function()
                return l_progress_0:map(function(v27)
                    if not v27 then
                        return 0;
                    else
                        return (math.clamp(0.8 - v27 * 0.8, 0, 0.8));
                    end;
                end);
            end, {
                l_progress_0
            }), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }), 
        Arrow = v3.createElement(v5.Label, {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Image = v23, 
            ImageColor3 = v24.Theme.IconEmphasis.Color, 
            ImageTransparency = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 3
        })
    });
end;
