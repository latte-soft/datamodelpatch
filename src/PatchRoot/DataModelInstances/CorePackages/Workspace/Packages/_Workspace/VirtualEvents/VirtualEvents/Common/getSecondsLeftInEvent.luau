local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
return function(v3, v4)
    local v5 = v2(v3);
    if v4.UnixTimestamp < v5.startDate.UnixTimestamp then
        return math.huge;
    elseif v5.endDate.UnixTimestamp < v4.UnixTimestamp then
        return 0;
    else
        return (v5.endDate.UnixTimestamp - v5.startDate.UnixTimestamp) - (v4.UnixTimestamp - v5.startDate.UnixTimestamp);
    end;
end;
