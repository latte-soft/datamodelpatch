local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_VerticalScrollView_0 = v5.App.Container.VerticalScrollView;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.Thunks.SendFeedbackThunk);
local v10 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v11 = require(l_Parent_0.Actions.SetFeedbackReason);
local v12 = require(l_Parent_0.Components.TextEntryField);
local v13 = require(l_Parent_0.Components.ModalDialog);
local v14 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RadioButtonList_0 = v5.App.InputButton.RadioButtonList;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v21 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments);
local v22 = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false);
local v23 = v2.PureComponent:extend("FeedbackReportDialog");
v23.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    screenSize = v4.Vector2, 
    closeDialog = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string)
});
v23.init = function(v24)
    if not v22 then
        v24.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0
        };
    else
        v24.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0, 
            isGenericSelection = false
        };
    end;
    v24.calculateFieldHeight = function(v25, v26, v27)
        if not (v25 < 180) or not v27 then
            return v26 * (v25 / 45 + 2);
        else
            return v26 * 5;
        end;
    end;
    v24.resetLocalState = function()
        if v22 then
            v24:setState({
                isGenericSelection = false
            });
        end;
        v24:setState({
            correctTranslationText = "", 
            additionalCommentsText = "", 
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = ""
        });
        v24.props.setFeedbackReason(0);
        l_ExperienceStateCaptureService_0:ResetHighlight();
    end;
    v24.setInstanceRelatedReportDialogState = function(v28)
        if not v28:isA("TextBox") then
            if not v28:isA("TextLabel") and not v28:isA("TextButton") then
                if v22 then
                    v24:setState({
                        feedbackText = v28.ClassName, 
                        feedbackOriginalText = v28.ClassName, 
                        feedbackIdentifier = "", 
                        isGenericSelection = true
                    });
                end;
            else
                v24:setState({
                    feedbackText = v28.Text, 
                    feedbackOriginalText = v28.LocalizationMatchedSourceText, 
                    feedbackIdentifier = v28.LocalizationMatchIdentifier
                });
                if v22 then
                    v24:setState({
                        isGenericSelection = false
                    });
                    return ;
                end;
            end;
        else
            v24:setState({
                feedbackText = v28.PlaceholderText, 
                feedbackOriginalText = v28.LocalizationMatchedSourceText, 
                feedbackIdentifier = v28.LocalizationMatchIdentifier
            });
            if v22 then
                v24:setState({
                    isGenericSelection = false
                });
                return ;
            end;
        end;
    end;
    l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Connect(function(v29)
        v24.resetLocalState();
        v24.setInstanceRelatedReportDialogState(v29);
        v24.props.setFeedbackFlowState(v8.State.CurrentlyLeavingFeedback);
    end);
    v24.onCorrectTranslationTextChanged = function(v30)
        v24:setState({
            correctTranslationText = v30
        });
    end;
    v24.onAdditionalCommentsTextChanged = function(v31)
        v24:setState({
            additionalCommentsText = v31
        });
    end;
    v24.onSubmitFeedback = function()
        v24:setState({
            numFeedbackSubmissionAttempts = v24.state.numFeedbackSubmissionAttempts + 1
        });
        v24.props.sendFeedback(v24.state.feedbackOriginalText, v24.state.feedbackText, v24.state.feedbackIdentifier, v24.state.correctTranslationText, v24.state.additionalCommentsText, v24.props.feedbackReason, v24.state.numFeedbackSubmissionAttempts);
        v24.resetLocalState();
        v24.props.setFeedbackFlowState(v8.State.Default);
    end;
    v24.onCancel = function()
        v24.resetLocalState();
        v24.props.setFeedbackFlowState(v8.State.Default);
    end;
