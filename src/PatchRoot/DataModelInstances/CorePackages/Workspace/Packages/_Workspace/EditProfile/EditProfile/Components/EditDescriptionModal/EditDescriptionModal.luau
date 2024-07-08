local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_CallbackInputBox_0 = v2.SocialLibraries.config({}).Components.CallbackInputBox;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagDescriptionModalThrottleError);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v14)
    local v15 = v3.useRef(nil);
    local v16, v17 = v3.useState(v14.initialText);
    local v18 = string.len(v16);
    local v19 = l_useLocalization_0({
        cancelButtonText = v13.CancelButtonText, 
        saveButtonText = v13.SaveButtonText, 
        saySomething = v13.SaySomething, 
        pinLocked = v13.PinLocked
    });
    local v20 = l_useStyle_0();
    local l_Font_0 = v20.Font;
    local l_Theme_0 = v20.Theme;
    local v23 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local function v26(v24)
        if string.len(v24) > 1000 then
            v24 = string.sub(v24, 1, 1000);
            local _ = 1000;
            if not (not v15 or not v15.current) then
                v15.current.Text = v24;
            end;
        end;
        v17(v24);
    end;
    return v3.createElement(l_InteractiveAlert_0, {
        title = v14.title, 
        screenSize = v14.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, 44), 
        middleContent = function()
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                InputGroup = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Description = v3.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = v14.description, 
                        TextSize = 14, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        RichText = true
                    }), 
                    Padding = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 24), 
                        LayoutOrder = 2
                    }), 
                    InputBackground = v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, 144), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, 144), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12), 
                                PaddingTop = UDim.new(0, 7)
                            }), 
                            Textbox = v3.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextYAlignment = Enum.TextYAlignment.Top, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v23, 
                                initialInputText = v14.initialText, 
                                placeholderText = v19.saySomething, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                textChangedCallback = v26, 
                                inputBoxRef = v15, 
                                multiLine = true, 
                                textWrapped = true, 
                                clearButtonDisabled = true, 
                                clearButtonSize = 0
                            })
                        })
                    }), 
                    Counter = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 22), 
                        LayoutOrder = 4
                    }, {
                        ThrottleError = if not not v11 and v14.throttleError then v3.createElement("TextLabel", {
                            Position = UDim2.fromScale(0, 0.4), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = v14.throttleErrorText, 
                            TextXAlignment = 0, 
                            TextSize = (l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize) * 0.9, 
                            TextColor3 = l_Theme_0.Alert.Color, 
                            TextTransparency = l_Theme_0.Alert.Transparency
                        }) else nil; 
                        v3.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = if not v14.textError then string.format("%d/%d", v18, 1000) else v19.pinLocked, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = if not (v18 ~= 1000) or v14.textError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                            TextTransparency = if not (v18 ~= 1000) or v14.textError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                            AnchorPoint = if not v14.textError then Vector2.new(1, 1) else Vector2.new(0, 1), 
                            Position = if not v14.textError then UDim2.fromScale(1, 1) else UDim2.fromScale(0, 1), 
                            TextWrapped = true
                        }, {
                            UISizeConstraint = v3.createElement("UISizeConstraint", {
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
                        onActivated = v14.cancelOnActivated, 
                        text = v19.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v14.saveOnActivated(v16);
                        end, 
                        text = v19.saveButtonText
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;
