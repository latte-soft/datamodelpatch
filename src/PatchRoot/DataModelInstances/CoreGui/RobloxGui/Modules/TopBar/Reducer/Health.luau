local v0 = require(game:GetService("CorePackages").Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v0.createReducer({
    isDead = false, 
    currentHealth = 100, 
    maxHealth = 100
}, {
    [require(l_Actions_0.UpdateHealth).name] = function(v2, v3)
        return {
            isDead = v2.isDead, 
            currentHealth = v3.health, 
            maxHealth = v3.maxHealth
        };
    end, 
    [require(l_Actions_0.SetIsDead).name] = function(v4, v5)
        return {
            isDead = v5.isDead, 
            currentHealth = v4.currentHealth, 
            maxHealth = v4.maxHealth
        };
    end
}));
