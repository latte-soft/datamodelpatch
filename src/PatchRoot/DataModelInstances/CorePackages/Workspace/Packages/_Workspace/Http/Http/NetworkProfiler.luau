local v0 = tonumber(settings():GetFVariable("PercentReportingNetworkProfileAfterStartup"));
local v1 = {};
v1.__index = v1;
v1.aggregate = {
    queued = 0, 
    nameLookup = 0, 
    connect = 0, 
    sslHandshake = 0, 
    makeRequest = 0, 
    receiveResponse = 0
};
v1.track = function(v2, v3)
    v2.aggregate.queued = v2.aggregate.queued + v3.queued;
    if v3.nameLookup >= 0 then
        v2.aggregate.nameLookup = v2.aggregate.nameLookup + v3.nameLookup;
    end;
    if v3.connect >= 0 then
        v2.aggregate.connect = v2.aggregate.connect + v3.connect;
    end;
    if v3.sslHandshake >= 0 then
        v2.aggregate.sslHandshake = v2.aggregate.sslHandshake + v3.sslHandshake;
    end;
    if v3.makeRequest >= 0 then
        v2.aggregate.makeRequest = v2.aggregate.makeRequest + v3.makeRequest;
    end;
    if v3.receiveResponse >= 0 then
        v2.aggregate.receiveResponse = v2.aggregate.receiveResponse + v3.receiveResponse;
    end;
end;
v1.report = function(v4, v5)
    v5("NetworkProfileDuringStartup", "Queued", v4.aggregate.queued, v0);
    v5("NetworkProfileDuringStartup", "NameLookup", v4.aggregate.nameLookup, v0);
    v5("NetworkProfileDuringStartup", "Connect", v4.aggregate.connect, v0);
    v5("NetworkProfileDuringStartup", "SSLHandshake", v4.aggregate.sslHandshake, v0);
    v5("NetworkProfileDuringStartup", "MakeRequest", v4.aggregate.makeRequest, v0);
    v5("NetworkProfileDuringStartup", "ReceiveResponse", v4.aggregate.receiveResponse, v0);
end;
return v1;
