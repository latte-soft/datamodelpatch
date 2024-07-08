return (require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0)
    return {
        creatorFilter = v0 or ""
    };
end));
