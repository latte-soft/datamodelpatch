local l_Parent_0 = script.Parent.Parent;
local l_Workspace_0 = game:GetService("Workspace");
local v2 = require(l_Parent_0.Actions.SetPromptState);
local v3 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_Parent_0.Enums.PromptState);
local v5 = require(l_Parent_0.Thunk);
return function()
    return v5.new(script.Name, {}, function(v6, _)
        local v8 = l_Workspace_0.DistributedGameTime - v6:getState().purchasingStartTime;
        v6:dispatch(v3());
        if v8 >= 1 then
            return v6:dispatch(v2(v4.PurchaseComplete));
        else
            delay(1 - v8, function()
                return v6:dispatch(v2(v4.PurchaseComplete));
            end);
            return ;
        end;
    end);
end;
