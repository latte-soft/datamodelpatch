local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.React);
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local l_LoadingSpinner_0 = v1.App.Loading.LoadingSpinner;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v1.App.ImageSet.Images;
local l_useStyle_0 = v1.Core.Style.useStyle;
return function(v8)
    local l_frameHeight_0 = v8.frameHeight;
    local l_layoutOrder_0 = v8.layoutOrder;
    local l_finished_0 = v8.finished;
    local l_progressText_0 = v8.progressText;
    local v13 = l_useStyle_0();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        StatusIcon = if not l_finished_0 then v2.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(l_frameHeight_0, l_frameHeight_0)
        }) else v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, l_frameHeight_0, 0, l_frameHeight_0), 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/status/success"], 
            ImageTransparency = v13.Theme.SystemPrimaryDefault.Transparency, 
            ImageColor3 = v13.Theme.IconEmphasis.Color
        }), 
        TextFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, -l_frameHeight_0 - 12, 0, l_frameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            ProgressText = v2.createElement(l_StyledTextLabel_0, {
                text = l_progressText_0, 
                fontStyle = v13.Font.CaptionBody, 
                colorStyle = v13.Theme.TextDefault, 
                size = UDim2.new(1, 0, 1, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;
