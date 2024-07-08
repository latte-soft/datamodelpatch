local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Badge_0 = v3.App.Indicator.Badge;
local v9 = l_Images_0["icons/menu/chat_on"];
local v10 = l_Images_0["icons/menu/chat_off"];
local v11 = v1.PureComponent:extend("ChatIcon");
v11.validateProps = v2.strictInterface({
    chatVisible = v2.boolean, 
    unreadMessages = v2.integer
});
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        local l_Theme_0 = v13.Theme;
        local l_v9_0 = v9;
        if not v12.props.chatVisible then
            l_v9_0 = v10;
        end;
        local l_createElement_0 = v1.createElement;
        local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
        local v18 = {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = l_v9_0, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ZIndex = 2
        };
        local v19 = {};
        local v20 = false;
        if v12.props.unreadMessages > 0 then
            v20 = v1.createElement(l_Badge_0, {
                position = UDim2.new(0, 24, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5), 
                hasShadow = false, 
                value = v12.props.unreadMessages
            });
        end;
        v19.Badge = v20;
        return l_createElement_0(l_l_ImageSetLabel_0_0, v18, v19);
    end);
end;
return v4.UNSTABLE_connect2(function(v21)
    return {
        chatVisible = v21.chat.visible, 
        unreadMessages = v21.chat.unreadMessages
    };
end, nil)(v11);
