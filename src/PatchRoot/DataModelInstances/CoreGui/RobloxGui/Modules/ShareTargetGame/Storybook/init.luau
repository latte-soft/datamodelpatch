local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers);
return {
    name = "sharetargetgame", 
    storyRoot = script, 
    middleware = function(v3, v4)
        require(l_CorePackages_0.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
        local v5 = v1.mount(v2.createStyleProvider({
            Story = v1.createElement(v3)
        }, {
            withDarkTheme = false
        }), v4, "StoryRoot");
        return function()
            v1.unmount(v5);
        end;
    end
};
