local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.Loading.LoadableImage);
local _ = require(l_Parent_0.Style.StyleTypes);
local v4 = UDim.new(0, 8);
return function(v5)
    local l_aspectRatio_0 = v5.aspectRatio;
    local l_isTopRounded_0 = v5.isTopRounded;
    local l_isBottomRounded_0 = v5.isBottomRounded;
    local l_thumbnail_0 = v5.thumbnail;
    local l_border_0 = v5.border;
    local v11 = l_isTopRounded_0 and l_isBottomRounded_0;
    local v12 = not v11 and (l_isTopRounded_0 or l_isBottomRounded_0);
    local v13 = if l_border_0 ~= nil then l_border_0.CornerRadius else v4;
    return v1.createElement("Frame", {
        Size = if not l_aspectRatio_0 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, l_aspectRatio_0, 0), 
        SizeConstraint = if not l_aspectRatio_0 then nil else Enum.SizeConstraint.RelativeXX, 
        BackgroundTransparency = 1
    }, {
        TopFrame = v1.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, v12 and 0.5 or 1), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            TopImage = v1.createElement(v2, {
                BackgroundTransparency = 1, 
                Image = l_thumbnail_0, 
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, v12 and 2 or 1), 
                cornerRadius = if v11 or l_isTopRounded_0 then v13 else nil, 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            })
        }), 
        BottomFrame = if not v12 then nil else v1.createElement("Frame", {
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 0.5), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            BottomImage = v1.createElement(v2, {
                BackgroundTransparency = 1, 
                Image = l_thumbnail_0, 
                Position = UDim2.fromScale(0, -1), 
                Size = UDim2.fromScale(1, 2), 
                cornerRadius = if v11 or l_isBottomRounded_0 then v13 else nil, 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            })
        })
    });
end;
