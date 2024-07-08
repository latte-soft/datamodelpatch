local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v7 = v2.PureComponent:extend("TileSelectionOverlay");
v7.validateProps = v3.strictInterface({
    ZIndex = v3.optional(v3.integer), 
    cornerRadius = v3.optional(v3.UDim)
});
v7.defaultProps = {
    cornerRadius = UDim.new(0, 0)
};
v7.render = function(v8)
    local l_ZIndex_0 = v8.props.ZIndex;
    local l_cornerRadius_0 = v8.props.cornerRadius;
    local v11 = v5["icons/actions/selectOn"];
    local v12 = v11.ImageRectSize / v5.ImagesResolutionScale;
    return v4(function(v13)
        local l_Theme_0 = v13.Theme;
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = l_ZIndex_0
        }, {
            SelectionImage = v2.createElement(v6.Label, {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Image = v11, 
                Position = UDim2.new(1, -6, 0, 6), 
                Size = UDim2.new(0, v12.X, 0, v12.Y)
            }), 
            UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v2.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        });
    end);
end;
return v7;
