local v0 = require(script.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_RoduxShareLinks_0 = v0.RoduxShareLinks;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withLocalization_0 = v0.withLocalization;
local l_ExperienceInviteStatus_0 = l_RoduxShareLinks_0.Enums.ExperienceInviteStatus;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v11 = l_Roact_0.Component:extend("InviteLinkExpiredModal");
local _ = require(script.Parent.inviteLinkExpiredMapStateToProps);
v11.defaultProps = {
    closeModal = function()
    end, 
    launchGame = function()
    end
};
v11.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    launchGame = l_t_0.callback, 
    linkStatus = l_t_0.string, 
    experienceName = l_t_0.string, 
    isLoading = l_t_0.boolean, 
    screenSize = l_t_0.Vector2
});
v11.render = function(v13)
    local l_props_0 = v13.props;
    local v15 = nil;
    local v16 = nil;
    if l_ExperienceInviteStatus_0.fromRawValue(l_props_0.linkStatus) == l_ExperienceInviteStatus_0.InviterNotInExperience then
        v15 = "Feature.SocialShare.Label.InviterNotHereError";
        v16 = "Feature.SocialShare.Description.InviterNotHereError";
    else
        v15 = "Feature.SocialShare.Label.InviteExpiredError";
        v16 = "Feature.SocialShare.Description.InviteExpiredError";
    end;
    return l_withLocalization_0({
        titleText = v15, 
        bodyText = {
            v16; 
            experienceName = l_props_0.experienceName
        }, 
        confirmButtonText = "Feature.Chat.Drawer.Join", 
        cancelButtonText = "Feature.Friends.Label.Cancel"
    })(function(v17)
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            title = v17.titleText, 
            bodyText = if l_props_0.isLoading then nil else v17.bodyText, 
            middleContent = not not l_props_0.isLoading and function()
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    BackgroundTransparency = 1
                }, {
                    Spinner = l_Roact_0.createElement(l_LoadingSpinner_0, {
                        anchorPoint = Vector2.new(0.5, 0.5), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                    })
                });
            end or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = nil, 
                        props = {
                            text = v17.cancelButtonText, 
                            onActivated = function()
                                l_props_0.closeModal(false);
                            end
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v17.confirmButtonText, 
                            onActivated = function()
                                l_props_0.launchGame();
                                l_props_0.closeModal(true);
                            end
                        }
                    }
                }
            }
        });
    end);
end;
return v11;
