local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsTextPanel);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAnnotatedGraph);
local v4 = UDim2.new(0, 0, 0, 0);
local v5 = UDim2.new(0.4, 0, 1, 0);
local v6 = UDim2.new(0.4, 0, 0, 0);
local v7 = UDim2.new(0.6, 0, 1, 0);
local v8 = {};
v8.__index = v8;
v8.new = function()
    local v9 = {};
    setmetatable(v9, v8);
    v9._frameImageLabel = Instance.new("ImageLabel");
    v9._frameImageLabel.Name = "PS_Viewer";
    v9._frameImageLabel.Image = "rbxasset://textures/ui/PerformanceStats/BackgroundRounded.png";
    v9._frameImageLabel.ScaleType = Enum.ScaleType.Slice;
    v9._frameImageLabel.SliceCenter = Rect.new(10, 10, 22, 22);
    v9._frameImageLabel.BackgroundTransparency = 1;
    v9._frameImageLabel.ImageColor3 = v1.NormalColor;
    v9._frameImageLabel.ImageTransparency = v1.Transparency;
    v9._textPanel = nil;
    v9._statType = nil;
    v9._graph = nil;
    return v9;
end;
v8.OnPerformanceStatsShouldBeVisibleChanged = function(v10)
    if v10._graph then
        v10._graph:OnPerformanceStatsShouldBeVisibleChanged();
    end;
    if v10._textPanel then
        v10._textPanel:OnPerformanceStatsShouldBeVisibleChanged();
    end;
    if v10._textPanel then
        v10._textPanel:OnVisibilityChanged();
    end;
end;
v8.GetIsVisible = function(v11)
    return v11._frameImageLabel.Visible;
end;
v8.GetStatType = function(v12)
    return v12._statType;
end;
v8.SetSizeAndPosition = function(v13, v14, v15)
    v13._frameImageLabel.Size = v14;
    v13._frameImageLabel.Position = v15;
end;
v8.SetParent = function(v16, v17)
    v16._frameImageLabel.Parent = v17;
end;
v8.SetVisible = function(v18, v19)
    v18._frameImageLabel.Visible = v19;
    if v18._graph then
        v18._graph:SetVisible(v19);
    end;
    if v18._textPanel then
        v18._textPanel:SetVisible(v19);
    end;
end;
v8.SetStatType = function(v20, v21)
    v20._statType = v21;
    v20._frameImageLabel:ClearAllChildren();
    if v20._textPanel then
        v20._textPanel:SetVisible(false);
        v20._textPanel = nil;
    end;
    v20._textPanel = v2.new(v21);
    v20._textPanel:PlaceInParent(v20._frameImageLabel, v5, v4);
    v20._graph = v3.new(v21, true);
    v20._graph:PlaceInParent(v20._frameImageLabel, v7, v6);
    v20._textPanel:SetZIndex(v1.TextZIndex);
    v20._graph:SetZIndex(v1.GraphZIndex);
    v20._graph:SetVisible(v20._frameImageLabel.Visible);
    v20._textPanel:SetVisible(v20._frameImageLabel.Visible);
    v20:_applyStatsAggregator();
end;
v8._applyStatsAggregator = function(v22)
    if v22._aggregator == nil then
        return ;
    else
        if v22._textPanel then
            v22._textPanel:SetStatsAggregator(v22._aggregator);
        end;
        if v22._graph then
            v22._graph:SetStatsAggregator(v22._aggregator);
        end;
        return ;
    end;
end;
v8.SetStatsAggregator = function(v23, v24)
    v23._aggregator = v24;
    v23:_applyStatsAggregator();
end;
return v8;
