local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_InGameMenuDependencies_0 = require(l_CorePackages_0:WaitForChild("InGameMenuDependencies"));
local l_Roact_0 = l_InGameMenuDependencies_0.Roact;
local l_RoactRodux_0 = l_InGameMenuDependencies_0.RoactRodux;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v14 = require(l_Modules_0.LoadingScreen.Thunks.GetGameProductInfo);
local v15 = require(l_Modules_0.LoadingScreen.Thunks.GetIsSubjectToChinaPolicies);
local v16 = require(l_Modules_0.LoadingScreen.Thunks.GetUniverseId);
local v17 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v18 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v19 = require(l_CorePackages_0.UIBlox);
local l_LoadingSpinner_0 = v19.App.Loading.LoadingSpinner;
local l_withStyle_0 = v19.Style.withStyle;
local l_Translator_0 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
local v23 = require(l_Modules_0.Common.httpRequest)(l_HttpRbxApiService_0);
local v24 = game:DefineFastFlag("FixServerInfoLocalization", false);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagReportFirstExperienceCancelled);
local l_GetFFlagLoadingScreenLargerJoinStatusText_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLoadingScreenLargerJoinStatusText;
local v27 = game:DefineFastFlag("LoadingScriptCancelButtonBeforeWait", false);
local v28 = 7;
game:DefineFastFlag("IncreaseLoadingScreenOrder", false);
if game:GetFastFlag("IncreaseLoadingScreenOrder") then
    v28 = 8;
end;
local v29 = Vector2.new(768, 432);
local v30 = Color3.fromRGB(101, 102, 104);
local v31 = {
    MOBILE_PORTRAIT = {
        TOP = 44, 
        BOTTOM = 44, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    MOBILE_LANDSCAPE = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 44, 
        RIGHT = 44
    }, 
    DESKTOP = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    CONSOLE = {
        TOP = 64, 
        BOTTOM = 64, 
        LEFT = 64, 
        RIGHT = 64
    }
};
local v32 = l_GuiService_0:IsTenFootInterface();
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v34 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v34 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v35 = {
    150, 
    256
};
local v36 = nil;
local v37 = 0;
local l_huge_0 = math.huge;
local function _(v39)
    if not v34 then
        if not v32 then
            return v31.DESKTOP;
        else
            return v31.CONSOLE;
        end;
    else
        return not not v39 and v31.MOBILE_PORTRAIT or v31.MOBILE_LANDSCAPE;
    end;
end;
local function _(v41, v42)
    if type(v41) == "table" and #v41 >= 2 then
        local v43 = math.clamp(v42, 0, 1);
        return v41[1] * (1 - v43) + v41[2] * v43;
    else
        return 0;
    end;
