local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_withStyle_0 = v3.Style.withStyle;
local v7 = v2.PureComponent:extend(script.Name);
v7.defaultProps = {
    contentWidth = 0
};
v7.render = function(v8)
    local l_contentWidth_0 = v8.props.contentWidth;
    local l_layoutOrder_0 = v8.props.layoutOrder;
    local l_richText_0 = v8.props.richText;
    local l_text_0 = v8.props.text;
    return l_withStyle_0(function(v13)
        local l_Font_0 = v13.Font.Body.Font;
        if v8.props.useBold == true then
            l_Font_0 = v13.Font.Header1.Font;
        end;
        local l_Center_0 = Enum.TextXAlignment.Center;
        if v8.props.alignLeft == true then
            l_Center_0 = Enum.TextXAlignment.Left;
        end;
        local v16 = nil;
        if l_contentWidth_0 == 0 then
            v16 = Enum.AutomaticSize.X;
        end;
        return v2.createElement(v5, {
            BackgroundTransparency = 1, 
            fitAxis = v4.FitAxis.Height, 
            Font = l_Font_0, 
            LayoutOrder = l_layoutOrder_0 or nil, 
            RichText = l_richText_0, 
            Size = UDim2.new(0, l_contentWidth_0, 0, 0), 
            AutomaticSize = v16, 
            Text = l_text_0, 
            TextColor3 = v13.Theme.TextDefault.Color, 
            TextSize = v13.Font.Body.RelativeSize * v13.Font.BaseSize, 
            TextTransparency = v13.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = l_Center_0
        });
    end);
end;
return v7;
