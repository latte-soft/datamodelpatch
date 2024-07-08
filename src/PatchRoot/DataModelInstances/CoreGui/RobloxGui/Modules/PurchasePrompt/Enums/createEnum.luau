local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbols.Symbol);
local v2 = require(l_Parent_0.strict);
return function(v3, v4)
    assert(typeof(v3) == "string", "Bad argument #1, expected string");
    assert(typeof(v4) == "table", "Bad argument #2, expected list of values");
    local v5 = {};
    for _, v7 in ipairs(v4) do
        assert(v7 ~= "isMember", "Shadowing 'isMember' function is not allowed");
        assert(typeof(v7) == "string", "Only string names are supported for enum types");
        local v8 = v1.named(v7);
        local v9 = ("%s.%s"):format(v3, v7);
        getmetatable(v8).__tostring = function()
            return v9;
        end;
        v5[v7] = v8;
    end;
    v5.isMember = function(v10)
        if typeof(v10) ~= "userdata" then
            return false;
        else
            for _, v12 in pairs(v5) do
                if v10 == v12 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    getmetatable((newproxy(true))).__index = v5;
    return v2(v5, v3);
end;
