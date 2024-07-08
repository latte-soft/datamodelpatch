return require(script:FindFirstAncestor("ToastRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", "SetCurrentToastMessage action expects toastMessage to be a table");
    return {
        toastMessage = v0
    };
end);
