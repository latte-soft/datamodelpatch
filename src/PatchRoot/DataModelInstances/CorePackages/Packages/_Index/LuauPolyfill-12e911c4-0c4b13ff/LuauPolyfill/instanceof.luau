return function(v0, v1)
    assert(typeof(v1) == "table", "Received a non-table as the second argument for instanceof");
    if typeof(v0) ~= "table" then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function()
            local v2 = false;
            if v1.new ~= nil then
                v2 = v0.new == v1.new;
            end;
            return v2;
        end);
        if not l_status_0 or not l_result_0 then
            local v5 = {
                tbl = true
            };
            while true do
                if v0 and typeof(v0) == "table" then
                    v0 = getmetatable(v0);
                    if typeof(v0) == "table" then
                        v0 = v0.__index;
                        if v0 == v1 then
                            return true;
                        end;
                    end;
                    if typeof(v0) == "table" then
                        if not v5[v0] then
                            v5[v0] = true;
                        else
                            return false;
                        end;
                    end;
                else
                    return false;
                end;
            end;
        else
            return true;
        end;
    end;
end;
