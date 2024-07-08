local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v4)
    return {
        ReportBackground = {
            backgroundColor = v4.Global.Color.Black, 
            gradientRotation = 90, 
            gradientTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.5), 
                NumberSequenceKeypoint.new(0.5, 0.5), 
                NumberSequenceKeypoint.new(1, 1)
            })
        }, 
        ReportHeader = {
            size = UDim2.new(0.9, 0, 0, 200), 
            verticalPadding = 36, 
            titleFontStyle = v4.Semantic.Typography.Title, 
            subtitleFontStyle = v4.Semantic.Typography.Header, 
            titleTextColor = v4.Semantic.Color.Text.Emphasis, 
            subtitleTextColor = v4.Semantic.Color.Text.Default, 
            dividerColor = v4.Semantic.Color.Common.Divider, 
            dividerHeight = 2, 
            dividerVerticalPadding = 36
        }, 
        ReportActionBar = {
            size = UDim2.new(0.33, 0, 0, 200), 
            buttonListHorizontalPadding = v4.Global.Space_100, 
            buttonHeight = v4.Global.Size_450, 
            buttonWidth = 450
        }, 
        ReportStep = {
            size = UDim2.new(0.75, 0, 0.7, 0), 
            headerFontStyle = v4.Semantic.Typography.Header, 
            headerTextColor = v4.Semantic.Color.Text.Emphasis, 
            verticalPadding = UDim.new(0, 24)
        }, 
        ReportListSelection = {
            listEntrySize = UDim2.new(1, 0, 0, 64)
        }, 
        ReportSubmission = {
            entrySize = UDim2.new(0.6, 0, 0, 100), 
            entryTitleColor = v4.Semantic.Color.Text.Default, 
            entryTextColor = v4.Semantic.Color.Text.Emphasis, 
            entryFontStyle = v4.Semantic.Typography.Subheader, 
            entryInnerVerticalPadding = UDim.new(0, 5), 
            dividerColor = v4.Semantic.Color.Common.Divider, 
            dividerHeight = 2, 
            dividerVerticalPadding = 5
        }
    };
end;
