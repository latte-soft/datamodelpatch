return function(v0)
    if not v0 or v0 == "" then
        return false;
    else
        assert(v0, "");
        return string.find(v0, "^%+*[%d%-%s%.%(%)]+$") ~= nil and #v0:gsub("[^%d]", "") >= 6;
    end;
end;
