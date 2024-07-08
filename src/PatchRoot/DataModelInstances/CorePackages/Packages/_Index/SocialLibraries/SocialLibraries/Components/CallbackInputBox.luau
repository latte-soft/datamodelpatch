local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Config_0 = l_UIBlox_0.Config;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v5 = l_Roact_0.PureComponent:extend("CallbackInputBox");
v5.defaultProps = {
    initialInputText = "", 
    inputTextFont = if not l_Config_0.enableFontNameMapping then Enum.Font.Gotham else Enum.Font.BuilderSans, 
    inputTextColor3 = Color3.new(1, 0, 1), 
    inputTextSize = 14, 
    inputTextYAlignment = Enum.TextYAlignment.Center, 
    inputTextXAlignment = Enum.TextXAlignment.Center, 
    inputTextTransparency = 0, 
    placeholderTextTransparency = 0.6, 
    placeholderTextColor3 = Color3.new(1, 0, 0), 
    placeholderText = "Test placeholder text", 
    clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    clearIconColor3 = Color3.new(1, 1, 0), 
    clearIconTransparency = 0, 
    clearButtonSize = 24, 
    clipsDescendants = true, 
    manualFocusRelease = false, 
    captureFocusOnMount = false, 
    multiLine = false, 
    textWrapped = false, 
    showCancelIconOnLoad = false, 
    textInputType = Enum.TextInputType.Default, 
    returnKeyType = Enum.ReturnKeyType.Default, 
    clearButtonDisabled = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function()
    end, 
    onSelectCallback = function()
    end, 
    returnPressedFromOnScreenKeyboardCallback = function()
    end, 
    inputBoxRef = nil, 
    [l_Roact_0.Change.AbsoluteSize] = function()
    end
};
v5.init = function(v6)
    v6.clearRef = l_Roact_0.createRef();
    v6.inputBoxRef = v6.props.inputBoxRef or l_Roact_0.createRef();
    v6.inputText = v6.props.initialInputText;
    v6.textChangedEventUnlocked = false;
    v6.focusTextbox = function()
        v6.props.onSelectCallback();
        if not v6.inputBoxRef.current:IsFocused() then
            v6.inputBoxRef.current:captureFocus();
        end;
    end;
end;
v5.render = function(v7)
    local l_placeholderTextTransparency_0 = v7.props.placeholderTextTransparency;
    local l_inputTextTransparency_0 = v7.props.inputTextTransparency;
    local _ = nil;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        inputBox = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            inputTextBox = l_Roact_0.createElement("TextBox", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -v7.props.clearButtonSize, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                TextColor3 = v7.props.inputTextColor3, 
                TextSize = v7.props.inputTextSize, 
                TextTransparency = if not v7.inputText or v7.inputText == "" then l_placeholderTextTransparency_0 else l_inputTextTransparency_0, 
                Font = v7.props.inputTextFont, 
                PlaceholderText = v7.props.placeholderText, 
                PlaceholderColor3 = v7.props.placeholderTextColor3, 
                TextXAlignment = v7.props.inputTextXAlignment, 
                TextYAlignment = v7.props.inputTextYAlignment, 
                OverlayNativeInput = true, 
                ClearTextOnFocus = false, 
                ClipsDescendants = v7.props.clipsDescendants, 
                LayoutOrder = 1, 
                ManualFocusRelease = v7.props.manualFocusRelease, 
                MultiLine = v7.props.multiLine, 
                TextWrapped = v7.props.textWrapped, 
                TextInputType = v7.props.textInputType, 
                ReturnKeyType = v7.props.returnKeyType, 
                [l_Roact_0.Event.ReturnPressedFromOnScreenKeyboard] = v7.props.returnPressedFromOnScreenKeyboardCallback, 
                [l_Roact_0.Event.TouchTap] = v7.focusTextbox, 
                [l_Roact_0.Event.Focused] = function(v11)
                    if v7.inputBoxRef.current and v7.inputBoxRef.current.Text ~= "" then
                        if not (not v7.clearRef.current or v7.props.clearButtonDisabled) then
                            v7.clearRef.current.Visible = true;
                        end;
                        v11.TextColor3 = v7.props.inputTextColor3;
                        v11.TextTransparency = l_inputTextTransparency_0;
                    else
                        v11.TextColor3 = v7.props.placeholderTextColor3;
                        v11.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v7.props.focusChangedCallback(true);
                end, 
                [l_Roact_0.Event.FocusLost] = function(v12, v13)
                    if v7.inputBoxRef.current and v7.inputBoxRef.current.Text == "" then
                        v12.TextColor3 = v7.props.placeholderTextColor3;
                        v12.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v7.props.focusChangedCallback(false, v13);
                end, 
                [l_Roact_0.Change.Text] = function(v14)
                    if not (v14.Text == "" and not v7.textChangedEventUnlocked) then
                        if v14.Text ~= "" then
                            if not (not v7.clearRef.current or v7.props.clearButtonDisabled) then
                                v7.clearRef.current.Visible = true;
                            end;
                            v14.TextColor3 = v7.props.inputTextColor3;
                            v14.TextTransparency = l_inputTextTransparency_0;
                        else
                            if v7.clearRef.current then
                                v7.clearRef.current.Visible = false;
                            end;
                            v14.TextColor3 = v7.props.placeholderTextColor3;
                            v14.TextTransparency = l_placeholderTextTransparency_0;
                        end;
                        v7.inputText = v14.Text;
                        if v7.props.textChangedCallback then
                            v7.props.textChangedCallback(v14.Text);
                        end;
                    end;
                    v7.textChangedEventUnlocked = true;
                end, 
                [l_Roact_0.Ref] = v7.inputBoxRef, 
                [l_Roact_0.Change.AbsoluteSize] = v7.props[l_Roact_0.Change.AbsoluteSize]
            }), 
            Clear = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v7.props.clearButtonSize, 1, 0), 
                AutoButtonColor = false, 
                LayoutOrder = 2, 
                Visible = not v7.props.clearButtonDisabled, 
                [l_Roact_0.Event.Activated] = function()
                    if v7.inputBoxRef.current then
                        v7.inputBoxRef.current.Text = "";
                    end;
                    v7.inputText = "";
                    if v7.clearRef.current then
                        v7.clearRef.current.Visible = false;
                    end;
                end
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = "Center", 
                    HorizontalAlignment = "Center"
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v7.props.clearButtonSize, 0, v7.props.clearButtonSize), 
                    Image = v7.props.clearIcon, 
                    ImageColor3 = v7.props.clearIconColor3, 
                    ImageTransparency = v7.props.clearIconTransparency, 
                    Visible = v7.props.showCancelIconOnLoad, 
                    [l_Roact_0.Ref] = v7.clearRef
                })
            })
        })
    });
end;
v5.didMount = function(v15)
    if v15.inputBoxRef.current then
        v15.inputBoxRef.current.Text = v15.inputText;
        if v15.props.captureFocusOnMount then
            spawn(function()
                if not (not v15.inputBoxRef or not v15.inputBoxRef.current) then
                    v15.inputBoxRef.current:captureFocus();
                end;
            end);
        end;
    end;
end;
return v5;
