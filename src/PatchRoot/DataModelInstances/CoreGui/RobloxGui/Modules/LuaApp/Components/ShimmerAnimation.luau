local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.Components.TextureScroller);
local v3 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v4 = v1.PureComponent:extend("ShimmerAnimation");
v4.defaultProps = {
    shimmerSpeed = 2, 
    shimmerScale = 2
};
v4.render = function(v5)
    local l_appTheme_0 = v5.props.appTheme;
    local l_Size_0 = v5.props.Size;
    local l_Position_0 = v5.props.Position;
    local l_AnchorPoint_0 = v5.props.AnchorPoint;
    local l_LayoutOrder_0 = v5.props.LayoutOrder;
    local l_shimmerScale_0 = v5.props.shimmerScale;
    local v12 = not not l_appTheme_0 and l_appTheme_0.ShimmerAnimation.Image or "rbxasset://textures/ui/LuaApp/graphic/shimmer.png";
    local v13 = not not l_appTheme_0 and l_appTheme_0.ShimmerAnimation.AspectRatio or 0.876;
    local v14 = not not l_appTheme_0 and l_appTheme_0.ShimmerAnimation.Transparency or 0.65;
    local v15 = UDim2.new(v13 * l_shimmerScale_0, 0, l_shimmerScale_0, 0);
    local l_shimmerSpeed_0 = v5.props.shimmerSpeed;
    local v17 = 0;
    if l_shimmerSpeed_0 ~= 0 then
        v17 = (l_shimmerScale_0 + 1) / l_shimmerSpeed_0;
    end;
    return v1.createElement(v2, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Image = v12, 
        imageSize = v15, 
        ImageTransparency = v14, 
        imageAnchorPoint = Vector2.new(0, 0.5), 
        imagePositionStart = UDim2.new(-l_shimmerScale_0, 0, 0.5, 0), 
        imagePositionEnd = UDim2.new(1, 0, 0.5, 0), 
        imageScrollCycleTime = v17
    });
end;
return (v3(v4));
