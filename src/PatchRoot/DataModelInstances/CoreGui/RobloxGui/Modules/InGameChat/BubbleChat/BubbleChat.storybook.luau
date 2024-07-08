local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
require(l_CorePackages_0.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local v4 = require(script.Parent.Helpers.StoryStore);
local v5 = require(script.Parent.ChatSettings);
v2.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
return {
    roact = v2, 
    mapStory = function(v6)
        return function(v7)
            return v2.createElement(v3.StoreProvider, {
                store = v4
            }, {
                Story = v2.createElement(v6, v1.Dictionary.join(v7, {
                    chatSettings = v5
                }))
            });
        end;
    end
};
