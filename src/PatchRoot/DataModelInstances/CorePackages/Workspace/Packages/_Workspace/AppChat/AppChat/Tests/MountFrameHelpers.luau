local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.UnitTestHelpers);
local l_mountFrame_0 = v1.mountFrame;
local l_mountStyledFrame_0 = v1.mountStyledFrame;
local v4 = require(l_script_FirstAncestor_0.LegacyAnalytics.Mock.mockAnalytics);
local v5 = require(script.Parent.mockApolloProvider);
local v6 = require(script.Parent.mockTopBar);
return {
    mountFrameWithApollo = function(v7, v8)
        return l_mountFrame_0(v5(v4(v7)), v8);
    end, 
    mountFrame = l_mountFrame_0, 
    mountStyledFrame = function(v9, v10)
        return l_mountStyledFrame_0(v4(v9), v10);
    end, 
    mountFrameWithAnalytics = function(v11, v12)
        return l_mountFrame_0(v4(v11), v12);
    end, 
    mountFrameWithTopBar = function(v13, v14)
        return l_mountFrame_0(v5(v4(v6(v13))), v14);
    end
};
