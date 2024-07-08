local v0 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
local v1 = require(game:GetService("CorePackages").Promise);
local function _(v2)
    local v3 = string.gsub(v2 and v2.Name, ",", "");
    v3 = not not v3 and string.match(v3, "[0-9]+") or nil;
    return not not v3 and tonumber(v3) or 1000;
end;
local function v11(v5)
    local v6 = {};
    for _, v8 in v5, nil, nil do
        local v9 = {};
        local v10 = string.gsub(v8 and v8.Name, ",", "");
        v10 = not not v10 and string.match(v10, "[0-9]+") or nil;
        v9.robuxValue = not not v10 and tonumber(v10) or 1000;
        v9.productId = v8.ProductId;
        table.insert(v6, v9);
    end;
    return v6;
end;
return function()
    return v1.new(function(v12, v13)
        local l_status_0, l_result_0 = pcall(function()
            return v0:BeginGetCatalogInfo();
        end);
        if not l_status_0 or not l_result_0 then
            v13(l_result_0);
            return ;
        else
            v12(l_result_0);
            return ;
        end;
    end):andThen(function(v16)
        return v1.resolve((v11(v16)));
    end);
end;
