return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.createReducer(game:GetService("UserInputService"):GetPlatform() == Enum.Platform.XBoxOne, {
    [require(script.Parent.Parent.Actions.SetGamepadEnabled).name] = function(_, v1)
        return v1.enabled;
    end
}));
