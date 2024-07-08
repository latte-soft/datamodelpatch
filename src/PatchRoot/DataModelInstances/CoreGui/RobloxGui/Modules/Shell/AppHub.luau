local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_TabDock_0 = require(l_Shell_0:FindFirstChild("TabDock"));
local l_TabDockItem_0 = require(l_Shell_0:FindFirstChild("TabDockItem"));
local l_HomePane_0 = require(l_Shell_0:FindFirstChild("HomePane"));
local l_GamesPane_0 = require(l_Shell_0:FindFirstChild("GamesPane"));
local l_AvatarPane_0 = require(l_Shell_0:FindFirstChild("AvatarPane"));
local l_PageHeartbeatTimer_0 = require(l_Shell_0:FindFirstChild("PageHeartbeatTimer"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local v18 = require(l_Shell_0.Components.Social.SocialPane);
local l_StorePane_0 = require(l_Shell_0:FindFirstChild("StorePane"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_SettingsScreen_0 = require(l_Shell_0:FindFirstChild("SettingsScreen"));
local l_GameSearchScreen_0 = require(l_Shell_0:FindFirstChild("GameSearchScreen"));
local l_AchievementManager_0 = require(l_Shell_0:FindFirstChild("AchievementManager"));
local l_HintActionView_0 = require(l_Shell_0:FindFirstChild("HintActionView"));
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local v26 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v27 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function()
    local v28 = {};
    local v29 = l_TabDock_0(UDim2.new(0, 0, 0.132, 0), UDim2.new(0, 0, 0, 0));
    local v30 = {};
    local v31 = nil;
    local v32 = false;
    local v33 = nil;
    local v34 = nil;
    local v35 = l_Utility_0.Create("Frame")({
        Name = "HubContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false
    });
    local v36 = l_Utility_0.Create("Frame")({
        Name = "PaneContainer", 
        Size = UDim2.new(1, 0, 0.786, 0), 
        Position = UDim2.new(0, 0, 0.214, 0), 
        BackgroundTransparency = 1, 
        Parent = v35
    });
    v29:SetParent(v35);
    local v37 = v29:AddTab(l_TabDockItem_0(l_LocalizedStrings_0:LocalizedString("HomeWord"), l_HomePane_0(v36), l_Analytics_0.TabNames("HomeId")));
    local v38 = v29:AddTab(l_TabDockItem_0(l_LocalizedStrings_0:LocalizedString("AvatarWord"), l_AvatarPane_0(v36), l_Analytics_0.TabNames("AvatarId")));
    local v39 = v29:AddTab(l_TabDockItem_0(l_LocalizedStrings_0:LocalizedString("GamesWord"), l_GamesPane_0(v36), l_Analytics_0.TabNames("DiscoverId")));
    local v40 = v29:AddTab(l_TabDockItem_0(l_LocalizedStrings_0:LocalizedString("FriendsWord"), v18(v36), l_Analytics_0.TabNames("FriendsId")));
    local v41 = v29:AddTab(l_TabDockItem_0(l_LocalizedStrings_0:LocalizedString("CatalogWord"), l_StorePane_0(v36), l_Analytics_0.TabNames("StoreId")));
    l_Utility_0.Create("ImageLabel")({
        Name = "RobloxLogo", 
        Size = UDim2.new(0, 232, 0, 56), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ROBLOXLogoSmall@1080.png", 
        Parent = v35
    });
    local function _(v42)
        v29:SetSelectedTab(v42);
    end;
    local v44 = l_HintActionView_0(v35, "OpenHintAction");
    v44:SetImage("rbxasset://textures/ui/Shell/ButtonIcons/XButton.png");
    v44:SetVisible(false);
    local v45 = l_HintActionView_0(v35, "OpenYHintAction", UDim2.new(0, 0, 1, -1));
    v45:SetImage("rbxasset://textures/ui/Shell/ButtonIcons/YButton.png");
    v45:SetVisible(false);
    local function _(v46, v47)
        if v26() > 0 then
            l_Analytics_0.reportNavigation(v46, v47, nil);
        end;
    end;
    local v49 = false;
    local v50 = false;
    local function v57(_, v52, _)
        if v52 == Enum.UserInputState.Begin then
            v49 = true;
            return ;
        else
            if not (not (v52 == Enum.UserInputState.End) or not v49) then
                local v54 = l_SettingsScreen_0();
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenSettingsScreen, v54);
                if not v27() then
                    local l_v54_Name_0 = v54:GetName();
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", l_v54_Name_0, nil);
                    end;
                else
                    local v56 = l_Analytics_0.TabNames("SettingsId");
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", v56, nil);
                    end;
                end;
                v49 = false;
            end;
            return ;
        end;
    end;
    local function v62(_, v59, _)
        if v59 == Enum.UserInputState.Begin then
            v50 = true;
            return ;
        else
            if not (not (v59 == Enum.UserInputState.End) or not v50) then
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenAvatarEditorScreen);
                if not v27() then
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", "AvatarEditor", nil);
                    end;
                else
                    local v61 = l_Analytics_0.WidgetNames("AvatarEditorScreenId");
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", v61, nil);
                    end;
                end;
                v50 = false;
            end;
            return ;
        end;
    end;
    local function v67(_, v64, _)
        if v64 == Enum.UserInputState.Begin then
            v49 = true;
            return ;
        else
            if not (not (v64 == Enum.UserInputState.End) or not v49) then
                if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Test.FeatureNotAvailableInStudio), false);
                    return ;
                elseif not pcall(function()
                    return v2:ShowSystemPartyUI();
                end) then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.PlatformError.PopupPartyUI), false);
                elseif not v27() then
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", "PartyUI", nil);
                        return ;
                    end;
                else
                    local v66 = l_Analytics_0.WidgetNames("PartyUiScreenId");
                    if v26() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", v66, nil);
                        return ;
                    end;
                end;
            end;
            return ;
        end;
    end;
    local function v71(_, v69, _)
        if v69 == Enum.UserInputState.Begin then
            v49 = true;
            return ;
        else
            if not (not (v69 == Enum.UserInputState.End) or not v49) then
                if v2 then
                    v2:ShowKeyboard(l_LocalizedStrings_0:LocalizedString("SearchGamesPhrase"), "", "", Enum.XboxKeyBoardType.Default);
                end;
                v49 = false;
            end;
            return ;
        end;
    end;
    local function _(v72, v73)
        v44:SetText(v73);
        v44:BindAction(v72, Enum.KeyCode.ButtonX);
        v44:SetVisible(true);
    end;
    local function v79(v75)
        v44:UnbindAction();
        v44:SetVisible(false);
        v45:UnbindAction();
        v45:SetVisible(false);
        if v75 == v37 then
            local l_v57_0 = v57;
            v44:SetText((l_LocalizedStrings_0:LocalizedString("SettingsWord")));
            v44:BindAction(l_v57_0, Enum.KeyCode.ButtonX);
            v44:SetVisible(true);
            return ;
        else
            if v75 == v39 then
                if l_AchievementManager_0:AllGamesUnlocked() then
                    local l_v71_0 = v71;
                    v44:SetText((l_LocalizedStrings_0:LocalizedString("SearchWord")));
                    v44:BindAction(l_v71_0, Enum.KeyCode.ButtonX);
                    v44:SetVisible(true);
                    return ;
                end;
            elseif v75 == v40 then
                local l_v67_0 = v67;
                v44:SetText((l_LocalizedStrings_0:LocalizedString("StartPartyPhrase")));
                v44:BindAction(l_v67_0, Enum.KeyCode.ButtonX);
                v44:SetVisible(true);
                return ;
            elseif v75 == v38 then
                v45:SetText(l_LocalizedStrings_0:LocalizedString("AvatarEditorWord"));
                v45:BindAction(v62, Enum.KeyCode.ButtonY);
                v45:SetVisible(true);
            end;
            return ;
        end;
    end;
    v28.GetId = function(_)
        return not not v33 and v33:GetId() or l_Analytics_0.TabNames("HomeId");
    end;
    v28.GetName = function(_)
        return not not v33 and v33:GetName() or l_LocalizedStrings_0:LocalizedString("HomeWord");
    end;
    v28.GetAnalyticsInfo = function(_)
        local v83 = {};
        local v84 = l_Analytics_0.WidgetNames("WidgetId");
        local v85 = nil;
        if v33 and type(v33.GetAnalyticsInfo) == "function" then
            v85 = v33.GetAnalyticsInfo();
        end;
        if not (type(v85) == "table") or not v85[v84] then
            v83[v84] = l_Analytics_0.WidgetNames("AppHubId");
            return v83;
        else
            return v85;
        end;
    end;
    v28.Show = function(_)
        if not v32 then
            v32 = true;
            v35.Visible = true;
            v35.Parent = v34;
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch");
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch", function()
                if l_ScreenManager_0:ContainsScreen(v28) then
                    if not v32 then
                        v28:Show();
                    end;
                    if not v29:IsFocused() then
                        v29:Focus();
                    end;
                    while not (not (l_ScreenManager_0:GetTopScreen() ~= v28) or not l_ScreenManager_0:ContainsScreen(v28)) do
                        l_ScreenManager_0:CloseCurrent();
                    end;
                    if l_ScreenManager_0:GetTopScreen() == v28 and v29:GetSelectedTab() ~= v41 then
                        v29:SetSelectedTab(v41);
                    end;
                end;
            end);
            local v87 = false;
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch");
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch", function()
                if not v87 then
                    v87 = true;
                    if l_ScreenManager_0:ContainsScreen(v28) then
                        while not (not (l_ScreenManager_0:GetTopScreen() ~= v28) or not l_ScreenManager_0:ContainsScreen(v28)) do
                            l_ScreenManager_0:CloseCurrent();
                        end;
                        if l_ScreenManager_0:GetTopScreen() == v28 and v29:GetSelectedTab() ~= v38 then
                            v29:SetSelectedTab(v38);
                        end;
                    end;
                    v87 = false;
                    return ;
                else
                    return ;
                end;
            end);
            if not l_AchievementManager_0:AllGamesUnlocked() then
                l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC");
                l_EventHub_0:addEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC", function()
                    if v32 then
                        local l_v29_SelectedTab_0 = v29:GetSelectedTab();
                        if l_v29_SelectedTab_0 and l_v29_SelectedTab_0 == v39 then
                            v44:UnbindAction();
                            v44:SetVisible(false);
                            local l_v71_1 = v71;
                            v44:SetText((l_LocalizedStrings_0:LocalizedString("SearchWord")));
                            v44:BindAction(l_v71_1, Enum.KeyCode.ButtonX);
                            v44:SetVisible(true);
                        end;
                    end;
                end);
            end;
            v29:SetSelectedTab((v29:GetSelectedTab()));
            if v33 then
                v33:Show();
            end;
            local function v92(v90)
                if v90 then
                    if v33 then
                        v33:Hide(true);
                        v33:RemoveFocus(true);
                    end;
                    local l_v90_ContentItem_0 = v90:GetContentItem();
                    if l_v90_ContentItem_0 then
                        l_v90_ContentItem_0:Show(true);
                        if not v29:IsFocused() then
                            v29:Focus();
                        end;
                    end;
                    v33 = l_v90_ContentItem_0;
                    v79(v90);
                end;
            end;
            v31 = v29.SelectedTabChanged:connect(function(v93)
                if v26() > 0 then
                    l_contentHistory_0:setLastSelectedContent(v33);
                end;
                v92(v93);
                l_Analytics_0.reportPageChanged();
                l_PageHeartbeatTimer_0.onPageChanged(v93:GetId());
            end);
            return ;
        else
            return ;
        end;
    end;
    v28.Hide = function(v94)
        v32 = false;
        if not l_ScreenManager_0:ContainsScreen(v94) then
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch");
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch");
        end;
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC");
        l_Utility_0.DisconnectEvent(v31);
        v35.Visible = false;
        v35.Parent = nil;
        if v33 then
            v33:Hide();
        end;
    end;
    v28.Focus = function(_)
        v29:ConnectEvents();
        (function()
            l_ContextActionService_0:BindCoreAction("CycleTabDock", function(_, v97, v98)
                if v97 == Enum.UserInputState.End then
                    if v29:IsFocused() then
                        if v98.KeyCode == Enum.KeyCode.ButtonL1 then
                            local l_v29_PreviousTab_0 = v29:GetPreviousTab();
                            if l_v29_PreviousTab_0 then
                                if v26() > 0 then
                                    v29:SetSelectedTab(l_v29_PreviousTab_0, "ButtonL1");
                                    return ;
                                else
                                    v29:SetSelectedTab(l_v29_PreviousTab_0);
                                    return ;
                                end;
                            end;
                        elseif v98.KeyCode == Enum.KeyCode.ButtonR1 then
                            local l_v29_NextTab_0 = v29:GetNextTab();
                            if l_v29_NextTab_0 then
                                if v26() > 0 then
                                    v29:SetSelectedTab(l_v29_NextTab_0, "ButtonR1");
                                    return ;
                                else
                                    v29:SetSelectedTab(l_v29_NextTab_0);
                                end;
                            end;
                        end;
                    else
                        v33:RemoveFocus(true);
                        v29:Focus();
                        return ;
                    end;
                end;
            end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            local v101 = false;
            l_ContextActionService_0:BindCoreAction("CloseAppHub", function(_, v103, _)
                if v103 == Enum.UserInputState.Begin then
                    v101 = true;
                    return ;
                else
                    if not ((not (v103 == Enum.UserInputState.End) or not v101) or v29:IsFocused()) then
                        v33:RemoveFocus(true);
                        v29:Focus();
                    end;
                    return ;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end)();
        table.insert(v30, v29.SelectedTabClicked:connect(function(v105)
            local v106 = v105 and v105:GetContentItem();
            if v106 then
                v106:Focus(v29);
            end;
        end));
        table.insert(v30, l_GuiService_0.Changed:connect(function(v107)
            if not (not (v107 == "SelectedCoreObject") or not v29:IsFocused()) then
                v29:Show();
                if v33 then
                    v33:RemoveFocus();
                end;
            end;
            if v107 == "SelectedObject" then
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not (((((not l_SelectedCoreObject_0 or not v33) or not v33.IsFocused) or v33:IsFocused()) or not v33.IsAncestorOf) or not v33:IsAncestorOf(l_SelectedCoreObject_0)) then
                    v33:Focus(v29);
                end;
            end;
        end));
        local function v111(v109)
            v109 = l_Utility_0.SpaceNormalizeString(v109);
            if #v109 > 0 then
                local v110 = l_GameSearchScreen_0(v109);
                v110:SetParent(v35.Parent);
                l_ScreenManager_0:OpenScreen(v110);
            end;
        end;
        if v2 then
            table.insert(v30, v2.KeyboardClosed:connect(v111));
        end;
        if v29:GetSelectedTab() == nil then
            v29:SetSelectedTab(v37);
        end;
        if v33 then
            v33:Focus(v29);
        end;
        v79(v29:GetSelectedTab());
    end;
    v28.RemoveFocus = function(_)
        v29:DisconnectEvents();
        l_ContextActionService_0:UnbindCoreAction("CycleTabDock");
        l_ContextActionService_0:UnbindCoreAction("CloseAppHub");
        if v33 then
            v33:RemoveFocus();
        end;
        for v113, v114 in pairs(v30) do
            v114:disconnect();
            v30[v113] = nil;
        end;
        l_ContextActionService_0:UnbindCoreAction("OpenHintAction");
        l_ContextActionService_0:UnbindCoreAction("OpenYHintAction");
    end;
    v28.SetParent = function(_, v116)
        v34 = v116;
    end;
    return v28;
end;