end;
local v81 = {
    FadeIn = function(v45, _, v47, v48)
        local v49 = {
            1, 
            1
        };
        local v50 = {
            1, 
            0
        };
        local v51 = {
            1, 
            0.2
        };
        if v45 <= 0.6 then
            local v52 = v45 / 0.6;
            local l_iconTransparency_0 = v47.iconTransparency;
            local v54;
            if type(v50) == "table" and #v50 >= 2 then
                local v55 = math.clamp(v52, 0, 1);
                v54 = v50[1] * (1 - v55) + v50[2] * v55;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.iconSize;
            if type(v49) == "table" and #v49 >= 2 then
                local v56 = math.clamp(v52, 0, 1);
                v54 = v49[1] * (1 - v56) + v49[2] * v56;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.infoFrameTransparency;
            if type(v51) == "table" and #v51 >= 2 then
                local v57 = math.clamp(v52, 0, 1);
                v54 = v51[1] * (1 - v57) + v51[2] * v57;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.thumbnailTransparency;
            if type(v50) == "table" and #v50 >= 2 then
                local v58 = math.clamp(v52, 0, 1);
                v54 = v50[1] * (1 - v58) + v50[2] * v58;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.placeTextTransparency;
            if type(v50) == "table" and #v50 >= 2 then
                local v59 = math.clamp(v52, 0, 1);
                v54 = v50[1] * (1 - v59) + v50[2] * v59;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.placeTextSize;
            if type(v49) == "table" and #v49 >= 2 then
                local v60 = math.clamp(v52, 0, 1);
                v54 = v49[1] * (1 - v60) + v49[2] * v60;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.creatorTextTransparency;
            if type(v50) == "table" and #v50 >= 2 then
                local v61 = math.clamp(v52, 0, 1);
                v54 = v50[1] * (1 - v61) + v50[2] * v61;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            l_iconTransparency_0 = v47.creatorTextSize;
            if type(v49) == "table" and #v49 >= 2 then
                local v62 = math.clamp(v52, 0, 1);
                v54 = v49[1] * (1 - v62) + v49[2] * v62;
            else
                v54 = 0;
            end;
            l_iconTransparency_0(v54);
            return ;
        else
            v47.iconTransparency(if type(v50) == "table" and #v50 >= 2 then v50[1] * 0 + v50[2] * 1 else 0);
            v47.iconSize(if type(v49) == "table" and #v49 >= 2 then v49[1] * 0 + v49[2] * 1 else 0);
            v47.infoFrameTransparency(if type(v51) == "table" and #v51 >= 2 then v51[1] * 0 + v51[2] * 1 else 0);
            v47.thumbnailTransparency(if type(v50) == "table" and #v50 >= 2 then v50[1] * 0 + v50[2] * 1 else 0);
            v47.placeTextTransparency(if type(v50) == "table" and #v50 >= 2 then v50[1] * 0 + v50[2] * 1 else 0);
            v47.placeTextSize(if type(v49) == "table" and #v49 >= 2 then v49[1] * 0 + v49[2] * 1 else 0);
            v47.creatorTextTransparency(if type(v50) == "table" and #v50 >= 2 then v50[1] * 0 + v50[2] * 1 else 0);
            v47.creatorTextSize(if type(v49) == "table" and #v49 >= 2 then v49[1] * 0 + v49[2] * 1 else 0);
            v48();
            return ;
        end;
    end, 
    FadeOut = function(v63, _, v65, v66)
        local v67 = {
            1, 
            0.6
        };
        local v68 = {
            0, 
            1
        };
        local v69 = {
            0.2, 
            1
        };
        if v63 <= 0.6 then
            local v70 = v63 / 0.6;
            local l_iconTransparency_1 = v65.iconTransparency;
            local v72;
            if type(v68) == "table" and #v68 >= 2 then
                local v73 = math.clamp(v70, 0, 1);
                v72 = v68[1] * (1 - v73) + v68[2] * v73;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.iconSize;
            if type(v67) == "table" and #v67 >= 2 then
                local v74 = math.clamp(v70, 0, 1);
                v72 = v67[1] * (1 - v74) + v67[2] * v74;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.infoFrameTransparency;
            if type(v69) == "table" and #v69 >= 2 then
                local v75 = math.clamp(v70, 0, 1);
                v72 = v69[1] * (1 - v75) + v69[2] * v75;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.thumbnailTransparency;
            if type(v68) == "table" and #v68 >= 2 then
                local v76 = math.clamp(v70, 0, 1);
                v72 = v68[1] * (1 - v76) + v68[2] * v76;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.placeTextTransparency;
            if type(v68) == "table" and #v68 >= 2 then
                local v77 = math.clamp(v70, 0, 1);
                v72 = v68[1] * (1 - v77) + v68[2] * v77;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.placeTextSize;
            if type(v67) == "table" and #v67 >= 2 then
                local v78 = math.clamp(v70, 0, 1);
                v72 = v67[1] * (1 - v78) + v67[2] * v78;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.creatorTextTransparency;
            if type(v68) == "table" and #v68 >= 2 then
                local v79 = math.clamp(v70, 0, 1);
                v72 = v68[1] * (1 - v79) + v68[2] * v79;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            l_iconTransparency_1 = v65.creatorTextSize;
            if type(v67) == "table" and #v67 >= 2 then
                local v80 = math.clamp(v70, 0, 1);
                v72 = v67[1] * (1 - v80) + v67[2] * v80;
            else
                v72 = 0;
            end;
            l_iconTransparency_1(v72);
            return ;
        else
            l_RunService_0:SetRobloxGuiFocused(false);
            v65.iconTransparency(if type(v68) == "table" and #v68 >= 2 then v68[1] * 0 + v68[2] * 1 else 0);
            v65.iconSize(if type(v67) == "table" and #v67 >= 2 then v67[1] * 0 + v67[2] * 1 else 0);
            v65.infoFrameTransparency(if type(v69) == "table" and #v69 >= 2 then v69[1] * 0 + v69[2] * 1 else 0);
            v65.thumbnailTransparency(if type(v68) == "table" and #v68 >= 2 then v68[1] * 0 + v68[2] * 1 else 0);
            v65.placeTextTransparency(if type(v68) == "table" and #v68 >= 2 then v68[1] * 0 + v68[2] * 1 else 0);
            v65.placeTextSize(if type(v67) == "table" and #v67 >= 2 then v67[1] * 0 + v67[2] * 1 else 0);
            v65.creatorTextTransparency(if type(v68) == "table" and #v68 >= 2 then v68[1] * 0 + v68[2] * 1 else 0);
            v65.creatorTextSize(if type(v67) == "table" and #v67 >= 2 then v67[1] * 0 + v67[2] * 1 else 0);
            v66();
            return ;
        end;
    end
};
local function _()
    if v36 then
        v36:disconnect();
        v36 = nil;
        l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
    end;
end;
local v83 = l_Roact_0.Component:extend("LoadingScreen");
v83.playAnimation = function(v84, v85, v86, v87)
    v84.animationStartTime = tick();
    v84.animationFunction = v85;
    if not v84.renderSteppedConnection then
        v84.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function()
            v84.animationFunction(tick() - v84.animationStartTime, v86, v84.updateBindings, function()
                v84:stopAnimation();
                if v87 then
                    v87();
                end;
            end);
        end);
    end;
end;
v83.stopAnimation = function(v88)
    if v88.renderSteppedConnection then
        v88.renderSteppedConnection:Disconnect();
        v88.renderSteppedConnection = nil;
    end;
end;
v83.renderBackground = function(v89, v90)
    local l_thumbnailScaledWidth_0 = v89.state.thumbnailScaledWidth;
    local l_thumbnailScaledHeight_0 = v89.state.thumbnailScaledHeight;
    local l_thumbnailPositionX_0 = v89.state.thumbnailPositionX;
    local v94 = "";
    if v89.props.placeId and v89.props.placeId > 0 then
        v94 = ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v89.props.placeId);
    end;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v28, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        l_Roact_0.createElement("Frame", {
            Name = "BackgroundFrame", 
            [l_Roact_0.Change.AbsoluteSize] = v89.onAbsoluteSizeChange, 
            BackgroundColor3 = v90.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Active = true
        }, {
            ThumbnailImage = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v94, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(l_thumbnailPositionX_0, 0.5), 
                Size = UDim2.fromOffset(l_thumbnailScaledWidth_0, l_thumbnailScaledHeight_0), 
                ImageTransparency = v89.bindings.thumbnailTransparency
            }), 
            renderStepped = not v90.Settings.ReducedMotion and l_Roact_0.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.renderStepped, 
                callback = v89.renderBackgroundSteppedCallback
            })
        })
    });
end;
v83.showConnnectionHealthDebugMenu = function(_, _)
    if v37 == 0 then
        v37 = 1;
        l_huge_0 = tick();
        return ;
    else
        if v34 and tick() - l_huge_0 <= 0.5 then
            l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
        end;
        v37 = 0;
        l_huge_0 = math.huge;
        return ;
    end;
end;
v83.renderPlaceIcon = function(v97, v98)
    local l_shimPos_0 = v97.state.shimPos;
    local v100 = v97.bindings.iconTransparency:getValue();
    local v101 = "";
    if v97.props.universeId and v97.props.universeId > 0 then
        v101 = ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(v97.props.universeId);
    end;
    local l_ReducedMotion_0 = v98.Settings.ReducedMotion;
    local l_createElement_0 = l_Roact_0.createElement;
    local v104 = "Frame";
    local v105 = {
        Name = "IconFrame", 
        BackgroundTransparency = v97.bindings.iconTransparency, 
        BackgroundColor3 = v30, 
        BorderSizePixel = 0, 
        Size = v97.bindings.iconSize, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Active = true
    };
    local v106 = {};
    local v107 = not l_ReducedMotion_0;
    if v107 then
        v107 = l_Roact_0.createElement;
        local v108 = "Frame";
        local v109 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            ZIndex = 2
        };
        local v110 = {
            Corner = l_Roact_0.createElement("UICorner")
        };
        local l_createElement_1 = l_Roact_0.createElement;
        local v112 = "UIGradient";
        local v113 = {
            Rotation = 25, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
            })
        };
        local l_new_0 = NumberSequence.new;
        local v115 = {};
        local l_new_1 = NumberSequenceKeypoint.new;
        local v117 = 0;
        local v118 = {
            0.7, 
            1
        };
        local v119;
        if type(v118) == "table" and #v118 >= 2 then
            local v120 = math.clamp(v100, 0, 1);
            v119 = v118[1] * (1 - v120) + v118[2] * v120;
        else
            v119 = 0;
        end;
        l_new_1 = l_new_1(v117, v119);
        v117 = NumberSequenceKeypoint.new;
        v119 = 0.5;
        local v121 = {
            0.3, 
            1
        };
        if type(v121) == "table" and #v121 >= 2 then
            local v122 = math.clamp(v100, 0, 1);
            v118 = v121[1] * (1 - v122) + v121[2] * v122;
        else
            v118 = 0;
        end;
        v117 = v117(v119, v118);
        v119 = NumberSequenceKeypoint.new;
        v118 = 1;
        local v123 = {
            0.7, 
            1
        };
        if type(v123) == "table" and #v123 >= 2 then
            local v124 = math.clamp(v100, 0, 1);
            v121 = v123[1] * (1 - v124) + v123[2] * v124;
        else
            v121 = 0;
        end;
        ??? = v119(v118, v121);
        setlist { ['R018[1 to ???]'] = 'R019 to ???' };
        v113.Transparency = l_new_0(v115);
        v113.Offset = Vector2.new(l_shimPos_0, 0);
        v110.Gradient = l_createElement_1(v112, v113);
        v110.renderStepped = l_Roact_0.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.renderStepped, 
            callback = v97.renderShimmerCallback
        });
        v107 = v107(v108, v109, v110);
    end;
    v106.LoadingOverlay = v107;
    v106.GameIconImage = l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v101, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ImageTransparency = v97.bindings.iconTransparency
    }, {
        Corner = l_Roact_0.createElement("UICorner")
    });
    v106.Corner = l_Roact_0.createElement("UICorner");
    return l_createElement_0(v104, v105, v106);
end;
v83.renderInfoFrame = function(v125, v126)
    local l_productInfo_0 = v125.props.productInfo;
    local v128 = not not l_productInfo_0 and l_productInfo_0.Name or "";
    local v129 = not not l_productInfo_0 and l_productInfo_0.Creator.Name or "";
    if l_productInfo_0 and l_productInfo_0.Creator.HasVerifiedBadge then
        v129 = v17.appendVerifiedBadge(v129);
    end;
    return l_Roact_0.createElement("Frame", {
        Name = "InfoFrame", 
        BackgroundColor3 = v126.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v125.bindings.infoFrameTransparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = not not v125.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0), 
        Active = true
    }, {
        PlaceIcon = v125:renderPlaceIcon(v126), 
        TextLayoutFrame = l_Roact_0.createElement("Frame", {
            Name = "TextLayout", 
            BackgroundColor3 = v126.Theme.BackgroundMuted.Color, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0, math.clamp((math.max(v125.state.absoluteSize.X, v125.state.absoluteSize.Y) / 1024) * v35[1], v35[1], v35[2]) / 2), 
            Size = UDim2.fromScale(1, 0), 
            Active = true
        }, {
            PlaceLabel = l_Roact_0.createElement("TextLabel", {
                Name = "PlaceLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v125.bindings.placeTextTransparency, 
                Size = UDim2.fromScale(0.8, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v126.Font.Title.Font, 
                TextSize = v125.bindings.placeTextSize, 
                TextScaled = false, 
                TextWrapped = true, 
                TextColor3 = v126.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v128, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            CreatorLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CreatorLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v125.bindings.creatorTextTransparency, 
                Size = UDim2.fromScale(0.6, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v126.Font.CaptionBody.Font, 
                TextSize = v125.bindings.creatorTextSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v126.Theme.TextDefault.Color, 
                TextStrokeTransparency = 1, 
                Text = v129, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 2, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, not v34 and 36 or 12)
            }), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, not v34 and 36 or 12), 
                PaddingBottom = UDim.new(0, not v34 and 36 or 12)
            })
        }), 
        Corner = l_Roact_0.createElement("UICorner")
    });
