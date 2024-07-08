local v0 = {
    Enum = require(game:GetService("CorePackages").enumerate)(script.Name, {
        Default = -1, 
        Flooded = 2, 
        InvalidPassword = 7, 
        InvalidCurrentPassword = 8, 
        PinLocked = 9
    })
};
v0.valueToLocalizationKey = {
    [v0.Enum.Default] = "Feature.AccountSecurityPrompt.Message.Error.Password.Default", 
    [v0.Enum.Flooded] = "Feature.AccountSecurityPrompt.Message.Error.Password.Flooded", 
    [v0.Enum.InvalidPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidPassword", 
    [v0.Enum.InvalidCurrentPassword] = "Feature.AccountSecurityPrompt.Message.Error.Password.InvalidCurrentPassword", 
    [v0.Enum.PinLocked] = "Feature.AccountSecurityPrompt.Message.Error.Password.PinLocked"
};
v0.localizationKeys = {};
for _, v2 in pairs(v0.valueToLocalizationKey) do
    v0.localizationKeys[v2] = v2;
end;
v0.toString = function(v3, v4)
    return v3[v0.valueToLocalizationKey[v4] or v0.valueToLocalizationKey[v0.Enum.Default]];
end;
return v0;
