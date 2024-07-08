local function v0(v1)
    if v1 then
        if v1.Joint then
            local v2 = v1.Joint.Part0 == v1.Part;
            if not v1.Joint:IsA("Motor6D") then
                if not v2 then
                    v1.Part.CFrame = (v1.Joint.Part0.CFrame * v1.Joint.C0) * v1.Joint.C1:inverse();
                else
                    v1.Part.CFrame = (v1.Joint.Part1.CFrame * v1.Joint.C1) * v1.Joint.C0:inverse();
                end;
            elseif not v2 then
                v1.Part.CFrame = ((v1.Joint.Part0.CFrame * v1.Joint.C0) * v1.Joint.Transform) * v1.Joint.C1:inverse();
            else
                v1.Part.CFrame = ((v1.Joint.Part1.CFrame * v1.Joint.C1) * v1.Joint.Transform) * v1.Joint.C0:inverse();
            end;
        end;
        if v1.Children then
            for _, v4 in pairs(v1.Children) do
                v0(v4);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v25(v5)
    local function v6(v7, v8)
        if not (not v7:IsA("Motor6D") and not v7:IsA("Weld")) then
            table.insert(v8, v7);
        end;
        for _, v10 in pairs(v7:GetChildren()) do
            v6(v10, v8);
        end;
    end;
    local v11 = {};
    v6(v5, v11);
    local v12 = {};
    local function v13(v14)
        v12[v14.Part] = v14;
        local v19, v20 = (function()
            local v15 = {};
            local v16 = {};
            for _, v18 in pairs(v11) do
                if (v18.Part0 == v14.Part and v18.Part1 ~= nil) and v12[v18.Part1] == nil then
                    table.insert(v15, v18.Part1);
                    table.insert(v16, v18);
                elseif (v18.Part1 == v14.Part and v18.Part0 ~= nil) and v12[v18.Part0] == nil then
                    table.insert(v15, v18.Part0);
                    table.insert(v16, v18);
                end;
            end;
            return v15, v16;
        end)();
        for v21, v22 in ipairs(v19) do
            local v23 = {
                Part = v22, 
                Name = v22.Name, 
                Joint = v20[v21]
            };
            v14.Children = v14.Children or {};
            v14.Children[#v14.Children + 1] = v23;
            v13(v23);
        end;
    end;
    local v24 = {
        Part = v5.HumanoidRootPart, 
        Name = v5.HumanoidRootPart.Name
    };
    v13(v24);
    return v24;
end;
return function(v26)
    v0((v25(v26)));
end;
