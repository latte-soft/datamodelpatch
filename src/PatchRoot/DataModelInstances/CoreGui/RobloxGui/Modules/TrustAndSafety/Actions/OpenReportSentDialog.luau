return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        reportType = v0, 
        targetPlayer = v1, 
        reportCategory = v2
    };
end);
