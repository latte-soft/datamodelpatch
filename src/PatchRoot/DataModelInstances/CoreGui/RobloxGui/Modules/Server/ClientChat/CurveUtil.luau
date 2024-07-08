local v0 = {};
v0.Expt = function(_, v2, v3, v4, v5)
    if math.abs(v3 - v2) < 0.01 then
        return v3;
    else
        return v2 + (v3 - v2) * v0:Expty(v2, v3, v4, v5);
    end;
end;
v0.Expty = function(_, _, _, v9, v10)
    return 1 - math.exp(- -math.log(1 - v9) * v10);
end;
v0.Sign = function(_, v12)
    if v12 > 0 then
        return 1;
    elseif v12 < 0 then
        return -1;
    else
        return 0;
    end;
end;
v0.BezierValForT = function(_, v14, v15, v16, v17, v18)
    return (((((1 - v18) * (1 - v18)) * (1 - v18)) * v14 + (((3 * v18) * (1 - v18)) * (1 - v18)) * v15) + (((3 * v18) * v18) * (1 - v18)) * v16) + ((v18 * v18) * v18) * v17;
end;
v0._BezierPt2ForT = {
    x = 0, 
    y = 0
};
v0.BezierPt2ForT = function(_, v20, v21, v22, v23, v24, v25, v26, v27, v28)
    v0._BezierPt2ForT.x = v0:BezierValForT(v20, v22, v24, v26, v28);
    v0._BezierPt2ForT.y = v0:BezierValForT(v21, v23, v25, v27, v28);
    return v0._BezierPt2ForT;
end;
v0.YForPointOf2PtLine = function(_, v30, v31, v32)
    local v33 = (v30.y - v31.y) / (v30.x - v31.x);
    return v33 * v32 + (v30.y - v33 * v30.x);
end;
v0.DeltaTimeToTimescale = function(_, v35)
    return v35 / 0.016666666666666666;
end;
v0.SecondsToTick = function(_, v37)
    return 0.016666666666666666 / v37;
end;
v0.ExptValueInSeconds = function(_, v39, v40, v41)
    return 1 - math.pow(v39 / v40, 1 / (60 * v41));
end;
v0.NormalizedDefaultExptValueInSeconds = function(v42, v43)
    return v42:ExptValueInSeconds(0.01, 1, v43);
end;
return v0;
