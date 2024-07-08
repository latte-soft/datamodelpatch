local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.StyleWidgets);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsMiniTextPanel);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAnnotatedGraph);
local v5 = UDim2.new(0, 0, 0, 0);
local v6 = UDim2.new(0.5, 0, 1, -v1.TabSelectionHeight);
local v7 = UDim2.new(0.5, 0, 0, 0);
local v8 = UDim2.new(0.5, 0, 1, -v1.TabSelectionHeight);
local v9 = {};
v9.__index = v9;
v9.new = function(v10)
    local v11 = {};
    setmetatable(v11, v9);
    v11._statType = v10;
    v11._button = Instance.new("TextButton");
    v11._button.Name = "PS_Button";
    v11._button.Text = "";
    v2.StyleButton(v11._button);
    v11._textPanel = v3.new(v10);
    v11._textPanel:PlaceInParent(v11._button, v6, v5);
    v11._graph = v4.new(v10, false);
    v11._graph:PlaceInParent(v11._button, v8, v7);
    v11._textPanel:SetZIndex(v2.TextZIndex);
    v11._graph:SetZIndex(v2.GraphZIndex);
    v11._tabSelection = v1.MakeTabSelectionWidget(v11._button);
    v11._isSelected = false;
    v11:_updateTabSelectionState();
    return v11;
end;
v9.OnPerformanceStatsShouldBeVisibleChanged = function(v12)
    if v12._graph then
        v12._graph:OnPerformanceStatsShouldBeVisibleChanged();
    end;
    if v12._textPanel then
        v12._textPanel:OnPerformanceStatsShouldBeVisibleChanged();
    end;
end;
v9.SetToggleCallbackFunction = function(v13, v14)
    v13._button.MouseButton1Click:connect(function()
        v14(v13._statType);
    end);
end;
v9.SetSizeAndPosition = function(v15, v16, v17)
    v15._button.Size = v16;
    v15._button.Position = v17;
end;
v9.SetIsSelected = function(v18, v19)
    v18._isSelected = v19;
    v18:_updateTabSelectionState();
end;
v9._updateTabSelectionState = function(v20)
    v20._tabSelection.Visible = v20._isSelected;
end;
v9.SetParent = function(v21, v22)
    v21._button.Parent = v22;
end;
v9.SetStatsAggregator = function(v23, v24)
    v23._textPanel:SetStatsAggregator(v24);
    v23._graph:SetStatsAggregator(v24);
end;
return v9;
