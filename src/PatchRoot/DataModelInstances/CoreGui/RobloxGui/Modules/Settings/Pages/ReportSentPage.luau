local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local v4 = require(l_Modules_0.BlockingUtility);
local v5 = require(l_Modules_0.Settings.SettingsPageFactory);
local v6 = require(l_Modules_0.RobloxTranslator);
local v7 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated);
local v8 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics);
local v9 = require(l_Modules_0.Settings.Utility);
local v10 = require(l_Modules_0.Settings.Theme);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v12 = v8.new(l_LocalPlayer_0.UserId, {
    EventStream = l_RbxAnalyticsService_0
});
local v13 = v10.textSize(36);
local v14 = v10.textSize(24);
local v15 = v10.textSize(16);
local v36 = (function()
    local l_v5_NewPage_0 = v5:CreateNewPage();
    l_v5_NewPage_0.TabHeader = nil;
    l_v5_NewPage_0.PageListLayout.Parent = nil;
    l_v5_NewPage_0.ShouldShowBottomBar = false;
    l_v5_NewPage_0.ShouldShowHubBar = false;
    l_v5_NewPage_0.IsPageClipped = false;
    l_v5_NewPage_0.Page.Name = "ReportSentPage";
    l_v5_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_v5_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_v5_NewPage_0.Root = v9:Create("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Name = "ReportSentContents", 
        Parent = l_v5_NewPage_0.Page
    });
    l_v5_NewPage_0.RootLayout = v9:Create("UIListLayout")({
        Name = "RootLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = l_v5_NewPage_0.Root
    });
    local function v21(v17, v18, v19, v20)
        return v9:Create("TextLabel")({
            Name = v17, 
            LayoutOrder = v20, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v18, 
            TextSize = v19, 
            Font = v10.font(Enum.Font.SourceSansBold, "Bold"), 
            TextWrap = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Parent = l_v5_NewPage_0.Root
        });
    end;
    local function _(v22, v23, v24, v25)
        local v26, v27 = v9:MakeStyledButton(v22, v23, UDim2.new(1, 0, 0, 50), v25);
        v26.LayoutOrder = v24;
        v26.Parent = l_v5_NewPage_0.Root;
        return v26, v27;
    end;
    local function v31(v29, v30)
        return v9:Create("Frame")({
            LayoutOrder = v30, 
            Name = "Spacer" .. tostring(v30), 
            Size = UDim2.fromOffset(0, v29), 
            Parent = l_v5_NewPage_0.Root
        });
    end;
    l_v5_NewPage_0.TitleLabel = v21("TitleLabel", v6:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), v13, 0);
    l_v5_NewPage_0.BodyLabel = v21("BodyLabel", v6:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), v14, 1);
    l_v5_NewPage_0.TopSpacer = v31(10, 2);
    l_v5_NewPage_0.ActionHeader = v21("ActionHeader", v6:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), v15, 3);
    l_v5_NewPage_0.ActionHeader.TextXAlignment = Enum.TextXAlignment.Left;
    local v32, v33 = v9:MakeStyledButton("BlockButton", v6:FormatByKey("Feature.SettingsHub.Action.Block"), UDim2.new(1, 0, 0, 50), function()
        l_v5_NewPage_0:HandleBlock();
    end);
    v32.LayoutOrder = 4;
    v32.Parent = l_v5_NewPage_0.Root;
    local l_v32_0 = v32;
    local l_v33_0 = v33;
    l_v5_NewPage_0.BlockButton = l_v32_0;
    l_v5_NewPage_0.BlockLabel = l_v33_0;
    l_v5_NewPage_0.MiddleSpacer = v31(20, 6);
    v32, v33 = v9:MakeStyledButton("DoneButton", v6:FormatByKey("Feature.SettingsHub.Action.Report.Done"), UDim2.new(1, 0, 0, 50), function()
        l_v5_NewPage_0:HandleDone();
    end);
    v32.LayoutOrder = 7;
    v32.Parent = l_v5_NewPage_0.Root;
    l_v5_NewPage_0.DoneButton = v32;
    return l_v5_NewPage_0;
end)();
v36.UpdateActions = function(v37)
    if not v37.ReportedPlayer then
        v37.TopSpacer.Visible = false;
        v37.ActionHeader.Visible = false;
        v37.BlockButton.Visible = false;
        return ;
    else
        v37.TopSpacer.Visible = true;
        v37.ActionHeader.Visible = true;
        v37.BlockButton.Visible = not v4:IsPlayerBlockedByUserId(v37.ReportedPlayer.UserId);
        v37.BlockLabel.Text = v6:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
            DISPLAY_NAME = v37.ReportedPlayer.DisplayName, 
            RBX_NAME = v37.ReportedPlayer.Name
        });
        return ;
    end;
end;
v36.ShowReportedPlayer = function(v38, v39)
    v38.ReportedPlayer = v39;
    v38:UpdateActions();
    v38.HubRef:SwitchToPage(v36, true);
end;
v36.HandleBlock = function(v40)
    if v40.ReportedPlayer then
        v7(v40.ReportedPlayer, v12);
    end;
    v40:HandleDone();
end;
v36.HandleDone = function(v41)
    v41.HubRef:SetVisibility(false, true);
end;
return v36;
