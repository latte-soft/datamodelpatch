return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        reportType = v0, 
        targetPlayer = v1
    };
end);
