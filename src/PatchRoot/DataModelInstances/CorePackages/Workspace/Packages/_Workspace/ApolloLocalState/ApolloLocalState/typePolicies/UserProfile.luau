return {
    fields = {
        platformProfileId = {
            read = require(script.Parent.utils.makeDefaultReadPolicy)("")
        }
    }
};
