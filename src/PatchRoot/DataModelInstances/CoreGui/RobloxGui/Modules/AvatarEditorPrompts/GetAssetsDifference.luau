local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Promise);
local v3 = require(script.Parent.GetCurrentHumanoidDescription);
local v4 = require(script.Parent.GetAssetIdsFromDescription);
local v5 = require(script.Parent.GetAssetNamesForIds);
return function(v6)
    local function v13(v7, v8)
        local v9 = v1.List.toSet(v7);
        local v10 = v1.List.toSet(v8);
        return v1.List.filter(v8, function(v11)
            return v9[v11] == nil;
        end), (v1.List.filter(v7, function(v12)
            return v10[v12] == nil;
        end));
    end;
    return v3():andThen(function(v14)
        local v15, v16 = v13(v4(v14), (v4(v6)));
        return v5((v1.List.join(v15, v16))):andThen(function(v17)
            local v18 = {};
            for _, v20 in ipairs(v15) do
                table.insert(v18, v17[v20]);
            end;
            local v21 = {};
            for _, v23 in ipairs(v16) do
                table.insert(v21, v17[v23]);
            end;
            return {
                addedNames = v18, 
                removedNames = v21, 
                addedAssetIds = v15, 
                removedAssetIds = v16
            };
        end);
    end);
end;
