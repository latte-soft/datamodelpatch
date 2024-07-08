local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Components.ProfileMoreButton);
local v3 = require(l_Parent_0.Components.ProfilePrimaryContextualButton);
local v4 = require(l_Parent_0.dependencies);
local l_RoactAppExperiment_0 = v4.RoactAppExperiment;
local l_AppUserLayers_0 = v4.AppUserLayers;
local l_Roact_0 = v4.Roact;
local l_React_0 = v4.React;
local l_UIBlox_0 = v4.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_ActionBar_0 = l_UIBlox_0.App.Button.ActionBar;
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local l_Cryo_0 = v4.Cryo;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_getFFlagEditProfilePageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.getFFlagEditProfilePageEnabled;
local l_FFlagEditProfileSetupNewExperimentFlow_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.FFlagEditProfileSetupNewExperimentFlow;
local l_EditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.EditProfileIXP;
local l_RealNamesInDisplayNamesIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.RealNamesInDisplayNamesIXP;
local v23 = l_Roact_0.PureComponent:extend("ProfileActionBar");
v23.defaultProps = {
    showMorePageEnabled = true
};
local function v24()
end;
v23.init = function(v25)
    local v26, v27 = l_Roact_0.createBinding(UDim2.new(1, 0, 0, 100));
    v25.bottomBarSize = v26;
    v25.updateBottomBarSize = v27;
    v25.onAbsoluteSizeChanged = function(v28)
        v25.updateBottomBarSize(UDim2.new(1, 0, 0, v28.Y));
    end;
    v25.renderOnLoading = function()
        return l_Roact_0.createFragment({
            LoadingMoreButton = l_Roact_0.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(0, 48, 0, 48), 
                LayoutOrder = 1, 
                cornerRadius = UDim.new(0.2, 0)
            }), 
            LoadingCTAButton = l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, -v25.props.innerPaddingSize, 0, 48), 
                isLoading = true, 
                layoutOrder = 2, 
                onActivated = v24
            })
        });
    end;
    v25.renderOnFailed = function()
        return l_Roact_0.createFragment({
            DisabledMoreButton = l_Roact_0.createElement(v2, {
                layoutOrder = 1, 
                onActivated = v24, 
                isDisabled = true
            }), 
            FailedCTAButton = l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, -v25.props.innerPaddingSize, 0, 48), 
                isDisabled = true, 
                icon = l_Images_0["icons/actions/block"], 
                layoutOrder = 2, 
                onActivated = v24
            })
        });
    end;
end;
v23.render = function(v29)
    v29.renderOnLoaded = function()
        local l_props_0 = v29.props;
        local v31 = -l_props_0.innerPaddingSize;
        local v32 = nil;
        if l_props_0.showMorePageEnabled then
            v32 = l_Roact_0.createElement(v2, {
                layoutOrder = 1, 
                onActivated = l_props_0.openMoreMenu, 
                isSelected = l_props_0.isMoreMenuOpen, 
                isQRCode = false
            });
        end;
        if not (not l_props_0.editProfileIXPEnabled and not l_getFFlagEditProfilePageEnabled_0() or not l_props_0.showProfileQRCode) then
            v32 = l_Roact_0.createElement(v2, {
                layoutOrder = 1, 
                onActivated = l_props_0.shareProfileQRCode, 
                isSelected = l_props_0.isMoreMenuOpen, 
                isQRCode = true
            });
        end;
        return l_Roact_0.createFragment({
            MoreButton = v32, 
            PrimaryCTAButton = if l_props_0.disableWebViewSupport then nil else l_Roact_0.createElement(v3, {
                size = UDim2.new(1, v31, 0, 48), 
                layoutOrder = 2, 
                openPurchaseExperienceModal = l_props_0.openPurchaseExperienceModal, 
                onClickWithToast = l_props_0.onClickWithToast, 
                openUnableToJoinExperienceModal = l_props_0.openUnableToJoinExperienceModal, 
                openEditProfilePage = l_props_0.openEditProfilePage, 
                editProfileIXPEnabled = l_props_0.editProfileIXPEnabled
            })
        });
    end;
    return l_withStyle_0(function(v33)
        return l_Roact_0.createElement("Frame", {
            Size = v29.bottomBarSize, 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v33.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v33.Theme.BackgroundDefault.Transparency, 
            ZIndex = 2
        }, {
            GradientFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 24), 
                Position = UDim2.new(0, 0, 0, -24), 
                BackgroundColor3 = v33.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v33.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                Gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = -90, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            ActionBar = l_Roact_0.createElement(l_ActionBar_0, {
                onAbsoluteSizeChanged = v29.onAbsoluteSizeChanged, 
                marginOverride = {
                    left = 24, 
                    right = 24, 
                    top = 0, 
                    bottom = 24
                }
            }, {
                loadingStateContainer = l_Roact_0.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_0.fromRawValue(v29.props.actionBarLoadingStatus), 
                    renderOnLoaded = v29.renderOnLoaded, 
                    renderOnLoading = v29.renderOnLoading, 
                    renderOnFailed = v29.renderOnFailed
                })
            })
        });
    end);
end;
if not l_FFlagEditProfileSetupNewExperimentFlow_0 then
    return (l_RoactAppExperiment_0.connectUserLayer({
        l_AppUserLayers_0.SocialSelfProfileViewLayer
    }, function(v34, _)
        return {
            editProfileIXPEnabled = if not l_EditProfileIXP_0.isEditProfileExperimentEnabled() then nil else l_EditProfileIXP_0.isExperimentEnabled(v34)
        };
    end)(v23));
else
    return function(v36)
        return l_React_0.createElement(v23, l_Cryo_0.Dictionary.join(v36, {
            editProfileIXPEnabled = l_RealNamesInDisplayNamesIXP_0.useIsExperimentEnabled({
                isExposureEnabled = not not v36.isLocalUser or false
            })
        }));
    end;
end;
