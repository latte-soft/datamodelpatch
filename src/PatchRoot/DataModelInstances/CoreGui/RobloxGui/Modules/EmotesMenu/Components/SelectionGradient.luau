local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(script.Parent.Parent.Constants);
local v4 = v1.PureComponent:extend("SelectionGradient");
v4.render = function(v5)
    local v6 = v3.Layouts[v5.props.layout];
    local l_focusedSegmentIndex_0 = v5.props.emotesWheel.focusedSegmentIndex;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Rotation = (360 / v3.EmotesPerPage) * (l_focusedSegmentIndex_0 - 1) + v3.SegmentsStartRotation, 
        Visible = l_focusedSegmentIndex_0 ~= 0
    }, {
        SelectedGradient = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0.5, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = v3.GradientTransparency, 
            Image = v6.SelectedGradient, 
            ZIndex = 2
        }, {
            AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = v6.SelectedGradientImageSize.X / v6.SelectedGradientImageSize.Y
            }), 
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = v6.SelectedGradientImageSize
            })
        })
    });
end;
return v2.connect(function(v8)
    return {
        emotesWheel = v8.emotesWheel, 
        layout = v8.layout
    };
end, nil)(v4);
