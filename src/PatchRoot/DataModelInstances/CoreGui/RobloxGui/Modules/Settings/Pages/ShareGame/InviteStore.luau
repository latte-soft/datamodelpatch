local v0 = require(game:GetService("CorePackages").Rodux);
return v0.Store.new(require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.AppReducer), nil, {
    v0.thunkMiddleware
});
