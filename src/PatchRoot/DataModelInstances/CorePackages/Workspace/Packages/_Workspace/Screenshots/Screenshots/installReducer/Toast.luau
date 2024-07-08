local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Enums.ShotsToastType);
local v5 = require(l_Parent_0.Actions.ToastDismissed);
local v6 = require(l_Parent_0.Actions.ToastTriggered);
local v7 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
return v3.createReducer({
    IsDismissed = false, 
    ToastType = v4.None, 
    ToastConfig = nil
}, {
    [v7.name] = function(v9, _)
        if v9.ToastType == v4.None then
            return v9;
        else
            return {
                IsDismissed = false, 
                ToastType = v4.None
            };
        end;
    end, 
    [v5.name] = function(v11, _)
        if not v11.IsDismissed then
            if v11.ToastType == v4.None then
                return v11;
            else
                return v2.join(v11, {
                    IsDismissed = true
                });
            end;
        else
            return v11;
        end;
    end, 
    [v6.name] = function(v13, v14)
        local v15 = v2.shallowEqual(v13.ToastConfig, v14.toastConfig);
        if (not (v13.ToastType == v14.toastType) or v13.IsDismissed) or not v15 then
            return {
                IsDismissed = false, 
                ToastType = v14.toastType, 
                ToastConfig = v14.toastConfig
            };
        else
            return v13;
        end;
    end
});
