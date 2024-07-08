return {
    ChatConversation = require(script.ChatConversation), 
    EventReceivers = require(script.EventReceivers), 
    ExternalNavigationHandlerContainer = if not require(script.Parent.Flags.getFFlagEnableModularExternalNavigationHandler)() then nil else require(script.ExternalNavigationHandler.Container), 
    Cells = require(script.Cells)
};
