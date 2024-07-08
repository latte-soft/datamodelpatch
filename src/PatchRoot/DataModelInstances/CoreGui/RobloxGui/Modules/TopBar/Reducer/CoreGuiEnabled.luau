local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
return (v1.createReducer({
    [Enum.CoreGuiType.PlayerList] = true, 
    [Enum.CoreGuiType.Health] = true, 
    [Enum.CoreGuiType.Backpack] = true, 
    [Enum.CoreGuiType.Chat] = true, 
    [Enum.CoreGuiType.EmotesMenu] = true
}, {
    [require(script.Parent.Parent.Actions.UpdateCoreGuiEnabled).name] = function(v3, v4)
        if v4.coreGuiType == Enum.CoreGuiType.All then
            local v5 = {};
            for v6, _ in pairs(v3) do
                v5[v6] = v4.enabled;
            end;
            return v5;
        else
            return v2.Dictionary.join(v3, {
                [v4.coreGuiType] = v4.enabled
            });
        end;
    end
}));
