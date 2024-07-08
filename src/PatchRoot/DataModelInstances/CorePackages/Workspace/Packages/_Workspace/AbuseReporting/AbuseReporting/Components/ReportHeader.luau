local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v3 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local v4 = UDim2.new(1, 0, 1, 0);
return function(v5)
    local l_ReportHeader_0 = v3().ReportHeader;
    return v1.createElement("Frame", {
        Size = l_ReportHeader_0.size or v4, 
        BackgroundTransparency = 1, 
        LayoutOrder = v5.layoutOrder
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = if not l_ReportHeader_0.verticalPadding then nil else v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_ReportHeader_0.verticalPadding), 
            PaddingBottom = UDim.new(0, l_ReportHeader_0.verticalPadding)
        }), 
        Title = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v5.title, 
            Font = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.Font, 
            TextColor3 = l_ReportHeader_0.titleTextColor and l_ReportHeader_0.titleTextColor.Color3, 
            TextSize = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.FontSize, 
            LineHeight = l_ReportHeader_0.titleFontStyle and l_ReportHeader_0.titleFontStyle.LineHeight, 
            LayoutOrder = 1
        }), 
        Subtitle = if not v5.subtitle then nil else v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v5.subtitle, 
            Font = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.Font, 
            TextColor3 = l_ReportHeader_0.subtitleTextColor and l_ReportHeader_0.subtitleTextColor.Color3, 
            TextSize = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.FontSize, 
            LineHeight = l_ReportHeader_0.subtitleFontStyle and l_ReportHeader_0.subtitleFontStyle.LineHeight, 
            LayoutOrder = 2
        }), 
        Decoration = if not v5.hasDivider then nil else v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_ReportHeader_0.dividerVerticalPadding or 36), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Divider = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_ReportHeader_0.dividerHeight or 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = l_ReportHeader_0.dividerColor and l_ReportHeader_0.dividerColor.Color3, 
                BackgroundTransparency = not not l_ReportHeader_0.dividerColor and l_ReportHeader_0.dividerColor.Transparency or 0.8
            })
        })
    });
end;
