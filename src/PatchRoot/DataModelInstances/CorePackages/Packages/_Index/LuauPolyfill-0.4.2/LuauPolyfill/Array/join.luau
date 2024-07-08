local _ = require(script.Parent.Parent.types);
local v1 = require(script.Parent.map);
return function(v2, v3)
    if #v2 == 0 then
        return "";
    else
        return table.concat(v1(v2, function(v4)
            return (tostring(v4));
        end), v3 or ",");
    end;
end;
