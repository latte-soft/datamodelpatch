local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Thunks.retryAfterUpsell);
local v4 = require(l_Parent_0.connectToStore);
local v5 = require(script.Parent.ExternalEventConnection);
return (v4(nil, function(v6)
    return {
        onBrowserWindowClosed = function()
            v6(v3());
        end
    };
end)(function(v7)
    return l_Roact_0.createElement(v5, {
        event = l_GuiService_0.BrowserWindowClosed, 
        callback = v7.onBrowserWindowClosed
    });
end));
