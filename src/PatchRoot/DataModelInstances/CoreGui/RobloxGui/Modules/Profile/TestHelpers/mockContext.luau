local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v3 = require(l_Parent_0.Common.ProfileTypes);
local l_Dash_0 = v1.Dash;
local v9 = {
    navigateToLuaAppPages = require(script.Parent.mockNavigateToLuaAppPages)(), 
    profileUserId = "123", 
    peekViewProps = require(script.Parent.mockPeekViewProps)(), 
    abbreviateCount = function(v5)
        return (tostring(v5));
    end, 
    wideMode = false, 
    localUserId = "456", 
    catalogAnalytics = {
        clickCatalogItemFromProfile = function(_, _, _)
        end
    }, 
    profileType = v3.Default, 
    resetProfileType = function()
    end, 
    navigationParams = {}
};
return function(v10)
    return l_Dash_0.join(v9, v10);
end;
