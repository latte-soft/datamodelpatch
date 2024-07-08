local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v3 = require(l_ShareGame_0.Components.RectangleButton);
local v4 = require(l_ShareGame_0.Components.IconButton);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_ShareGame_0.Constants);
local v7 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons);
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v9 = require(l_ShareGame_0.getTranslator)();
local v10 = v5.PureComponent:extend("BackButton");
v10.IconType = {
    Arrow = "Arrow", 
    Cross = "Cross", 
    None = "None"
};
v10.defaultProps = {
    iconType = v10.IconType.None
};
local v11 = {
    [v10.IconType.Arrow] = "back", 
    [v10.IconType.Cross] = "cross"
};
local function v21(v12)
    local l_iconType_0 = v12.iconType;
    local l_visible_0 = v12.visible;
    local l_anchorPoint_0 = v12.anchorPoint;
    local l_position_0 = v12.position;
    local l_size_0 = v12.size;
    local l_zIndex_0 = v12.zIndex;
    local l_onClick_0 = v12.onClick;
    local v20 = v11[l_iconType_0];
    if not v20 then
        return ;
    else
        return v5.createElement(v4, {
            visible = l_visible_0, 
            anchorPoint = l_anchorPoint_0, 
            position = l_position_0, 
            size = l_size_0, 
            zIndex = l_zIndex_0, 
            onClick = l_onClick_0, 
            iconHorizontalAlignment = Enum.HorizontalAlignment.Left, 
            iconSpritePath = v7:GetImagePath(), 
            iconSpriteFrame = v7:GetFrame(v20)
        });
    end;
end;
v10.render = function(v22)
    local l_iconType_1 = v22.props.iconType;
    local l_zIndex_1 = v22.props.zIndex;
    if l_iconType_1 == v10.IconType.None then
        return v5.createElement(v3, v22.props, {
            TextLabel = v5.createElement("TextLabel", {
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Text = v9:FormatByKey("Feature.SettingsHub.Action.InviteFriendsBack"), 
                TextSize = v8.textSize(24, "BackButton"), 
                TextColor3 = v6.Color.WHITE, 
                Font = v8.font(Enum.Font.SourceSansSemibold, "BackButton"), 
                ZIndex = l_zIndex_1
            })
        });
    else
        return v21(v22.props);
    end;
end;
return v10;
