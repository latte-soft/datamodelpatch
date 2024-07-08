local v0 = require(game:GetService("CorePackages").Packages.Dash);
return function(v1)
    return v0.map(v1, function(v2)
        return function(...)
            return v2(...);
        end;
    end);
end;
