return {
    Hooks = require(script.Hooks), 
    Mutations = require(script.Mutations), 
    Formatters = require(script.Formatters), 
    Selectors = require(script.Selectors), 
    TestUtils = require(script.TestUtils), 
    ["jest.config"] = script["jest.config"]
};
