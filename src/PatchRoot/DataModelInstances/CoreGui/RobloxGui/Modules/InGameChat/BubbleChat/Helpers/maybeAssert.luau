local v0 = require(script.Parent.Parent.GlobalConfig);
return function(...)
    if not v0.actionValidation then
        return ;
    else
        return assert(...);
    end;
end;
