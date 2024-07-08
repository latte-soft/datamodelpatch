local v0 = require(game:GetService("CorePackages").Cryo);
return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(v1)
    return v0.Dictionary.join({
        updateRequested = true
    }, v1 or {});
end);
