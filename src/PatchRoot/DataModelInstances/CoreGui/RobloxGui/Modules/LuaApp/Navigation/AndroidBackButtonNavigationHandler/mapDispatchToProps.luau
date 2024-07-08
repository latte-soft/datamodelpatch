local v0 = require(script:FindFirstAncestor("Modules").LuaApp.Thunks.NavigateBack);
return function(v1)
    return {
        navigateBackInAppRoute = function()
            v1(v0());
        end
    };
end;
