return {
    defaultOtaValidator = require(script.defaultOtaValidator), 
    validateInterface = require(script.validateInterface), 
    validatePackageDependencies = require(script.validatePackageDependencies), 
    ["jest.config"] = script["jest.config"]
};
