local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local l_BaseCarouselScreen_0 = require(l_Shell_0:FindFirstChild("BaseCarouselScreen"));
local l_HintActionView_0 = require(l_Shell_0:FindFirstChild("HintActionView"));
local v8 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
return function(v9, v10)
    local v11 = l_BaseCarouselScreen_0("ExperienceSearch");
    local l_v9_0 = v9;
    local v13 = nil;
    local l_l_SortsData_0_GameSearchSort_0 = l_SortsData_0:GetGameSearchSort(l_v9_0);
    local function _(v15)
        v11:SetTitle(string.format(l_LocalizedStrings_0:LocalizedString("SearchingForPhrase"), v15));
    end;
    local function _()
        if v1 then
            v1:ShowKeyboard(l_LocalizedStrings_0:LocalizedString("SearchGamesPhrase"), "", l_v9_0, Enum.XboxKeyBoardType.Default);
        end;
    end;
    if v8.isUserEnrolled() then
        if not v10 then
            v11:SetTitle(string.format(l_LocalizedStrings_0:LocalizedString("SearchingForPhrase"), l_v9_0));
        else
            v11:SetTitle(l_LocalizedStrings_0:LocalizedString("SearchWord"));
            if v1 then
                v1:ShowKeyboard(l_LocalizedStrings_0:LocalizedString("SearchGamesPhrase"), "", l_v9_0, Enum.XboxKeyBoardType.Default);
            end;
        end;
    end;
    v11:LoadGameCollection(l_l_SortsData_0_GameSearchSort_0);
    local function v19(v18)
        v18 = l_Utility_0.SpaceNormalizeString(v18);
        if #v18 > 0 and v18 ~= l_v9_0 then
            l_v9_0 = v18;
            v11:SetTitle(string.format(l_LocalizedStrings_0:LocalizedString("SearchingForPhrase"), l_v9_0));
            l_l_SortsData_0_GameSearchSort_0 = l_SortsData_0:GetGameSearchSort(l_v9_0);
            v11:LoadGameCollection(l_l_SortsData_0_GameSearchSort_0);
        end;
        if not (not (v8.isUserEnrolled() and #v18 < 1) or not v10) then
            v11:OnBackButtonClick();
        end;
    end;
    local v20 = false;
    local function v24(_, v22, _)
        if v22 == Enum.UserInputState.Begin then
            v20 = true;
            return ;
        else
            if not (not (v22 == Enum.UserInputState.End) or not v20) then
                if v1 then
                    v1:ShowKeyboard(l_LocalizedStrings_0:LocalizedString("SearchGamesPhrase"), "", l_v9_0, Enum.XboxKeyBoardType.Default);
                end;
                v20 = false;
            end;
            return ;
        end;
    end;
    local v25 = nil;
    if not v8.isUserEnrolled() then
        v25 = l_HintActionView_0(v11.Container, "OpenSearchKeyboard");
        v25:SetImage("rbxasset://textures/ui/Shell/ButtonIcons/XButton.png");
        v25:SetText(l_LocalizedStrings_0:LocalizedString("SearchWord"));
    end;
    v11.GetId = function(_)
        return l_Analytics_0.TabNames("SearchId");
    end;
    v11.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("GameSearchScreenId"), 
            Title = l_v9_0
        };
    end;
    local l_Focus_0 = v11.Focus;
    v11.Focus = function(v29)
        l_Focus_0(v29);
        if not v8.isUserEnrolled() then
            v25:BindAction(v24, Enum.KeyCode.ButtonX);
        end;
        v13 = l_Utility_0.DisconnectEvent(v13);
        if v1 then
            v13 = v1.KeyboardClosed:connect(v19);
        end;
    end;
    local l_RemoveFocus_0 = v11.RemoveFocus;
    v11.RemoveFocus = function(v31)
        l_RemoveFocus_0(v31);
        if not v8.isUserEnrolled() then
            v25:UnbindAction();
        end;
        v13 = l_Utility_0.DisconnectEvent(v13);
    end;
    return v11;
end;
