return {
    fields = {
        imageId = {
            read = require(script.Parent.utils.makeDefaultReadPolicy)("-1")
        }
    }
};
