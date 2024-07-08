local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_useLocalization_0 = v0.Localization.Hooks.useLocalization;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function()
    local v5 = l_useLocalization_0({
        maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
    });
    local v6 = l_useStyle_0();
    return l_React_0.createElement("TextLabel", {
        Text = v5.maxAccountsReachedText, 
        TextSize = v6.Font.BaseSize, 
        TextColor3 = v6.Theme.TextDefault.Color, 
        TextTransparency = v6.Theme.TextDefault.Transparency, 
        BackgroundColor3 = v6.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 1, 
        Font = v6.Font.Body.Font, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextWrapped = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        })
    });
end;
