local v0 = require(game:GetService("CorePackages").Cryo);
local v1 = require(script.Parent.RetryWithOverridableWait);
return function(v2)
    return v1((v0.Dictionary.join(v2, {
        waitImpl = wait
    })));
end;
