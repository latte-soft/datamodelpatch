local v0 = require(script.Parent.map);
return function(v1, v2)
    if #v1 == 0 then
        return "";
    else
        return table.concat(v0(v1, function(v3)
            return (tostring(v3));
        end), v2 or ",");
    end;
end;
