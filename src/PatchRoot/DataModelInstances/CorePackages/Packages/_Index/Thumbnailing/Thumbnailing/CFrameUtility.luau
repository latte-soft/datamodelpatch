local v5 = {
    CalculateTargetCFrame = function(v0)
        local v1 = nil;
        v1 = if math.abs(v0.LookVector.Y) > 0.9 then v0.UpVector else v0.LookVector;
        return CFrame.lookAt(v0.Position, v0.Position + Vector3.new(v1.X, 0, v1.Z).Unit);
    end, 
    AdjustTargetCFrameWithExtents = function(v2, v3, v4)
        return v2 + (v2 - v2.Position) * ((v3 + v4) / 2);
    end
};
v5.CalculateTargetCFrameWithExtents = function(v6, v7, v8)
    return v5.AdjustTargetCFrameWithExtents(v5.CalculateTargetCFrame(v6), v7, v8);
end;
return v5;
