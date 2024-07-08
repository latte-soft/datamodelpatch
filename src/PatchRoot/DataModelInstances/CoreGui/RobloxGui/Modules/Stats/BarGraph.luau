local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {};
    setmetatable(v3, v1);
    v3._barFrame = Instance.new("Frame");
    v3._barFrame.Name = "PS_BarFrame";
    v3._barFrame.BackgroundTransparency = 1;
    v3._lineFrame = Instance.new("Frame");
    v3._lineFrame.Name = "PS_LineFrame";
    v3._lineFrame.BackgroundTransparency = 1;
    v3._showExtras = v2;
    v3._values = {};
    v3._bars = {};
    v3._average = 0;
    v3._target = 0;
    if v3._showExtras then
        v3:_addGraphTarget();
        v3:_addGraphAverage();
    end;
    return v3;
end;
v1.SetZIndex = function(v4, v5)
    v4._barFrame.ZIndex = v5;
    v4._lineFrame.ZIndex = v5 + 1;
    if v4._showExtras then
        v4._targetLine.ZIndex = v4._lineFrame.ZIndex;
        v4._averageLine.ZIndex = v4._lineFrame.ZIndex;
    end;
end;
v1.PlaceInParent = function(v6, v7, v8, v9)
    v6._barFrame.Position = v9;
    v6._barFrame.Size = v8;
    v6._barFrame.Parent = v7;
    v6._lineFrame.Position = v9;
    v6._lineFrame.Size = v8;
    v6._lineFrame.Parent = v7;
end;
v1.SetAxisMax = function(v10, v11)
    v10._axisMax = v11;
end;
v1.SetValues = function(v12, v13)
    v12._values = v13;
end;
v1.SetAverage = function(v14, v15)
    v14._average = v15;
end;
v1.SetTarget = function(v16, v17)
    v16._target = v17;
    v16:_moveGraphTarget();
end;
v1._updateBarCount = function(v18, v19)
    local v20 = {};
    local v21 = #v18._bars;
    for v22 = 1, v21 do
        if v22 <= v21 then
            table.insert(v20, v18._bars[v22]);
        else
            v18._bars[v22].Destroy();
        end;
    end;
    for v23 = v21 + 1, v19 do
        table.insert(v20, v18:_makeNthBar(v23));
    end;
    v18._bars = v20;
end;
v1.Render = function(v24)
    local v25 = #v24._values;
    v24:_updateBarCount(v25);
    for v26, v27 in ipairs(v24._values) do
        v24:_updateBar(v26, v27, v25);
    end;
    if v24._showExtras then
        v24:_moveGraphAverage();
    end;
end;
v1._addGraphTarget = function(v28)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "TargetLine";
    l_ImageLabel_0.Size = UDim2.new(1, 0, 0, v0.GraphTargetLineInnerThickness);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/PerformanceStats/TargetLine.png";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = v28._lineFrame;
    l_ImageLabel_0.ZIndex = v28._lineFrame.ZIndex;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Changed:connect(function()
        v28:_updateTargetLineImageSize();
    end);
    v28._targetLine = l_ImageLabel_0;
    v28:_updateTargetLineImageSize();
end;
v1._updateTargetLineImageSize = function(v30)
    v30._targetLine.ImageRectSize = v30._targetLine.AbsoluteSize;
end;
v1._addGraphAverage = function(v31)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "AverageLine";
    l_Frame_0.Size = UDim2.new(1, 0, 0, v0.GraphAverageLineInnerThickness);
    l_Frame_0.Parent = v31._lineFrame;
    l_Frame_0.ZIndex = v31._lineFrame.ZIndex;
    v0.StyleAverageLine(l_Frame_0);
    v31._averageLine = l_Frame_0;
end;
v1._moveGraphTarget = function(v33)
    if v33._targetLine == nil then
        return ;
    else
        v33._targetLine.Position = UDim2.new(0, 0, (v33._axisMax - v33._target) / v33._axisMax, -v0.GraphTargetLineInnerThickness / 2);
        return ;
    end;
end;
v1._moveGraphAverage = function(v34)
    if v34._averageLine == nil then
        return ;
    else
        v34._averageLine.Position = UDim2.new(0, 0, (v34._axisMax - math.min(v34._average, v34._axisMax)) / v34._axisMax, -v0.GraphAverageLineTotalThickness / 2);
        return ;
    end;
end;
v1._makeNthBar = function(v35, v36)
    local v37 = v36 - 1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = string.format("Bar_%d", v37);
    l_Frame_1.Parent = v35._barFrame;
    l_Frame_1.ZIndex = v35._barFrame.ZIndex;
    l_Frame_1.BorderSizePixel = 0;
    return l_Frame_1;
end;
v1._updateBar = function(v39, v40, v41, v42)
    local v43 = v39._bars[v40];
    local v44 = v40 - 1;
    local v45 = math.max(0, (math.min(v41, v39._axisMax)));
    v43.Position = UDim2.new(v44 / v42, 0, (v39._axisMax - v45) / v39._axisMax, 0);
    v43.Size = UDim2.new(1 / v42, 0, v45 / v39._axisMax, 0);
    v43.BackgroundColor3 = v0.GetColorForValue(v41, v39._target);
end;
return v1;
