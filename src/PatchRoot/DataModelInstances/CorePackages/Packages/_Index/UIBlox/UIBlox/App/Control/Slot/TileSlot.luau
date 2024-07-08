local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Core_0.Control.Enum.ControlState);
local v6 = require(l_Core_0.Button.getContentStyle);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Style.useStyle);
local v9 = require(l_Core_0.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v11 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_0.ImageSet.Images);
local v13 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v14 = require(l_Parent_0.ImageSet.getIconSize);
local v15 = v12["component_assets/circle_9"];
local v16 = v12["component_assets/circle_9_stroke_1"];
local v17 = {
    [v5.Default] = "SecondaryDefault", 
    [v5.Hover] = "SecondaryOnHover"
};
local v18 = {
    [v5.Default] = "SecondaryDefault", 
    [v5.Hover] = "SecondaryDefault"
};
local v19 = {
    [v5.Default] = "TextDefault", 
    [v5.Hover] = "TextEmphasis"
};
local v20 = {
    [v5.Default] = "TextEmphasis", 
    [v5.Hover] = "TextEmphasis"
};
local v21 = {
    [v5.Default] = "BackgroundMuted"
};
local v22 = {
    [v5.Default] = "PlaceHolder"
};
local v23 = {
    [v5.Default] = "PlaceHolder"
};
local v24 = {
    [v5.Default] = "TextEmphasis"
};
return function(v25)
    local v26, v27 = v4.useState(v5.Initialize);
    local v28, v29 = v4.useState(false);
    local v30 = v4.useCallback(function()
        v25.onActivated(v25.index);
    end, {
        v25.onActivated, 
        v25.index
    });
    local v33 = v4.useCallback(function(v31, v32)
        v27(v32);
        if v32 == v5.Hover then
            v29(true);
        else
            v29(false);
        end;
        if v25.onStateChanged then
            v25.onStateChanged(v31, v32);
        end;
    end, {
        v25.onStateChanged
    });
    local v34 = v8();
    local l_isDisabled_0 = v25.isDisabled;
    local l_isLoading_0 = v25.isLoading;
    local v37 = not not l_isDisabled_0 and v5.Disabled or v26;
    local l_isSelected_0 = v25.isSelected;
    local v39 = v28 or l_isSelected_0;
    local v40 = not not l_isSelected_0 and v6(v18, v37, v34) or v6(v17, v37, v34);
    local v41 = not not l_isSelected_0 and v6(v20, v37, v34) or v6(v19, v37, v34);
    local v42 = v6(v24, v37, v34);
    local v43 = not not l_isSelected_0 and v6(v22, v37, v34) or v6(v21, v37, v34);
    local v44 = v6(v23, v37, v34);
    local l_SubHeader1_0 = v34.Font.SubHeader1;
    local l_thumbnail_0 = v25.thumbnail;
    local v47 = v25.thumbnail ~= nil;
    local v48 = v25.displayText ~= nil;
    local v49 = l_isDisabled_0 or l_isLoading_0;
    if v49 then
        v39 = false;
    end;
    return v4.createElement(v7, {
        Size = UDim2.fromOffset(48, 48), 
        Position = v25.position or UDim2.fromScale(0, 0), 
        BackgroundTransparency = 1, 
        onStateChanged = v33, 
        [v4.Event.Activated] = not v49 and v30 or nil
    }, {
        Button = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Background = v4.createElement(v9.Label, {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                Image = v15, 
                ImageColor3 = not not v48 and v43.Color or v44.Color, 
                ImageTransparency = not not v48 and v43.Transparency or v44.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 5, 5), 
                ZIndex = 1
            }), 
            Border = if not v39 then nil else v4.createElement(v9.Label, {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                Image = v16, 
                ImageColor3 = v40.Color, 
                ImageTransparency = v40.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(4, 4, 5, 5), 
                ZIndex = 2
            }), 
            ButtonContentLayer = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                Thumbnail = if not l_isLoading_0 and v47 then v4.createElement(v9.Label, {
                    Size = UDim2.fromOffset(v14(v13.Medium), v14(v13.Medium)), 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_thumbnail_0, 
                    ImageColor3 = v42.Color, 
                    ImageTransparency = v42.Transparency, 
                    ZIndex = 3
                }) else nil, 
                Text = if not l_isLoading_0 and v48 then v4.createElement(v11, {
                    Size = UDim2.new(1, -24, 1, -24), 
                    BackgroundTransparency = 1, 
                    Text = v25.displayText, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    fontStyle = l_SubHeader1_0, 
                    colorStyle = v41, 
                    ZIndex = 3
                }) else nil, 
                LoadingShimmer = if not l_isLoading_0 then nil else v4.createElement(v10, {
                    Size = UDim2.fromScale(1, 1)
                })
            })
        })
    });
end;
