local v0 = require(game:GetService("CorePackages").Packages.t);
return v0.union(v0.instanceIsA("Player"), v0.interface({
    UserId = v0.integer, 
    Name = v0.string, 
    DisplayName = v0.string
}));
