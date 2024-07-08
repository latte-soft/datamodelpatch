return require(script:FindFirstAncestor("SocialContextToasts").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        isConfirmationModalOpen = v0, 
        closeCallback = v1
    };
end);
