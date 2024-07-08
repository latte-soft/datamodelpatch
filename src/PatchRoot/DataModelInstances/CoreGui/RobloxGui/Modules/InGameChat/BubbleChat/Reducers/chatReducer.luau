return (require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
    chatSettings = require(script.Parent.chatSettings), 
    messages = require(script.Parent.messages), 
    userMessages = require(script.Parent.userMessages), 
    voiceState = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Reducers.voiceState), 
    components = require(script.Parent.components)
}));
