local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent.Parent.ES7Types);
local v2 = require(l_Parent_0.map);
return function(v3, v4)
    if #v3 == 0 then
        return "";
    else
        return table.concat(v2(v3, function(v5)
            return (tostring(v5));
        end), v4 or ",");
    end;
end;