end;
v83.renderMain = function(v130, v131)
    local v132 = if not v34 then if v32 then v31.CONSOLE else v31.DESKTOP else v130.isPortrait and v31.MOBILE_PORTRAIT or v31.MOBILE_LANDSCAPE;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v28 + 1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnTopOfCoreBlur = true
    }, {
        DarkGradient = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Gradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 1), 
                    NumberSequenceKeypoint.new(1, 0.5)
                })
            }), 
            Spinner = v131.Settings.ReducedMotion and l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 20
            }, {
                l_Roact_0.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(30, 30), 
                    position = UDim2.new(1, 0, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    rotationRate = 180
                })
            }), 
            infoFrame = v130:renderInfoFrame(v131), 
            serverFrame = v130:renderServerFrame(v131), 
            closeBtn = v130:renderCloseBtn(v131), 
            tenfootCancelBtn = v130:renderTenFootCancelBtn(v131), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v132.LEFT), 
                PaddingRight = UDim.new(0, v132.RIGHT), 
                PaddingTop = UDim.new(0, v132.TOP), 
                PaddingBottom = UDim.new(0, v132.BOTTOM)
            })
        })
    });
end;
v83.renderCloseBtn = function(v133, _)
    if not (not (not v133.state.showCloseBtn and tick() - v133.startTime > 5) or v32) then
        v133:setState({
            showCloseBtn = true
        });
    end;
    return v133.state.showCloseBtn and l_Roact_0.createElement("ImageButton", {
        Name = "CloseButton", 
        Image = "rbxasset://textures/loading/cancelButton.png", 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromOffset(32, 32), 
        Active = false, 
        ZIndex = 10, 
        [l_Roact_0.Event.MouseButton1Click] = function()
            if v25 then
                v18.default:logEventOnce("first_experience_cancelled");
            end;
            game:Shutdown();
        end
    });
