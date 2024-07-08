local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Enums.PlatformEnum);
local v3 = require(l_Parent_0.Resources.FTUXEventTypes);
local v4 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarHighlightedLeaveGameIcon);
local v5 = v3[v2.QuestVR];
return {
    [v2.QuestVR] = {
        {
            v5.PerspectiveTooltipEvent, 
            v5.FirstPersonToggleEvent, 
            v5.HapticFeedbackEvent
        }, 
        {
            v5.MovementTooltipEvent, 
            v5.MoveToGoalEvent, 
            v5.SoundFeedbackEvent, 
            v5.HapticFeedbackTwiceEvent
        }, 
        {
            v5.HapticFeedbackEvent, 
            v5.SoundFeedbackEvent
        }, 
        {
            v5.SoundFeedbackEvent, 
            if not v4 then v5.SoundFeedbackEvent else v5.LeaveGameIconHighlightEvent
        }
    }
};
