return function(v0, v1, v2, v3)
    local v4 = {
        Data = v0, 
        Version = v1, 
        GetRefreshIntervalFunc = v2, 
        RefreshFunc = v3
    };
    local v5 = false;
    v4.Update = function(v6, v7)
        if not (not v7 or not v7.Version) and v6.Version <= v7.Version then
            v6.Version = v7.Version;
            v6.Data = v7.Data;
        end;
    end;
    v4.Refresh = function(v8, v9)
        if v8.RefreshFunc and type(v8.RefreshFunc) == "function" then
            while v5 do
                wait();
            end;
            local v10 = nil;
            if v8.GetRefreshIntervalFunc and type(v8.GetRefreshIntervalFunc) == "function" then
                v10 = tonumber(v8.GetRefreshIntervalFunc());
            end;
            if ((v9 or not v8.Version) or not v10) or v10 <= tick() - v8.Version then
                v5 = true;
                if not v8.RefreshFunc(v8.Data) then
                    v8.Version = nil;
                else
                    v8.Version = tick();
                end;
                v5 = false;
            end;
        end;
    end;
    return v4;
end;
