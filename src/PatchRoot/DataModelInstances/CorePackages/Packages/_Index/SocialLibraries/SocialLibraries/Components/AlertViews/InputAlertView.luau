local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_ButtonType_0 = v1.UIBlox.App.Button.Enum.ButtonType;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_UserInputService_0 = v1.UserInputService;
local v6 = require(l_Components_0.AlertViewBuilder.AlertViewBuilder);
local v7 = l_Roact_0.Component:extend("InputAlertView");
v7.defaultProps = {
    titleText = "TestTitle", 
    cancelText = "TestCancel", 
    confirmText = "TestConfirm", 
    warningText = nil, 
    inputText = "TestInput", 
    maxCharacters = 150, 
    onActivated = function()
    end, 
    onModalClose = function()
    end, 
    screenSize = Vector2.new(0, 0), 
    soakAreaColor3 = Color3.fromRGB(0, 0, 255), 
    soakAreaTransparency = 0.9
};
v7.init = function(v8)
    v8.ref = l_Roact_0.createRef();
    v8.onTextChanged = function(v9)
        v8:setState({
            inputText = v9, 
            inputLengthExceeded = v8.props.maxCharacters < #v9
        });
    end;
    v8.onButtonActivated = function()
        v8.closing = true;
    end;
    v8.updateModalPosition = function()
        v8:setState({
            keyboardOffset = not not l_UserInputService_0.OnScreenKeyboardVisible and (v8.state.yPosition + v8.ref:getValue().AbsoluteSize.Y) - l_UserInputService_0.OnScreenKeyboardPosition.Y or 0
        });
    end;
    v8.onModalStayOpen = function()
        v8.closing = false;
        v8.updateModalPosition();
    end;
    v8.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        spawn(function()
            if v8.isMounted and not v8.closing then
                v8.updateModalPosition();
                return ;
            else
                return ;
            end;
        end);
    end);
    v8.onPositionChanged = function(v10)
        if v8.isMounted then
            if v10.AbsolutePosition.Y ~= v8.state.yPosition then
                v8:setState({
                    yPosition = v10.AbsolutePosition.Y
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v8.closing = false;
    v8.state = {
        inputText = v8.props.inputText, 
        inputLengthExceeded = false, 
        keyboardOffset = 0, 
        yPosition = 0
    };
end;
v7.render = function(v11)
    local l_props_0 = v11.props;
    local _ = nil;
    local l_maxCharacters_0 = l_props_0.maxCharacters;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v11.state.keyboardOffset), 
        Transparency = 1, 
        [l_Roact_0.Change.AbsolutePosition] = v11.onPositionChanged, 
        [l_Roact_0.Ref] = v11.ref
    }, {
        AlertView = l_Roact_0.createElement(v6, {
            buttons = if l_props_0.displayFailed then {
                {
                    buttonType = l_ButtonType_0.Alert, 
                    props = {
                        text = l_props_0.failedText, 
                        onActivated = l_props_0.onActivated
                    }
                }
            } else {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        text = l_props_0.cancelText, 
                        onActivated = function()
                        end
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        text = l_props_0.confirmText, 
                        isDisabled = v11.state.inputLengthExceeded, 
                        onActivated = l_props_0.onActivated
                    }
                }
            }, 
            inputLengthExceeded = v11.state.inputLengthExceeded, 
            onActivated = v11.onButtonActivated, 
            onModalClose = l_props_0.onModalClose, 
            onModalStayOpen = v11.onModalStayOpen, 
            soakAreaColor3 = v11.props.soakAreaColor3, 
            soakAreaTransparency = v11.props.soakAreaTransparency, 
            textboxes = {
                InputBox = {
                    belowText = l_maxCharacters_0 and #v11.state.inputText .. "/" .. l_maxCharacters_0, 
                    belowTextAlignment = Enum.TextXAlignment.Right, 
                    LayoutOrder = 1, 
                    onTextChanged = v11.onTextChanged, 
                    PlaceholderText = l_props_0.placeholderText, 
                    Text = l_props_0.inputText, 
                    warningText = v11.props.warningText
                }
            }, 
            title = l_props_0.titleText, 
            screenSize = l_props_0.screenSize
        })
    });
end;
v7.didMount = function(v15)
    v15.isMounted = true;
end;
v7.willUnmount = function(v16)
    v16.isMounted = false;
    if v16.keyboardConnection then
        v16.keyboardConnection:Disconnect();
        v16.keyboardConnection = nil;
    end;
end;
return v7;
