local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
return function()
    local v2 = {};
    local v3 = {};
    v2.actionsUpdateSignal = l_Utility_0.Signal();
    local function _(v4)
        v2.actionsUpdateSignal:fire(v4);
    end;
    v2.BindAction = function(_, v7, v8, v9, v10)
        if v10 then
            l_ContextActionService_0:UnbindCoreAction(v8);
            l_ContextActionService_0:BindCoreAction(v7, v10, false, v8);
            v3[v7] = {
                id = v7, 
                text = v9, 
                keyCode = v8
            };
            v2.actionsUpdateSignal:fire(v3);
            return ;
        else
            return ;
        end;
    end;
    v2.UnbindAction = function(_, v12)
        l_ContextActionService_0:UnbindCoreAction(v12);
        v3[v12] = nil;
        v2.actionsUpdateSignal:fire(v3);
    end;
    v2.UnbindAllActions = function(_)
        for _, v15 in pairs(v3) do
            l_ContextActionService_0:UnbindCoreAction(v15.id);
            v3[v15.id] = nil;
        end;
        v2.actionsUpdateSignal:fire(v3);
    end;
    return v2;
end;
