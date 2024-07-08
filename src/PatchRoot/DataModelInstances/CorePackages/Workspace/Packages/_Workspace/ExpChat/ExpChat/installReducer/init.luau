local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).combineReducers({
    Messages = require(script.Messages), 
    MutedUsers = require(script.MutedUsers), 
    VerifiedUsers = not not require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat)() and require(script.VerifiedUsers) or nil, 
    Players = require(script.Players), 
    LocalCharacter = require(script.LocalCharacter), 
    TextChannels = require(script.TextChannels), 
    ChatVisibility = require(script.ChatVisibility), 
    CanLocalUserChat = require(script.CanLocalUserChat), 
    LocalTeam = require(script.LocalTeam), 
    isUsingTouch = require(script.isUsingTouch), 
    shouldFocusChatInputBar = require(script.shouldFocusChatInputBar), 
    Voice = require(script.Voice), 
    BubbleChatSettings = require(script.BubbleChat), 
    LegacyBubbleChatSettings = require(script.BubbleChat.LegacyChatReducer), 
    ChatLayout = require(script.ChatLayout), 
    AutoCastCommands = require(script.AutoCastCommands), 
    Adornees = require(script.Adornees), 
    ClientSettings = require(script.ClientSettings), 
    AutocompleteDropdown = not not require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)() and require(script.AutocompleteDropdown) or nil
});
