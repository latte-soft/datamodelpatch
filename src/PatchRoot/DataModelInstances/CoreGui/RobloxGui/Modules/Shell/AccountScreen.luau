local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_AccountLinkingView_0 = require(l_Shell_0:FindFirstChild("AccountLinkingView"));
local l_GameplaySettingsView_0 = require(l_Shell_0:FindFirstChild("GameplaySettingsView"));
return function(v8)
    local v9 = l_BaseScreen_0();
    v9:SetTitle(l_LocalizedStrings_0:LocalizedString("AccountSettingsTitle"));
    local v10 = l_Utility_0.Create("Frame")({
        Name = "AccountLinkingViewContainer", 
        Position = UDim2.new(0, 75, 0, 275), 
        Size = UDim2.new(0, 765, 0, 630), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Parent = v9.Container
    });
    local v11 = l_AccountLinkingView_0();
    v11:SetParent(v10);
    local _ = l_Utility_0.Create("Frame")({
        Name = "ScreenDivide", 
        Size = UDim2.new(0, 2, 0, 615), 
        Position = UDim2.new(0, 840, 0, 275), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.PageDivideColor, 
        Parent = v9.Container
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "GameplaySettingsViewContainer", 
        Position = UDim2.new(0, 840, 0, 275), 
        Size = UDim2.new(0, 765, 0, 630), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Parent = v9.Container
    });
    local v14 = l_GameplaySettingsView_0(v8);
    v14:SetParent(v13);
    v9.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("UnlinkAccountScreenId")
        };
    end;
    v9.GetDefaultSelectionObject = function(_)
        return v11:GetUnlinkButton();
    end;
    local l_Focus_0 = v9.Focus;
    v9.Focus = function(v18)
        l_Focus_0(v18);
        v11:Focus();
        v14:Focus();
    end;
    local l_RemoveFocus_0 = v9.RemoveFocus;
    v9.RemoveFocus = function(v20)
        l_RemoveFocus_0(v20);
        v11:RemoveFocus();
    end;
    return v9;
end;
