local v0 = require(script:FindFirstAncestor("VirtualEvents").Parent.React);
return function(v1, v2)
    local v3 = v0.useRef(false);
    local v6 = v0.useCallback(function(v4, v5)
        if v4.AbsolutePosition.Y <= v5.AbsoluteSize.Y then
            v3.current = true;
            v2();
        end;
    end, {
        v2
    });
    v0.useEffect(function()
        if not v3.current then
            local l_current_0 = v1.current;
            local v8 = nil;
            if l_current_0 then
                local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("ScreenGui");
                if l_l_current_0_FirstAncestorWhichIsA_0 then
                    v6(l_current_0, l_l_current_0_FirstAncestorWhichIsA_0);
                    v8 = l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                        if not v3.current then
                            v6(l_current_0, l_l_current_0_FirstAncestorWhichIsA_0);
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            return function()
                if v8 then
                    v8:Disconnect();
                end;
            end;
        else
            return ;
        end;
    end);
end;
