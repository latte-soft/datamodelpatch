local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.ReactRoblox);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_HomePane_0 = require(l_Shell_0:FindFirstChild("HomePane"));
local l_GamesPane_0 = require(l_Shell_0:FindFirstChild("GamesPane"));
local l_AvatarPane_0 = require(l_Shell_0:FindFirstChild("AvatarPane"));
local l_PageHeartbeatTimer_0 = require(l_Shell_0:FindFirstChild("PageHeartbeatTimer"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local v20 = require(l_Shell_0.Components.Social.SocialPane);
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_SettingsScreen_0 = require(l_Shell_0:FindFirstChild("SettingsScreen"));
local l_GameSearchScreen_0 = require(l_Shell_0:FindFirstChild("GameSearchScreen"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local l_AchievementManager_0 = require(l_Shell_0:FindFirstChild("AchievementManager"));
local l_StoreScreen_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("StoreScreen"));
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local l_ContextBarContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext"));
local v29 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v30 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
local l_TabDockContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("TabDockContext"));
local l_TabDock_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("TabDock"));
local l_ThemeProvider_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ThemeProvider"));
local l_ContextBarContainer_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContainer"));
local l_SelectionCursorProvider_0 = v9.App.SelectionImage.SelectionCursorProvider;
local l_CreateTabDockItemContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("CreateTabDockItemContext"));
return function()
    local v37 = {};
    local v38 = l_TabDockContext_0.CreateTabDockContext();
    local v39 = {};
    local v40 = nil;
    local v41 = false;
    local v42 = nil;
    local v43 = nil;
    local v44 = l_Utility_0.Create("Frame")({
        Name = "HubContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false
    });
    local v45 = l_Utility_0.Create("Frame")({
        Name = "PaneContainer", 
        Size = UDim2.new(1, 0, 0.786, 0), 
        Position = UDim2.new(0, 0, 0.214, 0), 
        BackgroundTransparency = 1, 
        Parent = v44
    });
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    v38.configurationPromise:andThen(function()
        v46 = l_CreateTabDockItemContext_0(l_LocalizedStrings_0:LocalizedString("HomeWord"), l_HomePane_0(v45), l_Analytics_0.TabNames("HomeId"));
        v48 = l_CreateTabDockItemContext_0(l_LocalizedStrings_0:LocalizedString("GamesWord"), l_GamesPane_0(v45), l_Analytics_0.TabNames("DiscoverId"));
        v47 = l_CreateTabDockItemContext_0(l_LocalizedStrings_0:LocalizedString("AvatarWord"), l_AvatarPane_0(v45), l_Analytics_0.TabNames("AvatarId"));
        v49 = l_CreateTabDockItemContext_0(l_LocalizedStrings_0:LocalizedString("FriendsWord"), v20(v45), l_Analytics_0.TabNames("FriendsId"));
        v38:AddTabs({
            v46, 
            v48, 
            v47, 
            v49
        });
    end):catch(function(v50)
        error(v50);
    end);
    local function _(v51, v52)
        if v29() > 0 then
            l_Analytics_0.reportNavigation(v51, v52, nil);
        end;
    end;
    v8.createRoot((l_Utility_0.Create("Frame")({
        Name = "AltHubContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v44
    }))):render((v7.createElement(l_ThemeProvider_0, {}, {
        v7.createElement(l_TabDockContext_0.RoactContext.Provider, {
            value = v38
        }, {
            SelectionCursorProvider = v7.createElement(l_SelectionCursorProvider_0, {}, {
                v7.createElement(v7.Fragment, nil, {
                    TabDock = v7.createElement(l_TabDock_0, {
                        userId = l_AppState_0.store:getState().RobloxUser.rbxuid, 
                        onOpenStore = function(v54)
                            local v55 = l_StoreScreen_0();
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenStoreScreen, v55);
                            if not v30() then
                                local l_v55_Name_0 = v55:GetName();
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v54, l_v55_Name_0, nil);
                                end;
                            else
                                local v57 = l_Analytics_0.TabNames("StoreId");
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v54, v57, nil);
                                    return ;
                                end;
                            end;
                        end, 
                        onOpenSearch = function(v58)
                            local v59 = l_GameSearchScreen_0("", true);
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenSearchScreen, v59);
                            if not v30() then
                                local l_v59_Name_0 = v59:GetName();
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v58, l_v59_Name_0, nil);
                                end;
                            else
                                local v61 = l_Analytics_0.TabNames("SearchId");
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v58, v61, nil);
                                    return ;
                                end;
                            end;
                        end, 
                        onOpenSettings = function(v62)
                            local v63 = l_SettingsScreen_0();
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenSettingsScreen, v63);
                            if not v30() then
                                local l_v63_Name_0 = v63:GetName();
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v62, l_v63_Name_0, nil);
                                end;
                            else
                                local v65 = l_Analytics_0.TabNames("SettingsId");
                                if v29() > 0 then
                                    l_Analytics_0.reportNavigation(v62, v65, nil);
                                    return ;
                                end;
                            end;
                        end
                    }), 
                    ContextBar = v7.createElement(l_ContextBarContainer_0)
                })
            })
        })
    })));
    l_Utility_0.Create("ImageLabel")({
        Name = "RobloxLogo", 
        Size = UDim2.new(0, 232, 0, 56), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ROBLOXLogoSmall@1080.png", 
        Parent = v44
    });
    local function _(v66)
        v38:SetSelectedTab(v66);
    end;
    local v68 = false;
    local v69 = false;
    local function v74(_, v71, _)
        if v71 == Enum.UserInputState.Begin then
            v69 = true;
            return ;
        else
            if not (not (v71 == Enum.UserInputState.End) or not v69) then
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenAvatarEditorScreen);
                if not v30() then
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", "AvatarEditor", nil);
                    end;
                else
                    local v73 = l_Analytics_0.WidgetNames("AvatarEditorScreenId");
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", v73, nil);
                    end;
                end;
                v69 = false;
            end;
            return ;
        end;
    end;
    local function v79(_, v76, _)
        if v76 == Enum.UserInputState.Begin then
            v68 = true;
            return ;
        else
            if not (not (v76 == Enum.UserInputState.End) or not v68) then
                if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Test.FeatureNotAvailableInStudio), false);
                    return ;
                elseif not pcall(function()
                    return v3:ShowSystemPartyUI();
                end) then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.PlatformError.PopupPartyUI), false);
                elseif not v30() then
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", "PartyUI", nil);
                        return ;
                    end;
                else
                    local v78 = l_Analytics_0.WidgetNames("PartyUiId");
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextX", v78, nil);
                        return ;
                    end;
                end;
            end;
            return ;
        end;
    end;
    local function v86(_, v81, _)
        if v81 == Enum.UserInputState.Begin then
            v69 = true;
            return ;
        else
            if not (not (v81 == Enum.UserInputState.End) or not v69) then
                local v83 = l_GameSearchScreen_0("", true);
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenSearchScreen, v83);
                if not v30() then
                    local l_v83_Name_0 = v83:GetName();
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", l_v83_Name_0, nil);
                    end;
                else
                    local v85 = l_Analytics_0.TabNames("SearchId");
                    if v29() > 0 then
                        l_Analytics_0.reportNavigation("ContextY", v85, nil);
                    end;
                end;
                v69 = false;
            end;
            return ;
        end;
    end;
    local function v89(v87)
        local l_LuaContext_0 = l_ContextBarContext_0.LuaContext;
        l_LuaContext_0:UnbindAllActions();
        if v87 == v46 then
            l_LuaContext_0:BindAction("Y", Enum.KeyCode.ButtonY, l_LocalizedStrings_0:LocalizedString("SearchWord"), v86);
            return ;
        elseif v87 == v48 then
            l_LuaContext_0:BindAction("Y", Enum.KeyCode.ButtonY, l_LocalizedStrings_0:LocalizedString("SearchWord"), v86);
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.SetGamesHints);
            return ;
        elseif v87 == v49 then
            l_LuaContext_0:BindAction("X", Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocalizedString("StartPartyPhrase"), v79);
            l_LuaContext_0:BindAction("Y", Enum.KeyCode.ButtonY, l_LocalizedStrings_0:LocalizedString("SearchWord"), v86);
            return ;
        else
            if v87 == v47 then
                l_LuaContext_0:BindAction("Y", Enum.KeyCode.ButtonY, l_LocalizedStrings_0:LocalizedString("AvatarEditorWord"), v74);
            end;
            return ;
        end;
    end;
    v37.GetId = function(_)
        return not not v42 and v42:GetId() or l_Analytics_0.TabNames("HomeId");
    end;
    v37.GetName = function(_)
        return not not v42 and v42:GetName() or l_LocalizedStrings_0:LocalizedString("HomeWord");
    end;
    v37.GetAnalyticsInfo = function(_)
        local v93 = {};
        local v94 = l_Analytics_0.WidgetNames("WidgetId");
        local v95 = nil;
        if v42 and type(v42.GetAnalyticsInfo) == "function" then
            v95 = v42.GetAnalyticsInfo();
        end;
        if not (type(v95) == "table") or not v95[v94] then
            v93[v94] = l_Analytics_0.WidgetNames("AppHubId");
            return v93;
        else
            return v95;
        end;
    end;
    v37.Show = function(_)
        if not v41 then
            v41 = true;
            v44.Visible = true;
            v44.Parent = v43;
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch");
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch", function()
                if l_ScreenManager_0:ContainsScreen(v37) then
                    if not v41 then
                        v37:Show();
                    end;
                    if not v38:IsFocused() then
                        v38:Focus();
                    end;
                    while not (not (l_ScreenManager_0:GetTopScreen() ~= v37) or not l_ScreenManager_0:ContainsScreen(v37)) do
                        l_ScreenManager_0:CloseCurrent();
                    end;
                    if l_ScreenManager_0:GetTopScreen() == v37 and v38:GetSelectedTab() ~= nil then
                        v38:SetSelectedTab(nil);
                    end;
                end;
            end);
            local v97 = false;
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch");
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch", function()
                if not v97 then
                    v97 = true;
                    if l_ScreenManager_0:ContainsScreen(v37) then
                        while not (not (l_ScreenManager_0:GetTopScreen() ~= v37) or not l_ScreenManager_0:ContainsScreen(v37)) do
                            l_ScreenManager_0:CloseCurrent();
                        end;
                        if l_ScreenManager_0:GetTopScreen() == v37 and v38:GetSelectedTab() ~= v47 then
                            v38:SetSelectedTab(v47);
                        end;
                    end;
                    v97 = false;
                    return ;
                else
                    return ;
                end;
            end);
            if not l_AchievementManager_0:AllGamesUnlocked() then
                l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC");
                l_EventHub_0:addEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC", function()
                    if v41 then
                        local l_v38_SelectedTab_0 = v38:GetSelectedTab();
                        if l_v38_SelectedTab_0 and l_v38_SelectedTab_0 == v48 then
                            local l_LuaContext_1 = l_ContextBarContext_0.LuaContext;
                            l_LuaContext_1:UnbindAction("X");
                            l_LuaContext_1:BindAction("X", Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocalizedString("SearchWord"), v86);
                        end;
                    end;
                end);
            end;
            if v42 then
                v42:Show();
            end;
            local function v102(v100)
                if v100 then
                    if v42 then
                        v42:Hide(true);
                        v42:RemoveFocus(true);
                    end;
                    local l_v100_ContentItem_0 = v100:GetContentItem();
                    if l_v100_ContentItem_0 then
                        l_v100_ContentItem_0:Show(true);
                        if not v38:IsFocused() then
                            v38:Focus();
                        end;
                    end;
                    v42 = l_v100_ContentItem_0;
                    v89(v100);
                    if v42 then
                        v42:Focus();
                    end;
                end;
            end;
            v40 = v38.SelectedTabChanged:connect(function(v103)
                v102(v103);
                if v29() > 0 then
                    l_contentHistory_0:setLastSelectedContent(v42);
                end;
                l_Analytics_0.reportPageChanged();
                l_PageHeartbeatTimer_0.onPageChanged(v103:GetId());
            end);
            local l_v38_SelectedTab_1 = v38:GetSelectedTab();
            if l_v38_SelectedTab_1 then
                v102(l_v38_SelectedTab_1);
            end;
            return ;
        else
            return ;
        end;
    end;
    v37.Hide = function(v105)
        v41 = false;
        if not l_ScreenManager_0:ContainsScreen(v105) then
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToRobuxScreen, "AppHubListenToRobuxScreenSwitch");
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.NavigateToEquippedAvatar, "AppHubListenToAvatarScreenSwitch");
        end;
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "AppHubUnlockedUGC");
        l_Utility_0.DisconnectEvent(v40);
        v44.Visible = false;
        v44.Parent = nil;
        if v42 then
            v42:Hide();
        end;
    end;
    v37.Focus = function(_)
        v38:ConnectEvents();
        (function()
            l_ContextActionService_0:BindCoreAction("CycleTabDock", function(_, v108, v109)
                if v108 == Enum.UserInputState.End then
                    if v109.KeyCode == Enum.KeyCode.ButtonL1 then
                        local l_v38_PreviousTab_0 = v38:GetPreviousTab();
                        if l_v38_PreviousTab_0 then
                            l_Utility_0.SetSelectedCoreObject(l_v38_PreviousTab_0:GetGuiObject());
                            if v29() > 0 then
                                v38:SetSelectedTab(l_v38_PreviousTab_0, "ButtonL1");
                                return ;
                            else
                                v38:SetSelectedTab(l_v38_PreviousTab_0);
                                return ;
                            end;
                        end;
                    elseif v109.KeyCode == Enum.KeyCode.ButtonR1 then
                        local l_v38_NextTab_0 = v38:GetNextTab();
                        if l_v38_NextTab_0 then
                            l_Utility_0.SetSelectedCoreObject(l_v38_NextTab_0:GetGuiObject());
                            if v29() > 0 then
                                v38:SetSelectedTab(l_v38_NextTab_0, "ButtonR1");
                                return ;
                            else
                                v38:SetSelectedTab(l_v38_NextTab_0);
                            end;
                        end;
                    end;
                end;
            end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            local v112 = false;
            l_ContextActionService_0:BindCoreAction("CloseAppHub", function(_, v114, _)
                if v114 == Enum.UserInputState.Begin then
                    v112 = true;
                    return ;
                else
                    if not ((not (v114 == Enum.UserInputState.End) or not v112) or v38:IsFocused()) then
                        if v42 then
                            v42:RemoveFocus(true);
                        end;
                        v38:Focus();
                    end;
                    return ;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end)();
        table.insert(v39, v38.SelectedTabClicked:connect(function(v116)
            local v117 = v116 and v116:GetContentItem();
            if v117 then
                v117:Focus(v38);
            end;
        end));
        table.insert(v39, l_GuiService_0.Changed:connect(function(v118)
            if v118 == "SelectedCoreObject" then
                if not (not v38:IsFocused() or not v42) then
                    v42:RemoveFocus();
                end;
                if not ((not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v45)) or not v42) then
                    v42:Focus(v38);
                end;
            end;
            if v118 == "SelectedObject" then
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not (((((not l_SelectedCoreObject_0 or not v42) or not v42.IsFocused) or v42:IsFocused()) or not v42.IsAncestorOf) or not v42:IsAncestorOf(l_SelectedCoreObject_0)) then
                    v42:Focus(v38);
                end;
            end;
        end));
        local function v122(v120)
            v120 = l_Utility_0.SpaceNormalizeString(v120);
            if #v120 > 0 then
                local v121 = l_GameSearchScreen_0(v120);
                v121:SetParent(v44.Parent);
                l_ScreenManager_0:OpenScreen(v121);
            end;
        end;
        if v3 then
            table.insert(v39, v3.KeyboardClosed:connect(v122));
        end;
        if v38:GetSelectedTab() == nil then
            v38:SetSelectedTab(v46);
        end;
        if v42 then
            v42:Focus(v38);
        end;
        v89(v38:GetSelectedTab());
    end;
    v37.RemoveFocus = function(_)
        v38:DisconnectEvents();
        l_ContextActionService_0:UnbindCoreAction("CycleTabDock");
        l_ContextActionService_0:UnbindCoreAction("CloseAppHub");
        if v42 then
            v42:RemoveFocus();
        end;
        for v124, v125 in pairs(v39) do
            v125:disconnect();
            v39[v124] = nil;
        end;
        l_ContextActionService_0:UnbindCoreAction("OpenHintAction");
        l_ContextActionService_0:UnbindCoreAction("OpenYHintAction");
    end;
    v37.SetParent = function(_, v127)
        v43 = v127;
    end;
    return v37;
end;
