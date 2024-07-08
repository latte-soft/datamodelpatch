local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
return v2.createReducer({
    menuVisible = false, 
    guiInset = 0, 
    errorVisible = false, 
    errorText = ""
}, {
    [require(l_Actions_0.ShowMenu).name] = function(v4, _)
        return v1.Dictionary.join(v4, {
            menuVisible = true
        });
    end, 
    [require(l_Actions_0.HideMenu).name] = function(v6, _)
        return v1.Dictionary.join(v6, {
            menuVisible = false
        });
    end, 
    [require(l_Actions_0.ShowError).name] = function(v8, v9)
        return v1.Dictionary.join(v8, {
            errorVisible = true, 
            errorText = v9.errorText
        });
    end, 
    [require(l_Actions_0.HideError).name] = function(v10, _)
        return v1.Dictionary.join(v10, {
            errorVisible = false
        });
    end, 
    [require(l_Actions_0.SetGuiInset).name] = function(v12, v13)
        return v1.Dictionary.join(v12, {
            guiInset = v13.guiInset
        });
    end
});
