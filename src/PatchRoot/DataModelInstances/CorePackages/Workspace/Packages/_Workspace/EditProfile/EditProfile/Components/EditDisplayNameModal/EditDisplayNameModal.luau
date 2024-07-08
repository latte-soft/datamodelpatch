local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_CallbackInputBox_0 = v3.SocialLibraries.config({}).Components.CallbackInputBox;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v16.clearTimeout;
local l_setTimeout_0 = v16.setTimeout;
local v19 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v20 = require(l_script_FirstAncestor_0.Flags.InternationalNamesIXP);
local v21 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v21.EventNames;
local l_useAnalytics_0 = v21.useAnalytics;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 = require(l_Parent_0.SharedFlags).FFlagCountUTF8CharactersInAliasAndDisplayName;
local v26 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local v27 = game:DefineFastInt("EditProfileModalNetworkDelay", 500);
return function(v28)
    local v29 = v4.useRef(nil);
    local v30 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v30 = v26();
    end;
    local v31, v32 = v4.useState(v28.initialText);
    local v33 = if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.len(v31) else utf8.len(v31) or 0;
    local v34 = l_useLocalization_0({
        cancelButtonText = v15.CancelButtonText, 
        saveButtonText = v15.SaveButtonText, 
        displayNameFailed = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v15.DisplayNameError else nil, 
        displayNameTooShort = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v15.DisplayNameTooShort else nil
    });
    local v35 = if not v19.useIsExperimentEnabled() then nil else l_useAnalytics_0();
    local v36 = l_useStyle_0();
    local l_Font_0 = v36.Font;
    local l_Theme_0 = v36.Theme;
    local v39 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v40, v41 = v4.useState(true);
    local v42, v43 = v4.useState(false);
    local v44, v45 = v4.useState(if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v34.displayNameFailed else v30.displayNameChangeError);
    local v46 = v4.useRef(l_setTimeout_0(function()
    end, v27));
    local v47 = v4.useRef(false);
    local function _(v48)
        if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
            return v34.displayNameFailed;
        elseif v48 == v14.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination then
            return v30.displayNameChangeMixedCharactersError;
        else
            return v30.displayNameChangeError;
        end;
    end;
    local function v58(v50)
        if not (not (v20.FFlagIsSetupEnabled() and v50 ~= v28.initialText) or v47.current) then
            v47.current = true;
            v20.logExposure();
        end;
        l_clearTimeout_0(v46.current);
        v41(false);
        local v51 = if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.len(v50) else utf8.len(v50);
        if l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 and v51 == nil then
            return ;
        elseif v51 < 3 then
            if v35 then
                v35.fireAnalyticsEvent(l_EventNames_0.DisplayNameTooShort, {
                    displayName = v50
                });
            end;
            v45(if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v34.displayNameTooShort else v30.displayNameTooShortError);
            v43(true);
            v32(v50);
            return ;
        elseif v51 > 20 then
            v50 = if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.sub(v50, 1, 20) else if v33 == 20 then v31 else string.sub(v50, 1, utf8.offset(v50, 21) - 1);
            v51 = 20;
            if not (not v29 or not v29.current) then
                v29.current.Text = v50;
            end;
            v32(v50);
            return ;
        else
            v32(v50);
            v46.current = l_setTimeout_0(function()
                v28.validateDisplayName(v50):andThen(function(_)
                    v43(false);
                    v41(true);
                end):catch(function(v53)
                    local v54 = nil;
                    if v20.FFlagIsSetupEnabled() then
                        local l_status_0, l_result_0 = pcall(function()
                            return l_HttpService_0:JSONDecode(v53.Body);
                        end);
                        local v57 = -1;
                        if l_status_0 then
                            v57 = ((not not l_result_0 and l_result_0.errors) and l_result_0.errors[1]) and l_result_0.errors[1].code or -1;
                        end;
                        v54 = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v34.displayNameFailed else if v57 == v14.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination then v30.displayNameChangeMixedCharactersError else v30.displayNameChangeError;
                    end;
                    if v35 then
                        v35.fireAnalyticsEvent(l_EventNames_0.FilteredDisplayName, {
                            displayName = v50
                        });
                    end;
                    v45(if not v20.FFlagIsSetupEnabled() then if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v30.displayNameChangeError else v34.displayNameFailed else v54);
                    v43(true);
                end);
            end, v27);
            return ;
        end;
    end;
    return v4.createElement(l_InteractiveAlert_0, {
        title = v28.title, 
        screenSize = v28.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, 117), 
        middleContent = function()
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                InputGroup = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Description = v4.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = v28.description, 
                        TextSize = 14, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        RichText = true
                    }), 
                    Padding = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 24), 
                        LayoutOrder = 2
                    }), 
                    InputBackground = v4.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v39 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v39 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if not v42 then l_Theme_0.Divider.Color else l_Theme_0.Alert.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = v4.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = v4.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v39, 
                                initialInputText = v28.initialText, 
                                placeholderText = v28.initialText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v58, 
                                inputBoxRef = v29
                            })
                        })
                    }), 
                    AdditonalPadding = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8), 
                        LayoutOrder = 4
                    }), 
                    Counter = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 5
                    }, {
                        v4.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = if not v42 then string.format("%d/%d", v33, 20) else v44, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = if not (v33 ~= 20) or v42 then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                            TextTransparency = if not (v33 ~= 20) or v42 then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                            AnchorPoint = if not v42 then Vector2.new(1, 0) else nil, 
                            Position = if not v42 then UDim2.fromScale(1, 0) else nil, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }, {
                            UISizeConstraint = v4.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(math.huge, (l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize) * 2)
                            })
                        })
                    })
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v28.cancelOnActivated, 
                        text = v34.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            if v31 == v28.initialText then
                                v28.cancelOnActivated();
                                return ;
                            else
                                v28.saveOnActivated(v31);
                                return ;
                            end;
                        end, 
                        text = v34.saveButtonText, 
                        isDisabled = not v40
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;
