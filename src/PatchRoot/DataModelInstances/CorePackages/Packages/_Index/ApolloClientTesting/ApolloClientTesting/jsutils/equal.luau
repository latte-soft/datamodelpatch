local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local function v3(v4, v5)
    if typeof(v4) ~= typeof(v5) then
        return false;
    elseif v4 == v5 then
        return true;
    elseif typeof(v4) == "table" then
        if not l_Array_0.isArray(v4) or l_Array_0.isArray(v5) then
            if not (#v4 == #v5) or #l_Object_0.keys(v4) ~= #l_Object_0.keys(v5) then
                return false;
            else
                if not l_Array_0.isArray(v4) then
                    for v6 in pairs(v4) do
                        if not v3(v4[tostring(v6)], v5[tostring(v6)]) then
                            return false;
                        end;
                    end;
                else
                    for v7, _ in ipairs(v4) do
                        if not v3(v4[v7], v5[v7]) then
                            return false;
                        end;
                    end;
                end;
                return true;
            end;
        else
            return false;
        end;
    elseif not (typeof(v4) ~= "string" and typeof(v4) ~= "number") or typeof(v4) == "boolean" then
        return v4 == v5;
    elseif typeof(v4) == "function" then
        local v9 = false;
        if debug.info(v4, "n") == debug.info(v5, "n") then
            v9 = false;
            if debug.info(v4, "s") == debug.info(v5, "s") then
                v9 = false;
                if debug.info(v4, "l") == debug.info(v5, "l") then
                    v9 = debug.info(v4, "a") == debug.info(v5, "a");
                end;
            end;
        end;
        return v9;
    else
        if typeof(v4) == "thread" then
            error("unhandled equality check for type 'thread'");
        elseif typeof(v4) == "userdata" then
            error("unhandled equality check for type 'userdata'");
        end;
        error("unhandled equality check for type " .. typeof(v4));
        return ;
    end;
end;
return v3;
