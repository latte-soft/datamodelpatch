local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.Otter);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.FitChildren);
local v8 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v9 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_AuthStatefulRoundCornerBorder_0 = v9.Components.AuthStatefulRoundCornerBorder;
local l_PasswordBox_0 = v9.Components.PasswordBox;
local l_GenericTextBox_0 = v9.Components.GenericTextBox;
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.IssueTracker);
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local v15 = require(l_Modules_0.LuaApp.Enum.InputValidity);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnable10ftSignUpView);
local v17 = v2.PureComponent:extend("CollapsingTextInputValidator");
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionExperimentEnabled);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSignupPlaceholderColorFix);
local l_GetFFlagEnableAuthStatefulTextInputUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuthStatefulTextInputUpdates;
local v21 = require(script.Parent.Flags.FFlagSignUpTrackFailedRequest);
local v22 = game:DefineFastFlag("SignupAddLoadingSpinner", false);
local v23 = game:DefineFastFlag("SignupCollapsingTextValidatorPaddingBottomOverride", false);
v17.defaultProps = {
    prerequisiteMet = true, 
    captureFocusOnTapStart = true
};
v17.init = function(v24)
    v24.state = {
        inputTextToValidate = "", 
        validatedInputText = "", 
        isInputTextValid = v15.Unvalidated, 
        interactionBegan = false, 
        textBoxFocused = false, 
        textBoxHover = false, 
        issueSummaryHeight = 0, 
        issueFullListHeight = 0
    };
    v24.isMounted = false;
    v24.frameRef = v2.createRef();
    v24.getFrameRef = function()
        return v24.props.frameRef or v24.frameRef;
    end;
    local v25, v26 = v2.createBinding(1);
    v24.issueSummaryTextTransparency = v25;
    v24.updateIssueSummaryTextTransparency = v26;
    v25, v26 = v2.createBinding(1);
    v24.issueFullListTextTransparency = v25;
    v24.updateIssueFullListTextTransparency = v26;
    v25, v26 = v2.createBinding(1);
    v24.issueCheckmarkTransparency = v25;
    v24.updateIssueCheckmarkTransparency = v26;
    v25, v26 = v2.createBinding(UDim2.new(1, 0, 0, 0));
    v24.issueTrackerHeight = v25;
    v24.updateIssueTrackerHeight = v26;
    v24.springOptions = {
        frequency = 3
    };
    v24.onSizeChange = function(v27, v28)
        local l_AbsoluteSize_0 = v28.AbsoluteSize;
        if l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0 then
            spawn(function()
                if v24.isMounted then
                    v24:setState({
                        [v27] = l_AbsoluteSize_0.Y
                    });
                end;
            end);
        end;
    end;
    v24.onIssueSummarySizeChange = function(v30)
        v24.onSizeChange("issueSummaryHeight", v30);
    end;
    v24.onIssueFullListSizeChange = function(v31)
        v24.onSizeChange("issueFullListHeight", v31);
    end;
    v24.textInputChangedCallback = function(v32)
        spawn(function()
            if v24.isMounted then
                local l_Text_0 = v32.Text;
                local l_onInputTextChanged_0 = v24.props.onInputTextChanged;
                if l_onInputTextChanged_0 then
                    l_onInputTextChanged_0(l_Text_0, v15.Unvalidated);
                end;
                v24:setState({
                    inputTextToValidate = l_Text_0, 
                    isInputTextValid = v15.Unvalidated, 
                    interactionBegan = true
                });
            end;
        end);
    end;
    v24.onTextValidated = function(v35, v36, v37)
        spawn(function()
            if v24.isMounted and v24.state.inputTextToValidate == v35 then
                local l_onInputTextValidated_0 = v24.props.onInputTextValidated;
                if l_onInputTextValidated_0 then
                    if not v21 then
                        l_onInputTextValidated_0(v35, v36);
                    else
                        l_onInputTextValidated_0(v35, v36, v37);
                    end;
                end;
                v24:setState({
                    validatedInputText = v35, 
                    isInputTextValid = v36
                });
            end;
        end);
    end;
    v24.onTextInputBoxFocused = function()
        spawn(function()
            if v24.isMounted then
                local v39 = v24.getFrameRef();
                if not (not v24.props.textBoxFocusedCallback or not v39.current) then
                    v24.props.textBoxFocusedCallback(v39.current.AbsolutePosition);
                end;
                v24:setState({
                    textBoxFocused = true
                });
            end;
        end);
    end;
    v24.onMouseEnter = function()
        if v24.isMounted then
            v24:setState({
                textBoxHover = true
            });
        end;
    end;
    v24.onMouseLeave = function()
        if v24.isMounted then
            v24:setState({
                textBoxHover = false
            });
        end;
    end;
    v24.onTextInputBoxFocusLost = function()
        spawn(function()
            if v24.isMounted then
                if v24.props.textBoxFocusLostCallback then
                    v24.props.textBoxFocusLostCallback();
                end;
                v24:setState({
                    textBoxFocused = false
                });
            end;
        end);
    end;
    v24.onPositionChanged = function()
        spawn(function()
            if not (not v24.isMounted or not v24.state.textBoxFocused) then
                local v40 = v24.getFrameRef();
                if not (not v24.props.focusedTextBoxPositionChangedCallback or not v40.current) then
                    v24.props.focusedTextBoxPositionChangedCallback(v40.current.AbsolutePosition);
                end;
            end;
        end);
    end;
    v24.isInErrorState = function()
        if not v21 or not v24.props.hasFieldFailed then
            if v24.props.prerequisiteMet then
                if v24.state.inputTextToValidate == "" then
                    return false;
                elseif v24.state.isInputTextValid == v15.Invalid then
                    return v24.state.interactionBegan;
                else
                    return false;
                end;
            else
                return v24.state.textBoxFocused or v24.state.interactionBegan and v24.state.inputTextToValidate ~= "";
            end;
        else
            return true;
        end;
    end;
    v24.textInputBoxWithBorder = function()
        return l_withStyle_0(function(v41)
            local l_tokens_0 = v24.props.tokens;
            local l_Font_0 = v41.Font.Body.Font;
            local v44 = v41.Font.BaseSize * v41.Font.Body.RelativeSize;
            if not (not v16() or not l_tokens_0) then
                v44 = l_tokens_0.textBodySize;
            end;
            local l_Color_0 = v41.Theme.TextDefault.Color;
            local l_Transparency_0 = v41.Theme.TextDefault.Transparency;
            local l_Color_1 = v41.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v41.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v41.Theme.UIDefault.Color;
            local l_placeholderText_0 = v24.props.placeholderText;
            local l_textInputType_0 = v24.props.textInputType;
            local l_returnKeyType_0 = v24.props.returnKeyType;
            local v53 = v24.props.prefilledText or "";
            if l_textInputType_0 == Enum.TextInputType.Password then
                return v2.createElement(l_PasswordBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextSize = v44, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = "", 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor3 = not v19() and l_Color_2 or nil, 
                    PlaceholderColor = not not v19() and l_Color_2 or nil, 
                    ReturnKeyType = l_returnKeyType_0, 
                    ManualFocusRelease = false, 
                    CaptureFocusOnTapStart = v24.props.captureFocusOnTapStart, 
                    Disabled = v24.props.disabled, 
                    onChangeText = v24.textInputChangedCallback, 
                    onFocused = v24.onTextInputBoxFocused, 
                    onFocusLost = v24.onTextInputBoxFocusLost, 
                    onMouseEnter = v24.onMouseEnter, 
                    onMouseLeave = v24.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v24.props.onReturnPressedFromOnScreenKeyboard, 
                    IsKeyboardOverlayUsed = v24.props.IsKeyboardOverlayUsed, 
                    TextBoxRef = v24.props.textBoxRef, 
                    CentralOverlayBlocksInput = v24.props.centralOverlayBlocksInput, 
                    hidePassword = v24.props.hidePassword, 
                    onToggleCallback = v24.props.onToggleCallback
                });
            else
                return v2.createElement(l_GenericTextBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v53, 
                    Font = l_Font_0, 
                    TextSize = v44, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ClearTextOnFocus = false, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextInputType = l_textInputType_0, 
                    ReturnKeyType = l_returnKeyType_0, 
                    PaddingX = 12, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor = not not v19() and l_Color_2 or nil, 
                    onChangeText = v24.textInputChangedCallback, 
                    onFocused = v24.onTextInputBoxFocused, 
                    onFocusLost = v24.onTextInputBoxFocusLost, 
                    onMouseEnter = v24.onMouseEnter, 
                    onMouseLeave = v24.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v24.props.onReturnPressedFromOnScreenKeyboard, 
                    TextBoxRef = v24.props.textBoxRef
                });
            end;
        end);
    end;
