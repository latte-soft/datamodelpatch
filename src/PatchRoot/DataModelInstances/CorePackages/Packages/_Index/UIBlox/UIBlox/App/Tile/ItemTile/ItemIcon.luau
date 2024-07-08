local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_0.Enum.ItemTileEnums);
local v9 = v3.PureComponent:extend("ItemIcon");
local v10 = {
    [v8.ItemIconType.AnimationBundle] = v6["icons/status/item/bundle"], 
    [v8.ItemIconType.Bundle] = v6["icons/status/item/bundle"], 
    [v8.ItemIconType.DynamicHead] = v6["icons/status/dynamicHead_small"]
};
v9.validateProps = v4.strictInterface({
    itemIconType = v4.intersection(v8.ItemIconType.isEnumValue, function(v11)
        if not v10[v11] then
            return false, "Unknown ItemType " .. v11;
        else
            return true;
        end;
    end)
});
v9.render = function(v12)
    local v13 = v10[v12.props.itemIconType];
    local v14 = v13.ImageRectSize / v6.ImagesResolutionScale;
    return v5(function(v15)
        local l_Theme_0 = v15.Theme;
        return v3.createElement(v7.Label, {
            AnchorPoint = Vector2.new(1, 1), 
            BackgroundTransparency = 1, 
            Image = v13, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            Position = UDim2.new(1, -12, 1, -12), 
            Size = UDim2.new(0, v14.X, 0, v14.Y)
        });
    end);
end;
return v9;