end;
v23.renderContents = function(v32, v33)
    return l_withStyle_0(function(v34)
        local l_Theme_0 = v34.Theme;
        local l_Font_0 = v34.Font;
        local v37 = {
            v33.untranslated, 
            v33.accuracyIssue, 
            v33.spellingOrGrammarIssue, 
            v33.inappropriateOrDerogatory
        };
        if not v21() then
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = v2.createElement(v14, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, v32.calculateFieldHeight(string.len(v32.state.feedbackText), 18, false)), 
                    Text = if not v22 then v32.state.feedbackText or "" else if not v32.state.isGenericSelection then v32.state.feedbackText else v33.genericSelectionWrapper or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 4, 
                    enabled = true, 
                    text = v32.state.correctTranslationText, 
                    textChanged = v32.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v32.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v33.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v32.calculateFieldHeight(string.len(v32.state.correctTranslationText), 18, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v32.state.additionalCommentsText, 
                    textChanged = v32.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v33.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                    radioButtons = v37, 
                    onActivated = function(v38)
                        v32.props.setFeedbackReason(v38);
                    end, 
                    currentValue = v32.props.feedbackReason, 
                    elementSize = UDim2.new(1, 0, 0, 40), 
                    layoutOrder = 8
                })
            });
        else
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = v2.createElement(v14, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, 0, 0, v32.calculateFieldHeight(string.len(v32.state.feedbackText), 14, false)), 
                    Text = if not v22 then v32.state.feedbackText or "" else if not v32.state.isGenericSelection then v32.state.feedbackText else v33.genericSelectionWrapper or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                TranslationProblemsListFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 160), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                        radioButtons = v37, 
                        onActivated = function(v39)
                            v32.props.setFeedbackReason(v39);
                        end, 
                        currentValue = v32.props.feedbackReason, 
                        elementSize = UDim2.new(1, 0, 0, 40)
                    })
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v32.state.correctTranslationText, 
                    textChanged = v32.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v32.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v33.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v32.calculateFieldHeight(string.len(v32.state.correctTranslationText), 14, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v33.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 8, 
                    enabled = true, 
                    text = v32.state.additionalCommentsText, 
                    textChanged = v32.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v33.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                })
            });
        end;
    end);
end;
v23.render = function(v40)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader", 
        cancel = "CoreScripts.Feedback.FeedbackReportDialog.Cancel", 
        submitFeedback = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback", 
        untranslated = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated", 
        accuracyIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue", 
        spellingOrGrammarIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue", 
        inappropriateOrDerogatory = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory", 
        textSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.TextSelectionHeader", 
        correctTranslationHeader = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationHeader", 
        correctTranslationPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationPlaceholder", 
        additionalCommentsHeader = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsHeader", 
        additionalCommentsPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsPlaceholder", 
        problemDropdownSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ProblemDropdownSelectionHeader", 
        genericSelectionWrapper = {
            "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationObjectPlaceholder"; 
            ObjectType = v40.state.feedbackText
        }
    })(function(v41)
        return v2.createElement(v13, {
            visible = v40.props.feedbackFlowState == v8.State.CurrentlyLeavingFeedback, 
            screenSize = v40.props.screenSize, 
            titleText = v41.mainHeader, 
            showCloseButton = not not v21() or false, 
            contents = v2.createElement(l_VerticalScrollView_0, {
                useAutomaticCanvasSize = false, 
                canvasSizeY = if not v21() then UDim.new(1, 550) else UDim.new(0, 600 + v40.calculateFieldHeight(string.len(v40.state.feedbackText), 14, false) * 2)
            }, v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Contents = v40:renderContents(v41)
            })), 
            actionButtons = v2.createElement(l_ButtonStack_0, {
                buttonHeight = 36, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v40.onCancel, 
                            text = v41.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = v40.onSubmitFeedback, 
                            text = v41.submitFeedback
                        }
                    }
                }
            }), 
            onDismiss = v40.onCancel, 
            onBackButtonActivated = if not v40.props.canNavigateBack then nil else v40.navigateBack
        });
    end);
end;
return v3.connect(function(v42)
    return {
        screenSize = v42.displayOptions.screenSize, 
        feedbackFlowState = v42.feedbackFlowState.feedbackFlowState, 
        feedbackReason = v42.feedbackFlowState.feedbackReason
    };
end, function(v43)
    return {
        sendFeedback = function(v44, v45, v46, v47, v48, v49, v50)
            v43(v9(v44, v45, v46, v47, v48, v49, v50));
        end, 
        setFeedbackFlowState = function(v51)
            v43(function(v52)
                v52:dispatch(v10(v51));
            end);
        end, 
        setFeedbackReason = function(v53)
            v43(function(v54)
                v54:dispatch(v11(v53));
            end);
        end
    };
end)(v23);
