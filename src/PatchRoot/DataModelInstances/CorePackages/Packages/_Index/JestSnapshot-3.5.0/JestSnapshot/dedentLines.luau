local _ = require(script.Parent.Parent.LuauPolyfill);
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local _ = nil;
v1 = function(v8)
    local v9 = string.match(v8, "^[ ]+");
    if v9 == nil then
        return 0;
    else
        return v9:len() - v9:len() % 2;
    end;
end;
v2 = function(v10)
    return v10:sub(v1(v10) + 1);
end;
v3 = function(v11)
    local v12 = 0;
    local v13 = string.find(v11, "\"");
    while v13 do
        if not (v13 ~= 1) or string.sub(v11, v13 - 1, v13 - 1) ~= "\\" then
            v12 = v12 + 1;
        end;
        v13 = string.find(v11, "\"", v13 + 1);
    end;
    return v12 % 2 ~= 0;
end;
v4 = function(v14)
    return string.find(v14, "^[ ]*<") ~= nil;
end;
v5 = function(v15, v16)
    local v17 = v15[#v16 + 1];
    table.insert(v16, v2(v17));
    if not string.find(v17, ">") then
        while true do
            if #v16 < #v15 then
                v17 = v15[#v16 + 1];
                if not v3(v17) then
                    if not v4(v17) then
                        table.insert(v16, v2(v17));
                        if string.find(v17, ">") then
                            return true;
                        end;
                    elseif not v6(v15, v16) then
                        return false;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        end;
    else
        return true;
    end;
end;
v6 = function(v18, v19)
    local v20 = v18[#v19 + 1];
    if v5(v18, v19) then
        if not string.find(v18[#v19], "/>") then
            local v21 = false;
            local v22 = {};
            table.insert(v22, v1(v20));
            while true do
                if #v22 > 0 and #v19 < #v18 then
                    v20 = v18[#v19 + 1];
                    if not v4(v20) then
                        if not v21 then
                            table.insert(v19, v20:sub(v22[#v22] + 3));
                            v21 = true;
                        else
                            return false;
                        end;
                    else
                        if not string.find(v20, "</") then
                            if v5(v18, v19) then
                                if not string.find(v18[#v19], "/>") then
                                    table.insert(v22, v1(v20));
                                end;
                            else
                                return false;
                            end;
                        else
                            table.insert(v19, v2(v20));
                            table.remove(v22);
                        end;
                        v21 = false;
                    end;
                else
                    return #v22 == 0;
                end;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function(v23)
    local v24 = {};
    while true do
        if #v24 < #v23 then
            local v25 = v23[#v24 + 1];
            if not v3(v25) then
                if not v4(v25) then
                    table.insert(v24, v2(v25));
                elseif not v6(v23, v24) then
                    return nil;
                end;
            else
                return nil;
            end;
        else
            return v24;
        end;
    end;
end;
