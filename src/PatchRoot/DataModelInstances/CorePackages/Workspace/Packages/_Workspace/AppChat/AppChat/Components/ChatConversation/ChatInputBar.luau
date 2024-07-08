local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_withStyle_0 = v5.Style.withStyle;
local v9 = require(script.Parent.isMessageValid);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.isKeyCodePressed);
local v11 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_UserInputService_0 = game:GetService("UserInputService");
local v14 = Color3.fromRGB(184, 184, 184);
local v15 = Color3.fromRGB(0, 162, 255);
local l_CallbackInputBox_0 = v2.Components.CallbackInputBox;
local v17 = require(l_script_FirstAncestor_0.Analytics.Enums.SendButtonClickActionResult);
local v18 = v3.PureComponent:extend("ChatInputBar");
v18.defaultProps = {
    userInputService = l_UserInputService_0, 
    initialInputText = "", 
    placeholderText = "Say something", 
    sendButtonContainerSize = 45, 
    LayoutOrder = 0, 
    maxCharacterLength = 160, 
    messageListRef = nil, 
    onHeightChanged = function()
    end, 
    onPositionChanged = function()
    end, 
    onFocusLost = function()
    end, 
    onSendBtnClicked = nil, 
    onSendChat = nil, 
    onTextChanged = function()
    end, 
    inputBoxRef = nil
};
v18.init = function(v19)
    v19.isMounted = false;
    v19.state = {
        inputText = v19.props.initialInputText, 
        showSendChat = false, 
        chatBarWidth = 0, 
        frameHeight = 0
    };
    v19.inputBoxRef = v19.props.inputBoxRef or v3.createRef();
    v19.messageListRef = v19.props.messageListRef;
    v19.heightOfFourLines = function(v20, v21, v22)
        return l_Text_0.GetTextHeight("A\nB\nC\nD", v20, v21, v22);
    end;
    v19.calculateInputBoxHeight = function(v23, v24, v25, v26)
        local v27 = v25 + math.min(l_Text_0.GetTextHeight(v23, v24, v25, v26), (v19.heightOfFourLines(v24, v25, v26)));
        if v19.props.onHeightChanged then
            v19.props.onHeightChanged(v27);
        end;
        return v27;
    end;
    v19.onTextChanged = function(v28, v29, v30, v31)
        if v19.isMounted then
            local v32 = false;
            if not (not v28 or not v9(v28, v19.props.maxCharacterLength)) then
                v32 = true;
            end;
            v19:setState({
                inputText = v28, 
                showSendChat = v32, 
                frameHeight = v19.calculateInputBoxHeight(v28, v29, v30, v31)
            });
            v19.props.onTextChanged(v28);
            return ;
        else
            return ;
        end;
    end;
    v19.inputConnection = nil;
    v19.onInputEvent = function(v33)
        if not (not v10({
            v33
        }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) or v10(v19.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift)) then
            v19.onSendActivated();
        end;
    end;
    v19.focusChanged = function(v34)
        if not v34 or v19.inputConnection then
            if not (v34 or not v19.inputConnection) then
                v19.inputConnection:Disconnect();
                v19.inputConnection = nil;
                v19.props.onFocusLost();
            end;
            return ;
        else
            v19.inputConnection = v19.props.userInputService.InputBegan:Connect(v19.onInputEvent);
            return ;
        end;
    end;
    v19.onSendActivated = function()
        local v35 = l_Text_0.Trim(v19.state.inputText);
        local l_None_0 = v17.None;
        if not v19.state.showSendChat or not v9(v35, v19.props.maxCharacterLength) then
            l_None_0 = if v19.state.showSendChat then v17.MessageInvalid else v17.ButtonInactive;
        else
            if v11() then
                v19.inputBoxRef:getValue().Text = "";
                v19:setState({
                    inputText = "", 
                    showSendChat = false
                });
            end;
            if v19.props.onSendChat then
                if v35 == "/shrug" then
                    v19.props.onSendChat("\194\175\\_(\227\131\132)_/\194\175");
                else
                    v19.props.onSendChat(v35);
                end;
                l_None_0 = v17.WillSend;
            end;
            local v37 = (v19.messageListRef and v19.messageListRef.current) and v19.messageListRef.current._listRef;
            if v37 then
                v37:scrollToOffset({
                    offset = 0
                });
            end;
            if not v11() then
                v19.inputBoxRef:getValue().Text = "";
                v19:setState({
                    inputText = "", 
                    showSendChat = false
                });
            end;
        end;
        if v19.props.onSendBtnClicked then
            v19.props.onSendBtnClicked(l_None_0);
        end;
    end;
    v19.chatBoxSizeChanged = function(v38)
        v19:setState({
            chatBarWidth = v38.AbsoluteSize.X
        });
    end;
