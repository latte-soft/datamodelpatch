return function(v0)
    if (not (v0 ~= nil and v0.errors ~= nil) or not v0.errors[1]) or not v0.errors[1].fieldData then
        return "";
    else
        return v0.errors[1].fieldData;
    end;
end;
