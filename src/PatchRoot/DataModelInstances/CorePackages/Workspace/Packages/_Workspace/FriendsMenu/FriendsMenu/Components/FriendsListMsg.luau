local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v6 = {
    errorFriendsList = "Feature.SettingsHub.Label.FriendsListLoadErrorMessage", 
    noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults"
};
return function(v7)
    local v8 = l_useStyle_0();
    local l_Theme_0 = v8.Theme;
    local l_Font_0 = v8.Font;
    local v11 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Name = v7.msgType
    }, {
        subtitle = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = l_getLocalizedStrings_0(v6)[v7.msgType], 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextSize = v11, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            Size = UDim2.new(1, 0, 0, v11), 
            Position = UDim2.new(0, 0, 0.4, 0), 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;
