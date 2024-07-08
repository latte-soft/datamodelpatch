local v0 = require(game:GetService("CorePackages").Packages.Cryo);
local v1 = 0;
return function(v2)
    v1 = v1 + 1;
    return v0.Dictionary.join({
        name = "Foo", 
        id = tostring(v1), 
        userId = "1", 
        text = "Hello, World", 
        timestamp = v1
    }, v2);
end;
