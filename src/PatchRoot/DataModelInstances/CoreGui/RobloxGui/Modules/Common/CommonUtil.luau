return {
    TableConcat = function(v0, v1)
        for v2 = 1, #v1 do
            v0[#v0 + 1] = v1[v2];
        end;
        return v0;
    end, 
    SortByName = function(v3)
        table.sort(v3, function(v4, v5)
            return v4.Name < v5.Name;
        end);
        return v3;
    end, 
    Create = function(v6)
        return function(v7)
            local v8 = Instance.new(v6);
            local v9 = nil;
            for v10, v11 in pairs(v7) do
                if type(v10) == "number" then
                    v11.Parent = v8;
                elseif v10 == "Parent" then
                    v9 = v11;
                else
                    v8[v10] = v11;
                end;
            end;
            if v9 then
                v8.Parent = v9;
            end;
            return v8;
        end;
    end
};
