local l_Players_0 = game:GetService("Players");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregatorManager);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsButton);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsViewer);
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "PerformanceStats";
local v9 = v4.getSingleton();
local v10 = v7.new();
local v11 = {};
local v12 = nil;
local v13 = nil;
for _, v15 in ipairs(v6.AllStatTypes) do
    v11[v15] = v5.new(v15);
end;
ShowMasterFrame = function()
    l_Frame_0.Visible = true;
    l_Frame_0.Parent = l_CoreGui_0.RobloxGui;
end;
HideMasterFrame = function()
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = nil;
end;
ConfigureMasterFrame = function()
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.Selectable = false;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Active = false;
    l_Frame_0.ZIndex = 0;
    HideMasterFrame();
end;
ConfigureStatButtonsInMasterFrame = function()
    for v16, v17 in ipairs(v6.AllStatTypes) do
        AddButton(v17, v16);
    end;
end;
OnButtonToggled = function(v18)
    if v11[v18]._isSelected then
        v12 = nil;
    else
        v12 = v18;
    end;
    UpdateButtonSelectedStates();
    UpdateViewerVisibility();
end;
UpdateButtonSelectedStates = function()
    for _, v20 in ipairs(v6.AllStatTypes) do
        v11[v20]:SetIsSelected(v20 == v12);
    end;
end;
UpdateViewerVisibility = function()
    if v12 == nil then
        if v10:GetIsVisible() then
            v10:SetVisible(false);
            v10:SetStatsAggregator(nil);
            return ;
        end;
    else
        local v21 = false;
        if not v10:GetIsVisible() then
            v21 = true;
            v10:SetVisible(true);
        end;
        if v12 ~= v10:GetStatType() then
            v10:SetStatType(v12);
            v10:SetStatsAggregator(v9:GetAggregator(v12));
            v21 = true;
        end;
        if v21 then
            l_RbxAnalyticsService_0:TrackEvent("Game", "Enlarge PerfStat", v12, 0);
        end;
    end;
end;
AddButton = function(v22, v23)
    local v24 = v11[v22];
    v24:SetParent(l_Frame_0);
    v24:SetStatsAggregator(v9:GetAggregator(v22));
    local v25 = 1 / v6.NumButtonTypes;
    v24:SetSizeAndPosition(UDim2.new(v25, 0, 0, v6.ButtonHeight), (UDim2.new(v25 * (v23 - 1), 0, 0, 0)));
    v24:SetToggleCallbackFunction(OnButtonToggled);
end;
ConfigureStatViewerInMasterFrame = function()
    v10:SetParent(l_Frame_0);
    v10:SetSizeAndPosition(UDim2.new(0, v6.ViewerWidth, 0, v6.ViewerHeight), (UDim2.new(1, -v6.ViewerWidth, 0, v6.ButtonHeight + v6.ViewerTopMargin)));
end;
UpdatePerformanceStatsVisibility = function()
    local v26 = v6.PerformanceStatsShouldBeVisible();
    if v26 == l_Frame_0.Visible then
        return ;
    else
        if not v26 then
            HideMasterFrame();
        else
            ShowMasterFrame();
        end;
        v10:OnPerformanceStatsShouldBeVisibleChanged();
        for _, v28 in ipairs(v6.AllStatTypes) do
            v11[v28]:OnPerformanceStatsShouldBeVisibleChanged();
        end;
        local v29 = "Hide PerfStats";
        if v26 then
            v29 = "Show PerfStats";
        end;
        l_RbxAnalyticsService_0:TrackEvent("Game", v29, "", 0);
        if not v26 then
            if v13 then
                l_RbxAnalyticsService_0:ReportStats("TimeOpenPerformanceProfiler", time() - v13);
            end;
            return ;
        else
            v13 = time();
            l_RbxAnalyticsService_0:ReportCounter("OpenPerformanceProfiler", 1);
            return ;
        end;
    end;
end;
ConfigureMasterFrame();
ConfigureStatButtonsInMasterFrame();
ConfigureStatViewerInMasterFrame();
l_GameSettings_0.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility);
UpdateButtonSelectedStates();
UpdateViewerVisibility();
UpdatePerformanceStatsVisibility();
spawn(function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0.PlayerAdded:wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    UpdatePerformanceStatsVisibility();
end);
