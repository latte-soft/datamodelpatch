local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v4 = game:DefineFastFlag("UseLargerHeaderTextOnMultipageSignup", false);
return function(v5)
    local v6 = l_useStyle_0();
    local v7 = if not v4 then v6.Font.Header2 else v6.Font.Header1;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v5.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        TitleText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v5.titleText, 
            TextColor3 = v6.Theme.TextEmphasis.Color, 
            TextSize = v6.Font.BaseSize * v7.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v7.Font, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        HelpText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v5.helpText, 
            TextColor3 = v6.Theme.TextDefault.Color, 
            TextSize = v6.Font.BaseSize * v6.Font.CaptionBody.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v6.Font.CaptionBody.Font, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end;
