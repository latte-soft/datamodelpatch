local l_instanceof_0 = require(script.Parent.Parent.LuauPolyfill).instanceof;
local l_Headers_0 = require(script.Parent.Headers).Headers;
local l_Body_0 = require(script.Parent.Body).Body;
local l_AbortSignal_0 = require(script.Parent.AbortSignal).AbortSignal;
local v4 = setmetatable({}, {
    __index = l_Body_0
});
v4.__index = v4;
v4.new = function(v5, v6)
    local v7 = v6 or {};
    local v8 = nil;
    local v9 = nil;
    if type(v5) == "string" then
        v8 = v5;
        v9 = {};
    elseif not l_instanceof_0(v5, v4) then
        error("The first argument of Request.new() must be a string or Request object");
    else
        v8 = v5.url;
        v9 = v5;
    end;
    local v10 = if not v7.body and l_instanceof_0(v5, v4) then v5.body else nil;
    local v11 = setmetatable(l_Body_0.new(v7.body or v10), v4);
    v11.method = (v7.method or v9.method) or "GET";
    if not (not v7.body and not v10) and (not (v11.method ~= "GET") or v11.method == "HEAD") then
        error(string.format("'body' should not be provided as an option for request method %s", v11.method));
    end;
    v11.url = v8;
    v11.headers = if not v7.headers then v9.headers or l_Headers_0.new() else l_Headers_0.new(v7.headers);
    v11.cache = (v7.cache or v9.cache) or Enum.HttpCachePolicy.None;
    v11.signal = (v7.signal or v9.signal) or l_AbortSignal_0.abort("Request Cancelled");
    v11.destination = "document";
    v11.referrer = "client";
    v11.referrerPolicy = "no-referrer";
    v11.mode = v7.mode or "cors";
    v11.credentials = (v7.credentials or v9.credentials) or "omit";
    v11.redirect = (v7.redirect or v9.redirect) or "error";
    v11.integrity = (v7.integrity or v9.integrity) or "";
    v11.keepalive = (v7.keepalive or v9.keepalive) or false;
    v11.isReloadNavigation = false;
    v11.isHistoryNavigation = false;
    v11.duplex = (v7.duplex or v9.duplex) or "half";
    return v11;
end;
v4.clone = function(v12)
    return v4.new(v12);
end;
return {
    Request = v4
};
