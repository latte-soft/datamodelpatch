return (require(game:GetService("CorePackages").Rodux).createReducer(true, {
    [require(script.Parent.Parent.Actions.SetIsSubjectToChinaPolicies).name] = function(_, v1)
        return v1.isSubjectToChinaPolicies;
    end
}));
