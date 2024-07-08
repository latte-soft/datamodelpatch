local function v0(v1, v2, v3)
    if v1 == nil then
        return true, "";
    else
        local v4 = type(v1);
        local v5 = type(v2);
        if v4 ~= v5 then
            return false, (("interface types did not match; required %* ~= given %*"):format(v4, v5));
        else
            if v4 == "table" then
                for v6, v7 in v1, nil, nil do
                    if v6 ~= "__index" and v6 ~= "jest.config" then
                        local v8 = v2[v6];
                        if v8 == nil then
                            return false, (("missing required value for interface %*"):format(v6));
                        else
                            local v9 = type(v7);
                            local v10 = type(v8);
                            if v10 ~= v9 then
                                return false, (("interface %* types did not match; required %* ~= given %*"):format(v6, v9, v10));
                            elseif not (not (v3 and v9 == "table") or v7.isReactComponent) then
                                local v11, v12 = v0(v7, v8, v3);
                                if not v11 then
                                    return v11, v12;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            return true, "";
        end;
    end;
end;
return v0;
