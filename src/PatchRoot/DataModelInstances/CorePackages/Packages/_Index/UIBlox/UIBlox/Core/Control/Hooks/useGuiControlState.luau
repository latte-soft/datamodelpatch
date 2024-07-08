local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_useForwardRef_0 = require(l_Parent_1.ReactUtils).useForwardRef;
local v4 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v5 = require(l_Parent_0.Core.Control.Enum.ControlStateEvent);
local v6 = require(l_Parent_0.Core.Control.createGuiControlStateTable);
return function(v7, v8, v9)
    local v10 = v2.useRef(v4.Initialize);
    local v11 = v2.useRef(v9);
    local v12 = v2.useRef(false);
    local v15 = v2.useCallback(function(v13, v14)
        v10.current = v14;
        v8(v13, v14);
    end, {
        v8
    });
    local v16 = v2.useMemo(function()
        return v6(v15);
    end, {});
    v2.useEffect(function()
        v16:onStateChange(v15);
    end, {
        v15
    });
    local v23 = v2.useCallback(function(v17)
        local v18 = {};
        if v17 then
            table.insert(v18, v17.InputBegan:Connect(function(v19)
                if v11.current then
                    if not ((v19.UserInputType ~= Enum.UserInputType.MouseButton1 and v19.UserInputType ~= Enum.UserInputType.Touch) and v19.KeyCode ~= Enum.KeyCode.ButtonA) or v19.KeyCode == Enum.KeyCode.Return then
                        v16.events[v5.PrimaryPressed]();
                    end;
                    return ;
                else
                    return nil;
                end;
            end));
            table.insert(v18, v17.InputEnded:Connect(function(v20)
                if v11.current then
                    if v20.UserInputType == Enum.UserInputType.MouseButton1 then
                        v16.events[v5.PrimaryReleasedHover]();
                        return ;
                    else
                        if not (v20.UserInputType ~= Enum.UserInputType.Touch and v20.KeyCode ~= Enum.KeyCode.ButtonA) or v20.KeyCode == Enum.KeyCode.Return then
                            v16.events[v5.PrimaryReleased]();
                        end;
                        return ;
                    end;
                else
                    return nil;
                end;
            end));
            table.insert(v18, v17.SelectionGained:Connect(function()
                if v11.current then
                    v16.events[v5.SelectionGained]();
                    return ;
                else
                    return nil;
                end;
            end));
            table.insert(v18, v17.SelectionLost:Connect(function()
                if v11.current then
                    v16.events[v5.SelectionLost]();
                    return ;
                else
                    return nil;
                end;
            end));
            table.insert(v18, v17.MouseEnter:Connect(function()
                if v11.current then
                    v12.current = true;
                    v16.events[v5.PointerHover]();
                    return ;
                else
                    return nil;
                end;
            end));
            table.insert(v18, v17.MouseLeave:Connect(function()
                if v11.current then
                    v12.current = false;
                    v16.events[v5.PointerHoverEnd]();
                    return ;
                else
                    return nil;
                end;
            end));
        end;
        return function()
            for _, v22 in ipairs(v18) do
                v22:Disconnect();
            end;
        end;
    end, {
        v16, 
        v12
    });
    v2.useEffect(function()
        v11.current = v9;
    end, {
        v9
    });
    return l_useForwardRef_0(v7, v23), v16;
end;
