local _ = require(script.Parent.Parent.Types);
return function(v1)
    local v2, v3, v4 = string.match(v1.filePath, "(%d+)_(%d+)_(%d+)%.?%w*$");
    if not (v2 ~= nil and v3 ~= nil) or v4 == nil then
        return nil;
    else
        local v5 = tonumber(v2);
        local v6 = tonumber(v3);
        local v7 = tonumber(v4);
        assert(v5 ~= nil, "userId should not be nil");
        assert(v6 ~= nil, "placeId should not be nil");
        assert(v7 ~= nil, "unixTimestamp should not be nil");
        return {
            userId = v5, 
            placeId = v6, 
            unixTimestamp = v7
        };
    end;
end;
