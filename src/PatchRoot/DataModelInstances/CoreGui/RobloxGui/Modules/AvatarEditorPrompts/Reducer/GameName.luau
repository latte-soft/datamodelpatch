return require(game:GetService("CorePackages").Rodux).createReducer(require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.RobloxTranslator):FormatByKey("CoreScripts.AvatarEditorPrompts.GameNamePlaceHolder"), {
    [require(script.Parent.Parent.Actions.GameNameFetched).name] = function(_, v1)
        return v1.gameName;
    end
});
