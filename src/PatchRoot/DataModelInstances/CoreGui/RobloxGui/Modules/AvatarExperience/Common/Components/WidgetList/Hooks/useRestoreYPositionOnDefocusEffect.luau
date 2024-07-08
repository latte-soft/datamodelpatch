local v0 = require(game:GetService("CorePackages").Packages.React);
return function(v1, v2, v3, v4)
    local v5 = v0.useRef(v1);
    v0.useEffect(function()
        local v6 = v3();
        if v6 then
            assert(v6, "");
            local l_current_0 = v6.current;
            if l_current_0 then
                if v1 ~= v5.current then
                    v5.current = v1;
                    l_current_0.CanvasPosition = Vector2.new(0, 0);
                    return ;
                elseif not v2 or not l_current_0 then
                    if not v2 then
                        l_current_0.CanvasPosition = Vector2.new(0, v4.current or 0);
                    end;
                    return ;
                else
                    l_current_0.CanvasPosition = Vector2.new(0, 0);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v1, 
        v2, 
        v3, 
        v4
    });
end;
