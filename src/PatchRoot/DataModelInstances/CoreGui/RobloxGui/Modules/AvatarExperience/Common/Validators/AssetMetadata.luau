local v0 = require(game:GetService("CorePackages").Packages.t);
return v0.interface({
    version = v0.string, 
    order = v0.optional(v0.number), 
    type = v0.optional(v0.enum(Enum.AccessoryType)), 
    isLayered = v0.optional(v0.boolean)
});
