local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local _ = game:GetService("GuiService");
local _ = game:GetService("ContextActionService");
local l_AccountManager_0 = require(l_Shell_0:FindFirstChild("AccountManager"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_GuiUtilities_0 = require(l_Shell_0:FindFirstChild("GuiUtilities"));
local v15 = require(l_Shell_0.CrossDeviceLoginHelper);
return function()
    local v16 = l_BaseScreen_0();
    local v17 = l_GuiUtilities_0.CreateScreenDivide();
    v17.Parent = v16.Container;
    local v18 = l_ScrollingTextBox_0(UDim2.new(0, 740, 0, 460), UDim2.new(0, 16, 0, 334), v16.Container);
    v18:SetFont(l_GlobalSettings_0.RegularFont);
    v18:SetFontSize(l_GlobalSettings_0.TitleSize);
    v16:SetTitle(l_LocalizedStrings_0:LocalizedString("LinkAccountTitle"));
    v18:SetText(l_LocalizedStrings_0:LocalizedString("LinkAccountPhrase"));
    local v19 = v16:GetView().TitleText:Clone();
    v19.Text = l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginTitle");
    v19.Position = UDim2.new(v19.Position.X.Scale, (v17.Position.X.Offset + v17.Size.X.Offset) + 86, v19.Position.Y.Scale, v19.Position.Y.Offset);
    v19.Parent = v16.Container;
    local v20 = v16.Container:Clone();
    local v21 = v16.Container:Clone();
    local v22 = l_Utility_0.Create("TextLabel")({
        Name = "CodeText", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, v19.Position.X.Offset, 0, (v19.Position.Y.Offset + v19.AbsoluteSize.Y) + 74), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.BoldFont, 
        TextSize = 68, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = "", 
        Parent = v20
    });
    local v23 = l_ScrollingTextBox_0(UDim2.new(0, 780, 0, 460), UDim2.new(0, v19.Position.X.Offset, 0, 334), v20);
    v23:SetFont(l_GlobalSettings_0.RegularFont);
    v23:SetFontSize(l_GlobalSettings_0.TitleSize);
    v23:SetText(l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginDescriptionPhrase"));
    local v24 = l_ScrollingTextBox_0(UDim2.new(0, 780, 0, 460), UDim2.new(0, v19.Position.X.Offset, 0, 334), v21);
    v24:SetFont(l_GlobalSettings_0.RegularFont);
    v24:SetFontSize(l_GlobalSettings_0.TitleSize);
    local v25 = l_GuiUtilities_0.CreateModalOverlay();
    local function _(v26)
        v21.Parent = nil;
        v22.Text = v26;
        v20.Parent = v16.Container;
    end;
    local function _(v28)
        v20.Parent = nil;
        v24:SetText(l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginConfirmPhrase") .. " " .. v28);
        v21.Parent = v16.Container;
    end;
    local v30 = v15();
    local v31 = nil;
    local v32 = false;
    local function v35()
        local l_Error_0 = l_AccountManager_0.AuthResults.Error;
        local l_Error_1 = l_AccountManager_0.AuthResults.Error;
        l_GuiUtilities_0.DoLoadingSpinner(v16.Container, v25, {
            function()
                l_Error_0 = l_AccountManager_0:CrossDeviceAccountLink(v30:GetCode(), v30:GetPrivateKey());
                if l_Error_0 == l_AccountManager_0.AuthResults.Success then
                    l_Error_1 = l_AccountManager_0:LoginAsync();
                end;
            end
        });
        if l_Error_0 ~= l_AccountManager_0.AuthResults.Success then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not l_Error_0 and l_Errors_0.Authentication[l_Error_0] or l_Errors_0.Default), false);
        elseif l_Error_1 ~= l_AccountManager_0.AuthResults.Success then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not l_Error_1 and l_Errors_0.Authentication[l_Error_1] or l_Errors_0.Default), false);
        else
            v32 = true;
            l_ScreenManager_0:CloseCurrent();
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
        end;
    end;
    local function v39(v36)
        if v36 == v30.CrossDeviceLoginStatus.Cancelled then
            l_ScreenManager_0:CloseCurrent(v16);
            return ;
        elseif v36 == v30.CrossDeviceLoginStatus.Expired then
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0({
                Title = l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginCodeExpiredTitle"), 
                Msg = l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginExpiredPhrase")
            }), false);
            return ;
        elseif v36 == v30.CrossDeviceLoginStatus.Created then
            local l_v30_Code_0 = v30:GetCode();
            v21.Parent = nil;
            v22.Text = l_v30_Code_0;
            v20.Parent = v16.Container;
            return ;
        elseif v36 == v30.CrossDeviceLoginStatus.UserLinked then
            local l_v30_AccountName_0 = v30:GetAccountName();
            v20.Parent = nil;
            v24:SetText(l_LocalizedStrings_0:LocalizedString("CrossDeviceLoginConfirmPhrase") .. " " .. l_v30_AccountName_0);
            v21.Parent = v16.Container;
            return ;
        else
            if v36 == v30.CrossDeviceLoginStatus.Validated then
                v35();
            end;
            return ;
        end;
    end;
    v16.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("CrossDeviceLoginScreen")
        };
    end;
    v16.GetDefaultSelectionObject = function(_)
        return nil;
    end;
    local l_Focus_0 = v16.Focus;
    v16.Focus = function(v43)
        l_Focus_0(v43);
        v31 = v30.CrossDeviceLoginStatusChanged:connect(v39);
        spawn(function()
            v30:StartCrossDeviceLogin();
        end);
    end;
    local l_RemoveFocus_0 = v16.RemoveFocus;
    v16.RemoveFocus = function(v45)
        v31 = l_Utility_0.DisconnectEvent(v31);
        if not v32 then
            v30:CancelCrossDeviceLogin();
        end;
        l_RemoveFocus_0(v45);
    end;
    return v16;
end;
