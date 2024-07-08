return {
    displayName = "Jest", 
    setupFilesAfterEnv = {
        script.Parent.Parent.TestsSetup["setup-env"]
    }, 
    testMatch = {
        "**/__tests__/**/*.spec"
    }
};
