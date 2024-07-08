local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v2.Style.withStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v6 = {
    Hover = "Hover", 
    Focused = "Focused", 
    Error = "Error", 
    Default = "Default"
};
local v7 = v1.PureComponent:extend("AuthStatefulRoundCornerBorder");
v7.defaultProps = {
    borderState = v6.Default
};
v7.render = function(v8)
    return l_withStyle_0(function(v9)
        local l_size_0 = v8.props.size;
        local l_borderState_0 = v8.props.borderState;
        local l_layoutOrder_0 = v8.props.layoutOrder;
        local v13 = v8.props[v1.Children] or {};
        local l_Color_0 = v9.Theme.UIDefault.Color;
        local l_Transparency_0 = v9.Theme.UIDefault.Transparency;
        if l_borderState_0 == v6.Focused then
            l_Color_0 = v9.Theme.IconEmphasis.Color;
            l_Transparency_0 = v9.Theme.IconEmphasis.Transparency;
        elseif l_borderState_0 == v6.Hover then
            l_Color_0 = v9.Theme.IconDefault.Color;
            l_Transparency_0 = v9.Theme.IconDefault.Transparency;
        elseif l_borderState_0 == v6.Error then
            l_Color_0 = v9.Theme.Alert.Color;
            l_Transparency_0 = v9.Theme.Alert.Transparency;
        end;
        return v1.createElement("Frame", {
            Size = l_size_0, 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            Boundary = v1.createElement(l_ImageSetLabel_0, {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke", 
                ImageColor3 = l_Color_0, 
                ImageTransparency = l_Transparency_0
            }), 
            ContentWrapper = v1.createElement("Frame", {
                ZIndex = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v13)
        });
    end);
end;
v7.BorderState = v6;
return v7;
