local function v0(v1, v2)
    local v3 = v2:exec(v1);
    if v3 then
        local l_index_0 = v3.index;
        local v5 = v3[1];
        local v6 = {};
        if #v3 > 1 then
            for v7 = 2, #v3 do
                table.insert(v6, v3[v7]);
            end;
        end;
        return {
            {
                index = l_index_0, 
                input = v1, 
                matchedText = v5, 
                capturedGroups = v6
            }, 
            unpack((v0(v1:sub(l_index_0 + #v5), v2)))
        };
    else
        return {};
    end;
end;
return v0;
