local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = v3.Core.Style.withStyle;
local v8 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v9 = require(l_Parent_0.Actions.SetScreenSize);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Parent_0.Resources.Assets);
local v12 = require(l_Parent_0.Components.FeedbackReportDialog);
local v13 = require(l_Parent_0.Components.RefinedFeedbackBar);
local v14 = require(l_Parent_0.Components.FeedbackSubmissionToast);
local v15 = require(l_Parent_0.Components.HelpModal);
local v16 = game:DefineFastFlag("EnableFeedbackModeBottomBarTextFixes", false);
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackOnboardingModal);
local v18 = nil;
if v17() then
    v18 = require(l_Parent_0.Components.OnboardingModal);
end;
local v19 = v1.PureComponent:extend("FeedbackApp");
v19.validateProps = v4.strictInterface({
    setScreenGuiSize = v4.callback
});
v19.render = function(v20)
    if not v17() then
        return v1.createElement(v3.Core.Style.Provider, {}, {
            Gui = v1.createElement("ScreenGui", {
                AutoLocalize = false, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                [v1.Change.AbsoluteSize] = v20.props.setScreenGuiSize
            }, {
                ScreenFrame = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 10
                }, {
                    FeedbackSubmissionToast = v1.createElement(v14), 
                    HelpModal = v1.createElement(v15), 
                    FeedbackReportDialog = v1.createElement(v12)
                }), 
                RefinedFeedbackBar = l_withLocalization_0({
                    feedbackBarText = not v16 and "CoreScripts.Feedback.EntryPoint.MenuLabel" or "CoreScripts.Feedback.FeedbackBar.MainLabel"
                })(function(v21)
                    return l_withStyle_0(function(v22)
                        local l_Font_0 = v22.Font;
                        return v1.createElement(v13, {
                            leftHint = {
                                text = v21.feedbackBarText, 
                                hintTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                                maxWidth = 200, 
                                icon = v11.Images.FeedbackBarHintIcon
                            }
                        }, {});
                    end);
                end)
            })
        });
    else
        return v1.createElement(v3.Core.Style.Provider, {}, {
            Gui = v1.createElement("ScreenGui", {
                AutoLocalize = false, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                [v1.Change.AbsoluteSize] = v20.props.setScreenGuiSize
            }, {
                ScreenFrame = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 10
                }, {
                    FeedbackSubmissionToast = v1.createElement(v14), 
                    HelpModal = v1.createElement(v15), 
                    OnboardingModal = v1.createElement(v18), 
                    FeedbackReportDialog = v1.createElement(v12)
                }), 
                RefinedFeedbackBar = l_withLocalization_0({
                    feedbackBarText = not v16 and "CoreScripts.Feedback.EntryPoint.MenuLabel" or "CoreScripts.Feedback.FeedbackBar.MainLabel"
                })(function(v24)
                    return l_withStyle_0(function(v25)
                        local l_Font_1 = v25.Font;
                        return v1.createElement(v13, {
                            leftHint = {
                                text = v24.feedbackBarText, 
                                hintTextSize = l_Font_1.BaseSize * l_Font_1.Body.RelativeSize, 
                                maxWidth = 200, 
                                icon = v11.Images.FeedbackBarHintIcon
                            }
                        }, {});
                    end);
                end)
            })
        });
    end;
end;
return v2.connect(function()
end, function(v27)
    return {
        setScreenGuiSize = function(v28)
            v27(v9(v28.AbsoluteSize));
        end, 
        setFeedbackFlowState = function(v29)
            v27(function(v30)
                v30:dispatch(v8(v29));
            end);
        end
    };
end)(v19);
