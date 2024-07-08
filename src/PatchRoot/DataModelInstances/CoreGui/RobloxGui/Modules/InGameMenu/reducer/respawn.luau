local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Cryo_0 = v0.Cryo;
local l_Rodux_0 = v0.Rodux;
local l_Parent_0 = script.Parent.Parent;
return l_Rodux_0.createReducer({
    dialogOpen = false, 
    enabled = true, 
    customCallback = nil
}, {
    [require(l_Parent_0.Actions.SetRespawning).name] = function(v4, v5)
        return l_Cryo_0.Dictionary.join(v4, {
            dialogOpen = v5.respawning
        });
    end, 
    [require(l_Parent_0.Actions.SetMenuOpen).name] = function(v6, v7)
        if v7.menuOpen then
            return v6;
        else
            return l_Cryo_0.Dictionary.join(v6, {
                dialogOpen = false
            });
        end;
    end, 
    [require(l_Parent_0.Actions.SetCurrentPage).name] = function(v8, _)
        return l_Cryo_0.Dictionary.join(v8, {
            dialogOpen = false
        });
    end, 
    [require(l_Parent_0.Actions.SetRespawnBehavior).name] = function(v10, v11)
        local l_dialogOpen_0 = v10.dialogOpen;
        if not v11.respawnEnabled then
            l_dialogOpen_0 = false;
        end;
        return {
            customCallback = v11.customCallback, 
            enabled = v11.respawnEnabled, 
            dialogOpen = l_dialogOpen_0
        };
    end
});
