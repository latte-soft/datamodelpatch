local l_Dash_0 = require(script.Parent.Parent.dependencies).Dash;
local v1 = {
    contextualMenuClick = function()
    end, 
    buttonClick = function()
    end, 
    navigateToProfile = function()
    end, 
    pageLoaded = function()
    end, 
    pageLoadedWithData = function()
    end, 
    primaryCTAClick = function()
    end, 
    viewCatalogItem = function()
    end, 
    joinExperience = function()
    end
};
return function(v2)
    return l_Dash_0.join(v1, v2);
end;
