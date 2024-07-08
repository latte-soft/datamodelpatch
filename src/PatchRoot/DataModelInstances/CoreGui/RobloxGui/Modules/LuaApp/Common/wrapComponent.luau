local _ = require(game:GetService("CorePackages").Packages.React);
return function(v1)
    return function(v2)
        return function(v3)
            return v1(v2, v3);
        end;
    end;
end;
