local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(script.Parent.triggerFeedback);
local v2 = require(script.Parent.InteractionFeedbackContext);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
local v4 = require(l_Parent_0.React);
return function()
    local v5 = v4.useContext(v2);
    local v6 = l_useInputType_0();
    if not v5 then
        error("useTriggerFeedback must be used within an InteractionFeedbackProvider");
    end;
    return (v4.useCallback(function(v7, v8)
        return v1(v7, v8, v5, v6);
    end, {
        v5, 
        v6
    }));
end;
