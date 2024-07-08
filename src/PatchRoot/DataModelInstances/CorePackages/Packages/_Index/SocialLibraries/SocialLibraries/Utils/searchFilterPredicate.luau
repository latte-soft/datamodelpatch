return function(v0, v1)
    if not v0 or v0 == "" then
        return true;
    else
        return string.find(string.lower(v1), string.lower(v0), 1, true) ~= nil;
    end;
end;
