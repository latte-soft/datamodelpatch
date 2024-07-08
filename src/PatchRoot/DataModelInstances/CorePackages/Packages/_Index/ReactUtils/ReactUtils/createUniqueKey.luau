return function()
    local v0 = {};
    return function(v1)
        if v0[v1] == nil then
            v0[v1] = 1;
            return v1;
        else
            local v2;
            while true do
                v2 = v0;
                v2[v1] = v2[v1] + 1;
                v2 = ("%*_%*"):format(v1, v0[v1]);
                if v0[v2] == nil then
                    break;
                end;
            end;
            return v2;
        end;
    end;
end;
