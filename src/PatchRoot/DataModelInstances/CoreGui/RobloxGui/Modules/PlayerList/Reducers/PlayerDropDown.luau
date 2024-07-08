local v0 = require(game:GetService("CorePackages").Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v0.createReducer({
    isVisible = false, 
    selectedPlayer = nil
}, {
    [require(l_Actions_0.SetPlayerListVisibility).name] = function(v2, v3)
        if v3.isVisible then
            return v2;
        else
            return {
                isVisible = false, 
                selectedPlayer = v2.selectedPlayer
            };
        end;
    end, 
    [require(l_Actions_0.OpenPlayerDropDown).name] = function(_, v5)
        return {
            isVisible = true, 
            selectedPlayer = v5.selectedPlayer
        };
    end, 
    [require(l_Actions_0.ClosePlayerDropDown).name] = function(v6, _)
        return {
            isVisible = false, 
            selectedPlayer = v6.selectedPlayer
        };
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v8, v9)
        if v9.player == v8.selectedPlayer then
            return {
                isVisible = false, 
                selectedPlayer = nil
            };
        else
            return v8;
        end;
    end
}));
