local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Resources.Assets);
local v6 = require(l_Parent_0.GlobalConfig);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v8 = {
    [Enum.UserInputType.MouseButton1] = v5.Images.Mouse1Press, 
    [Enum.UserInputType.MouseButton2] = v5.Images.Mouse2Press, 
    [Enum.UserInputType.MouseWheel] = v5.Images.MouseWheelScroll
};
local v9 = l_t_0.strictInterface({
    input = l_t_0.enum(Enum.UserInputType), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
return function(v10)
    if v6.propValidation then
        assert(v9(v10));
    end;
    return l_Roact_0.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = v8[v10.input], 
        Size = UDim2.new(0, 36, 0, 36), 
        Position = v10.Position, 
        AnchorPoint = v10.AnchorPoint, 
        LayoutOrder = v10.LayoutOrder
    });
end;
