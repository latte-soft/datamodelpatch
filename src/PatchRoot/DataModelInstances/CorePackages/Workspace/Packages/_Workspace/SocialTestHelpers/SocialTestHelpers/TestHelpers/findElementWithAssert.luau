local l_Parent_0 = script:FindFirstAncestor("SocialTestHelpers").Parent;
local l_expect_0 = require(l_Parent_0.JestGlobals).expect;
local v2 = require(l_Parent_0.RhodiumHelpers);
return function(v3)
    return function(v4, v5)
        local v6 = v2.findFirstElement(v4, v3);
        if not v5.assertElementExists then
            l_expect_0(v6).toBeNil();
            return nil;
        else
            l_expect_0(v6).never.toBeNil();
            return v6;
        end;
    end;
end;
