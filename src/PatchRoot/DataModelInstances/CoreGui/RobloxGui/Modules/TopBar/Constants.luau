local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.TenFootInterface);
local v3 = require(l_Parent_0.Chrome.Enabled);
local v4 = require(l_Parent_0.isNewTiltIconEnabled);
local v5 = require(script.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local function _()
    local v6 = nil;
    pcall(function()
        v6 = l_UserInputService_0:GetPlatform();
    end);
    if not (v6 ~= Enum.Platform.IOS) or v6 == Enum.Platform.Android then
        return 52;
    else
        return 58;
    end;
end;
local function _()
    if v4() then
        if not v3() then
            return 36;
        else
            local v8 = nil;
            pcall(function()
                v8 = l_UserInputService_0:GetPlatform();
            end);
            if not (v8 ~= Enum.Platform.IOS) or v8 == Enum.Platform.Android then
                return 52;
            else
                return 58;
            end;
        end;
    else
        return 36;
    end;
end;
local v10 = not v3() and 36 or 48;
local v11 = not v3() and 32 or 44;
if v5() then
    if v4() then
        if not v3() then
            v10 = 36;
        else
            local v12 = nil;
            pcall(function()
                v12 = l_UserInputService_0:GetPlatform();
            end);
            if not (v12 ~= Enum.Platform.IOS) or v12 == Enum.Platform.Android then
                v10 = 52;
                --[[ close >= 10 ]]
            else
                v10 = 58;
                --[[ close >= 10 ]]
            end;
        end;
    else
        v10 = 36;
    end;
end;
return {
    TopBarHeight = v10, 
    TopBarHeightTenFoot = 72, 
    TopBarButtonHeight = v11, 
    TopBarButtonPadding = 2, 
    TopBarTopMargin = (v10 - v11) - 4, 
    MenuIconKeepOutAreaId = "roblox-menu-icon", 
    HealthBarKeepOutAreaId = "health-bar", 
    MoreMenuKeepOutAreaId = "more-menu", 
    ChatIconKeepOutAreaId = "chat-icon", 
    BackIconKeepOutAreaId = "back-icon", 
    BadgeOver13KeepOutAreaId = "badge-13", 
    VoiceBetaBadgeKeepOutAreaId = "badge-voice-beta", 
    ScreenSideOffset = 16, 
    ScreenSideOffsetTenFoot = 48, 
    Padding = 12, 
    HealthPercentForOverlay = 0.05, 
    HealthRedColor = Color3.fromRGB(255, 28, 0), 
    HealthYellowColor = Color3.fromRGB(250, 235, 0), 
    HealthGreenColor = Color3.fromRGB(27, 252, 107), 
    InputType = {
        MouseAndKeyBoard = "MouseAndKeyboard", 
        Touch = "Touch", 
        Gamepad = "Gamepad"
    }, 
    Analytics = {
        EventNameTopBarButtonActivated = "topbar-button-activated", 
        ChatButtonName = "chat", 
        MoreMenuButtonName = "more-menu", 
        InventoryButtonName = "inventory", 
        LeaderboardButtonName = "leaderboard", 
        EmotesButtonName = "emotes", 
        StatusActive = "active", 
        StatusInactive = "inactive"
    }
};
