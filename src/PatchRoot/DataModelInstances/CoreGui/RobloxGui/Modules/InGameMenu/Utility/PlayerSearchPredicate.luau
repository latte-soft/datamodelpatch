return function(v0, v1, v2)
    if not (v0 ~= nil) or v0 == "" then
        return true;
    elseif v2 and string.find(utf8.nfdnormalize(v2):lower(), utf8.nfdnormalize(v0):lower(), 1, true) ~= nil then
        return true;
    else
        return string.find(v1:lower(), v0:lower(), 1, true) ~= nil;
    end;
end;
