local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local l_FeedbackManagerInjectionContext_0 = require(l_Parent_0.UIBlox).Core.Control.FeedbackManagerInjectionContext;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useTriggerFeedback);
return function(v4)
    return v2.createElement(l_FeedbackManagerInjectionContext_0.Provider, {
        value = v3()
    }, v4.children);
end;
