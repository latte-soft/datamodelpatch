return require(game:GetService("CorePackages").Rodux).createReducer({}, {
    [require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpBundles).name] = function(_, v1)
        return v1.bundles;
    end
});
