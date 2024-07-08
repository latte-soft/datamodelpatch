local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.constants);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
return function()
    local v6 = l_useStyle_0();
    local l_Font_0 = v6.Font;
    local l_Font_1 = l_Font_0.Header1.Font;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v10 = l_useLocalization_0({
        emptyText = v2.Text.EmptyKey
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v2.DefaultPadding)
        }); 
        v3.createElement("TextLabel", {
            Text = v10 and v10.emptyText, 
            LayoutOrder = 2, 
            Font = l_Font_1, 
            TextSize = l_BaseSize_0, 
            BackgroundTransparency = 1, 
            TextColor3 = v6.Theme.TextDefault.Color, 
            Size = UDim2.new(1, 0, 0, v2.EmptyNotifications.LabelHeight)
        })
    });
end;
