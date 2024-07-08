local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local v4 = {};
local v5 = {};
v4[v5] = true;
v4.new = function(v6)
    local v7 = {
        Month = 1, 
        Day = 1, 
        Year = 1970
    };
    if v6 then
        v7.Month = v6.Month or v7.Month;
        v7.Day = v6.Day or v7.Day;
        v7.Year = v6.Year or v7.Year;
        v2.isNonNegativeNumber(v7.Month, "month in Birthday constructor");
        v2.isNonNegativeNumber(v7.Day, "day in Birthday constructor");
        v2.isNonNegativeNumber(v7.Year, "year in Birthday constructor");
    end;
    setmetatable(v7, v4);
    return v7;
end;
v4.IsUnder13 = function(v8)
    local v9 = v4.new(l_DateTime_0.now():GetValues());
    if v9.Year - 13 < v8.Year then
        return true;
    elseif v8.Year < v9.Year - 13 then
        return false;
    else
        local v10 = true;
        if v9.Month >= v8.Month then
            v10 = false;
            if v9.Month == v8.Month then
                v10 = v9.Day < v8.Day;
            end;
        end;
        return v10;
    end;
end;
v4.GetAgeInYears = function(v11, v12)
    local v13 = v4.new(v12 or l_DateTime_0.now():GetValues());
    if not (v13.Month >= v11.Month) or v13.Month == v11.Month and v13.Day < v11.Day then
        return (v13.Year - v11.Year) - 1;
    else
        return v13.Year - v11.Year;
    end;
end;
v4.FormatForEndpoint = function(v14)
    return v14.Year .. "-" .. v14.Month .. "-" .. v14.Day .. "T12:00:00.000Z";
end;
v4.ToString = function(v15, v16)
    v16 = v16 or " ";
    return v15.Month .. v16 .. v15.Day .. v16 .. v15.Year;
end;
v4.is = function(v17)
    if type(v17) ~= "table" then
        return false;
    else
        return v17[v5] == true;
    end;
end;
v4.__index = v4;
return v4;
