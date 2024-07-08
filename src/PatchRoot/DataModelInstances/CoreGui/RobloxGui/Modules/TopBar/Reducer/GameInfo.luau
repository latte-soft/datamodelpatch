return require(game:GetService("CorePackages").Rodux).createReducer({
    name = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.RobloxTranslator):FormatByKey("CoreScripts.TopBar.GameNamePlaceHolder")
}, {
    [require(script.Parent.Parent.Actions.SetGameName).name] = function(_, v1)
        return {
            name = v1.gameName
        };
    end
});
