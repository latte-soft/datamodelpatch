local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_Parent_0.Colors);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v9 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = v4.PureComponent:extend("PlayerNameLabel");
local l_verified_0 = v9.emoji.verified;
v11.render = function(v13)
    local l_locale_0 = v13.props.locale;
    local l_view_0 = v13.props.view;
    local l_playerName_0 = v13.props.playerName;
    local v17 = tonumber(v13.props.playerId);
    local v18 = v17 and l_Players_0:GetPlayerByUserId(v17);
    local v19 = not not v18 and v9.isPlayerVerified(v18);
    local v20 = nil;
    v20 = l_playerName_0 == "" and "" or if v19 then v8:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0, 
        VERIFIED_BADGE = l_verified_0
    }) else v8:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0
    });
    return v4.createElement(v10.Consumer, {
        render = function(v21)
            local v22 = v21[l_view_0];
            return v4.createElement("TextLabel", {
                Size = UDim2.new(1, -((v22.AvatarHeadShotSize + v22.BorderPaddingSize * 2) + 10), 0, v22.TopSizeY), 
                BackgroundTransparency = 1, 
                TextColor3 = v7.White, 
                TextScaled = true, 
                Text = v20, 
                TextSize = 36, 
                Font = l_AppFonts_0.default:getBlack(), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }, {
                TextSizeConstraint = v4.createElement("UITextSizeConstraint", {
                    MaxTextSize = 36
                })
            });
        end
    });
end;
return v5.UNSTABLE_connect2(function(v23, _)
    return {
        view = v23.view, 
        playerName = v23.playerName, 
        playerId = v23.playerId, 
        locale = v23.locale
    };
end)(v11);
