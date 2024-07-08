return function(v0, v1, v2)
    assert(type(v1) == "number", "Expected beatInterval to be a number");
    v0:setRBXEventStream(string.format("%s%d", "heartbeat", v1), "pageHeartbeat", {
        url = v2
    });
end;
