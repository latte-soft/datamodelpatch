local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Roact);
local v2 = require(l_Modules_0.LuaApp.FitChildren);
local v3 = require(l_Modules_0.LuaApp.Components.RetryButton);
local v4 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v5 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v6 = v1.PureComponent:extend("UserAvatarRetryButton");
v6.render = function(v7)
    local l_appTheme_0 = v7.props.appTheme;
    local l_position_0 = v7.props.position;
    local l_anchorPoint_0 = v7.props.anchorPoint;
    local l_maxTextWidth_0 = v7.props.maxTextWidth;
    local l_onRetry_0 = v7.props.onRetry;
    local v13 = UDim2.new(1, 0, 0, 72);
    if l_maxTextWidth_0 then
        v13 = UDim2.new(0, l_maxTextWidth_0, 0, 72);
    end;
    return v1.createElement(v2.FitFrame, {
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        BackgroundTransparency = 1
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 40)
        }), 
        RetryButton = v1.createElement(v3, {
            layoutOrder = 1, 
            onRetry = l_onRetry_0, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        FailMessage = v1.createElement(v4, {
            LayoutOrder = 2, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = v13, 
            TextColor3 = l_appTheme_0.Main.BodyText.Color, 
            Font = l_appTheme_0.Main.BodyText.Font, 
            Text = "Feature.Avatar.Message.FailedToLoadAvatar", 
            TextScaled = true
        }, {
            UITextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                MaxTextSize = 24
            })
        })
    });
end;
return (v5(v6));
