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
    local l_errorText_0 = v8.props.errorText;
    return l_withStyle_0(function(v12)
        return v2.createElement(v5, {
            BackgroundTransparency = 1, 
            fitAxis = v4.FitAxis.Height, 
            Font = v12.Font.Footer.Font, 
            LayoutOrder = l_layoutOrder_0 or nil, 
            Size = UDim2.new(0, l_contentWidth_0, 0, 0), 
            Text = l_errorText_0, 
            TextColor3 = v12.Theme.Alert.Color, 
            TextSize = v12.Font.BaseSize * v12.Font.Footer.RelativeSize, 
            TextTransparency = v12.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center
        });
    end);
end;
return v7;
