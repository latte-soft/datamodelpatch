local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v2)
    v1.isType(v2, "boolean", "Actions.SetCameraButton.errorOccurred");
    return {
        errorOccurred = v2
    };
end);
