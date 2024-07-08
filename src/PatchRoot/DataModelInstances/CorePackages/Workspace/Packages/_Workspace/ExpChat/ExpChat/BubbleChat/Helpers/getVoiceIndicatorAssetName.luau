local v0 = require(script:FindFirstAncestor("ExpChat").Flags.getFFlagEnableShimmeringIcon);
return function(v1, v2, v3)
    local _ = nil;
    if v0() and v1 == "Connecting" then
        return "icons/controls/voice/" .. v3 .. "_0_dark";
    elseif not (v1 ~= "Muted") or v1 == "LOCAL_MUTED" then
        return "icons/controls/voice/" .. v3 .. "_off_light";
    elseif not (v1 ~= "Inactive") or v1 == "Connecting" then
        return "icons/controls/voice/" .. v3 .. "_0_light";
    elseif v1 == "Talking" then
        return "icons/controls/voice/" .. v3 .. "_" .. tostring(20 * math.floor(0.5 + 5 * v2)) .. "_light";
    else
        return "icons/controls/voice/" .. v3 .. "_error_light";
    end;
end;
