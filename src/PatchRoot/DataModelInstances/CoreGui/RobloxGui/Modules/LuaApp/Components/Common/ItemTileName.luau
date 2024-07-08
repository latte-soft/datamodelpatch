local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.Components.LoadingSkeleton);
local v5 = v2.PureComponent:extend("ItemTileName");
v5.defaultProps = {
    textYAlignment = Enum.TextYAlignment.Top
};
local v6 = {
    [1] = {
        Size = UDim2.new(0.8, 0, 0, 16)
    }, 
    [2] = {
        Size = UDim2.new(0.5, 0, 0, 16)
    }
};
v5.init = function(v7)
    v7.createLoadingSkeletonLayout = function()
        return v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        });
    end;
end;
v5.render = function(v8)
    local l_name_0 = v8.props.name;
    local l_textYAlignment_0 = v8.props.textYAlignment;
    return l_withStyle_0(function(v11)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        return l_name_0 == nil and v2.createElement(v4, {
            Size = UDim2.new(1, 0, 1, 0), 
            createLayout = v8.createLoadingSkeletonLayout, 
            panels = v6
        }) or v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            Font = l_Font_0.Header2.Font, 
            Text = l_name_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = l_textYAlignment_0, 
            TextWrapped = true
        });
    end);
end;
return v5;
