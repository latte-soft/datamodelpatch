local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_beforeAll_0 = require(l_script_FirstAncestor_0.devDependencies).JestGlobals.beforeAll;
local _ = require(l_script_FirstAncestor_0.Flags.getFIntShowFriendRecommendationsLimit);
l_beforeAll_0(function(_)
    game:SetFastIntForTesting("ShowFriendRecommendationsLimit", 6);
    v1.RoduxNetworking.setNetworkImpl(function(v5)
        error(string.format("Should have replaced network implementation for url: %s", (tostring(v5))));
    end);
end);
