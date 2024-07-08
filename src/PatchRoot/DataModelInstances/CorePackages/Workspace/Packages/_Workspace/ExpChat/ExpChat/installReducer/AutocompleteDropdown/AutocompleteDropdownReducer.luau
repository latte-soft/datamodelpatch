local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    activated = false, 
    results = {}, 
    selectedIndex = 1, 
    autocompleteType = "none"
}, {
    [require(l_Actions_0.AutocompleteDropdownActivated).name] = function(v5, v6)
        return l_Dictionary_0.join(v5, {
            activated = v6.activated
        });
    end, 
    [require(l_Actions_0.AutocompleteDropdownResultsChanged).name] = function(v7, v8)
        return l_Dictionary_0.join(v7, {
            results = v8.results, 
            selectedIndex = 1
        });
    end, 
    [require(l_Actions_0.AutocompleteDropdownSelectionChanged).name] = function(v9, v10)
        return l_Dictionary_0.join(v9, {
            selectedIndex = v10.selectedIndex
        });
    end, 
    [require(l_Actions_0.AutocompleteDropdownTypeChanged).name] = function(v11, v12)
        if v12.autocompleteType ~= v11.autocompleteType then
            return l_Dictionary_0.join(v11, {
                autocompleteType = v12.autocompleteType, 
                activated = false, 
                results = {}, 
                selectedIndex = 1
            });
        else
            return v11;
        end;
    end, 
    [require(l_Actions_0.AutocompleteDropdownDeactivated).name] = function(v13, _)
        return l_Dictionary_0.join(v13, {
            autocompleteType = "none", 
            activated = false, 
            results = {}, 
            selectedIndex = 1
        });
    end
});
