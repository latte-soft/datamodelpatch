local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v4 = require(l_Modules_0.RobloxTranslator);
local v5 = require(l_Modules_0.Settings.SettingsPageFactory);
local v6 = require(l_Modules_0.Settings.Theme);
local v7 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v8 = nil;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
v8 = l_status_0 and l_result_0;
l_status_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
l_result_0 = v5:CreateNewPage();
l_result_0.TabHeader.Name = "CapturesTab";
if not v6.UIBloxThemeEnabled then
    l_result_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/CaptureTab.png";
    if not v8 then
        l_result_0.TabHeader.Icon.Title.AutoLocalize = false;
        l_result_0.TabHeader.Icon.Title.Text = v4:FormatByKey("Feature.SettingsHub.Label.Captures");
    else
        l_result_0.TabHeader.Title.AutoLocalize = false;
        l_result_0.TabHeader.Title.Text = v4:FormatByKey("Feature.SettingsHub.Label.Captures");
    end;
else
    local v11 = if not not l_status_0() and v7 then v6.Images["icons/controls/cameraOff"] else v6.Images["icons/controls/screenshot"];
    l_result_0.TabHeader.TabLabel.Icon.Image = v11.Image;
    l_result_0.TabHeader.TabLabel.Icon.ImageRectOffset = v11.ImageRectOffset;
    l_result_0.TabHeader.TabLabel.Icon.ImageRectSize = v11.ImageRectSize;
    l_result_0.TabHeader.TabLabel.Title.AutoLocalize = false;
    l_result_0.TabHeader.TabLabel.Title.Text = v4:FormatByKey("Feature.SettingsHub.Label.Captures");
end;
l_result_0.PageListLayout.Parent = nil;
l_result_0.ShouldShowBottomBar = true;
l_result_0.ShouldShowHubBar = true;
l_result_0.Page.Name = "Captures";
l_result_0.Page.Size = UDim2.fromScale(1, 0);
local l_UIPadding_0 = l_result_0.Page:FindFirstChildWhichIsA("UIPadding");
if l_UIPadding_0 then
    l_UIPadding_0:Destroy();
end;
l_result_0.ConnectHubToApp = function(_, v14, v15, v16)
    l_result_0:SetHub(v14);
    local v17 = v15.AbsoluteSize.Y - 20;
    l_result_0.Page.Size = UDim2.new(1, 0, 0, v17);
    v15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        v17 = v15.AbsoluteSize.Y - 20;
        l_result_0.Page.Size = UDim2.new(1, 0, 0, v17);
    end);
    local l_Display_0 = l_result_0.Display;
    l_result_0.Display = function(_, ...)
        v16.openMenu();
        l_Display_0(l_result_0, ...);
    end;
    l_result_0.Hidden.Event:Connect(function()
        v16.closeMenu();
    end);
end;
return l_result_0;
