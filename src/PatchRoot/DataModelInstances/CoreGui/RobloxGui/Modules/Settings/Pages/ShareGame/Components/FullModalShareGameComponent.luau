local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Parent_0 = script.Parent;
local v6 = require(l_Modules_0.Flags.GetFFlagExtraInviteModalStringValidation);
local v7 = require(l_Parent_0.ShareGameContainer);
local v8 = require(l_Parent_0.ModalShareGamePageFrame);
local v9 = require(l_Parent_0.LayoutProvider);
local v10 = require(l_Parent_0.InviteSingleUserContainer);
local v11 = require(l_Parent_0.LoadingModal);
local v12 = v2.PureComponent:extend("FullModalShareGameComponent");
v12.render = function(v13)
    local l_isVisible_0 = v13.props.isVisible;
    local l_analytics_0 = v13.props.analytics;
    local l_onAfterClosePage_0 = v13.props.onAfterClosePage;
    local l_store_0 = v13.props.store;
    local l_promptMessage_0 = v13.props.promptMessage;
    local l_inviteUserId_0 = v13.props.inviteUserId;
    local l_inviteMessageId_0 = v13.props.inviteMessageId;
    local l_launchData_0 = v13.props.launchData;
    local l_isLoading_0 = v13.props.isLoading;
    if not (not v6() or not l_promptMessage_0) then
        if not l_inviteUserId_0 then
            l_promptMessage_0 = l_promptMessage_0:gsub("\n", " ");
        end;
        if l_promptMessage_0:gsub("%s", "") == "" then
            l_promptMessage_0 = nil;
        end;
    end;
    return v2.createElement(v3.StoreProvider, {
        store = l_store_0
    }, {
        screenGui = v2.createElement("ScreenGui", {
            AutoLocalize = false, 
            Enabled = l_isVisible_0, 
            DisplayOrder = -1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            loadingIndicator = l_isLoading_0 and v2.createElement(v11), 
            layoutProvider = not l_isLoading_0 and v2.createElement(v9, nil, {
                ShareGameContainer = v2.createElement(v7, {
                    analytics = l_analytics_0, 
                    isVisible = l_isVisible_0, 
                    skeletonComponent = if not l_inviteUserId_0 then v8 else v10, 
                    promptMessage = l_promptMessage_0, 
                    inviteUserId = l_inviteUserId_0, 
                    inviteMessageId = l_inviteMessageId_0, 
                    launchData = l_launchData_0, 
                    onAfterClosePage = function()
                        local v23 = {};
                        for v24, _ in pairs(l_store_0:getState().Invites) do
                            table.insert(v23, v24);
                        end;
                        l_onAfterClosePage_0(v23);
                    end
                })
            })
        })
    });
end;
return v12;
