local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v4.EventNames;
local l_useAnalytics_0 = v4.useAnalytics;
local l_React_0 = v2.React;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_RoactFitComponents_0 = v2.RoactFitComponents;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_CallbackInputBox_0 = l_SocialLibraries_0.Components.CallbackInputBox;
local l_UplevelAliasIXP_0 = v2.UserProfiles.Flags.UplevelAliasIXP;
local v23 = game:DefineFastFlag("LuaAppAllowClearAlias", false);
local l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 = require(l_Parent_1.SharedFlags).FFlagCountUTF8CharactersInAliasAndDisplayName;
return function(v25)
    local v26 = l_React_0.useRef(nil);
    local v27, v28 = l_React_0.useState(Vector2.new(0, 0));
    local v29, v30 = l_React_0.useState(v25.alias);
    local v31, v32 = l_React_0.useState(not v25.alias and 0 or if l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then utf8.len(v25.alias) or 0 else string.len(v25.alias));
    local v33 = l_useStyle_0();
    local l_Font_0 = v33.Font;
    local l_Theme_0 = v33.Theme;
    local v36 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v37 = not not l_UplevelAliasIXP_0.isSetupEnabled() and v25.uplevelAliasEnabled;
    local v38 = l_useLocalization_0({
        titleText = if not v37 then v3.MODAL_TITLE else v3.CUSTOMIZE_NAME_MODAL_TITLE, 
        cancelButtonText = v3.CANCEL_BUTTON, 
        saveButtonText = v3.SAVE_BUTTON, 
        descriptionText = if not not v37 and v25.displayName then {
            v3.SET_CUSTOM_NAME_DESCRIPTION; 
            displayName = v25.displayName
        } else if v37 then v3.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION else v3.MODAL_DESCRIPTION, 
        recognizeFriendsByCustomNameText = if not v37 then nil else v3.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION, 
        customNamePlaceholderText = if not v37 then nil else v3.CUSTOM_NAME_PLACEHOLDER, 
        invalidAliasErrorText = if not v37 then nil else v3.INVALID_ALIAS_ERROR
    });
    local v39 = if not v37 then nil else l_useAnalytics_0();
    local v40 = l_React_0.useRef(false);
    local v41 = nil;
    if not v23 then
        if not v37 then
            v41 = nil;
        else
            local v42 = false;
            if string.len((l_Dash_0.trim(v29 or ""))) > 0 then
                v42 = not v25.hasSaveAliasError;
            end;
            v41 = v42;
        end;
    else
        v41 = if not v37 then nil else not v25.hasSaveAliasError;
    end;
    local v44 = l_React_0.useCallback(function(v43)
        if v27.X ~= v43.AbsoluteSize.X then
            v28(v43.AbsoluteSize);
        end;
    end, {
        v27
    });
    local function v45()
        v25.saveOnActivated(v29);
    end;
    local function v46()
        if not (not v37 or not v39) then
            v39.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalClosed);
        end;
        v25.cancelOnActivated();
    end;
    local function v50(v47)
        local v48 = if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.len(v47) else utf8.len(v47);
        if l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 and v48 == nil then
            return ;
        else
            local l_v48_0 = v48;
            if l_v48_0 > 20 then
                v47 = if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.sub(v47, 1, 20) else if v31 == 20 then v29 else string.sub(v47, 1, utf8.offset(v47, 21) - 1);
                l_v48_0 = 20;
                if not (not v26 or not v26.current) then
                    v26.current.Text = v47;
                end;
            end;
            v32(l_v48_0);
            v30(v47);
            if v37 then
                if v25.onTextChanged then
                    v25.onTextChanged();
                end;
                if not (not (if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.len(v47) else l_v48_0 == 0) or not v39) then
                    v39.fireAnalyticsEvent(l_EventNames_0.CustomizeNameClearedInput);
                end;
                if not ((not (if not l_FFlagCountUTF8CharactersInAliasAndDisplayName_0 then string.len(v47) else l_v48_0 == 20) or not v39) or v40.current) then
                    v40.current = true;
                    v39.fireAnalyticsEvent(l_EventNames_0.CustomizeNameMaximumCharLimitTyped, {
                        alias = v47
                    });
                end;
            end;
            return ;
        end;
    end;
    return l_React_0.createElement(l_InteractiveAlert_0, {
        title = v38.titleText, 
        screenSize = v25.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, v27.Y), 
        middleContent = function()
            return l_React_0.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 16), 
                [l_React_0.Change.AbsoluteSize] = v44
            }, {
                InputGroup = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        Padding = if not v37 then UDim.new(0, 24) else nil, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = if not v37 then nil else Enum.HorizontalAlignment.Center, 
                        SortOrder = if not v37 then nil else Enum.SortOrder.LayoutOrder
                    }), 
                    Description = l_React_0.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v27.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v38.descriptionText, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        RichText = not not v37 or nil
                    }), 
                    RecognizeFriendsByCustomNameContainer = if not v37 then nil else l_React_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 2), 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        RecognizeFriendsByCustomName = l_React_0.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            maximumWidth = v27.X, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = v38.recognizeFriendsByCustomNameText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    }), 
                    InputBackground = l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v36 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = not v37 and 2 or 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v36 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if not not v37 and v25.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = l_React_0.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = l_React_0.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v36, 
                                initialInputText = v29, 
                                placeholderText = not v37 and "" or v38.customNamePlaceholderText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = if not v37 then nil else l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = if not v37 then nil else l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = if not v37 then nil else l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = if not v37 then nil else l_IconSize_0.Small, 
                                clearButtonDisabled = not v37 and true or false, 
                                textChangedCallback = v50, 
                                inputBoxRef = v26
                            })
                        })
                    })
                }), 
                Counter = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2
                }, {
                    l_React_0.createElement(l_FitTextLabel_0, {
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v27.X, 
                        Font = l_Font_0.CaptionBody.Font, 
                        Text = if not not v37 and v25.hasSaveAliasError then v38.invalidAliasErrorText else string.format("%d/%d", v31, 20), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                        TextColor3 = if not not v37 and (not (v31 ~= 20) or v25.hasSaveAliasError) then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                        TextTransparency = if not not v37 and (not (v31 ~= 20) or v25.hasSaveAliasError) then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                        AnchorPoint = if not not v37 and v25.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
                        Position = if not not v37 and v25.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
                    }, {
                        UISizeConstraint = if not v37 then nil else l_React_0.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(math.huge, (l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize) * 2)
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
                        onActivated = if not v37 then v25.cancelOnActivated else v46, 
                        text = v38.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v45, 
                        text = v38.saveButtonText, 
                        isDisabled = if not v37 then nil else not v41
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;
