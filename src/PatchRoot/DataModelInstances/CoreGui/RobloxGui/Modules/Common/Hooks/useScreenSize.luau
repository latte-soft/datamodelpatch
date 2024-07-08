local v0 = require(game:GetService("CorePackages").Packages.React);
return function()
    local v1 = nil;
    local v2 = nil;
    local v3, v4 = v0.useState(Vector2.new(0, 0));
    local function v6()
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            v4(Vector2.new(l_CurrentCamera_0.ViewportSize.X, l_CurrentCamera_0.ViewportSize.Y));
        end;
    end;
    local function v8()
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if v2 then
            pcall(function()
                v2:Disconnect();
            end);
            v2 = nil;
        end;
        if l_CurrentCamera_1 then
            v2 = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(v6);
        end;
    end;
    v0.useEffect(function()
        v1 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v8);
        v8();
        local l_CurrentCamera_2 = workspace.CurrentCamera;
        if l_CurrentCamera_2 then
            v4(Vector2.new(l_CurrentCamera_2.ViewportSize.X, l_CurrentCamera_2.ViewportSize.Y));
        end;
        return function()
            if v1 then
                v1:Disconnect();
            end;
            if v2 then
                v2:Disconnect();
            end;
        end;
    end, {});
    return v3;
end;
