return {
    ["jest.config"] = script["jest.config"], 
    useAutoFocus = require(script.useAutoFocus), 
    useDescendantHasFocus = require(script.useDescendantHasFocus), 
    useFirstFocusableDescendantRef = require(script.useFirstFocusableDescendantRef), 
    useFocusNavigableSurfaceRegistryConnection = require(script.useFocusNavigableSurfaceRegistryConnection), 
    useDefaultFocusNavigationBindings = require(script.useDefaultFocusNavigationBindings), 
    useGlobalFocusHandler = require(script.useGlobalFocusHandler), 
    useGlobalDefaultSelectionCursor = require(script.useGlobalDefaultSelectionCursor), 
    FocusNavigableSurfaceRegistry = require(script.FocusNavigableSurfaceRegistry), 
    FocusNavigableSurfaceIdentifierEnum = require(script.FocusNavigableSurfaceIdentifierEnum), 
    FocusNavigableSurfaceWrapper = require(script.FocusNavigableSurfaceWrapper), 
    FocusNavigationEventNameEnum = require(script.FocusNavigationEventNameEnum), 
    getFirstFocusableDescendant = require(script.getFirstFocusableDescendant), 
    useLastInputMode = require(script.useLastInputMode), 
    useLastInputMethod = require(script.useLastInputMethod)
};
