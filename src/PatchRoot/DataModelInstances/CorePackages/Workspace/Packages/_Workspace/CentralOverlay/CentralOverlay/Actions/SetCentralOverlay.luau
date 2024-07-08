return require(script:FindFirstAncestor("CentralOverlay").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        overlayType = v0, 
        arguments = v1, 
        configs = v2
    };
end);
