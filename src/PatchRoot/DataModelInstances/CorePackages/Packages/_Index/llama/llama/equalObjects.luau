return function(...)
    for v0 = 1, select("#", ...) - 1 do
        if select(v0, ...) ~= select(v0 + 1, ...) then
            return false;
        end;
    end;
    return true;
end;
