return function(v0)
    local v1 = DateTime.now();
    local _ = nil;
    return ("%s AT %s"):format(v0:FormatLocalTime(v1:ToLocalTime().Year < v0:ToLocalTime().Year and "ll" or "ddd, MMM DD", "en-us"), v0:FormatLocalTime("LT", "en-us")):upper();
end;
