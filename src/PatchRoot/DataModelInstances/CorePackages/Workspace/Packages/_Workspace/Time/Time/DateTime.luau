local l_LocalizationService_0 = game:GetService("LocalizationService");
local v1 = require(script.Parent.TimeZone);
local v2 = {};
v2.new = function(v3, v4, v5, v6, v7, v8, v9)
    local v10 = {
        dateTime = DateTime.fromUniversalTime(v3 or 1970, v4 or 1, v5 or 1, v6 or 0, v7 or 0, v8 or 0, v9 or 0)
    };
    setmetatable(v10, v2);
    return v10;
end;
v2.now = function()
    local v11 = {
        dateTime = DateTime.now()
    };
    setmetatable(v11, v2);
    return v11;
end;
v2.fromUnixTimestamp = function(v12)
    assert(type(v12) == "number", "Invalid argument #1 to fromUnixTimestamp, expected number.");
    local v13 = {
        dateTime = DateTime.fromUnixTimestampMillis(v12 * 1000)
    };
    setmetatable(v13, v2);
    return v13;
end;
v2.fromIsoDate = function(v14)
    assert(type(v14) == "string", "Invalid argument #1 to DateTime.fromIsoDate, expected string.");
    local v15 = {
        dateTime = DateTime.fromIsoDate(v14)
    };
    setmetatable(v15, v2);
    return v15;
end;
v2.Format = function(v16, v17, v18, v19)
    assert(type(v17) == "string", "Invalid argument #1 to Format, expected string.");
    v18 = v18 or v1.Current;
    v19 = v19 or l_LocalizationService_0.RobloxLocaleId;
    if v18 == v1.UTC then
        return v16.dateTime:FormatUniversalTime(v17, v19);
    elseif v18 == v1.Current then
        return v16.dateTime:FormatLocalTime(v17, v19);
    else
        error(("Invalid TimeZone \"%s\""):format((tostring(v18))), 2);
        return ;
    end;
end;
v2.GetValues = function(v20, v21)
    v21 = v21 or v1.Current;
    if v21 == v1.UTC then
        return v20.dateTime:ToUniversalTime();
    elseif v21 == v1.Current then
        return v20.dateTime:ToLocalTime();
    else
        error(("Invalid TimeZone \"%s\""):format((tostring(v21))), 2);
        return ;
    end;
end;
v2.GetUnixTimestamp = function(v22)
    if v22.dateTime:ToUniversalTime().Millisecond > 0 then
        return v22.dateTime.UnixTimestamp + (v22.dateTime.UnixTimestampMillis % 1000) / 1000;
    else
        return v22.dateTime.UnixTimestamp;
    end;
end;
v2.GetIsoDate = function(v23)
    return v23.dateTime:ToIsoDate();
end;
v2.GetLongRelativeTime = function(v24, _, v26, v27)
    return v24:Format("lll", v26, v27);
end;
v2.GetShortRelativeTime = function(v28, _, v30, v31)
    return v28:Format("ll", v30 or v1.Current, v31);
end;
v2.__index = v2;
return v2;
