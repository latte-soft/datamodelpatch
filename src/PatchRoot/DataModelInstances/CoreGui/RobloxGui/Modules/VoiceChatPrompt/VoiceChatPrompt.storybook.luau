local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
require(l_CorePackages_0.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
v1.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
return {
    roact = v1, 
    mapStory = function(v2)
        return function(v3)
            return v1.createElement(v2, v3);
        end;
    end
};
