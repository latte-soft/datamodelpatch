local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_usePlayerCountText_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).usePlayerCountText;
local v15 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenGameDetails);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_GameStats_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameStats;
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetAXFixGameDetailsViewTitle);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRevisedExperienceTile);
local function _(v23, v24)
    if v23 + v24 == 0 then
        return "--";
    else
        return (("%*%%"):format((math.round((v23 / (v23 + v24)) * 100))));
    end;
end;
return function(v26)
    local v27 = l_useDispatch_0();
    local v28 = l_useNavigation_0();
    local v29 = l_useStyle_0();
    local v30 = v3.useRef(nil);
    local l_Font_0 = v29.Font;
    local l_Theme_0 = v29.Theme;
    local v33;
    if (not v26.isHydrated or not v26.totalDownVotes) or not v26.totalUpVotes then
        v33 = "--";
    else
        local l_totalUpVotes_0 = v26.totalUpVotes;
        local l_totalDownVotes_0 = v26.totalDownVotes;
        v33 = l_totalUpVotes_0 + l_totalDownVotes_0 == 0 and "--" or ("%*%%"):format((math.round((l_totalUpVotes_0 / (l_totalUpVotes_0 + l_totalDownVotes_0)) * 100)));
    end;
    local v36 = l_usePlayerCountText_0(not not v26.isHydrated and v26.playerCount or nil);
    local v37 = math.ceil((l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize) * 2);
    local v38 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v39 = l_getIconSize_0(l_IconSize_0.Small);
    local v40 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v41, v42 = v3.useState(1);
    v3.useEffect(function()
        local l_current_0 = v30.current;
        if l_current_0 and l_current_0.AbsoluteSize then
            local l_X_0 = l_current_0.AbsoluteSize.X;
            if l_X_0 < 100 then
                v42(0.7);
                return ;
            elseif l_X_0 < 120 then
                v42(0.8);
                return ;
            elseif l_X_0 < 140 then
                v42(0.9);
                return ;
            else
                v42(1);
                return ;
            end;
        else
            return ;
        end;
    end, {
        v26.isHydrated, 
        l_useSelector_0(function(v45)
            return v45.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
        end), 
        v30
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v26.index, 
        Size = UDim2.new(1, 0, 0, 0), 
        ref = v30
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 8)
        }), 
        ImageButton = v3.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Image = nil, 
            Size = UDim2.fromScale(1, 1), 
            [v3.Event.Activated] = function()
                v27(v15(v26.universeId, v28, {
                    mountAsFullView = not v21() and true or nil, 
                    onClose = function()
                        if v21() then
                            v27(v17(false));
                        end;
                        v28.navigate(v16.Catalog);
                    end
                }));
            end
        }, {
            Image = v3.createElement(l_LoadableImage_0, {
                BackgroundTransparency = 1, 
                Image = ("rbxthumb://type=GameIcon&id=%*&w=%*&h=%*"):format(v26.universeId, 150, 150), 
                Size = UDim2.fromScale(1, 1), 
                cornerRadius = UDim.new(0, 12)
            }), 
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        TitleShimmer = if v26.isHydrated then nil else v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, v37), 
            LayoutOrder = 1
        }), 
        Title = if not v26.isHydrated then nil else v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header2.Font, 
            Text = v26.name, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.new(1, 0, 0, v37), 
            LayoutOrder = 1
        }), 
        FooterShimmer = if v26.isHydrated then nil else v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, v38), 
            LayoutOrder = 2
        }), 
        Footer = if not v26.isHydrated then nil else if v22() then v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 22)
            }), 
            Footer = v3.createElement(l_GameStats_0, {
                stats = {
                    playerCount = v26.playerCount, 
                    totalUpVotes = v26.totalUpVotes, 
                    totalDownVotes = v26.totalDownVotes
                }
            })
        }) else (function()
            if v26.isHydrated then
                local l_Theme_1 = v29.Theme;
                local l_Font_1 = v29.Font;
                local v48 = UDim2.fromOffset(v39 * v41, v39 * v41);
                local v49 = UDim2.fromOffset(v39 * v41 + 4, 0);
                return v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v38), 
                    LayoutOrder = 2
                }, {
                    RatingStats = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0, 0), 
                        Size = UDim2.fromScale(0.5, 1)
                    }, {
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            Size = v48, 
                            Image = l_Images_0["icons/status/games/rating_small"], 
                            BackgroundTransparency = 1, 
                            ImageTransparency = l_Theme_1.IconDefault.Transparency, 
                            ImageColor3 = l_Theme_1.IconDefault.Color, 
                            LayoutOrder = 1
                        }), 
                        Text = v3.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_1.Body.Font, 
                            Position = v49, 
                            Text = v33, 
                            TextSize = v40 * v41, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextColor3 = l_Theme_1.TextMuted.Color, 
                            TextTransparency = l_Theme_1.TextMuted.Transparency, 
                            LayoutOrder = 2
                        })
                    }), 
                    PlayingStats = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Position = UDim2.new(0.5, 4, 0, 0), 
                        Size = UDim2.fromScale(0.5, 1)
                    }, {
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            Size = v48, 
                            Image = l_Images_0["icons/status/games/people-playing_small"], 
                            BackgroundTransparency = 1, 
                            ImageTransparency = l_Theme_1.IconDefault.Transparency, 
                            ImageColor3 = l_Theme_1.IconDefault.Color, 
                            LayoutOrder = 1
                        }), 
                        Text = v3.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_1.Body.Font, 
                            Position = v49, 
                            Text = v36, 
                            TextSize = v40 * v41, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextColor3 = l_Theme_1.TextMuted.Color, 
                            TextTransparency = l_Theme_1.TextMuted.Transparency, 
                            LayoutOrder = 2
                        })
                    })
                });
            else
                return nil;
            end;
        end)()
    });
end;
