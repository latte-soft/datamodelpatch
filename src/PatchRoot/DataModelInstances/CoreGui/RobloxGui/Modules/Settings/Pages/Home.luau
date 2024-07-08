local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v4 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v5 = nil;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v9 = l_status_0 and l_result_0;
v5 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.TabHeader.Name = "HomeTab";
    if not v4.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png";
        l_NewPage_0.TabHeader.Icon.Size = UDim2.new(0, 32, 0, 30);
        l_NewPage_0.TabHeader.Icon.Position = UDim2.new(0, 5, 0.5, -15);
        if not v9 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "Home";
        else
            l_NewPage_0.TabHeader.Title.Text = "Home";
        end;
    else
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png";
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Home";
    end;
    l_NewPage_0.TabHeader.Size = UDim2.new(0, 100, 1, 0);
    l_NewPage_0.Page.Name = "Home";
    l_NewPage_0.ResumeButton = v3:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0, 200, 0, 50), function()
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource
        });
    end);
    l_NewPage_0.ResumeButton.Position = UDim2.new(0.5, -100, 0, 20);
    l_NewPage_0.ResumeButton.Parent = l_NewPage_0.Page;
    local v11 = v3:MakeStyledButton("ResetButton", "Reset Character", UDim2.new(0, 200, 0, 50), function()
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end);
    v11.Position = UDim2.new(0.5, -100, 0, (l_NewPage_0.ResumeButton.AbsolutePosition.Y + l_NewPage_0.ResumeButton.AbsoluteSize.Y) + 10);
    v11.Parent = l_NewPage_0.Page;
    local v12 = v3:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0, 200, 0, 50), function()
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
    end);
    v12.Position = UDim2.new(0.5, -100, 0, (v11.AbsolutePosition.Y + v11.AbsoluteSize.Y) + 10);
    v12.Parent = l_NewPage_0.Page;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v12.AbsolutePosition.Y + v12.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v5.Displayed.Event:connect(function()
    if v3:UsesSelectedObject() then
        l_GuiService_0.SelectedCoreObject = v5.ResumeButton;
        return ;
    else
        return ;
    end;
end);
return v5;
