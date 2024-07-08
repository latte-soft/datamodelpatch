local l_Parent_0 = script.Parent.Parent;
local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local v2 = require(l_Parent_0.Actions.SetPromptState);
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Actions.ErrorOccurred);
local v5 = require(l_Parent_0.Actions.StartPurchase);
local v6 = require(l_Parent_0.Actions.PromptNativeUpsell);
local v7 = require(l_Parent_0.Actions.SetWindowState);
local v8 = require(l_Parent_0.Enums.WindowState);
local v9 = require(l_Parent_0.Enums.PromptState);
return l_Rodux_0.createReducer(v8.Hidden, {
    [v2.name] = function(_, v11)
        if v11.promptState == v9.None then
            return v8.Hidden;
        else
            return v8.Shown;
        end;
    end, 
    [v7.name] = function(_, v13)
        return v13.state;
    end, 
    [v4.name] = function(_, _)
        return v8.Shown;
    end, 
    [v5.name] = function(_, _)
        return v8.Shown;
    end, 
    [v6.name] = function(_, _)
        return v8.Shown;
    end, 
    [v3.name] = function(_, _)
        return v8.Hidden;
    end
});
