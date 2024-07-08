local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v4 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
local v5 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local _ = require(l_Modules_0.LuaApp.Models.PremiumFeaturesApi.IAPProduct);
local v7 = require(l_Modules_0.LuaApp.Thunks.PollRobuxBalance);
local _ = function(v8, v9)
    for _, v11 in pairs(v8) do
        if v11.mobileProductId == v9 then
            return true;
        end;
    end;
    return false;
end;
return function(v13, v14, v15)
    return function(v16)
        local v17 = v16:getState();
        local l_LocalUserId_0 = v17.LocalUserId;
        local v19 = v17.UserRobux[v17.LocalUserId];
        if not (v15 ~= v3.Failed) or v15 == v3.Pending then
            return v16:dispatch(v5(v14, v3.Failed));
        else
            local l_Subscriptions_0 = v17.IAPProducts.Subscriptions;
            local l_v14_0 = v14;
            local v22;
            for _, v24 in pairs(l_Subscriptions_0) do
                if v24.mobileProductId == l_v14_0 then
                    v22 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v22 = false;
            ::label0::;
            if not v22 then
                v16:dispatch(v5(v14, v3.Polling));
                if not l_RunService_0:IsStudio() then
                    return v16:dispatch(v7(v13, tostring(l_LocalUserId_0), v19, function(v25)
                        return v16:dispatch(v5(v14, v25 ~= v19 and v3.Success or v3.Failed));
                    end)):catch(function()
                        return v16:dispatch(v5(v14, v3.Failed));
                    end);
                else
                    return v16:dispatch(v5(v14, v3.Success));
                end;
            else
                v16:dispatch(v4(l_LocalUserId_0, Enum.MembershipType.Premium));
                return v16:dispatch(v5(v14, v3.Success));
            end;
        end;
    end;
end;
