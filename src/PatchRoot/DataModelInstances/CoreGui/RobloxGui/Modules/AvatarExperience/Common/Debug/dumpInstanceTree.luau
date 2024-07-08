local function _(v0, v1)
    local l_status_0, l_result_0 = pcall(function()
        return v0[v1];
    end);
    if not l_status_0 then
        return nil;
    else
        return (tostring(l_result_0));
    end;
end;
local function v15(v5, v6)
    local l_Name_0 = v5.Name;
    local v8 = false;
    local v9 = v6 or {};
    for _, v11 in v9, nil, nil do
        local l_status_1, l_result_1 = pcall(function()
            return v5[v11];
        end);
        local v14 = if not l_status_1 then nil else tostring(l_result_1);
        if v14 then
            if v8 then
                l_Name_0 = l_Name_0 .. ", ";
            else
                v8 = true;
                l_Name_0 = l_Name_0 .. "   (";
            end;
            l_Name_0 = l_Name_0 .. v11 .. "=" .. v14;
        end;
    end;
    if v8 then
        l_Name_0 = l_Name_0 .. ")";
    end;
    return l_Name_0 .. "\n";
end;
local function v16(v17, v18, v19)
    if v17 == nil then
        return v19 .. "[nil Instance]\n";
    elseif v17.Name == nil then
        return v19 .. "[Invalid Instance]\n";
    else
        local v20 = v19 .. v15(v17, v18);
        for _, v22 in v17:GetChildren() do
            v20 = v20 .. v16(v22, v18, v19 .. "   ");
        end;
        return v20;
    end;
end;
return function(v23, v24)
    return (v16(v23, v24, ""));
end;
