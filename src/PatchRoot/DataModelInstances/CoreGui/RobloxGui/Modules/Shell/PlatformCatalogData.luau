local v0 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
local v1 = {};
local function v2()
    return {
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$199.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$199.99", 
            Price = "199.99", 
            ProductId = "210d1d69-5189-40f4-a59b-ecfb4f849847", 
            Name = "22,500 Robux", 
            TitleId = 0, 
            IsBundle = false
        }, 
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$4.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$4.99", 
            Price = "4.99", 
            ProductId = "70c2075d-5e2f-4ffd-8de5-8a6d2f5e65ad", 
            Name = "400 Robux", 
            TitleId = 0, 
            IsBundle = false
        }, 
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$99.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$99.99", 
            Price = "99.99", 
            ProductId = "878c642b-cb27-4d5e-a150-a408ea40c41c", 
            Name = "10\194\160000 Robux", 
            TitleId = 0, 
            IsBundle = false
        }, 
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$399.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$399.99", 
            Price = "399.99", 
            ProductId = "878c642b-cb27-4d5e-a150-a408ea40c41c", 
            Name = "50 000 Robux", 
            TitleId = 0, 
            IsBundle = false
        }, 
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$129.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$129.99", 
            Price = "129.99", 
            ProductId = "878c642b-cb27-4d5e-a150-a408ea40c41c", 
            Name = "12.500 Robux", 
            TitleId = 0, 
            IsBundle = false
        }, 
        {
            ReducedName = "Default Short Title", 
            Description = "Default Description", 
            DisplayListPrice = "$229.99", 
            IsPartOfAnyBundle = false, 
            DisplayPrice = "$229.99", 
            Price = "229.99", 
            ProductId = "878c642b-cb27-4d5e-a150-a408ea40c41c", 
            Name = "\229\156\168Xbox\228\184\138\231\141\178\229\190\15132500 Robux", 
            TitleId = 0, 
            IsBundle = false
        }
    };
end;
v1.GetCatalogInfoAsync = function(_)
    if UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
        return v2(), true, "";
    else
        local v4 = nil;
        local v5 = nil;
        local v6 = nil;
        for _ = 1, 5 do
            local l_status_0, l_result_0 = pcall(function()
                v4 = v0:BeginGetCatalogInfo();
            end);
            v5 = l_status_0;
            v6 = l_result_0;
            if not v5 or not v4 then
                wait(10);
            else
                return v4, v5, v6;
            end;
        end;
        return v4, v5, v6;
    end;
end;
v1.ParseMoneyValue = function(_, v11)
    return not not v11 and tonumber(v11.Price) or 0.99;
end;
v1.ParseRobuxValue = function(_, v13)
    if v13 and v13.Name then
        return (tonumber((string.gsub(v13.Name, "%D+", ""))));
    else
        return 0;
    end;
end;
v1.CalculateRobuxRatio = function(v14, v15)
    local v16 = v14:ParseRobuxValue(v15);
    local v17 = v14:ParseMoneyValue(v15);
    if not (v17 ~= 0) or v16 == 0 then
        return 0;
    else
        return v16 / v17;
    end;
end;
return v1;
