local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer);
return function(v1)
    return {
        startDate = if not not v1.eventTime and v1.eventTime.startUtc then DateTime.fromIsoDate(v1.eventTime.startUtc) else nil or DateTime.now(), 
        endDate = if not not v1.eventTime and v1.eventTime.endUtc then DateTime.fromIsoDate(v1.eventTime.endUtc) else nil or DateTime.now()
    };
end;
