return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    return {
        screenName = v0, 
        screenHeightPix = v1, 
        topYPix = v2, 
        viewportSizePix = v3
    };
end);
