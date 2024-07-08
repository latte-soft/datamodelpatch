return {
    testMatch = {
        "**/*.spec"
    }, 
    setupFilesAfterEnv = {
        script.Parent.Parent.Utilities.UIBloxInitializer
    }
};
