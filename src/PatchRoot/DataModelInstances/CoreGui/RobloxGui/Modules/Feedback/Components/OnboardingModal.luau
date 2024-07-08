local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local v7 = require(l_Parent_0.Components.ModalDialog);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local v10 = require(l_Parent_0.Thunks.ShowOnboardingModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = v2.PureComponent:extend("OnboardingModal");
v12.init = function(v13)
    v13.onDismiss = function()
        v13.props.showOnboardingModal(false);
    end;
    v13.onCancel = function()
        l_ExperienceStateCaptureService_0:ToggleCaptureMode();
    end;
end;
v12.render = function(v14)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.Onboarding.MainHeader", 
        instructionLabel = "CoreScripts.Feedback.Onboarding.Instructions", 
        cancel = "CoreScripts.Feedback.Onboarding.Cancel", 
        start = "CoreScripts.Feedback.Onboarding.Start"
    })(function(v15)
        return v2.createElement(v7, {
            visible = v14.props.visible, 
            screenSize = v14.props.screenSize, 
            titleText = v15.mainHeader, 
            maxHeight = 200, 
            maxWidth = 540, 
            showCloseButton = true, 
            actionButtons = v2.createElement(l_ButtonStack_0, {
                buttonHeight = 36, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v14.onCancel, 
                            text = v15.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = v14.onDismiss, 
                            text = v15.start
                        }
                    }
                }
            }), 
            contents = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                InstructionLabel = v2.createElement(v6, {
                    LayoutOrder = 1, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0.4, 36), 
                    Text = v15.instructionLabel, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            onDismiss = v14.onDismiss
        });
    end);
end;
return v3.connect(function(v16)
    return {
        screenSize = v16.displayOptions.screenSize, 
        visible = v16.common.showOnboardingModal
    };
end, function(v17)
    return {
        showOnboardingModal = function(v18)
            v17(v10(v18));
        end
    };
end)(v12);
