local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.ErrorOccurred);
local v2 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local _ = require(l_Parent_0.Actions.SetWindowState);
local v4 = require(l_Parent_0.Actions.SetPromptState);
local v5 = require(l_Parent_0.Enums.PromptState);
local _ = require(l_Parent_0.Enums.WindowState);
local v7 = require(l_Parent_0.Network.performSubscriptionPurchase);
local v8 = require(l_Parent_0.Services.ExternalSettings);
local v9 = require(l_Parent_0.Services.Network);
local v10 = require(l_Parent_0.Thunk);
local v11 = require(l_Parent_0.Thunks.hideWindow);
local v12 = {
    v8, 
    v9
};
return function(v13)
    return v10.new(script.Name, v12, function(v14, v15)
        local v16 = v15[v8];
        local v17 = v15[v9];
        if not v16.isStudio() then
            v7(v17, v14:getState().promptRequest.id, v13):catch(function(v18)
                v14:dispatch(v1(v18));
            end);
            v14:dispatch(v4(v5.UpsellInProgress));
            v14:dispatch(v11());
            return nil;
        else
            v14:dispatch(v2());
            v14:dispatch(v11());
            return nil;
        end;
    end);
end;
