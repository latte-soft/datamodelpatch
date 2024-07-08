local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.ReactOtter);
local v8 = require(l_Parent_1.RoactUtils);
local v9 = require(l_Parent_1.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local l_StyledTextLabel_0 = v9.App.Text.StyledTextLabel;
local v13 = require(l_Parent_0.Constants);
local v14 = require(l_Parent_0.App.Networking);
local l_NetworkingGames_0 = v14.NetworkingGames;
local l_RoduxGames_0 = v14.RoduxGames;
local l_getDeepValue_0 = v5.SocialLibraries.config({}).Dictionary.getDeepValue;
local v18 = require(l_Parent_0.Utils.getScreenshotHud);
local l_useAnimatedBinding_0 = v7.useAnimatedBinding;
local v20 = require(l_Parent_0.Hooks.useBindCaptureShortcut);
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v6.useEffect;
local l_useEffectOnMount_0 = v8.Hooks.useEffectOnMount;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local v26 = require(l_Parent_0.Hooks.useShowFlashOverlay);
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_instant_0 = v7.instant;
local l_spring_0 = v7.spring;
local v30 = game:DefineFastFlag("ScreenshotsOverlayLocalizedUsername", false);
local v31 = require(l_Parent_0.Flags.FFlagRemoveCaptureWatermark);
local v32 = game:DefineFastFlag("UseScreenshotHudOverlaySettings", false);
local v33 = require(l_Parent_0.Flags.FFlagUseUpdatedScreenshotWatermarkLayouts);
return function(v34)
    local v35 = l_useDispatch_0();
    local v36 = l_useStyle_0();
    local l_Font_0 = v36.Font;
    local l_Theme_0 = v36.Theme;
    local v39 = if not v34.gameId then tostring(game.GameId) else v34.gameId;
    local v40 = nil;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        v40 = l_LocalPlayer_0.Name;
    end;
    local v42 = v18();
    local v43 = not v42 or v42.ExperienceNameOverlayEnabled;
    local v44 = if not v42 then nil else v42.OverlayFont;
    l_useEffectOnMount_0(function()
        v35(l_NetworkingGames_0.GetExperiencesDetails.API({
            v39
        })):catch(function()
        end);
    end);
    v20();
    local v46 = l_useSelector_0(function(v45)
        return v45.Screenshots.IsOverlayActive;
    end);
    local v48 = l_useSelector_0(function(v47)
        return l_getDeepValue_0(v47, "Games.byGameId." .. v39 .. ".creator.creatorName");
    end);
    local v50 = l_useSelector_0(function(v49)
        return l_getDeepValue_0(v49, "Games.byGameId." .. v39 .. ".creator.creatorType");
    end);
    local v52 = l_useSelector_0(function(v51)
        return l_getDeepValue_0(v51, "Games.byGameId." .. v39 .. ".name");
    end);
    local v53 = l_useLocalization_0({
        groupNameByline = {
            "Feature.Captures.Label.GroupNameByline"; 
            groupName = v48
        }, 
        localUsername = {
            "Feature.Captures.Label.LocalUsername"; 
            username = v40
        }, 
        usernameByline = {
            "Feature.Captures.Label.UsernameByline"; 
            username = v48
        }
    });
    local l_usernameByline_0 = v53.usernameByline;
    if v50 == l_RoduxGames_0.Enums.CreatorType.Group then
        l_usernameByline_0 = v53.groupNameByline;
    end;
    local v55, v56 = v26();
    local v57, v58 = l_useAnimatedBinding_0(1);
    local v59 = if not v33 then v40 else v52;
    local v60 = if not v30 then "@" .. v40 else v53.localUsername;
    l_useEffect_0(function()
        if v55 then
            v56();
            v58((l_instant_0(0)));
            task.defer(task.defer, v58, l_spring_0(1));
        end;
    end, {
        v55
    });
    return v6.createElement("Frame", {
        Active = false, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = not v55 and 1 or v57, 
        Position = UDim2.fromOffset(0, -l_GuiService_0.TopbarInset.Height), 
        Size = UDim2.new(1, 0, 1, l_GuiService_0.TopbarInset.Height), 
        Visible = v46, 
        ZIndex = v13.ZIndex.Entrypoint
    }, if not v31 then {
        GameMetadataContainer = if v33 then nil else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(24, 24), 
            Visible = if not v32 then not v55 else v43 and not v55
        }, {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            GameTitleTextLabel = if not v52 then nil else v6.createElement(l_StyledTextLabel_0, {
                colorStyle = l_Theme_0.TextEmphasis, 
                fontStyle = if not not v32 and v44 then {
                    Font = v44, 
                    RelativeMinSize = l_Font_0.Header1.RelativeMinSize, 
                    RelativeSize = l_Font_0.Header1.RelativeSize
                } else l_Font_0.Header1, 
                layoutOrder = 1, 
                text = v52, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left
            }), 
            CreatorTextLabel = if not v48 then nil else v6.createElement(l_StyledTextLabel_0, {
                colorStyle = l_Theme_0.TextEmphasis, 
                fontStyle = if not not v32 and v44 then {
                    Font = v44, 
                    RelativeMinSize = l_Font_0.Header2.RelativeMinSize, 
                    RelativeSize = l_Font_0.Header2.RelativeSize
                } else l_Font_0.Header2, 
                layoutOrder = 2, 
                text = l_usernameByline_0, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        RobloxLogoAndExperienceNameContainer = v6.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 1), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, -24, 1, -24), 
            Visible = not v55
        }, {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            RobloxLetterform = v6.createElement(l_ImageSetButton_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/logo/letterform"], 
                ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(138, 24)
            }), 
            ExperienceNameLabel = if not v59 then nil else v6.createElement(l_StyledTextLabel_0, {
                colorStyle = l_Theme_0.TextEmphasis, 
                fontStyle = if not not v32 and v44 then {
                    Font = v44, 
                    RelativeMinSize = l_Font_0.Header2.RelativeMinSize, 
                    RelativeSize = l_Font_0.Header2.RelativeSize
                } else l_Font_0.Header2, 
                layoutOrder = 2, 
                text = if not v33 then v60 else v59, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Right
            })
        })
    } else {});
end;
