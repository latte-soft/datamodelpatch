return function(v0, v1, v2, v3)
    if not v0 then
        return "";
    elseif not (v1 ~= "Muted") or v1 == "LOCAL_MUTED" then
        return v0("Muted", v3);
    elseif v1 == "Connecting" then
        return v0("Connecting", v3);
    elseif v1 == "Inactive" then
        return v0("Unmuted0", v3);
    elseif v1 == "Talking" then
        return v0("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v2)), v3);
    else
        return v0("Error", v3);
    end;
end;
