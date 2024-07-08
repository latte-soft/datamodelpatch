return require(game:GetService("CorePackages").Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(v0, v1)
    return {
        userId = v0, 
        userName = v1
    };
end);
