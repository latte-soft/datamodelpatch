local v0 = require(script.Parent.checkListConsistency);
local function v1(v2, v3)
    v3 = v3 or "";
    if type(v2) == "table" then
        local v4 = "";
        if not v0(v2) then
            v4 = v4 .. "-- WARNING: this table fails the list consistency test\n";
        end;
        v4 = v4 .. "{\n";
        for v5, v6 in pairs(v2) do
            if type(v5) == "string" then
                v4 = v4 .. "  " .. v3 .. tostring(v5) .. " = " .. v1(v6, "  " .. v3) .. ";\n";
            end;
            if type(v5) == "number" then
                v4 = v4 .. "  " .. v3 .. v1(v6, "  " .. v3) .. ",\n";
            end;
        end;
        return v4 .. v3 .. "}";
    else
        return (tostring(v2));
    end;
end;
return v1;
