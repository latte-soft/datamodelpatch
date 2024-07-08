local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackOnboardingModal);
local v6 = require(l_Parent_0.Actions.IncrementFeedbackSubmissionAttempts);
local v7 = require(l_Parent_0.Actions.ShowHelpModal);
local v8 = nil;
if v5 then
    v8 = require(l_Parent_0.Actions.ShowOnboardingModal);
end;
if not v5() then
    return v3.createReducer({
        numFeedbackSubmissionAttempts = nil, 
        showHelpModal = true
    }, {
        [v6.name] = function(v9, v10)
            return v2.Dictionary.join(v9, {
                numFeedbackSubmissionAttempts = v10.numFeedbackSubmissionAttempts
            });
        end, 
        [v7.name] = function(v11, v12)
            return v2.Dictionary.join(v11, {
                showHelpModal = v12.helpModalVisible
            });
        end
    });
else
    return v3.createReducer({
        numFeedbackSubmissionAttempts = nil, 
        showHelpModal = false, 
        showOnboardingModal = true
    }, {
        [v6.name] = function(v13, v14)
            return v2.Dictionary.join(v13, {
                numFeedbackSubmissionAttempts = v14.numFeedbackSubmissionAttempts
            });
        end, 
        [v7.name] = function(v15, v16)
            return v2.Dictionary.join(v15, {
                showHelpModal = v16.helpModalVisible
            });
        end, 
        [v8.name] = function(v17, v18)
            return v2.Dictionary.join(v17, {
                showOnboardingModal = v18.onboardingModalVisible
            });
        end
    });
end;
