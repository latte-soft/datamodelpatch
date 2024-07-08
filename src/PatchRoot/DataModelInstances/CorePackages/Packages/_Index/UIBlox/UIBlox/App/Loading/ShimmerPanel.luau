local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(script.Parent.TextureScroller);
local v8 = require(l_Parent_1.UIBlox.Utility.lerp);
local v9 = v3.PureComponent:extend("ShimmerPanel");
v9.validateProps = v4.strictInterface({
    AnchorPoint = v4.optional(v4.Vector2), 
    LayoutOrder = v4.optional(v4.integer), 
    Position = v4.optional(v4.UDim2), 
    Size = v4.UDim2, 
    cornerRadius = v4.optional(v4.UDim), 
    Image = v4.optional(v4.string), 
    imageDimensions = v4.optional(v4.Vector2), 
    imageScale = v4.optional(v4.number), 
    shimmerSpeed = v4.optional(v4.number)
});
v9.defaultProps = {
    cornerRadius = UDim.new(0, 0), 
    Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer.png", 
    imageDimensions = Vector2.new(219, 250), 
    imageScale = 2.5, 
    shimmerSpeed = 4
};
local function _(v10)
    v10 = math.abs(v10 - 1);
    if v10 > 1 then
        return 1;
    elseif v10 < 0.5 then
        return 4 * math.pow(v10, 3);
    else
        return 1 - math.pow(-2 * v10 + 2, 3) / 2;
    end;
end;
v9.init = function(v12)
    v12.state = {
        lerpValue = 0
    };
    v12.frameRef = v3.createRef();
    v12.lerpValue = 0;
end;
v9.render = function(v13)
    local l_AnchorPoint_0 = v13.props.AnchorPoint;
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_Position_0 = v13.props.Position;
    local l_cornerRadius_0 = v13.props.cornerRadius;
    local l_Image_0 = v13.props.Image;
    local l_imageDimensions_0 = v13.props.imageDimensions;
    local l_imageScale_0 = v13.props.imageScale;
    local l_shimmerSpeed_0 = v13.props.shimmerSpeed;
    local l_Size_0 = v13.props.Size;
    local v23 = l_imageDimensions_0 / l_imageScale_0;
    local v24 = 0;
    if l_shimmerSpeed_0 ~= 0 then
        v24 = (l_imageScale_0 + 1) / l_shimmerSpeed_0;
    end;
    return v6(function(v25)
        local l_Theme_0 = v25.Theme;
        local l_Settings_0 = v25.Settings;
        local function v33(v28)
            local l_BackgroundOnHover_0 = l_Theme_0.BackgroundOnHover;
            local v30 = v13.lerpValue + v28;
            if v30 > 2.5 then
                v30 = 0;
            end;
            v13.lerpValue = v30;
            if v13.frameRef.current then
                local v31 = math.abs(v13.lerpValue - 1);
                local v32 = v31 > 1 and 1 or if v31 < 0.5 then 4 * math.pow(v31, 3) else 1 - math.pow(-2 * v31 + 2, 3) / 2;
                v13.frameRef.current.BackgroundColor3 = l_BackgroundOnHover_0.Color:Lerp(l_BackgroundOnHover_0.Color, v32);
                v13.frameRef.current.BackgroundTransparency = v8(l_BackgroundOnHover_0.Transparency, l_BackgroundOnHover_0.Transparency - 0.1, v32);
            end;
        end;
        if not l_Settings_0.ReducedMotion then
            return v3.createElement(v7, {
                anchorPoint = l_AnchorPoint_0, 
                layoutOrder = l_LayoutOrder_0, 
                backgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                backgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                cornerRadius = l_cornerRadius_0, 
                image = l_Image_0, 
                imageRectSize = v23, 
                imageAnchorPoint = Vector2.new(0, 0.5), 
                imageTransparency = 0, 
                imageRectOffsetStart = Vector2.new(l_imageDimensions_0.X, l_imageDimensions_0.Y / 2), 
                imageRectOffsetEnd = Vector2.new(-v23.X, l_imageDimensions_0.Y / 2), 
                imageScrollCycleTime = v24, 
                position = l_Position_0, 
                size = l_Size_0
            });
        else
            return v3.createElement("Frame", {
                AnchorPoint = l_AnchorPoint_0, 
                LayoutOrder = l_LayoutOrder_0, 
                BorderSizePixel = 0, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                [v3.Ref] = v13.frameRef
            }, {
                UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v3.createElement("UICorner", {
                    CornerRadius = l_cornerRadius_0
                }) or nil, 
                renderStepped = v3.createElement(l_EventConnection_0, {
                    callback = v33, 
                    event = l_RunService_0.renderStepped
                })
            });
        end;
    end);
end;
return v9;