end;
v83.renderServerFrame = function(v135, v136)
    local l_serverStatusText_0 = v135.state.serverStatusText;
    local l_isSubjectToChinaPolicies_0 = v135.props.isSubjectToChinaPolicies;
    local v139 = not v32 and 12 or 16;
    local v140 = not v32 and 12 or 16;
    return l_Roact_0.createElement("Frame", {
        Name = "ServerFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.fromScale(0.5, 1), 
        Size = if not l_GetFFlagLoadingScreenLargerJoinStatusText_0() then UDim2.fromScale(0.5, 0.2) else UDim2.new(1, -48, 0.2, 0), 
        Active = true
    }, {
        PolicyLabel = l_isSubjectToChinaPolicies_0 and l_Roact_0.createElement("TextLabel", {
            Name = "PolicyLabel", 
            BackgroundTransparency = 1, 
            Size = if not l_GetFFlagLoadingScreenLargerJoinStatusText_0() then UDim2.new(1, 0, 0, 20) else UDim2.new(1, 0, 0, 2 * v140), 
            Position = if not l_GetFFlagLoadingScreenLargerJoinStatusText_0() then UDim2.fromScale(0, 0.5) else UDim2.new(0, 0, 1, -4 * v139 - 2 * v140), 
            Font = v136.Font.Footer.Font, 
            TextSize = v140, 
            TextWrapped = true, 
            TextScaled = not l_GetFFlagLoadingScreenLargerJoinStatusText_0() and true or false, 
            TextColor3 = v136.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_Translator_0:FormatByKey("Authentication.Login.WeChat.AntiAddictionText"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2
        }), 
        JoinServerLabel = l_Roact_0.createElement("TextLabel", {
            Name = "JoinText", 
            BackgroundTransparency = 1, 
            Size = if not l_GetFFlagLoadingScreenLargerJoinStatusText_0() then UDim2.new(1, 0, 0, -v139) else UDim2.new(1, 0, 0, 4 * v139), 
            Position = if not l_GetFFlagLoadingScreenLargerJoinStatusText_0() then UDim2.fromScale(0, 1) else UDim2.new(0, 0, 1, -2 * v139), 
            Font = v136.Font.Footer.Font, 
            TextSize = v139, 
            TextWrapped = true, 
            TextScaled = not l_GetFFlagLoadingScreenLargerJoinStatusText_0() and true or false, 
            TextColor3 = v136.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_serverStatusText_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            RootLocalizationTable = if not v24 then nil else l_CoreGui_0.CoreScriptLocalization, 
            [l_Roact_0.Event.InputBegan] = not v135.props.isSubjectToChinaPolicies and v135.showConnnectionHealthDebugMenu or nil
        })
    });
end;
v83.renderTenFootCancelBtn = function(v141, v142)
    return v141.state.showTenFootCancelBtn and l_Roact_0.createElement("Frame", {
        Name = "TenfootCancelFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.fromOffset(150, 48), 
        Active = true
    }, {
        CancelIcon = l_Roact_0.createElement("ImageLabel", {
            Name = "TenfootCancel", 
            Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(24, 24), 
            Active = false, 
            ZIndex = 10, 
            LayoutOrder = 0
        }), 
        CancelLabel = l_Roact_0.createElement("TextLabel", {
            Name = "CancelText", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Font = v142.Font.SubHeader1.Font, 
            TextSize = 24, 
            TextWrapped = true, 
            TextColor3 = v142.Theme.TextEmphasis.Color, 
            TextStrokeTransparency = 1, 
            Text = l_Translator_0:FormatByKey("CoreScripts.TopBar.Back"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            LayoutOrder = 1
        }), 
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 5)
        })
    });
