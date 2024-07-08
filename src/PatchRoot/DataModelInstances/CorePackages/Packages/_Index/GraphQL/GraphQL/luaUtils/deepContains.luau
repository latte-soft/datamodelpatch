local l_Number_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Number;
local v1 = require(script.Parent.null);
local function v2(v3, v4)
    if typeof(v3) ~= typeof(v4) then
        return false, (("{1}: value of type '%s'\n{2}: value of type '%s'"):format(typeof(v3), (typeof(v4))));
    elseif not l_Number_0.isNaN(v3) or not l_Number_0.isNaN(v4) then
        if v3 == v4 then
            return true;
        elseif not (v3 ~= v1 and v4 ~= v1) or typeof(v3) ~= "table" then
            return false, string.format("{1} (%s) ~= {2} (%s)", tostring(v3), (tostring(v4)));
        else
            for v5, v6 in pairs(v4) do
                local v7, v8 = v2(v3[v5], v6);
                if not v7 then
                    return false, (v8:gsub("{1}", ("{1}[%s]"):format((tostring(v5)))):gsub("{2}", ("{2}[%s]"):format((tostring(v5)))));
                end;
            end;
            return true;
        end;
    else
        return true;
    end;
end;
return v2;
