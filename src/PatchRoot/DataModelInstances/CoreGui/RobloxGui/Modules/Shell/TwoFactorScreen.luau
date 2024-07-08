local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local _ = game:GetService("GuiService");
local l_AccountManager_0 = require(l_Shell_0:FindFirstChild("AccountManager"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_TextBox_0 = require(l_Shell_0:FindFirstChild("TextBox"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_GuiUtilities_0 = require(l_Shell_0:FindFirstChild("GuiUtilities"));
return function(v16, v17, v18)
    local v19 = l_BaseScreen_0();
    local v20 = l_GuiUtilities_0.CreateModalOverlay();
    local v21 = l_GuiUtilities_0.CreateScreenDivide();
    v21.Parent = v19.Container;
    local v22 = l_ScrollingTextBox_0(UDim2.new(0, 740, 0, 460), UDim2.new(0, 16, 0, 334), v19.Container);
    v22:SetFont(l_GlobalSettings_0.RegularFont);
    v22:SetFontSize(l_GlobalSettings_0.TitleSize);
    v19:SetTitle(l_LocalizedStrings_0:LocalizedString("TwoStepTitlePhase"));
    v22:SetText(l_LocalizedStrings_0:LocalizedString("TwoStepDescriptionPhase"));
    local v23 = nil;
    local v24 = l_TextBox_0(UDim2.new(0, 656, 0, 84));
    v24:SetPosition(UDim2.new(0, (v21.Position.X.Offset + v21.Size.X.Offset) + 86, 0, 334));
    v24:SetSpacing(Vector2.new(20, 0));
    v24:SetParent(v19.Container);
    v24:SetClipsDescendants(true);
    local l_v24_Container_0 = v24:GetContainer();
    v24:SetDefaultText(l_LocalizedStrings_0:LocalizedString("EnterCodePlaceholder"));
    v24:SetKeyboardTitle(l_LocalizedStrings_0:LocalizedString("EnterCodePlaceholder"));
    local v26 = l_Utility_0.Create("ImageLabel")({
        Name = "errorFrame", 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        Image = l_GlobalSettings_0.RoundCornerButtonOutlineImage, 
        ImageColor3 = l_GlobalSettings_0.Colors.RedText, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        Parent = l_v24_Container_0
    });
    v26.Visible = false;
    v19.errorFrame = v26;
    local function v32(v27, v28, v29, v30, v31)
        return (l_Utility_0.Create("TextLabel")({
            Name = v27 .. "Text", 
            Size = UDim2.new(1, 0, 0, v30), 
            Position = v29, 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            Text = v28, 
            TextSize = v30, 
            TextColor3 = v31 or l_GlobalSettings_0.WhiteTextColor, 
            Parent = v19.Container, 
            TextXAlignment = Enum.TextXAlignment.Left
        }));
    end;
    local v33 = v32("invalidCode", l_LocalizedStrings_0:LocalizedString("InvalidCode"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (l_v24_Container_0.Position.Y.Offset + l_v24_Container_0.Size.Y.Offset) + 20), 25.139999999999997, l_GlobalSettings_0.Colors.RedText);
    v33.Visible = false;
    v19.invalidCodeText = v33;
    local v34, v35, _ = l_GuiUtilities_0.CreateSlicedTextButton("Verify", l_LocalizedStrings_0:LocalizedString("VerifyWord"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (l_v24_Container_0.Position.Y.Offset + l_v24_Container_0.Size.Y.Offset) + 66));
    v34.Parent = v19.Container;
    v34.Size = l_v24_Container_0.Size;
    v19.VerifyButton = v35;
    local v37 = v32("resendCode", l_LocalizedStrings_0:LocalizedString("ResendCodeTitlePhase"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (v34.Position.Y.Offset + v34.Size.Y.Offset) + 100), 30.168);
    local v38, v39, _ = l_GuiUtilities_0.CreateSlicedTextOutlineButton("Resend", l_LocalizedStrings_0:LocalizedString("ResendWord"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (v37.Position.Y.Offset + v37.Size.Y.Offset) + 30));
    v38.Parent = v19.Container;
    v38.Size = l_v24_Container_0.Size;
    v19.ResendButton = v39;
    local v41 = v32("resentText", l_LocalizedStrings_0:LocalizedString("CodeResentPhase"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (v38.Position.Y.Offset + v38.Size.Y.Offset) + 18), 25.139999999999997);
    v41.Visible = false;
    v19.resentText = v41;
    local v42 = v32("resentErrorText", l_LocalizedStrings_0:LocalizedString("ResentErrorPhase"), UDim2.fromOffset(l_v24_Container_0.Position.X.Offset, (v38.Position.Y.Offset + v38.Size.Y.Offset) + 18), 25.139999999999997, l_GlobalSettings_0.Colors.RedText);
    v42.Visible = false;
    v19.resentErrorText = v42;
    v19.TermsOfServiceText = l_Utility_0.Create("TextLabel")({
        Name = "TermsOfServiceText", 
        Size = UDim2.new(0, 740, 0, 128), 
        Position = UDim2.new(0, 16, 0, 835), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        Text = l_LocalizedStrings_0:LocalizedString("TermsOfService2SV"), 
        Parent = v19.Container
    });
    v19.VerifyButton = v35;
    local function _()
        v19.invalidCodeText.Visible = true;
        v19.errorFrame.Visible = true;
    end;
    local function _()
        v19.invalidCodeText.Visible = false;
        v19.errorFrame.Visible = false;
    end;
    local function _()
        v19.resentText.Visible = true;
        v19.resentErrorText.Visible = false;
    end;
    local function _()
        v19.resentText.Visible = false;
    end;
    local function _()
        v19.resentErrorText.Visible = true;
        v19.resentText.Visible = false;
    end;
    local function _()
        v19.resentErrorText.Visible = false;
    end;
    local function v53()
        l_Utility_0.SetSelectedCoreObject(nil);
        local v49 = nil;
        l_GuiUtilities_0.DoLoadingSpinner(v19.Container, v20, {
            function()
                v49 = l_AccountManager_0:VerifyAsync(v16, v17, v18, v23);
            end
        });
        if v49 == l_AccountManager_0.AuthResults.Success then
            local v50 = nil;
            do
                local l_v50_0 = v50;
                l_GuiUtilities_0.DoLoadingSpinner(v19.Container, v20, {
                    function()
                        l_v50_0 = l_AccountManager_0:LoginAsync();
                    end
                });
                if l_v50_0 == l_AccountManager_0.AuthResults.Success then
                    l_ScreenManager_0:CloseCurrent();
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AuthenticationSuccess);
                else
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(not not l_v50_0 and l_Errors_0.Authentication[l_v50_0] or l_Errors_0.Default), false);
                end;
            end;
        elseif v49 == l_AccountManager_0.AuthResults.CodeInvalid then
            l_Utility_0.SetSelectedCoreObject(l_v24_Container_0);
            v19.invalidCodeText.Visible = true;
            v19.errorFrame.Visible = true;
        else
            local v52 = not not v49 and l_Errors_0.Authentication[v49] or l_Errors_0.Default;
            l_ScreenManager_0:CloseCurrent();
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(v52), false);
        end;
        v19.resentText.Visible = false;
    end;
    local function v55()
        local v54 = nil;
        l_GuiUtilities_0.DoLoadingSpinner(v19.Container, v20, {
            function()
                v54 = l_AccountManager_0:ResendAsync(v17, v18);
            end
        });
        if v54 == l_AccountManager_0.AuthResults.Success then
            v19.resentText.Visible = true;
            v19.resentErrorText.Visible = false;
            v19.invalidCodeText.Visible = false;
            v19.errorFrame.Visible = false;
            v24:SetDefaultText(l_LocalizedStrings_0:LocalizedString("EnterCodePlaceholder"));
            l_Utility_0.SetSelectedCoreObject(l_v24_Container_0);
        else
            v19.resentErrorText.Visible = true;
            v19.resentText.Visible = false;
        end;
    end;
    v35.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        v53();
    end);
    v39.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        v55();
    end);
    local function _()
        v19.invalidCodeText.Visible = true;
        v19.errorFrame.Visible = true;
        v19.resentText.Visible = false;
        v19.resentErrorText.Visible = false;
        v24:SetDefaultText(l_LocalizedStrings_0:LocalizedString("EnterCodePlaceholder"));
        v19.invalidCodeText.Visible = false;
        v19.errorFrame.Visible = false;
    end;
    v19.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("TwoFactorScreen")
        };
    end;
    v19.GetDefaultSelectionObject = function(_)
        return l_v24_Container_0;
    end;
    local v59 = nil;
    local l_Focus_0 = v19.Focus;
    v19.Focus = function(v61)
        l_Focus_0(v61);
        v59 = v24.OnTextChanged:connect(function(v62)
            v23 = v62;
            if #v23 == 6 then
                v19.invalidCodeText.Visible = false;
                v19.errorFrame.Visible = false;
                l_Utility_0.SetSelectedCoreObject(v35);
                return ;
            else
                if v23 == "" then
                    v19.invalidCodeText.Visible = false;
                    v19.errorFrame.Visible = false;
                else
                    v19.invalidCodeText.Visible = true;
                    v19.errorFrame.Visible = true;
                end;
                l_Utility_0.SetSelectedCoreObject(l_v24_Container_0);
                return ;
            end;
        end);
    end;
    local l_RemoveFocus_0 = v19.RemoveFocus;
    v19.RemoveFocus = function(v64)
        l_RemoveFocus_0(v64);
        l_Utility_0.DisconnectEvent(v59);
        v19.invalidCodeText.Visible = true;
        v19.errorFrame.Visible = true;
        v19.resentText.Visible = false;
        v19.resentErrorText.Visible = false;
        v24:SetDefaultText(l_LocalizedStrings_0:LocalizedString("EnterCodePlaceholder"));
        v19.invalidCodeText.Visible = false;
        v19.errorFrame.Visible = false;
    end;
    return v19;
end;
