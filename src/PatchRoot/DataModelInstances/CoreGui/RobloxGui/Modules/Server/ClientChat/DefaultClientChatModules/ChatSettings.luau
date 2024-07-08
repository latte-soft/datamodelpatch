local l_Players_0 = game:GetService("Players");
local l_ChatConstants_0 = require(script.Parent:WaitForChild("ChatConstants"));
local v2 = {
    WindowDraggable = false, 
    WindowResizable = false, 
    ShowChannelsBar = false, 
    GamepadNavigationEnabled = false, 
    AllowMeCommand = false, 
    ShowUserOwnFilteredMessage = true, 
    ChatOnWithTopBarOff = false, 
    ScreenGuiDisplayOrder = 6, 
    ShowFriendJoinNotification = true, 
    BubbleChatEnabled = l_Players_0.BubbleChat, 
    ClassicChatEnabled = l_Players_0.ClassicChat, 
    ChatWindowTextSize = 18, 
    ChatChannelsTabTextSize = 18, 
    ChatBarTextSize = 18, 
    ChatWindowTextSizePhone = 14, 
    ChatChannelsTabTextSizePhone = 18, 
    ChatBarTextSizePhone = 14, 
    DefaultFont = Enum.Font.SourceSansBold, 
    ChatBarFont = Enum.Font.SourceSansBold, 
    BackGroundColor = Color3.new(0, 0, 0), 
    DefaultMessageColor = Color3.new(1, 1, 1), 
    DefaultNameColor = Color3.new(1, 1, 1), 
    ChatBarBackGroundColor = Color3.new(0, 0, 0), 
    ChatBarBoxColor = Color3.new(1, 1, 1), 
    ChatBarTextColor = Color3.new(0, 0, 0), 
    ChannelsTabUnselectedColor = Color3.new(0, 0, 0), 
    ChannelsTabSelectedColor = Color3.new(0.11764705882352941, 0.11764705882352941, 0.11764705882352941), 
    DefaultChannelNameColor = Color3.fromRGB(35, 76, 142), 
    WhisperChannelNameColor = Color3.fromRGB(102, 14, 102), 
    ErrorMessageTextColor = Color3.fromRGB(245, 50, 50), 
    MinimumWindowSize = UDim2.new(0.3, 0, 0.25, 0), 
    MaximumWindowSize = UDim2.new(1, 0, 1, 0), 
    DefaultWindowPosition = UDim2.new(0, 0, 0, 0), 
    DefaultWindowSizePhone = UDim2.new(0.5, 0, 0.5, 24), 
    DefaultWindowSizeTablet = UDim2.new(0.4, 0, 0.3, 24), 
    DefaultWindowSizeDesktop = UDim2.new(0.3, 0, 0.25, 24), 
    ChatWindowBackgroundFadeOutTime = 3.5, 
    ChatWindowTextFadeOutTime = 30, 
    ChatDefaultFadeDuration = 0.8, 
    ChatShouldFadeInFromNewInformation = false, 
    ChatAnimationFPS = 20, 
    GeneralChannelName = "All", 
    EchoMessagesInGeneralChannel = true, 
    ChannelsBarFullTabSize = 4, 
    MaxChannelNameLength = 12, 
    MaxChannelNameCheckLength = 50, 
    RightClickToLeaveChannelEnabled = false, 
    MessageHistoryLengthPerChannel = 50, 
    ShowJoinAndLeaveHelpText = false, 
    MaximumMessageLength = 200, 
    DisallowedWhiteSpace = {
        "\n", 
        "\r", 
        "\t", 
        "\v", 
        "\f"
    }, 
    ClickOnPlayerNameToWhisper = true, 
    ClickOnChannelNameToSetMainChannel = true, 
    BubbleChatMessageTypes = {
        l_ChatConstants_0.MessageTypeDefault, 
        l_ChatConstants_0.MessageTypeWhisper
    }, 
    WhisperCommandAutoCompletePlayerNames = true, 
    PlayerDisplayNamesEnabled = true, 
    WhisperByDisplayName = true
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local v9 = setmetatable({}, {
    __index = function(_, v5)
        return v2[v5];
    end, 
    __newindex = function(_, v7, v8)
        v2[v7] = v8;
        l_BindableEvent_0:Fire(v7, v8);
    end
});
rawset(v9, "SettingsChanged", l_BindableEvent_0.Event);
return v9;
