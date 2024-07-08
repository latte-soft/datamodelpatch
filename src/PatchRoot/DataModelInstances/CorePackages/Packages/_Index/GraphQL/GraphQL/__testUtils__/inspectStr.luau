local l_HttpService_0 = game:GetService("HttpService");
local function _(v1)
    v1 = string.gsub(v1, "\n\"", "\n`");
    if v1:sub(1, 1) == "\"" then
        return "`" .. string.sub(v1, 2);
    else
        return v1;
    end;
end;
local function _(v3)
    v3 = string.gsub(v3, "\"\n", "`\n");
    if v3:sub(-1) == "\"" then
        return string.sub(v3, 1, -2) .. "`";
    else
        return v3;
    end;
end;
return {
    inspectStr = function(v5)
        if v5 == nil then
            return "nil";
        else
            local v6 = string.gsub(l_HttpService_0:JSONEncode(v5), "\n\"", "\n`");
            local v7 = string.gsub(if v6:sub(1, 1) == "\"" then "`" .. string.sub(v6, 2) else v6, "\"\n", "`\n");
            return (string.gsub(string.gsub(if v7:sub(-1) == "\"" then string.sub(v7, 1, -2) .. "`" else v7, "\\\"", "\""), "\\\\", "\\"));
        end;
    end
};
