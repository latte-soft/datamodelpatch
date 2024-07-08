local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = game:GetService("CoreGui").RobloxGui.Modules.LuaApp;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_LuaApp_0.Components.NavigationBar);
local v5 = v2.PureComponent:extend("ShareTargetGameTopBar");
v5.defaultProps = {
    LayoutOrder = 0
};
v5.render = function(v6)
    return v3.Style.withStyle(function(v7)
        return v2.createElement("Frame", {
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v7.Theme.BackgroundDefault.Color, 
            Size = UDim2.new(1, 0, 0, 88), 
            LayoutOrder = v6.props.LayoutOrder
        }, {
            topBar = v2.createElement(v4, {
                paddingTop = 12, 
                title = "Feature.Chat.Heading.ShareGameToChat", 
                titleFont = v7.Font.Header2.Font, 
                titleTextSize = v7.Font.Header2.RelativeSize * v7.Font.BaseSize, 
                titleColor = v7.Theme.TextEmphasis.Color, 
                iconSize = 36, 
                icon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
                iconColor = v7.Theme.IconEmphasis.Color, 
                buttonLeftPadding = 15, 
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    end);
end;
return v5;
