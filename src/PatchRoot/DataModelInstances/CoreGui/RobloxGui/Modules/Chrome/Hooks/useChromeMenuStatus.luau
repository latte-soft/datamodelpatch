local v0 = require(script.Parent.Parent.Service);
local v1 = require(script.Parent.useObservableValue);
return function()
    return v1(v0:status());
end;
