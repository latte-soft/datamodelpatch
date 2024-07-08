local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.ButtonEnum);
return {
    [require(l_Parent_0.Enums.PlatformEnum).QuestVR] = {
        {
            title = "CoreScripts.VRFTUX.Heading.Perspective", 
            text = {
                "CoreScripts.VRFTUX.Description.Perspective.Body1", 
                "CoreScripts.VRFTUX.Description.Perspective.Body2"
            }, 
            image = "rbxassetid://13251804809", 
            button = v1.SkipButton
        }, 
        {
            title = "CoreScripts.VRFTUX.Heading.Movement", 
            text = {
                "CoreScripts.VRFTUX.Description.Movement.Body1", 
                "CoreScripts.VRFTUX.Description.Movement.Body2", 
                "CoreScripts.VRFTUX.Description.Movement.Body3"
            }, 
            image = "rbxassetid://13251750527", 
            button = v1.SkipButton
        }, 
        {
            title = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title", 
            text = {
                "CoreScripts.VRFTUX.Description.SafetyBubble.Body1", 
                "CoreScripts.VRFTUX.Description.SafetyBubble.Body2"
            }, 
            image = "rbxassetid://13251806846", 
            button = v1.NextButton
        }, 
        {
            title = "CoreScripts.VRFTUX.Heading.OtherSettings.Title", 
            text = {
                "CoreScripts.VRFTUX.Description.OtherSettings.Body1", 
                "CoreScripts.VRFTUX.Description.OtherSettings.Body2"
            }, 
            image = "", 
            button = v1.NextButton
        }
    }
};