end;
v18.render = function(v39)
    return l_withStyle_0(function(v40)
        local l_Font_0 = v40.Font;
        local l_Font_1 = l_Font_0.Body.Font;
        local v43 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_frameHeight_0 = v39.state.frameHeight;
        if l_frameHeight_0 == 0 then
            l_frameHeight_0 = v39.calculateInputBoxHeight(v39.state.inputText, l_Font_1, v43, v39.state.chatBarWidth);
        end;
        return v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v39.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
            [v3.Change.AbsolutePosition] = v39.props.onPositionChanged
        }, {
            layout = v3.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_IconSize_0.Regular / 4), 
                PaddingBottom = UDim.new(0, 5)
            }), 
            inputBorder = v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, -v39.props.sendButtonContainerSize, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                ImageColor3 = v40.Theme.Divider.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9)
            }, {
                inputImage = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Image = l_Images_0["component_assets/circle_21"], 
                    ImageColor3 = v40.Theme.UIMuted.Color, 
                    ImageTransparency = v40.Theme.UIMuted.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9)
                }, {
                    padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v43 / 2.5), 
                        PaddingLeft = UDim.new(0.02, 0), 
                        PaddingRight = UDim.new(0.02, 0)
                    }), 
                    inputBox = v3.createElement(l_CallbackInputBox_0, {
                        initialInputText = v39.props.initialInputText, 
                        inputTextFont = l_Font_1, 
                        inputTextColor3 = v40.Theme.TextMuted.Color, 
                        inputTextSize = v43, 
                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                        inputTextYAlignment = Enum.TextYAlignment.Top, 
                        placeholderText = v39.props.placeholderText, 
                        placeholderTextColor3 = v40.Theme.TextMuted.Color, 
                        placeholderTextTransparency = v40.Theme.TextMuted.Transparency, 
                        clipsDescendants = false, 
                        multiLine = true, 
                        manualFocusRelease = true, 
                        textWrapped = true, 
                        focusChangedCallback = v39.focusChanged, 
                        clearButtonDisabled = true, 
                        clearButtonSize = 0, 
                        textChangedCallback = function(v45)
                            v39.onTextChanged(v45, l_Font_1, v43, v39.state.chatBarWidth);
                        end, 
                        [v3.Change.AbsoluteSize] = v39.chatBoxSizeChanged, 
                        inputBoxRef = v39.inputBoxRef
                    })
                })
            }), 
            sendButton = v3.createElement("TextButton", {
                Size = UDim2.new(0, v39.props.sendButtonContainerSize, 1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Text = "", 
                [v3.Event.Activated] = v39.onSendActivated
            }, {
                layout = v3.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                sendIcon = v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = not not v39.state.showSendChat and v15 or v14, 
                    Image = l_Images_0["icons/actions/send"]
                })
            })
        });
    end);
end;
v18.didMount = function(v46)
    v46.isMounted = true;
end;
v18.willUnmount = function(v47)
    v47.isMounted = false;
    if v47.inputConnection then
        v47.inputConnection:Disconnect();
        v47.inputConnection = nil;
    end;
end;
return v18;