end;
v17.didMount = function(v54)
    v54.isMounted = true;
    v54.motor = v3.createGroupMotor({
        issueSummaryTextTransparency = 1, 
        issueFullListTextTransparency = 1, 
        issueCheckmarkTransparency = 1, 
        issueTrackerHeight = 0
    });
    v54.motor:onStep(function(v55)
        v54.updateIssueSummaryTextTransparency(v55.issueSummaryTextTransparency);
        v54.updateIssueFullListTextTransparency(v55.issueFullListTextTransparency);
        v54.updateIssueCheckmarkTransparency(v55.issueCheckmarkTransparency);
        v54.updateIssueTrackerHeight(UDim2.new(1, 0, 0, v55.issueTrackerHeight));
    end);
    v54.motor:onComplete(function()
        if v54.props.onAnimationStateChangeCallback then
            v54.props.onAnimationStateChangeCallback(v54.props.textInputType, false);
        end;
    end);
    v54.motor:start();
    local l_prefilledText_0 = v54.props.prefilledText;
    if l_prefilledText_0 and l_prefilledText_0 ~= "" then
        v54:setState({
            inputTextToValidate = l_prefilledText_0, 
            isInputTextValid = v15.Unvalidated, 
            interactionBegan = false
        });
    end;
end;
v17.didUpdate = function(v57, _, v59)
    local l_textBoxFocused_0 = v57.state.textBoxFocused;
    local l_issueSummaryHeight_0 = v57.state.issueSummaryHeight;
    local l_issueFullListHeight_0 = v57.state.issueFullListHeight;
    local l_showDetailedError_0 = v57.props.showDetailedError;
    local v64 = v59.validatedInputText ~= "";
    local v65 = not l_textBoxFocused_0 or not v57.props.prerequisiteMet;
    local v66 = v57.state.validatedInputText ~= "";
    local v67 = v57.isInErrorState();
    local v68 = nil;
    local v69 = v18();
    if not (not l_showDetailedError_0 or not v67) then
        v65 = false;
        v66 = true;
    end;
    v68 = if l_textBoxFocused_0 or l_showDetailedError_0 and v67 then if v57.props.prerequisiteMet then l_issueFullListHeight_0 else l_issueSummaryHeight_0 else if v67 then l_issueSummaryHeight_0 else 0;
    local v70 = false;
    if not (not v69 or not v57.props.pillClicked) then
        l_issueSummaryHeight_0 = 0;
        v68 = 0;
        v57.props.resetPillClicked();
        v70 = true;
    end;
    if (l_textBoxFocused_0 == v59.textBoxFocused and v64 == v66) and (not l_showDetailedError_0 or not v67) then
        if not (l_issueSummaryHeight_0 == v59.issueSummaryHeight) or l_issueFullListHeight_0 ~= v59.issueFullListHeight then
            if not v69 or not v70 then
                v57.motor:setGoal({
                    issueTrackerHeight = v3.instant(v68)
                });
            else
                v57.motor:setGoal({
                    issueTrackerHeight = v3.spring(v68, v57.springOptions)
                });
            end;
            if v57.props.onAnimationStateChangeCallback then
                v57.props.onAnimationStateChangeCallback(v57.props.textInputType, true);
            end;
        end;
    else
        v57.motor:setGoal({
            issueSummaryTextTransparency = v3.spring(not v65 and 1 or 0, v57.springOptions), 
            issueFullListTextTransparency = v3.spring(not v65 and 0 or 1, v57.springOptions), 
            issueCheckmarkTransparency = v3.spring(not v66 and 1 or 0, v57.springOptions), 
            issueTrackerHeight = v3.spring(v68, v57.springOptions)
        });
        if v57.props.onAnimationStateChangeCallback then
            v57.props.onAnimationStateChangeCallback(v57.props.textInputType, true);
            return ;
        end;
    end;
