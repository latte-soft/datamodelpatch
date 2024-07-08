local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v3 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local v4 = require(l_script_FirstAncestor_0.Components.ReportActionBar);
local v5 = UDim2.fromScale(1, 1);
local v6 = UDim.new(0, 10);
return function(v7)
    local v8 = v3();
    local l_ReportStep_0 = v8.ReportStep;
    local v10 = not not l_ReportStep_0.size and l_ReportStep_0.size or v5;
    local v11 = l_ReportStep_0.verticalPadding or v6;
    local v12 = UDim.new((not not v8.ReportActionBar.size and v8.ReportActionBar.size.Y.Scale or 0) + 2 * v11.Scale, (not not v8.ReportActionBar.size and v8.ReportActionBar.size.Y.Offset or 0) + 2 * v11.Offset);
    return v1.createElement("Frame", {
        Size = v10, 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = v11, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = not not v7.title and v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v7.title, 
            Font = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.Font, 
            TextColor3 = l_ReportStep_0.headerTextColor and l_ReportStep_0.headerTextColor.Color3, 
            TextSize = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.FontSize, 
            LineHeight = l_ReportStep_0.headerFontStyle and l_ReportStep_0.headerFontStyle.LineHeight, 
            LayoutOrder = 1
        }) or nil, 
        Body = v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1 - v12.Scale, -v12.Offset), 
            BackgroundTransparency = 1
        }, v7.children), 
        Actions = v1.createElement(v4, {
            layoutOrder = 3, 
            buttons = v7.buttons, 
            tokens = v8.ReportActionBar
        })
    });
end;
