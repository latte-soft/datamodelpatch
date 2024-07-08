local v0 = require(game:GetService("CorePackages").Packages.React);
return function(v1, v2, v3, v4, _)
    if not v3 then
        v3 = v2;
    end;
    local v6, v7 = v0.useState(v4 or false);
    local v8, v9 = v0.useState(false);
    local v10 = v0.useRef(v4 or 0);
    local v11 = v0.useRef(false);
    v0.useEffect(function()
        local v12 = tick();
        local v13 = nil;
        local v14 = false;
        local function _(v15, v16, v17)
            if v15 > 0 then
                v13 = task.delay(v15, function()
                    v14 = true;
                    v13 = nil;
                    v10.current = v17;
                    v9(v16);
                end);
                return ;
            else
                if v8 ~= v16 then
                    v14 = true;
                    v9(v16);
                end;
                return ;
            end;
        end;
        if not v6 then
            local v19 = v10.current - v1;
            local l_v1_0 = v1;
            if v19 > 0 then
                local l_delay_0 = task.delay;
                local l_v19_0 = v19;
                local v23 = false;
                v13 = l_delay_0(l_v19_0, function()
                    v14 = true;
                    v13 = nil;
                    v10.current = l_v1_0;
                    v9(v23);
                end);
            elseif v8 ~= false then
                v14 = true;
                v9(false);
            end;
        else
            local v24 = v2 - v10.current;
            local l_v2_0 = v2;
            if v24 > 0 then
                local l_delay_1 = task.delay;
                local l_v24_0 = v24;
                local v28 = true;
                v13 = l_delay_1(l_v24_0, function()
                    v14 = true;
                    v13 = nil;
                    v10.current = l_v2_0;
                    v9(v28);
                end);
            elseif v8 ~= true then
                v14 = true;
                v9(true);
            end;
        end;
        local l_v6_0 = v6;
        return function()
            if not v14 then
                if v13 then
                    task.cancel(v13);
                end;
                if not v11.current then
                    local v30 = tick() - v12;
                    if not l_v6_0 then
                        v30 = v30 * -1;
                    end;
                    v10.current = math.clamp(v10.current + v30, 0, v3);
                end;
            end;
            v11.current = false;
        end;
    end, {
        v6, 
        v8, 
        v1, 
        v2, 
        v3
    });
    return v8, (v0.useCallback(function(v31, v32)
        v11.current = v32;
        if v32 then
            if not v31 then
                v10.current = 0;
            else
                v10.current = v3;
            end;
        end;
        v7(v31);
    end, {
        v7
    }));
end;
