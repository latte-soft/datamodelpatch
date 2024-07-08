local v0 = {
    ClearAppScreensAction = "ClearAppScreensAction"
};
v0.clearAppScreens = function(v1)
    return {
        type = v0.ClearAppScreensAction, 
        routeNames = v1
    };
end;
return v0;
