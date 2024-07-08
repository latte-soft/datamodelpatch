local l_getDeepValue_0 = require(script:FindFirstAncestor("PYMKCarousel").dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v1, v2)
    return l_getDeepValue_0(v1, string.format("metadata.%s", v2)) or {};
end;
