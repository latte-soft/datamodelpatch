local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
require(l_Parent_0.UIBlox).init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local v4 = require(script.Parent.temp.mockLocale);
local v5 = require(script.Parent.temp.styleWrapper);
local v6 = require(l_script_FirstAncestor_0.Logger);
local v7 = v2.Lumberyak.Logger.new();
v7:addSink({
    maxLevel = v7.Levels.fromString("info"), 
    log = function(_, v9, _)
        print(v9);
    end
});
v6:setParent(v7);
return {
    storyRoots = {
        l_script_FirstAncestor_0.Components
    }, 
    roact = l_Roact_0, 
    mapStory = function(v11)
        return function(v12)
            return v4(v5(v11, v12));
        end;
    end
};
