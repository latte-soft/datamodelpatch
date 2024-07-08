return function(v0, v1)
    return function(v2)
        local v3 = Instance.new(v0);
        local v4 = nil;
        for v5, v6 in next, v2, nil do
            if type(v5) == "string" then
                if v5 == "Parent" then
                    v4 = v6;
                else
                    v3[v5] = v6;
                end;
            else
                local v7 = typeof(v6);
                if v7 == "function" then
                    v6(v3);
                elseif v7 == "Instance" then
                    v6.Parent = v3;
                end;
            end;
        end;
        if not v4 then
            if v1 then
                v3.Parent = v1;
            end;
            return v3;
        else
            v3.Parent = v4;
            return v3;
        end;
    end;
end;
