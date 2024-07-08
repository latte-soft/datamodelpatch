local v1 = {
    ["jest.config"] = script["jest.config"], 
    game = game, 
    waitProxy = function(v0)
        wait(v0);
    end, 
    settingsProxy = function()
        return settings();
    end
};
setmetatable(v1, {
    __index = function(_, v3)
        return game:GetService(v3);
    end
});
return v1;
