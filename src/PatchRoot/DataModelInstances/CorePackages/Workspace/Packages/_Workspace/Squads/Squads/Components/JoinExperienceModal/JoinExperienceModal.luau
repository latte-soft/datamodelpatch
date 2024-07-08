local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_RoactFitComponents_0 = v2.RoactFitComponents;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withLocalization_0 = v2.withLocalization;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Components.FacePile);
local v10 = require(l_script_FirstAncestor_0.Components.ProgressBar);
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v16 = l_Roact_0.Component:extend("JoinExperienceModal");
local _ = require(script.Parent.joinExperienceMapStateToProps);
v16.defaultProps = {
    closeModal = function()
    end
};
v16.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    users = l_t_0.table, 
    experienceName = l_t_0.string, 
    experienceServerSize = l_t_0.number, 
    screenSize = l_t_0.Vector2
});
v16.render = function(v18)
    local l_props_0 = v18.props;
    return l_withLocalization_0({
        titleText = "CommonUI.Messages.Label.Alert", 
        bodyText = {
            "Feature.Squads.Description.JoinExperiencePrompt"; 
            experienceName = l_props_0.experienceName
        }, 
        acceptButtonText = "CommonUI.Controls.Action.Accept", 
        declineButtonText = "CommonUI.Controls.Action.Decline"
    })(function(v20)
        return l_withStyle_0(function(v21)
            local l_Theme_0 = v21.Theme;
            local l_Font_0 = v21.Font;
            local v24 = #l_props_0.users .. "/" .. (l_props_0.experienceServerSize or 0);
            local v25 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v24, v25, l_Font_0.Header2.Font, Vector2.new(math.huge, 32));
            return l_Roact_0.createElement(l_InteractiveAlert_0, {
                screenSize = l_props_0.screenSize, 
                title = v20.titleText, 
                bodyText = v20.bodyText, 
                middleContent = function()
                    return l_Roact_0.createElement(l_FitFrameVertical_0, {
                        BackgroundColor3 = Color3.fromRGB(17, 17, 17), 
                        BorderSizePixel = 0, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        width = UDim.new(1, 0)
                    }, {
                        l_Roact_0.createElement("Frame", {
                            BorderSizePixel = 0, 
                            Size = UDim2.new(1, 0, 0.5625, 0), 
                            SizeConstraint = Enum.SizeConstraint.RelativeXX
                        }, {
                            ExperienceImage = l_Roact_0.createElement(l_LoadableImage_0, {
                                ZIndex = 1, 
                                Image = l_props_0.experienceImageId, 
                                Size = UDim2.fromScale(1, 1), 
                                showFailedStateWhenLoadingFailed = true, 
                                useShimmerAnimationWhileLoading = true
                            }), 
                            BottomBar = l_Roact_0.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Position = UDim2.new(0, 0, 1, -40), 
                                Size = UDim2.new(1, 0, 0, 32), 
                                ZIndex = 2
                            }, {
                                Padding = l_Roact_0.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, 12), 
                                    PaddingRight = UDim.new(0, 12)
                                }), 
                                Layout = l_Roact_0.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                                }), 
                                FacePile = l_Roact_0.createElement(v9, {
                                    avatarSize = v8.AVATAR_SIZE, 
                                    borderColor = Color3.fromRGB(11, 11, 11), 
                                    borderWidth = 2, 
                                    faceCount = l_props_0.experienceServerSize, 
                                    facePileWidth = UDim.new(1, -l_l_TextService_0_TextSize_0.X - 16), 
                                    overlapOffset = 4, 
                                    users = l_props_0.users
                                }), 
                                ServerLimitTextContainer = l_Roact_0.createElement("Frame", {
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 16, 1, 0)
                                }, {
                                    Layout = l_Roact_0.createElement("UIListLayout", {
                                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                                        VerticalAlignment = Enum.VerticalAlignment.Center
                                    }), 
                                    ServerLimitText = l_Roact_0.createElement("TextLabel", {
                                        BackgroundTransparency = 1, 
                                        BorderSizePixel = 0, 
                                        Font = l_Font_0.Header2.Font, 
                                        Text = v24, 
                                        TextColor3 = l_Theme_0.TextDefault.Color, 
                                        TextSize = v25, 
                                        Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 1, 0)
                                    })
                                })
                            })
                        }); 
                        ProgressBar = l_Roact_0.createElement(v10, {
                            targetElapsedTime = 15
                        })
                    });
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = nil, 
                            props = {
                                text = v20.declineButtonText, 
                                onActivated = function()
                                    l_props_0.closeModal(false);
                                end
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                text = v20.acceptButtonText, 
                                onActivated = function()
                                    l_props_0.closeModal(true);
                                end
                            }
                        }
                    }
                }
            });
        end);
    end);
end;
return v16;
