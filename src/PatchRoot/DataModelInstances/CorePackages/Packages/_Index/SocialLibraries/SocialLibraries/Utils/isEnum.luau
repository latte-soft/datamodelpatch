return function(v0)
    if not (type(v0) == "userdata") or not v0.rawValue then
        return false;
    else
        return true;
    end;
end;
