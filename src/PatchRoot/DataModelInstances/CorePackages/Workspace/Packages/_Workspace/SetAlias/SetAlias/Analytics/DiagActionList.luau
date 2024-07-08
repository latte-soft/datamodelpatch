local v0 = require(script.Parent.Enums.EventNames);
return {
    [v0.CustomizeNameModalOpened] = {
        name = game:DefineFastString("CustomizeNameModalOpened", "CustomizeNameModalOpened")
    }, 
    [v0.CustomizeNameClearedInput] = {
        name = game:DefineFastString("CustomizeNameClearedInput", "CustomizeNameClearedInput")
    }, 
    [v0.CustomizeNameMaximumCharLimitTyped] = {
        name = game:DefineFastString("CustomizeNameMaximumCharLimitTyped", "CustomizeNameMaximumCharLimitTyped")
    }, 
    [v0.CustomizeNameModalClosed] = {
        name = game:DefineFastString("CustomizeNameModalClosed", "CustomizeNameModalClosed")
    }, 
    [v0.CustomizeNameSaved] = {
        name = game:DefineFastString("CustomizeNameSaved", "CustomizeNameSaved")
    }, 
    [v0.CustomizeNameSaveAttemptInvalidInput] = {
        name = game:DefineFastString("CustomizeNameSaveAttemptInvalidInput", "CustomizeNameSaveAttemptInvalidInput")
    }
};
