local _ = require(script.Parent.LuauPolyfill);
local l_Headers_0 = require(script.Headers).Headers;
local l_Request_0 = require(script.Request).Request;
local l_Response_0 = require(script.Response).Response;
local l_Body_0 = require(script.Body).Body;
local v5 = require(script.fetch);
return {
    Headers = l_Headers_0, 
    Request = l_Request_0, 
    Response = l_Response_0, 
    Body = l_Body_0, 
    fetch = v5(game:GetService("HttpService")), 
    buildFetch = v5, 
    AbortSignal = require(script.AbortSignal).AbortSignal
};
