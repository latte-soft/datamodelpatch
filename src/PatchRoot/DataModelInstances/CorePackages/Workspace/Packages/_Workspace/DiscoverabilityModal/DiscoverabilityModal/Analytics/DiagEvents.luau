local v0 = require(script.Parent.Enums.EventNames);
return {
    [v0.DiscoverabilityModalLoad] = {
        name = game:DefineFastString("DiscoverabilityModalLoadCounter", "DiscoverabilityModalLoad")
    }, 
    [v0.DiscoverabilityModalContinue] = {
        name = game:DefineFastString("DiscoverabilityModalContinueCounter", "DiscoverabilityModalContinue")
    }, 
    [v0.DiscoverabilityModalClose] = {
        name = game:DefineFastString("DiscoverabilityModalCloseCounter", "DiscoverabilityModalClose")
    }, 
    [v0.DiscoverabilityModalRadioButtonClick] = {
        name = game:DefineFastString("DiscoverabilityModalRadioButtonClickCounter", "DiscoverabilityModalRadioButtonClick")
    }
};
