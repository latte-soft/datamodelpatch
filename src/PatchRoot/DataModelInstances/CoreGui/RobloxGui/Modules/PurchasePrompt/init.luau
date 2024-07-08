local l_script_0 = script;
local v1 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Roact_0 = v1.Roact;
local l_Rodux_0 = v1.Rodux;
local v6 = require(script.Components.PurchasePromptApp);
local v7 = require(l_script_0.Reducers.Reducer);
local v8 = require(l_script_0.Services.ABTest);
local v9 = require(l_script_0.Services.Network);
local v10 = require(l_script_0.Services.Analytics);
local v11 = require(l_script_0.Services.PlatformInterface);
local v12 = require(l_script_0.Services.ExternalSettings);
local v13 = require(l_script_0.Thunk);
local v14 = require(l_script_0.Thunks.initiateAvatarCreationFeePurchase);
local v15 = require(l_script_0.Flags.GetFFlagEnableAvatarCreationFeePurchase);
local v16 = nil;
local v17 = nil;
local function v18()
    v17 = l_Rodux_0.Store.new(v7, {}, {
        v13.middleware({
            [v8] = v8.new(), 
            [v9] = v9.new(), 
            [v10] = v10.new(), 
            [v11] = v11.new(), 
            [v12] = v12.new()
        })
    });
end;
local _ = nil;
return {
    mountPurchasePrompt = not v15() and function()
        if not l_RunService_0:IsStudio() or not l_RunService_0:IsEdit() then
            return (l_Roact_0.mount(l_Roact_0.createElement(v6), l_CoreGui_0, "PurchasePromptApp"));
        else
            return nil;
        end;
    end or function()
        if not (l_RunService_0:IsStudio() and l_RunService_0:IsEdit()) and not v16 then
            v18();
            v16 = l_Roact_0.mount(l_Roact_0.createElement(v6, {
                store = v17
            }), l_CoreGui_0, "PurchasePromptApp");
            return v16;
        else
            return nil;
        end;
    end, 
    initiateAvatarCreationFeePurchase = if not v15() then nil else function(v20, v21, v22)
        if not v17 then
            error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted");
        end;
        v17:dispatch(v14(v20, v21, v22));
    end
};
