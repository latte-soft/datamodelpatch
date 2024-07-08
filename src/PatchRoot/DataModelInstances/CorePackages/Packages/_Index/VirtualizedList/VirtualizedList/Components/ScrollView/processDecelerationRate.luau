return function(v0)
    if v0 == "normal" then
        return 0.985;
    elseif v0 == "fast" then
        return 0.9;
    else
        return v0;
    end;
end;
