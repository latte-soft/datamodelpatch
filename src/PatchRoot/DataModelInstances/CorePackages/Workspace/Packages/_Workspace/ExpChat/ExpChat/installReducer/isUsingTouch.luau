local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).createReducer(false, {
    [require(l_script_FirstAncestor_0.Actions.ClientAppLoaded).name] = function(_, v2)
        return v2.isTouchEnabled;
    end, 
    [require(l_script_FirstAncestor_0.Actions.LastInputTypeChanged).name] = function(v3, v4)
        if v4.lastInputTypeUsed == Enum.UserInputType.Touch then
            return true;
        elseif v4.lastInputTypeUsed == Enum.UserInputType.Keyboard then
            return false;
        else
            return v3;
        end;
    end
});
