return require(script:FindFirstAncestor("RoduxPresence").Parent.enumerate)(script.Name, {
    Offline = 0, 
    Online = 1, 
    InGame = 2, 
    InStudio = 3
});
