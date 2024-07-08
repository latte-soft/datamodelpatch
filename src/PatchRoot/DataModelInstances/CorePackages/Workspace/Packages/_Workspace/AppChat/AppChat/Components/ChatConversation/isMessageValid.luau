return function(v0, v1)
    if v1 < #v0 then
        return false;
    elseif not v0:match("^%s*$") then
        return true;
    else
        return false;
    end;
end;
