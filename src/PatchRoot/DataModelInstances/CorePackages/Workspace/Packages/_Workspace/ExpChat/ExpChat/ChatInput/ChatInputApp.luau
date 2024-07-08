local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Localization);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactRodux);
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.Actions.FocusChatHotKeyActivated);
local v10 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownActivated);
local v11 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownResultsChanged);
local v12 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownSelectionChanged);
local v13 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownTypeChanged);
local v14 = require(l_script_FirstAncestor_0.Actions.AutocompleteDropdownDeactivated);
local v15 = require(script.Parent.UI.ChatInputBar);
local v16 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v17 = v5.Component:extend("ChatInputBarApp");
v17.defaultProps = {
    addTopPadding = true, 
    LayoutOrder = 1, 
    onSendChat = nil, 
    transparencyValue = v5.createBinding(0.3)
};
v17.render = function(v18)
    return v6.createElement(v15, {
        userInputService = l_UserInputService_0, 
        contextActionService = game:GetService("ContextActionService"), 
        messageCharacterLimit = v8.MessageCharacterLimit, 
        sendButtonContainerWidth = 30, 
        addTopPadding = v18.props.addTopPadding, 
        LayoutOrder = v18.props.LayoutOrder, 
        placeholderText = if not v18.props.isUsingTouch then v18.props.placeholderKeyboardText else v18.props.placeholderTouchText, 
        disabledChatPlaceholderText = v18.props.disabledChatPlaceholderText, 
        size = UDim2.fromScale(1, 0), 
        onSendChat = v18.props.onSendChat, 
        transparencyValue = v18.props.transparencyValue, 
        canLocalUserChat = v18.props.canLocalUserChat, 
        targetTextChannel = v18.props.targetTextChannel, 
        localTeam = v18.props.localTeam, 
        localPlayer = v18.props.localPlayer, 
        defaultSystemTextChannel = v18.props.defaultSystemTextChannel, 
        shouldFocusChatInputBar = v18.props.shouldFocusChatInputBar, 
        resetTargetChannel = v18.props.resetTargetChannel, 
        focusChatHotKeyActivated = v18.props.focusChatHotKeyActivated, 
        devDefinedFocusKeyCode = v18.props.devDefinedFocusKeyCode, 
        visible = v18.props.visible, 
        onFocus = v18.props.onFocus, 
        onUnfocus = v18.props.onUnfocus, 
        onHovered = v18.props.onHovered, 
        onUnhovered = v18.props.onUnhovered, 
        onAbsoluteSizeChanged = v18.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v18.props.onAbsolutePositionChanged, 
        chatWindowSettings = v18.props.chatWindowSettings, 
        chatInputBarSettings = v18.props.chatInputBarSettings, 
        isChatHotkeyEnabled = v18.props.isChatHotkeyEnabled, 
        autocompleteDropdownReducer = v18.props.autocompleteDropdownReducer, 
        autocompleteDropdownActivated = v18.props.autocompleteDropdownActivated, 
        autocompleteDropdownResultsChanged = v18.props.autocompleteDropdownResultsChanged, 
        autocompleteDropdownSelectionChanged = v18.props.autocompleteDropdownSelectionChanged, 
        autocompleteDropdownTypeChanged = v18.props.autocompleteDropdownTypeChanged, 
        autocompleteDropdownDeactivated = v18.props.autocompleteDropdownDeactivated, 
        autocompleteEnabled = v18.props.autocompleteEnabled
    });
end;
return v7.connect(function(v19)
    return {
        targetTextChannel = v19.TextChannels.targetTextChannel, 
        localPlayer = l_Players_0.LocalPlayer, 
        localTeam = v19.LocalTeam, 
        isUsingTouch = v19.isUsingTouch, 
        devDefinedFocusKeyCode = v19.ChatLayout.ChatInputBarSettings.KeyboardKeyCode, 
        defaultSystemTextChannel = v19.TextChannels.allTextChannels.RBXSystem, 
        shouldFocusChatInputBar = v19.shouldFocusChatInputBar, 
        chatInputBarSettings = v19.ChatLayout.ChatInputBarSettings, 
        isChatHotkeyEnabled = v19.ChatVisibility.isChatHotkeyEnabled.value, 
        autocompleteDropdownReducer = v19.AutocompleteDropdown, 
        autocompleteEnabled = v19.ChatLayout.ChatInputBarSettings.AutocompleteEnabled
    };
end, function(v20)
    return {
        focusChatHotKeyActivated = function()
            return v20(v9());
        end, 
        onFocus = function()
            return v20(v16("focus"));
        end, 
        onUnfocus = function()
            return v20(v16("unfocus"));
        end, 
        onHovered = function()
            return v20(v16("hover"));
        end, 
        onUnhovered = function()
            return v20(v16("unhover"));
        end, 
        autocompleteDropdownActivated = function(v21)
            return v20(v10(v21));
        end, 
        autocompleteDropdownResultsChanged = function(v22)
            return v20(v11(v22));
        end, 
        autocompleteDropdownSelectionChanged = function(v23)
            return v20(v12(v23));
        end, 
        autocompleteDropdownTypeChanged = function(v24)
            return v20(v13(v24));
        end, 
        autocompleteDropdownDeactivated = function()
            return v20(v14());
        end
    };
end)(v3.connect(function(v25)
    return {
        placeholderKeyboardText = {
            "CoreScripts.TextChat.InputBar.Hint.MouseKeyboard", 
            {
                KEY = l_UserInputService_0:GetStringForKeyCode(v25.devDefinedFocusKeyCode)
            }
        }, 
        placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch", 
        disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"
    };
end)(v17));
