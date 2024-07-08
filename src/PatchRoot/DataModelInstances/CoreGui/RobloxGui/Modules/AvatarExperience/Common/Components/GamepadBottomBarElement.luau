local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v8 = v2.PureComponent:extend("GamepadBottomBarElement");
v8.validateProps = v4.strictInterface({
    elementIcon = v4.string, 
    elementText = v4.string, 
    position = v4.optional(v4.UDim2), 
    layoutOrder = v4.optional(v4.number), 
    forwardRef = v4.optional(v4.table), 
    width = v4.optional(v4.number), 
    disabled = v4.optional(v4.boolean)
});
v8.defaultValue = {
    position = UDim2.new(0, 0, 0, 0), 
    layoutOrder = 1
};
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        local l_Theme_0 = v10.Theme;
        local l_Font_0 = v10.Font;
        local l_Font_1 = l_Font_0.Header2.Font;
        local v14 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local l_Regular_0 = v5.App.Constant.IconSize.Regular;
        local v16 = l_Text_0.GetTextWidth(v9.props.elementText, l_Font_1, v14);
        local v17 = nil;
        if v9.props.width and v9.props.width < v16 then
            v16 = v9.props.width - (l_Regular_0 + 8);
            v17 = v9.props.width;
        else
            v17 = (v16 + l_Regular_0) + 8;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, v17, 1, 0), 
            BackgroundTransparency = 1, 
            Position = v9.props.position, 
            LayoutOrder = v9.props.layoutOrder, 
            [v2.Ref] = v9.props.forwardRef
        }, {
            Icon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_Regular_0, 0, l_Regular_0), 
                Image = v9.props.elementIcon, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = if not v9.props.disabled then l_Theme_0.IconEmphasis.Transparency else 0.5
            }), 
            TextFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v16, 1, 0), 
                Position = UDim2.new(0, l_Regular_0 + 8, 0, 0)
            }, {
                Text = v2.createElement("TextLabel", {
                    Text = v9.props.elementText, 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, v14), 
                    BackgroundTransparency = 1, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = if not v9.props.disabled then l_Theme_0.TextEmphasis.Transparency else 0.5, 
                    Font = l_Font_1, 
                    TextSize = v14, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true
                })
            })
        });
    end);
end;
return v2.forwardRef(function(v18, v19)
    return v2.createElement(v8, v1.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);