end;
v83.init = function(v143)
    v143.thumbnailMoveSpd = 0.05;
    v143.fadeinComplete = false;
    v143.isPortrait = false;
    v143.startTime = tick();
    v143.numberOfTaps = 0;
    v143.lastTapTime = math.huge;
    v143:setState({
        visible = true, 
        absoluteSize = Vector2.new(0, 0), 
        thumbnailPositionX = 0.5, 
        thumbnailScaledWidth = v29.x, 
        thumbnailScaledHeight = v29.y, 
        shimPos = 0, 
        serverStatusText = "", 
        showCloseBtn = false, 
        showTenFootCancelBtn = v32
    });
    v143.onAbsoluteSizeChange = function(v144)
        v143:setState({
            absoluteSize = v144.AbsoluteSize
        });
        v143.isPortrait = v144.AbsoluteSize.X < v144.AbsoluteSize.Y;
        v143.updateBindings.iconSize(1);
    end;
    game.Loaded:Connect(function()
        if not (not v27 or not v32) then
            l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
        end;
        while not v143.fadeinComplete do
            wait();
        end;
        v143:stopAnimation();
        v143:playAnimation(v81.FadeOut, {}, function()
            v143:setState({
                visible = false
            });
        end);
    end);
    local v145, v146 = l_Roact_0.createBinding(1);
    local v147, v148 = l_Roact_0.createBinding(1);
    local v149, v150 = l_Roact_0.createBinding(0);
    local v151, v152 = l_Roact_0.createBinding(1);
    local v153, v154 = l_Roact_0.createBinding(0);
    local v155, v156 = l_Roact_0.createBinding(1);
    local v157, v158 = l_Roact_0.createBinding(0);
    local v159, v160 = l_Roact_0.createBinding(1);
    v143.bindings = {
        thumbnailTransparency = v145, 
        iconTransparency = v147, 
        iconSize = v149:map(function(v161)
            local v162 = math.clamp((math.max(v143.state.absoluteSize.X, v143.state.absoluteSize.Y) / 1024) * v35[1], v35[1], v35[2]);
            return UDim2.fromOffset(v162 * v161, v162 * v161);
        end), 
        placeTextTransparency = v151, 
        placeTextSize = v153:map(function(v163)
            return (not v34 and 36 or 20) * v163;
        end), 
        creatorTextTransparency = v155, 
        creatorTextSize = v157:map(function(v164)
            return 20 * v164;
        end), 
        infoFrameTransparency = v159
    };
    v143.updateBindings = {
        thumbnailTransparency = v146, 
        iconTransparency = v148, 
        iconSize = v150, 
        placeTextTransparency = v152, 
        placeTextSize = v154, 
        creatorTextTransparency = v156, 
        creatorTextSize = v158, 
        infoFrameTransparency = v160
    };
    v143.renderBackgroundSteppedCallback = function(v165)
        local l_absoluteSize_0 = v143.state.absoluteSize;
        local v167 = l_absoluteSize_0.x * 1.5;
        local v168 = (v167 / v29.x) * v29.y;
        if v168 < l_absoluteSize_0.y then
            v167 = (l_absoluteSize_0.y / v29.y) * v29.x;
            v168 = l_absoluteSize_0.y;
        end;
        local v169 = (v167 / l_absoluteSize_0.x) / 2;
        local v170 = math.max(v169, 1 - v169);
        local v171 = math.min(v169, 1 - v169);
        local v172 = v143.state.thumbnailPositionX + v143.thumbnailMoveSpd * v165;
        if not (v170 > v172) or v172 <= v171 then
            v143.thumbnailMoveSpd = -v143.thumbnailMoveSpd;
            v172 = math.clamp(v172, v171, v170);
        end;
        v143:setState({
            thumbnailPositionX = v172, 
            thumbnailScaledHeight = v168, 
            thumbnailScaledWidth = v167
        });
    end;
    v143.renderShimmerCallback = function(v173)
        local v174 = v143.state.shimPos + v173 * 1;
        if v174 > 1 then
            v174 = -1;
        end;
        v143:setState({
            shimPos = v174
        });
    end;
    if l_GuiService_0:GetUiMessage() ~= "" then
        v143:setState({
            serverStatusText = l_GuiService_0:GetUiMessage()
        });
    end;
    l_GuiService_0.UiMessageChanged:Connect(function(v175, v176)
        if v175 == Enum.UiMessageType.UiMessageInfo then
            v143:setState({
                serverStatusText = v176
            });
        end;
    end);
    if v32 then
        local v177 = false;
        do
            local l_v177_0 = v177;
            l_ContextActionService_0:BindCoreAction("CancelGameLoad", function(_, v180, _)
                if v180 == Enum.UserInputState.Begin then
                    l_v177_0 = true;
                    return ;
                else
                    if not (not (v180 == Enum.UserInputState.End) or not l_v177_0) then
                        v143:setState({
                            showTenFootCancelBtn = false
                        });
                        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
                        game:Shutdown();
                    end;
                    return ;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end;
    end;
end;
v83.render = function(v182)
    return l_withStyle_0(function(v183)
        return v182.state.visible and l_Roact_0.createElement("Folder", {}, {
            BackgroundScreen = v182:renderBackground(v183), 
            MainScreen = v182:renderMain(v183)
        });
    end);
end;
v83.willUpdate = function(_, _, _)
end;
v83.didMount = function(v187)
    l_RunService_0:SetRobloxGuiFocused(true);
    v187.props.fetchUniverseId(v187.props.placeId);
    v187.props.fetchGameProductInfo(v187.props.placeId);
    v187.props.fetchSubjectToChinaPolicies();
    v187:playAnimation(v81.FadeIn, {}, function()
        v187.fadeinComplete = true;
    end);
end;
v83.willUnmount = function(_)
    l_RunService_0:SetRobloxGuiFocused(false);
    if not (v27 or not v32) then
        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
    end;
    if not v36 then
        v36 = l_UserInputService_0.InputBegan:Connect(function()
            if v36 then
                v36:disconnect();
                v36 = nil;
                l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
            end;
        end);
    end;
end;
return (l_RoactRodux_0.connect(function(v189, v190)
    return {
        productInfo = v189.productInfo, 
        isSubjectToChinaPolicies = v189.isSubjectToChinaPolicies, 
        placeId = not not v189.gameIds and v189.gameIds.placeId or v190.placeId, 
        universeId = not not v189.gameIds and v189.gameIds.universeId or 0, 
        settings = v189.settings
    };
end, function(v191)
    return {
        fetchGameProductInfo = function(v192)
            v191(v14(v192));
        end, 
        fetchSubjectToChinaPolicies = function()
            v191(v15());
        end, 
        fetchUniverseId = function(v193)
            v191(v16(v23, v193));
        end
    };
end)(v83));
