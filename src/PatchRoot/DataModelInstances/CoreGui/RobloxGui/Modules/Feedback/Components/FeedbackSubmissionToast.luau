local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Toast_0 = v3.App.Dialog.Toast;
local l_Images_0 = v3.App.ImageSet.Images;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = v1.PureComponent:extend("FeedbackSubmissionToast");
v8.validateProps = v4.strictInterface({
    numFeedbackSubmissionAttempts = v4.optional(v4.number)
});
v8.render = function(v9)
    if v9.props.numFeedbackSubmissionAttempts == nil then
        return nil;
    else
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 100
        }, {
            Toast = l_withLocalization_0({
                toastTitle = "CoreScripts.Feedback.SubmissionToastHeader", 
                toastSubtitle = "CoreScripts.Feedback.SubmissionToastBody"
            })(function(v10)
                local l_toastTitle_0 = v10.toastTitle;
                local l_toastSubtitle_0 = v10.toastSubtitle;
                if v9.props.numFeedbackSubmissionAttempts % 2 == 0 then
                    l_toastTitle_0 = v10.toastTitle .. " ";
                    l_toastSubtitle_0 = v10.toastSubtitle .. " ";
                end;
                return v1.createElement(l_Toast_0, {
                    duration = 3, 
                    toastContent = {
                        iconImage = l_Images_0["icons/status/success"], 
                        toastTitle = l_toastTitle_0, 
                        toastSubtitle = l_toastSubtitle_0
                    }
                });
            end)
        });
    end;
end;
return v2.connect(function(v13)
    return {
        numFeedbackSubmissionAttempts = v13.common.numFeedbackSubmissionAttempts
    };
end, nil)(v8);
