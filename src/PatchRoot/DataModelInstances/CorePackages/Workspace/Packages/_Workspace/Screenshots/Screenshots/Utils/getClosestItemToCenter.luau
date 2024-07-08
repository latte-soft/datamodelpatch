return function(v0, v1)
    local l_AbsoluteSize_0 = v1.AbsoluteSize;
    local l_CanvasPosition_0 = v1.CanvasPosition;
    local v4 = math.floor((l_CanvasPosition_0.X + l_AbsoluteSize_0.X / 2) / v0.X) + 1;
    return v4, (math.abs(l_CanvasPosition_0.X - (v4 - 1) * v0.X));
end;
