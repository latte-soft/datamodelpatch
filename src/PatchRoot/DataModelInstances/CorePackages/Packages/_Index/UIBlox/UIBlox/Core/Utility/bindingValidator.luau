return function(v0)
    return function(v1)
        local v2 = string.match(tostring(v1), "RoactBinding");
        if typeof(v1) == "table" and v2 then
            local l_status_0, l_result_0 = pcall(function()
                return v1:getValue();
            end);
            if l_status_0 then
                local v5, v6 = v0(l_result_0);
                if v5 then
                    return true;
                else
                    warn(string.format("RoactBinding value: %s", v6));
                    return false;
                end;
            else
                warn("getValue() not defined");
                return false;
            end;
        else
            warn(string.format("RoactBinding expected, got %s", (typeof(v1))));
            return false;
        end;
    end;
end;
