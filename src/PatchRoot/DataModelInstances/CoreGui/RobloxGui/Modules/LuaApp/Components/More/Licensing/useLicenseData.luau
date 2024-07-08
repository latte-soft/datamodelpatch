local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.Common.memoize);
local v5 = require(l_CorePackages_0.Promise);
local _ = function()
    return v5.new(function(v6, v7)
        task.spawn(function()
            local l_status_0, l_result_0 = pcall(function()
                local v8 = {};
                for _, v10 in pairs(l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
                    local v11, v12 = v10.Name:match("^(%d*)-(.*)");
                    v8[v11 + 1] = {
                        key = v12, 
                        value = v10.Value:match("(.-)\n*$"):split("\n")
                    };
                end;
                return v8;
            end);
            if not l_status_0 then
                v7(l_result_0);
                return ;
            else
                v6(l_result_0);
                return ;
            end;
        end);
    end);
end;
return function()
    local v16, v17 = v3.useState({
        licenseList = {}, 
        initialLicense = nil, 
        initialLicenseKey = nil
    });
    v3.useLayoutEffect(function()
        v5.new(function(v18, v19)
            task.spawn(function()
                local l_status_1, l_result_1 = pcall(function()
                    local v20 = {};
                    for _, v22 in pairs(l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
                        local v23, v24 = v22.Name:match("^(%d*)-(.*)");
                        v20[v23 + 1] = {
                            key = v24, 
                            value = v22.Value:match("(.-)\n*$"):split("\n")
                        };
                    end;
                    return v20;
                end);
                if not l_status_1 then
                    v19(l_result_1);
                    return ;
                else
                    v18(l_result_1);
                    return ;
                end;
            end);
        end):andThen(function(v27)
            v17({
                licenseList = v27, 
                initialLicense = v27[1], 
                initialLicenseKey = if not v27[1] then nil else v27[1].key
            });
        end):catch(function(v28)
            warn("Failed to retrieve license data: ", v28);
        end);
    end, {});
    return v16;
end;
