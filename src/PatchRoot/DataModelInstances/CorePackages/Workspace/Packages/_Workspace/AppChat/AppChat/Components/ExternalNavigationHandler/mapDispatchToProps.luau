local v0 = require(script.Parent.Parent.Parent.Actions.CompleteExternalNavigationIntoChat);
return function(v1)
    return {
        completeExternalNavigation = function(v2)
            v1(v0(v2));
        end
    };
end;
