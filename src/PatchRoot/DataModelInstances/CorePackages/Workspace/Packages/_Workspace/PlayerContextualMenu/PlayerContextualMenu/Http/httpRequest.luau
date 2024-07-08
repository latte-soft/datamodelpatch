local v0 = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.HttpRequest);
return v0.config({
    requestFunction = v0.requestFunctions.HttpRbxApi, 
    maxRetryCount = 0
});
