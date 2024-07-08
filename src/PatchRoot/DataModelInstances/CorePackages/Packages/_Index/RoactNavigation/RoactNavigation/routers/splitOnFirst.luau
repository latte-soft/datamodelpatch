local function _(v0)
    return v0;
end;
return function(v2, v3)
    if not (type(v2) == "string") or type(v3) ~= "string" then
        error("Expected the arguments to be of type `string`");
    end;
    if v3 == "" then
        return {
            v2
        };
    else
        local v4 = v2:find(v3, 1, true);
        if v4 == nil then
            return {
                v2
            };
        else
            return {
                v2:sub(1, v4 - 1), 
                v2:sub(v4 + v3:len())
            };
        end;
    end;
end;
