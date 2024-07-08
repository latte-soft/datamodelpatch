local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.PurchaseProduct);
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v8 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v10 = require(l_Modules_0.LuaApp.Models.EconomyApi.PurchaseProduct);
local v11 = require(l_Modules_0.LuaApp.Types.EconomyTypes);
local v12 = {};
local function _(v13)
    return "luaapp.purchaseproduct." .. v13;
end;
local v15 = v3.tuple(v3.callback, v3.numberPositive, v11.PurchaseDetail, v3.optional(v3.callback));
v12.Post = function(v16, v17, v18, v19)
    v5.assert(v15(v16, v17, v18, v19));
    return l_PerformFetch_0.Single("luaapp.purchaseproduct." .. v17, function(v20)
        return v6(v16, v17, v18):andThen(function(v21)
            local l_responseBody_0 = v21.responseBody;
            if type(l_responseBody_0) == "table" then
                local v23 = v10.fromJsonData(l_responseBody_0);
                if v23.purchased then
                    return v4.resolve(v23);
                else
                    if not (v19 ~= nil) or v19(v23) == false then
                        v20:dispatch(v8(v23));
                    end;
                    return v4.reject(v23);
                end;
            else
                v2.warn("Response from PurchaseProduct is malformed");
                v20:dispatch(v7({
                    HttpError = Enum.HttpError.OK
                }));
                return v4.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v24)
            v20:dispatch(v7(v24));
            return v4.reject(v24);
        end);
    end);
end;
v12.GetPostingStatus = function(v25, v26)
    return l_PerformFetch_0.GetStatus(v25, "luaapp.purchaseproduct." .. v26);
end;
return v12;
