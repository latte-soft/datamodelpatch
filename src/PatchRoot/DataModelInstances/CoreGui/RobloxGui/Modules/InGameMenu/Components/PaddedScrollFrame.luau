local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.GlobalConfig);
local v8 = l_t_0.strictInterface({
    Size = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.UDim2), 
    CanvasSize = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
return function(v9)
    if v7.propValidation then
        assert(v8(v9));
    end;
    return l_withStyle_0(function(v10)
        return l_Roact_0.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarImageColor3 = v10.Theme.UIEmphasis.Color, 
            ScrollBarImageTransparency = v10.Theme.UIEmphasis.Transparency, 
            BottomImage = v6.Images.ScrollBottom, 
            MidImage = v6.Images.ScrollMid, 
            TopImage = v6.Images.ScrollTop, 
            ClipsDescendants = false, 
            ScrollBarThickness = 12, 
            Size = v9.Size, 
            AnchorPoint = v9.AnchorPoint, 
            CanvasSize = v9.CanvasSize, 
            Position = v9.Position
        }, v9[l_Roact_0.Children]);
    end);
end;
