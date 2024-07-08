local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local v5 = require(l_script_FirstAncestor_0.Components.ReportHeader);
return v2.forwardRef(function(v6, v7)
    local v8 = v4();
    local v9 = UDim.new(not v8.ReportHeader.size and 0 or v8.ReportHeader.size.Y.Scale, not v8.ReportHeader.size and 0 or v8.ReportHeader.size.Y.Offset);
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v8.ReportBackground.backgroundColor and v8.ReportBackground.backgroundColor.Color3, 
        ref = v7
    }, {
        Gradient = v2.createElement("UIGradient", {
            Rotation = v8.ReportBackground.gradientRotation, 
            Transparency = v8.ReportBackground.gradientTransparency
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement(v5, {
            title = v6.title, 
            subtitle = v6.subtitle, 
            layoutOrder = 1, 
            hasDivider = true
        }), 
        Body = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1 - v9.Scale, -v9.Offset), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, v3.Dictionary.join({
            Layout = v6.children and v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            } or nil)
        }, v6.children or {}))
    });
end);
