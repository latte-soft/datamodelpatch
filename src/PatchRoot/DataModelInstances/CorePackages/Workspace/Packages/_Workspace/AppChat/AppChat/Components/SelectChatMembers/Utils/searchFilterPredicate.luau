return function(v0, v1)
    if not v0 or v0 == "" then
        return true;
    else
        local l_displayName_0 = v1.displayName;
        if v1.alias ~= nil then
            l_displayName_0 = l_displayName_0 .. v1.alias;
        end;
        return string.find(string.lower(l_displayName_0), string.lower(v0), 1, true) ~= nil;
    end;
end;
