return function(v0, v1, v2, v3, v4)
    local l_R_0 = v3.R;
    local l_G_0 = v3.G;
    local l_B_0 = v3.B;
    local v8 = 1 - v4;
    local v9 = table.create((v1 * v1) * 4);
    for v10 = 1, v1 do
        for v11 = 1, v1 do
            if v2[math.floor(((v10 - 1) / v1) * #v2) + 1][math.floor(((v11 - 1) / v1) * #v2) + 1] > 0 then
                table.insert(v9, l_R_0);
                table.insert(v9, l_G_0);
                table.insert(v9, l_B_0);
                table.insert(v9, v8);
            else
                table.insert(v9, 1);
                table.insert(v9, 1);
                table.insert(v9, 1);
                table.insert(v9, 0);
            end;
        end;
    end;
    local v12 = Vector2.new(0, 0);
    local v13 = Vector2.new(v1, v1);
    v0.Size = v13;
    v0:WritePixels(v12, v13, v9);
    return v9;
end;
