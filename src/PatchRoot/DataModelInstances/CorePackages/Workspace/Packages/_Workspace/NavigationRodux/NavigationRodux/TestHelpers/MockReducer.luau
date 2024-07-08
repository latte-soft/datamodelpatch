local v0 = require(script:FindFirstAncestor("NavigationRodux").Parent.Cryo);
return function(v1, v2)
    v1 = v1 or {
        Navigation = {
            lockNavigationActions = nil
        }
    };
    if v2.type == "ApplySetNavigationLocked" then
        if v1.Navigation.lockNavigationActions == v2.locked then
            return v1;
        else
            return {
                Navigation = v0.Dictionary.join(v1.Navigation, {
                    lockNavigationActions = v2.locked or false
                })
            };
        end;
    else
        return v1;
    end;
end;
