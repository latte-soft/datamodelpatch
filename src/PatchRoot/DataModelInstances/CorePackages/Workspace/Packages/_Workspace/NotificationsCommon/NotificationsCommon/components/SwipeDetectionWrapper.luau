local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script.Parent.Parent.Parent.React);
return function(v2)
    local v3 = v1.createRef();
    local v4, v5 = v1.useState(false);
    v1.useEffect(function()
        if not v2.swipeEnabled or not v2.swipeCallback then
            v5(false);
            return nil;
        else
            local v9 = l_UserInputService_0.TouchStarted:Connect(function(v6)
                local v7 = v3 and v3.current;
                if v7 then
                    local v8 = Vector2.new(v6.Position.X, v6.Position.Y) - v7.AbsolutePosition;
                    if ((v8.X >= 0 and v8.Y >= 0) and v8.X <= v7.AbsoluteSize.X) and v8.Y <= v7.AbsoluteSize.Y then
                        v5(true);
                    end;
                    return ;
                else
                    return ;
                end;
            end);
            local v10 = l_UserInputService_0.TouchEnded:Connect(function()
                v5(false);
            end);
            local v12 = if not v4 then nil else l_UserInputService_0.TouchSwipe:Connect(function(v11)
                if v4 then
                    v2.swipeCallback(v11);
                end;
            end);
            return function()
                v9:Disconnect();
                v10:Disconnect();
                if v12 then
                    v12:Disconnect();
                end;
            end;
        end;
    end, {
        v2.swipeEnabled, 
        v2.swipeCallback, 
        v3, 
        v4
    });
    return v1.createElement("Frame", {
        Size = v2.Size, 
        AutomaticSize = v2.AutomaticSize, 
        BackgroundTransparency = 1, 
        Active = true, 
        ref = v3
    }, v2.children);
end;
