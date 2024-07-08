local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v2.Core.Style.withStyle;
local l_VerticalScrollViewWithMargin_0 = v2.App.Container.VerticalScrollViewWithMargin;
local v7 = v1.PureComponent:extend("LicenseText");
v7.defaultProps = {
    contentMaxWidth = math.huge, 
    paddingHorizontal = 0
};
v7.validateProps = v4.strictInterface({
    licenseTextLines = v4.array(v4.string), 
    contentMaxWidth = v4.optional(v4.number), 
    paddingHorizontal = v4.optional(v4.number)
});
v7.getTextLines = function(v8, v9)
    local l_licenseTextLines_0 = v8.props.licenseTextLines;
    local v11 = {
        TextLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    for v12, v13 in ipairs(l_licenseTextLines_0) do
        v11[v12] = v1.createElement("TextLabel", v3.Dictionary.join(v9, {
            LayoutOrder = v12, 
            Text = v13
        }));
    end;
    return v11;
end;
v7.render = function(v14)
    return l_withStyle_0(function(v15)
        local l_TextDefault_0 = v15.Theme.TextDefault;
        local l_Font_0 = v15.Font;
        local l_Font_1 = l_Font_0.Body.Font;
        local v19 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_contentMaxWidth_0 = v14.props.contentMaxWidth;
        local l_paddingHorizontal_0 = v14.props.paddingHorizontal;
        return v1.createElement(l_VerticalScrollViewWithMargin_0, {
            canvasSizeY = UDim.new(0, 0), 
            useAutomaticCanvasSize = true, 
            paddingHorizontal = 0
        }, {
            LicenseFrame = v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1
            }, {
                License = v1.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, (v14:getTextLines({
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_1, 
                    TextSize = v19, 
                    LineHeight = 1.25, 
                    TextWrapped = true, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency
                }))), 
                LicenseMaxWidth = v1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(l_contentMaxWidth_0 + 2 * l_paddingHorizontal_0, math.huge)
                }), 
                LicensePadding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_paddingHorizontal_0), 
                    PaddingRight = UDim.new(0, l_paddingHorizontal_0), 
                    PaddingBottom = UDim.new(0, 24)
                })
            })
        });
    end);
end;
return v7;
