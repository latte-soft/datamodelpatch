return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        reportCategory = v0, 
        reportType = v1, 
        annotationPoints = v2
    };
end);
