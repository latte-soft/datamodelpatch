local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local v6 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local function _(v7)
    return Vector2.new(math.floor(v7.X), (math.floor(v7.Y)));
end;
local v9 = v3.PureComponent:extend("TextureScroller");
v9.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.integer), 
    backgroundColor3 = v4.optional(v4.Color3), 
    backgroundTransparency = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    cornerRadius = v4.optional(v4.UDim), 
    image = v4.string, 
    imageTransparency = v4.optional(v4.number), 
    imageAnchorPoint = v4.optional(v4.Vector2), 
    imageRectOffsetStart = v4.Vector2, 
    imageRectOffsetEnd = v4.Vector2, 
    imageScrollCycleTime = v4.optional(v4.number), 
    imageRectSize = v4.Vector2, 
    size = v4.optional(v4.UDim2)
});
v9.defaultProps = {
    backgroundTransparency = 1, 
    cornerRadius = UDim.new(0, 0), 
    imageAnchorPoint = Vector2.new(0, 0), 
    imageScrollCycleTime = 1
};
v9.init = function(v10)
    v10.lerpValue = 0;
    v10.imageRef = v3.createRef();
    v10.renderSteppedCallback = function(v11)
        local l_imageScrollCycleTime_0 = v10.props.imageScrollCycleTime;
        local l_imageRectOffsetStart_0 = v10.props.imageRectOffsetStart;
        local l_imageRectOffsetEnd_0 = v10.props.imageRectOffsetEnd;
        local l_imageRectSize_0 = v10.props.imageRectSize;
        local l_imageAnchorPoint_0 = v10.props.imageAnchorPoint;
        local v17 = Vector2.new(l_imageRectOffsetStart_0.X - l_imageAnchorPoint_0.X * l_imageRectSize_0.X, l_imageRectOffsetStart_0.Y - l_imageAnchorPoint_0.Y * l_imageRectSize_0.Y);
        local v18 = Vector2.new(l_imageRectOffsetEnd_0.X - l_imageAnchorPoint_0.X * l_imageRectSize_0.X, l_imageRectOffsetEnd_0.Y - l_imageAnchorPoint_0.Y * l_imageRectSize_0.Y);
        local v19 = 0;
        if l_imageScrollCycleTime_0 ~= 0 then
            v19 = v11 / l_imageScrollCycleTime_0;
        end;
        v10.lerpValue = (v10.lerpValue + v19) % 1;
        if v10.imageRef.current then
            local l_current_0 = v10.imageRef.current;
            local v21 = v17:lerp(v18, v10.lerpValue);
            l_current_0.ImageRectOffset = Vector2.new(math.floor(v21.X), (math.floor(v21.Y)));
        end;
    end;
end;
v9.render = function(v22)
    local l_anchorPoint_0 = v22.props.anchorPoint;
    local l_backgroundColor3_0 = v22.props.backgroundColor3;
    local l_backgroundTransparency_0 = v22.props.backgroundTransparency;
    local l_cornerRadius_0 = v22.props.cornerRadius;
    local l_image_0 = v22.props.image;
    local l_imageRectSize_1 = v22.props.imageRectSize;
    return v3.createElement("Frame", {
        AnchorPoint = l_anchorPoint_0, 
        BackgroundColor3 = l_backgroundColor3_0, 
        BackgroundTransparency = l_backgroundTransparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v22.props.layoutOrder, 
        Position = v22.props.position, 
        Size = v22.props.size
    }, {
        TextureScrollerImage = v3.createElement(v6.Label, {
            BackgroundTransparency = 1, 
            Image = l_image_0, 
            ImageTransparency = v22.props.imageTransparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(0, 0, l_imageRectSize_1.X, l_imageRectSize_1.Y), 
            [v3.Ref] = v22.imageRef, 
            ImageRectSize = l_imageRectSize_1
        }, {
            UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v3.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        }), 
        renderStepped = v3.createElement(l_EventConnection_0, {
            callback = v22.renderSteppedCallback, 
            event = l_RunService_0.renderStepped
        }), 
        UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v3.createElement("UICorner", {
            CornerRadius = l_cornerRadius_0
        }) or nil
    });
end;
return v9;
