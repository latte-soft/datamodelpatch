local l_TweenService_0 = game:GetService("TweenService");
local v1 = require(script:FindFirstAncestor("GameCollectionViews").Parent.React);
return function(v2, v3)
    v1.useEffect(function()
        local v4 = {};
        local v5 = nil;
        local v6 = 0;
        local v7 = 0;
        local v8 = 0;
        if v2 and v2.current ~= nil then
            local l_current_0 = v2.current;
            v6 = l_current_0.AbsolutePosition.Y;
            v7 = l_current_0.AbsoluteWindowSize.Y;
            table.insert(v4, l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                v6 = l_current_0.AbsolutePosition.Y;
            end));
            table.insert(v4, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
                v7 = l_current_0.AbsoluteWindowSize.Y;
            end));
            table.insert(v4, l_current_0.SelectionChanged:Connect(function(_, _, v12)
                if v12 ~= nil and v12:IsDescendantOf(l_current_0) then
                    if v5 then
                        v5:Cancel();
                        v5 = nil;
                    end;
                    local v13 = v12.AbsolutePosition.Y - ((v7 * 0.5 - v12.AbsoluteSize.Y * 0.5) + v6);
                    local l_CanvasPosition_0 = l_current_0.CanvasPosition;
                    local v15 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + v13);
                    local v16 = os.clock();
                    if v3 * 0.5 <= v16 - v8 then
                        v5 = l_TweenService_0:Create(l_current_0, TweenInfo.new(v3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            CanvasPosition = v15
                        });
                        if v5 then
                            v5:Play();
                        end;
                    else
                        l_current_0.CanvasPosition = v15;
                    end;
                    v8 = v16;
                    return ;
                else
                    return ;
                end;
            end));
        end;
        return function()
            for _, v18 in v4, nil, nil do
                v18:Disconnect();
            end;
            if v5 then
                v5:Cancel();
            end;
        end;
    end, {
        v2, 
        v3
    });
end;
