_G.__TESTEZ_RUNNING_TEST__ = true;
return {
    projects = {
        require(script.Parent.Parent.VoiceChat)["jest.config"]
    }
};
