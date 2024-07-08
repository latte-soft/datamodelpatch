local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer);
return function(v1)
    local v2 = table.clone(v1);
    table.sort(v2, function(v3, v4)
        if ((not v3.eventTime or not v3.eventTime.startUtc) or not v4.eventTime) or not v4.eventTime.startUtc then
            return true;
        else
            return (DateTime.fromIsoDate(v3.eventTime.startUtc) or DateTime.now()).UnixTimestamp < (DateTime.fromIsoDate(v4.eventTime.startUtc) or DateTime.now()).UnixTimestamp;
        end;
    end);
    return v2;
end;
