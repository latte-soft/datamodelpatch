local function v0(v1, v2, v3)
    if #v1 == 0 then
        if not string.find(v1, v2) then
            return {
                ""
            };
        else
            return {};
        end;
    else
        if not v3 then
            v3 = -1;
        end;
        if v3 == 1 then
            return {
                v1
            };
        else
            if not v2 then
                v2 = "%s+";
            end;
            local v4, v5 = string.find(v1, v2);
            if v4 then
                if v5 < 1 then
                    local v6, v7 = string.find(string.sub(v1, 2), v2);
                    v4 = v6;
                    v5 = v7;
                    v4 = v4 + 1;
                    v5 = v5 + 1;
                end;
                local v8 = string.sub(v1, 1, v4 - 1);
                local v9 = string.sub(v1, v5 + 1);
                if #v9 == 0 and v4 <= v5 then
                    return {
                        v8, 
                        v9
                    };
                else
                    local v10 = v0(v9, v2, v3 - 1);
                    table.insert(v10, 1, v8);
                    return v10;
                end;
            else
                return {
                    v1
                };
            end;
        end;
    end;
end;
return v0;
