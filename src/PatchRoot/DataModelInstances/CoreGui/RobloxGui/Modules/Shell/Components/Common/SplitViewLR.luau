local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local v1 = v0.Component:extend("SplitViewLR");
v1.init = function(_)
end;
v1.render = function(v3)
    local l_props_0 = v3.props;
    local l_Bias_0 = l_props_0.Bias;
    v3.leftView = l_props_0.LeftView;
    v3.rightView = l_props_0.RightView;
    v3.divider = l_props_0.Divider;
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        LeftFrame = v0.createElement("Frame", {
            Size = UDim2.new(l_Bias_0, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Left = v3.leftView
        }), 
        Divider = v0.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(l_Bias_0, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Divider = v3.divider
        }), 
        RightFrame = v0.createElement("Frame", {
            Size = UDim2.new(1 - l_Bias_0, 0, 1, 0), 
            Position = UDim2.new(l_Bias_0, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Right = v3.rightView
        })
    });
end;
return v1;
