local _ = require(script.Parent.Parent.types);
return function(v1)
    return table.isfrozen(v1);
end;