end;
v17.willUnmount = function(v71)
    v71.isMounted = false;
    v71.motor:destroy();
end;
v17.render = function(v72)
    local l_layoutOrder_0 = v72.props.layoutOrder;
    local l_titleTextKey_0 = v72.props.titleTextKey;
    local l_summaryErrorTextKey_0 = v72.props.summaryErrorTextKey;
    local l_validator_0 = v72.props.validator;
    local l_validatorAdditionalProps_0 = v72.props.validatorAdditionalProps;
    local l_inputTextToValidate_0 = v72.state.inputTextToValidate;
    local l_tokens_1 = v72.props.tokens;
    if not v72.props.prerequisiteMet then
        l_inputTextToValidate_0 = "";
    end;
    local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
    if not v72.isInErrorState() then
        if not v72.state.textBoxFocused then
            if v72.state.textBoxHover then
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Hover;
            end;
        else
            l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
        end;
    else
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
    end;
    return l_withStyle_0(function(v81)
        local v82 = v81.Font.BaseSize * v81.Font.CaptionHeader.RelativeSize;
        local v83 = 5;
        local v84 = 36;
        if not (not v16() or not l_tokens_1) then
            v83 = l_tokens_1.boxPadding;
            v82 = l_tokens_1.textCaptionHeaderSize;
            v84 = l_tokens_1.textboxHeight;
        end;
        return v6({
            titleText = l_titleTextKey_0, 
            summaryErrorText = l_summaryErrorTextKey_0
        })(function(v85)
            return v2.createElement(v7.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v7.FitAxis.Height, 
                BackgroundTransparency = 1, 
                [v2.Ref] = v72.getFrameRef(), 
                [v2.Change.AbsolutePosition] = v72.onPositionChanged
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v83)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, if not not v23 and v72.props.paddingBottomOverride then v72.props.paddingBottomOverride else 5)
                }), 
                Title = v2.createElement(v8, {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v85.titleText or "", 
                    TextWrapped = true, 
                    Font = v81.Font.CaptionHeader.Font, 
                    TextSize = v82, 
                    TextColor3 = v81.Theme.TextEmphasis.Color, 
                    TextTransparency = v81.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TextInputBox = v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
                    size = UDim2.new(1, 0, 0, if not not v16() and l_tokens_1 then l_tokens_1.textboxHeight else 36), 
                    layoutOrder = 1, 
                    borderState = l_Default_0
                }, {
                    textbox = v2.createElement(v72.textInputBoxWithBorder), 
                    loadingSpinner = if not not v22 and v72.props.shouldShowLoadingIcon then v2.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(16, 16), 
                        position = UDim2.new(1, -22, 0.5, 0), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    }) else nil
                }), 
                AnimatedWrapper = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    Size = v72.issueTrackerHeight
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, 12), 
                        PaddingLeft = if not l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then UDim.new(0, 12) else UDim.new(0, 0)
                    }), 
                    IssueSummaryWrapper = v2.createElement(v7.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v7.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v2.Change.AbsoluteSize] = v72.onIssueSummarySizeChange
                    }, {
                        IssueSummaryText = v72.isInErrorState() and v2.createElement(v8, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v7.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            Text = v85.summaryErrorText or "", 
                            TextWrapped = true, 
                            Font = v81.Font.CaptionBody.Font, 
                            TextSize = v81.Font.BaseSize * v81.Font.CaptionBody.RelativeSize, 
                            TextColor3 = v81.Theme.Alert.Color, 
                            TextTransparency = v72.issueSummaryTextTransparency, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }), 
                    IssueTrackerWrapper = v2.createElement(v7.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v7.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v2.Change.AbsoluteSize] = v72.onIssueFullListSizeChange
                    }, {
                        IssueTracker = v2.createElement(v13, {
                            validator = l_validator_0, 
                            validatorAdditionalProps = l_validatorAdditionalProps_0, 
                            textToValidate = l_inputTextToValidate_0, 
                            onTextValidated = v72.onTextValidated, 
                            contentTransparency = v72.issueFullListTextTransparency, 
                            checkmarkTransparency = v72.issueCheckmarkTransparency, 
                            updateIssueCondition = v72.props.updateIssueCondition, 
                            debounceTime = if not v21 then nil else v72.props.debounceTime
                        })
                    })
                })
            });
        end);
    end);
end;
return v17;
