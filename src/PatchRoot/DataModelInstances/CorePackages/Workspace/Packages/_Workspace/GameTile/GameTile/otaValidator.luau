local function v0(v1, v2)
    if v1 == nil then
        return true, "";
    else
        local v3 = type(v1);
        if v3 ~= type(v2) then
            return false, (("ota type failed to be a table; was type %*"):format((type(v2))));
        else
            if v3 == "table" then
                for v4, v5 in pairs(v1) do
                    local v6 = v2[v4];
                    if v6 == nil then
                        return false, (("ota missing key %*"):format(v4));
                    else
                        local v7 = type(v5);
                        if v7 ~= type(v6) then
                            return false, (("ota value mis-matched type; local type %* ~= ota type %*"):format(v7, (type(v6))));
                        elseif v7 == "table" then
                            local v8, v9 = v0(v5, v6);
                            if not v8 then
                                return v8, v9;
                            end;
                        end;
                    end;
                end;
            end;
            return true, "";
        end;
    end;
end;
return function(v10, v11)
    local v12, v13 = v0(v10.Flags, v11.Flags);
    if v12 then
        local v14, v15 = v0(v10.GameTileConstants, v11.GameTileConstants);
        if v14 then
            return true, "";
        else
            return false, (("GameTileConstants file failed with '%*'"):format(v15));
        end;
    else
        return false, (("Flags file failed with '%*'"):format(v13));
    end;
end;
