local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.Common;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v4 = require(l_Common_0.Roact);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local v8 = require(l_Modules_0.LuaApp.FitChildren);
local _ = v4.PureComponent:extend("AdjacentTextAndLink");
return function(v10)
    return l_withStyle_0(function(v11)
        local l_spacing_0 = v10.spacing;
        local v13 = v10.LayoutOrder or 1;
        local l_AnchorPoint_0 = v10.AnchorPoint;
        local l_textLabelText_0 = v10.textLabelText;
        local l_textLabelColor_0 = v10.textLabelColor;
        local l_TextTransparency_0 = v10.TextTransparency;
        local v18 = v10.fontStyle or "CaptionBody";
        local v19 = v11.Font[v18];
        local v20 = v10.buttonSize or UDim2.fromScale(0, 1);
        local l_linkColorStyle_0 = v10.linkColorStyle;
        local l_linkText_0 = v10.linkText;
        local l_onActivated_0 = v10.onActivated;
        local l_textButtonEnabled_0 = v10.textButtonEnabled;
        if l_textButtonEnabled_0 == nil then
            l_textButtonEnabled_0 = true;
        end;
        local v25 = v19.RelativeSize * v11.Font.BaseSize;
        return v4.createElement(v8.FitFrame, {
            Size = UDim2.fromOffset(0, v25), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = v13, 
            fitAxis = v8.FitAxis.Width
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_spacing_0 or l_Text_0.GetTextWidth(" ", v19.Font, v25)), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TextLabel = v4.createElement("TextLabel", {
                TextSize = v25, 
                Font = v19.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_Text_0.GetTextWidth(l_textLabelText_0 or "", v19.Font, v25), 1, 0), 
                Text = l_textLabelText_0, 
                TextTransparency = l_TextTransparency_0, 
                TextColor3 = l_textLabelColor_0, 
                LayoutOrder = 1
            }), 
            LinkButton = v4.createElement(l_LinkButton_0, {
                fontStyle = v18, 
                size = v20, 
                text = l_linkText_0, 
                colorStyleDefault = l_linkColorStyle_0, 
                colorStyleHover = l_linkColorStyle_0, 
                layoutOrder = 2, 
                isDisabled = not l_textButtonEnabled_0, 
                onActivated = l_onActivated_0
            })
        });
    end);
end;
