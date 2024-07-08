local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v5 = require(script.Parent.SelectionRow);
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v9 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v10 = require(l_Parent_0.Analytics.EventConstants);
return function(v11)
    local v12 = l_useLocalization_0({
        addAccountText = "Authentication.AccountSwitch.Action.AddAccount"
    });
    local v13 = l_useStyle_0();
    return l_React_0.createElement(v5, {
        titleContent = v12.addAccountText, 
        subtitleContent = "", 
        renderImage = function()
            return l_React_0.createElement("Frame", {
                Size = UDim2.new(0, 48, 0, 48), 
                BackgroundColor3 = v13.Theme.IconDefault.Color, 
                BackgroundTransparency = 0.6
            }, {
                UICorner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 24)
                }), 
                Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Image = l_Images_0["icons/common/plus_small"], 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ImageColor3 = v13.Theme.BackgroundDefault.Color
                })
            });
        end, 
        onAccountSelection = function()
            v11.onRowClicked();
            v9.sendButtonClickEvent(v11.context, v11.origin, v10.btn.addAccount);
        end, 
        userInteractionEnabled = true
    });
end;
