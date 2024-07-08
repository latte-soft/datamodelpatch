local v0 = require(script.Parent.Parent.HttpRequest);
return {
    networkImpl = v0.config({
        requestFunction = v0.requestFunctions.HttpRbxApi
    })
};
