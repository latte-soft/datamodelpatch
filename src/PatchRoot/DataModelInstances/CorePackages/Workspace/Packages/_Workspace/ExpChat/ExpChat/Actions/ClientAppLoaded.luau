return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        team = v0.team, 
        isChatCoreGuiEnabled = v0.isChatCoreGuiEnabled == nil and true or v0.isChatCoreGuiEnabled, 
        isTouchEnabled = v0.isTouchEnabled
    };
end);
