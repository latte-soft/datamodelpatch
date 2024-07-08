local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local v3 = require(script.Parent.Images);
local v4 = l_Roact_0.PureComponent:extend("CheckIcon");
v4.defaultProps = {
    checked = false, 
    onActivated = function()
    end
};
v4.render = function(v5)
    local v6 = not not v5.props.checked and v3.checkFill or v3.checkStroke;
    return l_UIBlox_0.Style.withStyle(function(v7)
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 17, 0, 17)
        }, {
            Button = l_Roact_0.createElement("ImageButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v6.Image, 
                ImageRectOffset = v6.ImageRectOffset, 
                ImageRectSize = v6.ImageRectSize, 
                ImageColor3 = v7.Theme.UIDefault.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 1, 0), 
                SliceCenter = v6.SliceCenter, 
                [l_Roact_0.Event.MouseButton1Click] = v5.props.onActivated
            })
        });
    end);
end;
return v4;
