return {
    Hooks = require(script.Parent.Hooks), 
    Flags = require(script.Parent.Flags), 
    Formatters = require(script.Parent.Formatters), 
    Selectors = require(script.Parent.Selectors), 
    Queries = require(script.Parent.Common.Queries), 
    Mutations = require(script.Parent.Mutations), 
    TestUtils = require(script.Parent.TestUtils), 
    UserProfilesFetchWrapper = require(script.Parent.UserProfilesFetchWrapper), 
    ["jest.config"] = script.Parent["jest.config"]
};
