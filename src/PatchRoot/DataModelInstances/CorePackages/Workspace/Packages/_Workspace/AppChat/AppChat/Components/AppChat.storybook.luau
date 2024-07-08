local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
require(l_Parent_0.UIBlox).init({});
local l_StoryMiddleware_0 = require(l_script_FirstAncestor_0.SocialLibraries).StoryMiddleware;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Tests.mockApolloProvider);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
l_Logger_0:addSink({
    maxLevel = l_Logger_0.Levels.fromString("trace"), 
    log = function(_, v9, _)
        print(v9);
    end
});
v2:setParent(l_Logger_0);
return {
    roact = v4, 
    mapStory = function(v11)
        local v12 = l_StoryMiddleware_0(v11);
        return function(v13)
            return v6(v12(v5.Dictionary.join((not not v13 and v13.definition) and v13.definition.props or {}, v13)));
        end;
    end
};
