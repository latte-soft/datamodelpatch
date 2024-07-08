local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_InteractiveAlert_0 = require(l_Parent_0.UIBlox).App.Dialog.Alert.InteractiveAlert;
local v4 = require(l_script_FirstAncestor_0.Hooks.useScreenSize);
local v5 = require(script.Parent.Scrim);
return function(v6)
    return v2.createElement(v5, {}, v2.createElement(l_InteractiveAlert_0, {
        title = v6.title, 
        bodyText = v6.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v6.onDismiss, 
                        text = v6.dismissCTA
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v4(), 
        middleContent = v6.middleContent
    }));
end;
