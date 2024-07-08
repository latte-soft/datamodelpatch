local l___DEV___0 = _G.__DEV__;
local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v2)
    if l___DEV___0 then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call");
    end;
    return table.isfrozen(v2);
end;
