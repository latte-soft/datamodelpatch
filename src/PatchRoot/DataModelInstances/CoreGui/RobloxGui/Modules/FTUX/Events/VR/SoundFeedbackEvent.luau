local _ = require(script.Parent.Parent.EventType);
return {
    Name = "SoundFeedbackEvent", 
    StartEvent = function()
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.Parent = game.Workspace;
        l_Sound_0.SoundId = "rbxassetid://10066947742";
        l_Sound_0.Volume = 1;
        l_Sound_0:Play();
    end
};
