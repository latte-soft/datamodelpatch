local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(script.Parent.temp.styleWrapper);
local v4 = require(script.Parent.temp.mockLocale);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = v1.Lumberyak.Logger.new();
v6:addSink({
    maxLevel = v6.Levels.fromString("info"), 
    log = function(_, v8, _)
        print(v8);
    end
});
v5:setParent(v6);
return {
    storyRoots = {
        l_script_FirstAncestor_0.UserCarousel.Components
    }, 
    roact = l_Roact_0, 
    mapStory = function(v10)
        return function(v11)
            return v4(v3(v10, v11));
        end;
    end
};
