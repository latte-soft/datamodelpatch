return function(v0, v1)
    local v2 = v0 or {};
    if not (not (not (v1 ~= "POST") or v1 == "PATCH") or v2["Content-Type"]) then
        v2["Content-Type"] = "application/json";
    end;
    return v2;
end;
