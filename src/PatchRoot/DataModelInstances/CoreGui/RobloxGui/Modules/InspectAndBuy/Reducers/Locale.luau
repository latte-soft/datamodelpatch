return require(game:GetService("CorePackages").Rodux).createReducer("en-us", {
    [require(script.Parent.Parent.Actions.SetLocale).name] = function(_, v1)
        return v1.locale;
    end
});
