local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.Parent.Rodux).createReducer(require(l_Parent_0.Enums.ServerType).StandardServer, {
    [require(l_Parent_0.Actions.ServerTypeDetected).name] = function(_, v2)
        return v2.serverType;
    end
});
