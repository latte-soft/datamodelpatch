local l_Parent_0 = script:FindFirstAncestor("AbuseReportMenu").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
return function(v3)
    local v4 = l_useStyle_0();
    local l_Font_0 = v4.Font.Body.Font;
    local l_BaseSize_0 = v4.Font.BaseSize;
    local l_Theme_0 = v4.Theme;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundTransparency = v4.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v4.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        AbuseReportsText = v1.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 40), 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            PlaceholderText = "In your own words, help us understand what went wrong.", 
            Font = l_Font_0, 
            Text = v3.text, 
            TextSize = l_BaseSize_0, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            RichText = false, 
            MultiLine = true, 
            TextWrapped = true, 
            ClearTextOnFocus = false, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            [v1.Event.FocusLost] = function()
            end, 
            [v1.Event.Focused] = function()
            end, 
            [v1.Change.AbsoluteSize] = function()
            end, 
            [v1.Change.Text] = function(v8)
                if v3.text ~= v8.Text then
                    v3.onUpdate(v8.Text);
                end;
            end
        })
    });
end;
