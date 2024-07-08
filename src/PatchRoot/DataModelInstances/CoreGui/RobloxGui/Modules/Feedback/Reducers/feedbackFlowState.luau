local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent.Parent;
return v2.createReducer({
    feedbackFlowState = require(l_Parent_0.Resources.Constants).State.Default, 
    feedbackReason = 0
}, {
    [require(l_Parent_0.Actions.SetFeedbackFlowState).name] = function(v4, v5)
        return v1.Dictionary.join(v4, {
            feedbackFlowState = v5.feedbackFlowState
        });
    end, 
    [require(l_Parent_0.Actions.SetFeedbackReason).name] = function(v6, v7)
        return v1.Dictionary.join(v6, {
            feedbackReason = v7.feedbackReason
        });
    end
});
