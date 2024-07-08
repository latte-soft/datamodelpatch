local v0 = require(script:FindFirstAncestor("SceneManagement").Parent.React);
getCameraFacingCFrame = function(v1, v2)
    return CFrame.lookAt(v2.Position + v1 * v2.LookVector, v2.Position, v2.UpVector);
end;
getDimensionsToFillViewPort = function(v3, v4)
    local v5 = if v4.ViewportSize.Y > 0 then v4.ViewportSize.X / v4.ViewportSize.Y else 0;
    local v6 = (2 * v3) * math.tan((math.rad(v4.FieldOfView / 2)));
    return Vector2.new(v6 * v5, v6);
end;
return function(v7)
    local v8, v9 = v0.useState(workspace.CurrentCamera);
    local v10, v11 = v0.useBinding(Vector2.new());
    local v12, v13 = v0.useBinding(CFrame.new());
    local function _(v14)
        v11(getDimensionsToFillViewPort(v7, v14));
        v13(getCameraFacingCFrame(v7, v14.CFrame));
    end;
    local function v21(v16)
        local v17 = {};
        for _, v19 in {
            "CFrame", 
            "ViewportSize", 
            "FieldOfView"
        }, nil, nil do
            table.insert(v17, v16:GetPropertyChangedSignal(v19):Connect(function()
                local l_v16_0 = v16;
                v11(getDimensionsToFillViewPort(v7, l_v16_0));
                v13(getCameraFacingCFrame(v7, l_v16_0.CFrame));
            end));
        end;
        return v17;
    end;
    v0.useEffect(function()
        local v22 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            v9(workspace.CurrentCamera);
        end);
        return function()
            v22:Disconnect();
        end;
    end, {});
    v0.useEffect(function()
        local v23 = nil;
        if v8 then
            v23 = v21(v8);
            local l_v8_0 = v8;
            v11(getDimensionsToFillViewPort(v7, l_v8_0));
            v13(getCameraFacingCFrame(v7, l_v8_0.CFrame));
        end;
        return function()
            if v23 then
                for _, v26 in v23, nil, nil do
                    v26:Disconnect();
                end;
            end;
        end;
    end, {
        v8
    });
    return v0.useMemo(function()
        return {
            viewportFillDimensions = v10, 
            cFrame = v12
        };
    end, {});
end;
