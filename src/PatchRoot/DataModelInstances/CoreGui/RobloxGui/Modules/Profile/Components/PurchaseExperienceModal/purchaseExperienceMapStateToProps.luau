local l_getDeepValue_0 = require(script.Parent.Parent.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v1, v2)
    local v3 = v2.navigation.getParam("universeId");
    return {
        screenSize = v1.ScreenSize, 
        gameDetails = l_getDeepValue_0(v1, string.format("Profile.Games.byGameId.%s", v3)), 
        productInfo = l_getDeepValue_0(v1, string.format("Profile.Games.productInfoByGameId.%s", v3))
    };
end;
