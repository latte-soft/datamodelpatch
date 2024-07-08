local v0 = require(game:GetService("CorePackages").Packages.React);
return function(v1)
    local v2 = v0.useRef(v1);
    v2.current = v1;
    return v2;
end;
