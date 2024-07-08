local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Events.VR.FirstPersonToggleEvent);
local v2 = require(l_Parent_0.Events.VR.HapticFeedbackEvent);
local v3 = require(l_Parent_0.Events.VR.HapticFeedbackTwiceEvent);
local v4 = require(l_Parent_0.Events.VR.SoundFeedbackEvent);
local v5 = require(l_Parent_0.Events.VR.JumpEvent);
local v6 = require(l_Parent_0.Events.VR.MoveToGoalEvent);
local v7 = require(l_Parent_0.Events.VR.PerspectiveTooltipEvent);
local v8 = require(l_Parent_0.Events.VR.MovementTooltipEvent);
local v9 = require(l_Parent_0.Events.VR.LeaveGameIconHighlightEvent);
local v10 = require(l_Parent_0.Enums.PlatformEnum);
local v11 = require(l_Parent_0.Resources.FTUXEventTypes);
local _ = require(script.Parent.Parent.EventType);
local v13 = v11[v10.QuestVR];
return {
    Name = "VRFTUXEventHandler", 
    StartEvent = function(v14, v15)
        if v14 == v13.FirstPersonToggleEvent then
            task.spawn(v1.StartEvent, v15);
            return ;
        elseif v14 == v13.MoveToGoalEvent then
            task.spawn(v6.StartEvent, v15);
            return ;
        elseif v14 == v13.JumpEvent then
            task.spawn(v5.StartEvent, v15);
            return ;
        elseif v14 == v13.PerspectiveTooltipEvent then
            task.spawn(v7.StartEvent);
            return ;
        elseif v14 == v13.MovementTooltipEvent then
            task.spawn(v8.StartEvent);
            return ;
        elseif v14 == v13.HapticFeedbackEvent then
            task.spawn(v2.StartEvent);
            return ;
        elseif v14 == v13.SoundFeedbackEvent then
            task.spawn(v4.StartEvent);
            return ;
        elseif v14 == v13.HapticFeedbackTwiceEvent then
            task.spawn(v3.StartEvent);
            return ;
        elseif v14 == v13.LeaveGameIconHighlightEvent then
            task.spawn(v9.StartEvent);
            return ;
        else
            warn("Unmapped VRFTUX event type: " .. tostring(v14));
            return ;
        end;
    end, 
    StopEvent = function(v16)
        if v16 == v13.FirstPersonToggleEvent then
            task.spawn(v1.StopEvent);
            return ;
        elseif v16 == v13.MoveToGoalEvent then
            task.spawn(v6.StopEvent);
            return ;
        elseif v16 == v13.JumpEvent then
            task.spawn(v5.StopEvent);
            return ;
        elseif v16 == v13.PerspectiveTooltipEvent then
            task.spawn(v7.StopEvent);
            return ;
        elseif v16 == v13.MovementTooltipEvent then
            task.spawn(v8.StopEvent);
            return ;
        elseif v16 == v13.LeaveGameIconHighlightEvent then
            task.spawn(v9.StopEvent);
            return ;
        elseif v16 == v13.HapticFeedbackTwiceEvent then
            return ;
        elseif v16 == v13.HapticFeedbackEvent then
            return ;
        elseif v16 == v13.SoundFeedbackEvent then
            return ;
        else
            warn("Unmapped VRFTUX event type: " .. tostring(v16));
            return ;
        end;
    end
};
