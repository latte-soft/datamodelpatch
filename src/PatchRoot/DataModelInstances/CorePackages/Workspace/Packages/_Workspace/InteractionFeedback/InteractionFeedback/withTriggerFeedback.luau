local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useTriggerFeedback);
return function(v4)
    return function(v5)
        return v2.createElement(v4, (v1.Dictionary.join(v5, {
            triggerFeedback = v3()
        })));
    end;
end;
