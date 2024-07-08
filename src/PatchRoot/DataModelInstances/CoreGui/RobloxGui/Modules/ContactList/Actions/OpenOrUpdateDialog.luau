return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        title = v0, 
        bodyText = v1, 
        dismissCallback = v2
    };
end);
