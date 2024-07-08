local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(script.Parent.Parent.Constants);
local v4 = v1.PureComponent:extend("SlotNumbers");
v4.render = function(v5)
    local v6 = v3.Layouts[v5.props.layout];
    local v7 = {};
    for v8 = 1, v3.EmotesPerPage do
        local v9 = (360 / v3.EmotesPerPage) * (v8 - 1) + v3.SegmentsStartRotation;
        local v10 = v3.InnerCircleSizeRatio / 2;
        local l_SlotNumberSize_0 = v3.SlotNumberSize;
        local v12 = l_SlotNumberSize_0 / 2;
        local v13 = math.cos((math.rad(v9)));
        local v14 = (0.5 + v10 * v13) + v12 * v13;
        local v15 = math.sin((math.rad(v9)));
        v7[v8] = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(v14, 0, (0.5 + v10 * v15) + v12 * v15, 0), 
            Size = UDim2.new(l_SlotNumberSize_0, 0, l_SlotNumberSize_0, 0), 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            TextSize = v6.SlotNumberTextSize, 
            TextColor3 = v3.Colors.White, 
            Text = v8, 
            Font = v6.SlotNumberFont, 
            ZIndex = 2
        }, {
            TextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                MaxTextSize = v6.SlotNumberTextSize
            })
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v7);
end;
return v2.connect(function(v16)
    return {
        layout = v16.layout
    };
end, nil)(v4);
