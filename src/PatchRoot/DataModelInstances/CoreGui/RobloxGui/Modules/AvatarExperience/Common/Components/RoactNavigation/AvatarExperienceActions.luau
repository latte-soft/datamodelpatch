local v0 = {
    ClearScreens = "ClearScreens"
};
v0.clearScreens = function(v1)
    return {
        type = v0.ClearScreens, 
        routeNames = v1
    };
end;
return v0;
