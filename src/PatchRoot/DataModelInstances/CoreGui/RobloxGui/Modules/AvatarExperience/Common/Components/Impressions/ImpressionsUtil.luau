return {
    writeItemAttributes = function(v0, v1, v2)
        if v0 then
            for v3, v4 in v0.mapping, nil, nil do
                local v5 = v2[v3];
                if v5 then
                    v1:SetAttribute(v4.attribute, v5);
                end;
            end;
            return ;
        else
            warn("Impressions schema is nil");
            return ;
        end;
    end, 
    buildSchema = function(v6, v7)
        local v8 = {};
        local l_groupBy_0 = v7.groupBy;
        for _, v11 in v7.mapping, nil, nil do
            v8[v11.prop] = {
                attribute = string.format("%s_%s", v6, v11.prop), 
                out = v11.out, 
                isGrouping = not not l_groupBy_0 and table.find(l_groupBy_0, v11.out) ~= nil
            };
        end;
        if l_groupBy_0 then
            for _, v13 in l_groupBy_0, nil, nil do
                local v14 = false;
                for _, v16 in v7.mapping, nil, nil do
                    if v16.out == v13 then
                        v14 = true;
                    end;
                    if v14 then
                        break;
                    end;
                end;
                if not v14 then
                    error(string.format("Impression schema groupBy field '%s' not specified in output mapping", v13));
                end;
            end;
        end;
        return {
            mapping = v8, 
            enumMap = v7.enumMap
        };
    end, 
    packEvents = function(v17, v18)
        if v17 then
            local v19 = {};
            local v20 = {};
            for v21, v22 in v18, nil, nil do
                local l_v22_Attributes_0 = v22:GetAttributes();
                local v24 = "";
                for _, v26 in v17.mapping, nil, nil do
                    if v26.isGrouping then
                        v24 = v24 .. (l_v22_Attributes_0[v26.attribute] or "_");
                    end;
                end;
                local v27 = v19[v24] or {};
                v19[v24] = v27;
                for _, v29 in v17.mapping, nil, nil do
                    local v30 = l_v22_Attributes_0[v29.attribute];
                    local l_out_0 = v29.out;
                    if not v29.isGrouping then
                        local v32 = v27[l_out_0] or {};
                        v27[l_out_0] = v32;
                        v32[v21] = v30 or "";
                        if not (not v17.enumMap or not v17.enumMap[l_out_0]) then
                            v32[v21] = v17.enumMap[l_out_0][v30];
                        end;
                    else
                        v27[l_out_0] = v30;
                    end;
                end;
            end;
            for _, v34 in v19, nil, nil do
                local v35 = {};
                table.insert(v20, v35);
                for _, v37 in v17.mapping, nil, nil do
                    local l_out_1 = v37.out;
                    local v39 = v34[l_out_1];
                    if typeof(v39) == "table" then
                        for _, v41 in v39, nil, nil do
                            if not v35[l_out_1] then
                                v35[l_out_1] = tostring(v41);
                            else
                                v35[l_out_1] = v35[l_out_1] .. "," .. tostring(v41);
                            end;
                        end;
                    else
                        v35[l_out_1] = v39;
                    end;
                end;
            end;
            return v20;
        else
            warn("Impressions schema nil");
            return ;
        end;
    end
};
