local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.types);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v8, v9, v10)
    local v11 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        joinEvent = "Feature.VirtualEvents.JoinEvent", 
        goHome = "Feature.VirtualEvents.GoHome"
    });
    local v12 = v2.useMemo(function()
        if v8.eventStatus ~= "cancelled" and v8.eventStatus ~= "moderated" then
            if not (v9 ~= "Upcoming") or v9 == "UpcomingImminent" then
                if v8.userRsvpStatus == "going" then
                    return {
                        props = {
                            buttonType = l_ButtonType_0.Secondary, 
                            text = v11.unfollowEvent, 
                            icon = l_Images_0["icons/actions/favoriteOn"], 
                            onActivated = v10.onRsvpChanged
                        }
                    };
                else
                    return {
                        props = {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            text = v11.notifyMe, 
                            icon = l_Images_0["icons/actions/favoriteOff"], 
                            onActivated = v10.onRsvpChanged
                        }
                    };
                end;
            elseif not (v9 ~= "Ongoing") or v9 == "ElapsedImminent" then
                return {
                    props = {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        text = v11.joinEvent, 
                        onActivated = v10.onJoinEvent
                    }
                };
            else
                return nil;
            end;
        else
            return {
                props = {
                    buttonType = l_ButtonType_0.Secondary, 
                    text = v11.goHome, 
                    onActivated = v10.onClose
                }
            };
        end;
    end, {
        v8, 
        v9, 
        v10
    });
    local v13 = v2.useMemo(function()
        if (v8.eventStatus ~= "cancelled" and v8.eventStatus ~= "moderated") and v9 ~= "Elapsed" then
            return {
                props = {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    icon = l_Images_0["icons/actions/share"], 
                    userInteractionEnabled = true, 
                    onActivated = v10.onShare
                }
            };
        else
            return nil;
        end;
    end, {
        v8, 
        v9, 
        v10
    });
    return (v2.useMemo(function()
        return {
            button = v12, 
            icons = {
                v13
            }
        };
    end, {
        v12, 
        v13
    }));
end;
