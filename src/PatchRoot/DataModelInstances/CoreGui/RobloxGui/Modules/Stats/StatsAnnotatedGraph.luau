local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.BarGraph);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    local v6 = {};
    setmetatable(v6, v3);
    v6._statType = v4;
    v6._statMaxName = v1.StatMaxNames[v4];
    v6._isMaximized = v5;
    v6._values = {};
    v6._average = 0;
    v6._target = 0;
    v6._axisMax = 0;
    v6._frame = Instance.new("Frame");
    v6._frame.Name = "PS_AnnotatedGraph";
    v6._frame.BackgroundTransparency = 1;
    v6._frame.ZIndex = v1.GraphZIndex;
    v6._topLabel = Instance.new("TextLabel");
    v6._topLabel.Name = "PS_TopAxisLabel";
    v6._topLabel.Parent = v6._frame;
    v6._topLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v6._topLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v6._topLabel.FontSize = v1.PanelGraphFontSize;
    v6._bottomLabel = Instance.new("TextLabel");
    v6._bottomLabel.Name = "PS_BottomAxisLabel";
    v6._bottomLabel.Parent = v6._frame;
    v6._bottomLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v6._bottomLabel.TextYAlignment = Enum.TextYAlignment.Bottom;
    v6._bottomLabel.FontSize = v1.PanelGraphFontSize;
    v6._graph = v2.new(v5);
    v1.StyleTextWidget(v6._topLabel);
    v1.StyleTextWidget(v6._bottomLabel);
    v6:_layoutElements();
    return v6;
end;
v3.SetZIndex = function(v7, v8)
    v7._frame.ZIndex = v8;
    v7._topLabel.ZIndex = v8;
    v7._bottomLabel.ZIndex = v8;
    v7._graph:SetZIndex(v8);
end;
v3._layoutElements = function(v9)
    local v10 = nil;
    if not v9._isMaximized then
        v10 = 0;
        v9._topLabel.Visible = false;
        v9._bottomLabel.Visible = false;
    else
        v10 = 30;
        v9._topLabel.Visible = true;
        v9._bottomLabel.Visible = true;
    end;
    local v11 = UDim2.new(0, 10, 0, 10);
    local v12 = UDim2.new(1, -(20 + v10), 1, -20);
    local v13 = UDim2.new(1, -(10 + v10), 0, 10);
    local v14 = UDim2.new(0, v10, 0.333, -20);
    local v15 = UDim2.new(1, -(10 + v10), 0.666, 10);
    local v16 = UDim2.new(0, v10, 0.333, -20);
    v9._topLabel.Size = v14;
    v9._topLabel.Position = v13;
    v9._bottomLabel.Size = v16;
    v9._bottomLabel.Position = v15;
    v9._graph:PlaceInParent(v9._frame, v12, v11);
end;
v3.PlaceInParent = function(v17, v18, v19, v20)
    v17._frame.Position = v20;
    v17._frame.Size = v19;
    v17._frame.Parent = v18;
end;
v3._getTarget = function(v21)
    if v21._performanceStats == nil then
        return 0;
    else
        local l_FirstChild_0 = v21._performanceStats:FindFirstChild(v21._statMaxName);
        if l_FirstChild_0 == nil then
            return 0;
        else
            return l_FirstChild_0:GetValue();
        end;
    end;
end;
v3._render = function(v23)
    v23._graph:SetAxisMax(v23._axisMax);
    v23._graph:SetValues(v23._values);
    v23._graph:SetAverage(v23._average);
    v23._graph:SetTarget(v23._target);
    v23._graph:Render();
    v23._topLabel.Text = string.format("%.2f", v23._axisMax);
    v23._bottomLabel.Text = string.format("%.2f", 0);
end;
v3._calculateAxisMax = function(v24)
    local v25 = v24._target * 2;
    local v26 = v24:_recursiveGetOrderOfMagnitude(1, v25);
    v24._axisMax = math.floor(0.5 + v25 / v26) * v26;
end;
v3.SetStatsAggregator = function(v27, v28)
    if v27._aggregator then
        v27._aggregator:RemoveListener(v27._listenerId);
        v27._listenerId = nil;
        v27._aggregator = nil;
    end;
    v27._aggregator = v28;
    v27:_refreshVisibility();
end;
v3._stopListening = function(v29)
    if v29._aggregator == nil then
        return ;
    elseif v29._listenerId == nil then
        return ;
    else
        v29._aggregator:RemoveListener(v29._listenerId);
        v29._listenerId = nil;
        return ;
    end;
end;
v3._startListening = function(v30)
    if v30._aggregator == nil then
        return ;
    elseif v30._listenerId ~= nil then
        return ;
    else
        v30._listenerId = v30._aggregator:AddListener(function()
            v30:_updateValuesAndRender();
        end);
        return ;
    end;
end;
v3._shouldBeVisible = function(v31)
    if not v1.PerformanceStatsShouldBeVisible() then
        return false;
    else
        return v31._frame.Visible;
    end;
end;
v3.SetVisible = function(v32, v33)
    v32._frame.Visible = v33;
    v32:_refreshVisibility();
end;
v3._refreshVisibility = function(v34)
    if not v34:_shouldBeVisible() then
        v34:_stopListening();
        return ;
    else
        v34:_startListening();
        v34:_updateValuesAndRender();
        return ;
    end;
end;
v3.OnPerformanceStatsShouldBeVisibleChanged = function(v35)
    v35:_refreshVisibility();
end;
v3._recursiveGetOrderOfMagnitude = function(v36, v37, v38)
    if v38 < v37 then
        return v36:_recursiveGetOrderOfMagnitude(v37 / 10, v38);
    elseif v38 <= v37 * 10 then
        return v37;
    else
        return v36:_recursiveGetOrderOfMagnitude(v37 * 10, v38);
    end;
end;
v3._updateValuesAndRender = function(v39)
    v39._values = {};
    v39._average = 0;
    v39._target = 0;
    if v39._aggregator ~= nil then
        v39._values = v39._aggregator:GetValues();
        v39._average = v39._aggregator:GetAverage();
        v39._target = v39._aggregator:GetTarget();
    end;
    v39:_calculateAxisMax();
    v39:_render();
end;
return v3;
