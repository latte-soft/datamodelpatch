local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
return function(v4, v5)
    local v6 = v3(v4);
    local v7 = v6.startDate.UnixTimestamp - v5.UnixTimestamp;
    local v8 = v6.endDate.UnixTimestamp - v5.UnixTimestamp;
    if v6.startDate.UnixTimestamp <= v5.UnixTimestamp then
        if v5.UnixTimestamp < v6.endDate.UnixTimestamp then
            if v8 <= 14400 then
                return "ElapsedImminent";
            else
                return "Ongoing";
            end;
        else
            return "Elapsed";
        end;
    elseif v7 > 0 and v7 <= 14400 then
        return "UpcomingImminent";
    else
        return "Upcoming";
    end;
end;
