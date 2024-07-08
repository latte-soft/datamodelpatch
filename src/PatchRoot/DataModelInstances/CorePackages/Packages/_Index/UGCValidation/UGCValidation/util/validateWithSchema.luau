local _ = function(v0, v1)
    if type(v0) == "table" then
        for _, v3 in pairs(v0) do
            if v3 == v1 then
                return true;
            end;
        end;
    elseif type(v0) == "string" then
        return v0 == v1;
    end;
    return false;
end;
local function _(v5)
    if type(v5) == "table" then
        return table.concat(v5, " or ");
    elseif type(v5) == "string" then
        return v5;
    else
        return "*";
    end;
end;
local function v7(v8, v9, v10)
    if v9.ClassName == v8.ClassName then
        if v8.Name ~= nil then
            local l_Name_0 = v8.Name;
            local l_Name_1 = v9.Name;
            local v13;
            if type(l_Name_0) == "table" then
                for _, v15 in pairs(l_Name_0) do
                    if v15 == l_Name_1 then
                        v13 = true;
                        goto label1 --[[  true, false  ]];
                    end;
                end;
            elseif type(l_Name_0) == "string" then
                v13 = l_Name_0 == l_Name_1;
                goto label1 --[[  true, true  ]];
            end;
            v13 = false;
            ::label1::;
            if not v13 then
                goto label0;
            end;
        end;
        if v8._children then
            for _, v17 in pairs(v8._children) do
                local v18 = false;
                local v19 = nil;
                for _, v21 in pairs(v9:GetChildren()) do
                    local v22 = v7(v17, v21, v10);
                    if not v22.success then
                        if v22.message then
                            v19 = v22;
                        end;
                    else
                        v18 = true;
                        break;
                    end;
                end;
                if not (v18 or v17._optional) then
                    if not v19 then
                        local v23 = {
                            success = false
                        };
                        local v24 = "Could not find a ";
                        local l_ClassName_0 = v17.ClassName;
                        local v26 = " called ";
                        local l_Name_2 = v17.Name;
                        v23.message = v24 .. l_ClassName_0 .. v26 .. if type(l_Name_2) == "table" then table.concat(l_Name_2, " or ") else if type(l_Name_2) == "string" then l_Name_2 else "*" .. " inside " .. v9.Name;
                        return v23;
                    else
                        return v19;
                    end;
                end;
            end;
        end;
        v10[v9] = true;
        return {
            success = true
        };
    end;
    ::label0::;
    return {
        success = false
    };
end;
return function(v28, v29)
    if v29.ClassName == v28.ClassName then
        if v28.Name ~= nil then
            local l_Name_3 = v28.Name;
            local l_Name_4 = v29.Name;
            local v32;
            if type(l_Name_3) == "table" then
                for _, v34 in pairs(l_Name_3) do
                    if v34 == l_Name_4 then
                        v32 = true;
                        goto label3 --[[  true, false  ]];
                    end;
                end;
            elseif type(l_Name_3) == "string" then
                v32 = l_Name_3 == l_Name_4;
                goto label3 --[[  true, true  ]];
            end;
            v32 = false;
            ::label3::;
            if not v32 then
                goto label2;
            end;
        end;
        local v35 = {};
        local v36 = v7(v28, v29, v35);
        if v36.success then
            local v37 = {};
            for _, v39 in pairs(v29:GetDescendants()) do
                if v35[v39] == nil then
                    v37[#v37 + 1] = v39:GetFullName();
                end;
            end;
            if #v37 > 0 then
                return {
                    success = false, 
                    message = "Unexpected Descendants:\n" .. table.concat(v37, "\n")
                };
            else
                return {
                    success = true
                };
            end;
        else
            return v36;
        end;
    end;
    ::label2::;
    local v40 = {
        success = false
    };
    local v41 = "Expected top-level instance to be a ";
    local l_ClassName_1 = v28.ClassName;
    local v43 = " named ";
    local l_Name_5 = v28.Name;
    v40.message = v41 .. l_ClassName_1 .. v43 .. if type(l_Name_5) == "table" then table.concat(l_Name_5, " or ") else if type(l_Name_5) == "string" then l_Name_5 else "*";
    return v40;
end;
