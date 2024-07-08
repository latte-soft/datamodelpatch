local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(script.temp.StyleSwapper);
local v3 = require(l_script_FirstAncestor_0.devDependencies).Lumberyak.Logger.new();
v3:addSink({
    maxLevel = v3.Levels.fromString("info"), 
    log = function(_, v5, _)
        if not _G.__TESTEZ_RUNNING_TEST__ then
            print(v5);
        end;
    end
});
v1:setParent(v3);
return {
    name = "SocialTab", 
    storyRoot = l_script_FirstAncestor_0.Components, 
    middleware = v2()
};
