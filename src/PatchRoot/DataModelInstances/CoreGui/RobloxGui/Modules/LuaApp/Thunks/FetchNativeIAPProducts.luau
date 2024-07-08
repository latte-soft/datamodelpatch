local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default;
local v2 = require(l_Modules_0.LuaApp.Actions.SetNativeRobuxProducts);
local _ = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v4 = nil;
pcall(function()
    v4 = game:GetService("PlatformService");
end);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagNativeProductFallbackToPlatformService);
local v6 = {};
local function _(v7)
    return (tonumber((string.gsub(v7.Name, "%D+", ""))));
end;
v6.Fetch = function()
    return function(v9)
        l_default_0:isAvailable():andThen(function(v10)
            local function v13(v11, v12)
                return v11.robuxAmount < v12.robuxAmount;
            end;
            if not v10 then
                if not v5() then
                    v9:dispatch(v2(nil));
                    return ;
                else
                    local v14 = nil;
                    local v15 = nil;
                    local v16 = nil;
                    local l_status_0, l_result_0 = pcall(function()
                        v14 = v4:BeginGetCatalogInfo();
                    end);
                    v15 = l_status_0;
                    v16 = l_result_0;
                    if not v15 then
                        v9:dispatch(v2(nil));
                    else
                        l_status_0 = {};
                        for _, v20 in v14, nil, nil do
                            table.insert(l_status_0, {
                                productId = v20.Name, 
                                price = tonumber(v20.Price) or 0, 
                                nativeProductId = v20.ProductId, 
                                robuxAmount = tonumber((string.gsub(v20.Name, "%D+", ""))) or 0, 
                                displayPrice = v20.DisplayPrice
                            });
                        end;
                        table.sort(l_status_0, v13);
                        v9:dispatch(v2(l_status_0));
                    end;
                    return ;
                end;
            else
                l_default_0:listNativeProducts():andThen(function(v21)
                    table.sort(v21.products, v13);
                    v9:dispatch(v2(v21.products));
                end);
                return ;
            end;
        end);
    end;
end;
return v6;
