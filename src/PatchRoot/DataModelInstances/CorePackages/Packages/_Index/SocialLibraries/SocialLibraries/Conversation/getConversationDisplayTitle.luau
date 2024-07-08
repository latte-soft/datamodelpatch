return function(v0)
    if v0 then
        local v1 = v0.title or v0.titleForViewer;
        if v1 then
            return string.gsub(tostring(v1), "\n", "");
        end;
    end;
    return "";
end;
