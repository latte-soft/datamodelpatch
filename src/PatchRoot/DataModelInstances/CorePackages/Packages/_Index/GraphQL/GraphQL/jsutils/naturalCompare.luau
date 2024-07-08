local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Number_0 = v0.Number;
local l_String_0 = v0.String;
local l_isNaN_0 = l_Number_0.isNaN;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local function v15(v7, v8)
    local v9 = 1;
    local v10 = 1;
    while true do
        if v9 <= #v7 and v10 <= #v8 then
            local v11 = l_String_0.charCodeAt(v7, v9);
            local v12 = l_String_0.charCodeAt(v8, v10);
            if not v4(v11) or not v4(v12) then
                if v11 < v12 then
                    return -1;
                elseif v12 < v11 then
                    return 1;
                else
                    v9 = v9 + 1;
                    v10 = v10 + 1;
                end;
            else
                local v13 = 0;
                while true do
                    v9 = v9 + 1;
                    v13 = (v13 * 10 + v11) - v5;
                    v11 = l_String_0.charCodeAt(v7, v9);
                    if not (v4(v11) and v13 > 0) then
                        break;
                    end;
                end;
                local v14 = 0;
                while true do
                    v10 = v10 + 1;
                    v14 = (v14 * 10 + v12) - v5;
                    v12 = l_String_0.charCodeAt(v8, v10);
                    if not (v4(v12) and v14 > 0) then
                        break;
                    end;
                end;
                if v13 < v14 then
                    return -1;
                elseif v14 < v13 then
                    return 1;
                end;
            end;
        else
            return #v7 - #v8;
        end;
    end;
end;
v5 = 48;
v6 = 57;
v4 = function(v16)
    local v17 = not l_isNaN_0(v16);
    if v17 then
        v17 = false;
        if v5 <= v16 then
            v17 = v16 <= v6;
        end;
    end;
    return v17;
end;
return {
    naturalCompare = v15
};
