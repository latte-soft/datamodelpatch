local v0 = {
    parseAndCheckHttpResponse = require(script.parseAndCheckHttpResponse).parseAndCheckHttpResponse, 
    serializeFetchParameter = require(script.serializeFetchParameter).serializeFetchParameter
};
local v1 = require(script.selectHttpOptionsAndBody);
v0.fallbackHttpConfig = v1.fallbackHttpConfig;
v0.selectHttpOptionsAndBody = v1.selectHttpOptionsAndBody;
v0.checkFetcher = require(script.checkFetcher).checkFetcher;
v0.createSignalIfSupported = require(script.createSignalIfSupported).createSignalIfSupported;
v0.selectURI = require(script.selectURI).selectURI;
v0.createHttpLink = require(script.createHttpLink).createHttpLink;
v0.HttpLink = require(script.HttpLink).HttpLink;
v0.rewriteURIForGET = require(script.rewriteURIForGET).rewriteURIForGET;
return v0;
