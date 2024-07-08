local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_AbuseReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.AbuseReportMenu).AbuseReportMenu;
local l_ReportAbuseAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AbuseReportMenu).ReportAbuseAnalytics;
local v7 = require(l_RobloxGui_0.Modules.Chrome.Flags.GetFFlagOpenControlsOnMenuOpen);
local v8 = nil;
local v9 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v12 = l_status_0 and l_result_0;
v8 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0._onHiddenCallback = function()
    end;
    l_NewPage_0._onDisplayedCallback = function()
    end;
    l_NewPage_0._onSettingsHiddenCallback = function()
    end;
    l_NewPage_0._setNextPlayerToReportCallback = function()
    end;
    l_NewPage_0._onMenuWidthChange = function()
    end;
    l_NewPage_0.SetHub = function(_, v15)
        l_NewPage_0.HubRef = v15;
        l_NewPage_0.HubRef.SettingsShowSignal:connect(function(v16)
            if not v16 then
                l_NewPage_0:onSettingsHidden();
            end;
        end);
        return l_NewPage_0;
    end;
    l_NewPage_0.showAlert = function(_, v18, v19, v20)
        v4:ShowAlert(v18, v19, l_NewPage_0.HubRef, v20);
    end;
    l_NewPage_0.showReportSentPage = function(_, v22)
        l_NewPage_0.HubRef.ReportSentPageV2:ShowReportedPlayer(v22, true);
    end;
    l_NewPage_0.HideMenu = function(_, v24)
        if not v7() then
            l_NewPage_0.HubRef:SetVisibility(false, true);
            return ;
        else
            l_NewPage_0.HubRef:SetVisibility(false, true, nil, nil, nil, v24);
            return ;
        end;
    end;
    l_NewPage_0.ShowMenu = function(_)
        l_NewPage_0.HubRef:SetVisibility(true, true, l_NewPage_0, nil, "ScreenshotUnhide");
    end;
    l_NewPage_0.onHidden = function(_)
        l_NewPage_0._onHiddenCallback();
    end;
    l_NewPage_0.onSettingsHidden = function(_)
        l_NewPage_0._onSettingsHiddenCallback();
    end;
    l_NewPage_0.onDisplayed = function(_)
        l_NewPage_0._onDisplayedCallback();
    end;
    l_NewPage_0.setNextPlayerToReport = function(_, v30)
        l_NewPage_0._setNextPlayerToReportCallback(v30);
    end;
    l_NewPage_0.TabHeader.Name = "ReportAbuseTab";
    if not v9.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/ReportAbuseTab.png";
        if not v12 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "Report";
        else
            l_NewPage_0.TabHeader.Title.Text = "Report";
        end;
    else
        local v31 = v9.Images["icons/actions/feedback"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v31.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v31.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v31.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Report";
    end;
    l_NewPage_0.Page.Name = "ReportAbuseMenuNewContainerPage";
    l_NewPage_0.ShouldShowBottomBar = true;
    l_NewPage_0.ShouldShowHubBar = true;
    v3.mount(v3.createElement(l_AbuseReportMenu_0, {
        hideReportTab = function()
            if not v7() then
                l_NewPage_0:HideMenu();
                return ;
            else
                l_NewPage_0:HideMenu(true);
                return ;
            end;
        end, 
        showReportTab = function()
            l_NewPage_0:ShowMenu();
        end, 
        registerOnReportTabHidden = function(v32)
            l_NewPage_0._onHiddenCallback = v32;
        end, 
        registerOnReportTabDisplayed = function(v33)
            l_NewPage_0._onDisplayedCallback = v33;
        end, 
        registerOnMenuWidthChange = function(v34)
            l_NewPage_0._onMenuWidthChange = v34;
        end, 
        registerSetNextPlayerToReport = function(v35)
            l_NewPage_0._setNextPlayerToReportCallback = v35;
        end, 
        registerOnSettingsHidden = function(v36)
            l_NewPage_0._onSettingsHiddenCallback = v36;
        end, 
        showReportSentPage = function(v37)
            l_NewPage_0:showReportSentPage(v37);
        end, 
        onReportComplete = function(v38)
            l_NewPage_0:showAlert(v38, "Ok", function()
                l_NewPage_0:HideMenu();
            end);
        end
    }), l_NewPage_0.Page, "AbuseReportMenu");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        l_NewPage_0._onMenuWidthChange(l_NewPage_0.Page.AbsoluteSize.X);
    end);
    return l_NewPage_0;
end)();
v8.Displayed.Event:connect(function()
    v8:onDisplayed();
end);
v8.Hidden.Event:connect(function()
    v8:onHidden();
end);
v8.ReportPlayer = function(_, v40, v41)
    if v40 then
        l_ReportAbuseAnalytics_0:startAbuseReportSession(v41);
        v8:setNextPlayerToReport(v40);
        if v8.HubRef:GetVisibility() then
            v8.HubRef:SwitchToPage(v8, false, nil, nil, nil, {
                entrypoint = l_ReportAbuseAnalytics_0:getAbuseReportSessionEntryPoint()
            });
        else
            v8.HubRef:SetVisibility(true, false, v8);
            return ;
        end;
    end;
end;
return v8;
