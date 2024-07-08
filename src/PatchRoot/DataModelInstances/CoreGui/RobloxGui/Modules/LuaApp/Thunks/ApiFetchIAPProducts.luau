local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GetIAPProducts);
local v5 = require(l_Modules_0.LuaApp.Actions.SetIAPProducts);
local v6 = require(l_Modules_0.LuaApp.Models.PremiumFeaturesApi.IAPProduct);
return {
    Fetch = function(v7)
        return l_PerformFetch_0.Single("IAPProducts", function(v8)
            return v4(v7):andThen(function(v9)
                if not ((v9 ~= nil and v9[1] ~= nil) and v9[1].products ~= nil) or type(v9[1].products) ~= "table" then
                    v2.assert("Invalid response from GetIAPProducts");
                    return ;
                else
                    local v10 = {};
                    local v11 = {};
                    local v12 = {};
                    for _, v14 in ipairs(v9[1].products) do
                        local v15 = v6.fromJsonData(v14, v8:getState().Platform);
                        if v15 ~= nil then
                            if not v15.isSubscription then
                                if not v15.requiresPremium then
                                    table.insert(v11, v15);
                                else
                                    table.insert(v10, v15);
                                end;
                            else
                                table.insert(v12, v15);
                            end;
                        end;
                    end;
                    local function v18(v16, v17)
                        return v16.robuxAmount < v17.robuxAmount;
                    end;
                    table.sort(v10, v18);
                    table.sort(v11, v18);
                    table.sort(v12, v18);
                    v8:dispatch(v5(v11, v10, v12));
                    return ;
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v19)
        return l_PerformFetch_0.GetStatus(v19, "IAPProducts");
    end
};
