local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.dependencies);
local v4 = require(l_Parent_0.Common.TextKeys);
local l_Roact_0 = v3.Roact;
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_Cryo_0 = v3.Cryo;
local l_formatUsername_0 = v3.UserProfiles.Formatters.formatUsername;
local l_formatPrimaryName_0 = v3.UserProfiles.Formatters.formatPrimaryName;
local l_useLocalization_0 = v3.useLocalization;
local l_useUserExperiment_0 = v3.useUserExperiment;
local l_AppUserLayers_0 = v3.AppUserLayers;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v21 = require(l_Parent_0.Flags.FFlagShowDisplayNameTooltip);
local v22 = require(l_Parent_0.Flags.FFlagDisplayNameTooltipIXPEnabled);
local v23 = game:DefineFastInt("ProfileAliasTooltipSeenMaxCount", 3);
local v24 = game:DefineFastInt("ProfileDisplayNameTooltipSeenMaxCount", 3);
local l_InternationalNamesIXP_0 = v3.EditProfile.Flags.InternationalNamesIXP;
local v26 = require(l_Parent_0.Flags.InternationalNamesSupportedLocales);
local v27 = {
    appStorageService = l_AppStorageService_0, 
    localizationService = l_LocalizationService_0
};
return function(v28)
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if not (v21 or v22) and not l_InternationalNamesIXP_0.FFlagIsSetupEnabled() then
        v29 = v28;
        v30 = l_AppStorageService_0;
    else
        v29 = l_Cryo_0.Dictionary.join(v27, v28);
        v30 = v29.appStorageService;
    end;
    if l_InternationalNamesIXP_0.FFlagIsSetupEnabled() then
        v31 = v29.localizationService;
    end;
    local v32 = l_useStyle_0();
    local l_Font_0 = v32.Font;
    local l_Theme_0 = v32.Theme;
    local v35 = nil;
    local v36 = nil;
    local v37 = if not l_InternationalNamesIXP_0.FFlagIsSetupEnabled() then nil else l_InternationalNamesIXP_0.useIsExperimentEnabled({
        isExposureEnabled = false
    });
    if l_InternationalNamesIXP_0.FFlagIsSetupEnabled() then
        l_React_0.useEffect(function()
            if not ((not v29.isLocalUser or not v35) or not v26.isSupportedLocale(v31.RobloxLocaleId)) then
                l_InternationalNamesIXP_0.logExposure();
            end;
        end, {
            v29.isLocalUser
        });
    end;
    local v38 = nil;
    if v22 then
        v38 = l_useUserExperiment_0({
            l_AppUserLayers_0.SocialSelfProfileViewLayer
        }, function(v39)
            return (v39[l_AppUserLayers_0.SocialSelfProfileViewLayer] or {}).dn_tooltip_enabled;
        end);
    end;
    local v40 = nil;
    local v41 = ((v21 or v38) and v29.isLocalUser) and "NamesDisplayNameTooltipImpressionCount" or "NamesProfileTooltip";
    local v42 = tonumber(v30:GetItem(v41)) or 0;
    local v43, v44 = l_React_0.useState(v42);
    local v45 = l_React_0.useRef(v42);
    local function _()
        if not v29.isLocalUser then
            return v4.AliasTooltipBody;
        elseif not v37 or not v26.isSupportedLocale(v31.RobloxLocaleId) then
            return v4.DisplayNameTooltipBody;
        else
            return v4.DisplayNameNewCharactersTooltipBody;
        end;
    end;
    if not v21 and not v38 then
        local function _(v47)
            v30:SetItem("NamesProfileTooltip", (tostring(v47)));
            v30:Flush();
        end;
        v35 = v43 < v23 and (v29.isOverwrittenName and true or false);
        l_React_0.useEffect(function()
            return function()
                if v35 then
                    v30:SetItem("NamesProfileTooltip", (tostring(v43 + 1)));
                    v30:Flush();
                end;
            end;
        end, {});
        local function _()
            v44(v23);
            v30:SetItem("NamesProfileTooltip", (tostring(v23)));
            v30:Flush();
        end;
        v36 = function()
            v44(v23);
            v30:SetItem("NamesProfileTooltip", (tostring(v23)));
            v30:Flush();
            v29.primaryNameActivated();
        end;
        v40 = l_useLocalization_0({
            tooltipTitle = v4.AliasTooltipHeader, 
            tooltipBody = v4.AliasTooltipBody
        });
    else
        v40 = l_useLocalization_0({
            tooltipTitle = if not v29.isLocalUser then v4.AliasTooltipHeader else nil, 
            tooltipBody = if not l_InternationalNamesIXP_0.FFlagIsSetupEnabled() then if v29.isLocalUser then v4.DisplayNameTooltipBody else v4.AliasTooltipBody else if v29.isLocalUser then if v37 and v26.isSupportedLocale(v31.RobloxLocaleId) then v4.DisplayNameNewCharactersTooltipBody else v4.DisplayNameTooltipBody else v4.AliasTooltipBody
        });
        local function _(v50)
            v30:SetItem(v41, (tostring(v50 or 0)));
            v30:Flush();
        end;
        local v52 = if not v29.isLocalUser then v23 else v24;
        if v45.current then
            v35 = if not v29.isLocalUser then v45.current < v52 and (v29.isOverwrittenName and true or false) else v45.current < v52 and (not v29.isOverwrittenName or false);
        end;
        l_React_0.useEffect(function()
            return function()
                if not (not v35 or not v45.current) then
                    v30:SetItem(v41, (tostring(v45.current + 1 or 0)));
                    v30:Flush();
                end;
            end;
        end, {});
        local function _()
            if not v29.isLocalUser then
                v45.current = v23;
                v30:SetItem(v41, (tostring(v23 or 0)));
                v30:Flush();
                return ;
            else
                v45.current = v24;
                v30:SetItem(v41, (tostring(v24 or 0)));
                v30:Flush();
                return ;
            end;
        end;
        v36 = function()
            if not v29.isLocalUser then
                v29.primaryNameActivated();
            else
                v29.navigateToEditDisplayNameModal();
            end;
            if not v29.isLocalUser then
                v45.current = v23;
                v30:SetItem(v41, (tostring(v23 or 0)));
                v30:Flush();
                return ;
            else
                v45.current = v24;
                v30:SetItem(v41, (tostring(v24 or 0)));
                v30:Flush();
                return ;
            end;
        end;
    end;
    local v54 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v56 = l_formatUsername_0(v29.username);
    local v57 = l_Roact_0.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        Font = l_Font_1, 
        Text = l_formatPrimaryName_0(v29.primaryName, {
            hasVerifiedBadge = v29.hasVerifiedBadge, 
            hasPremiumMembership = v29.hasPremiumMembership
        }), 
        TextSize = v54, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_Theme_0.TextEmphasis.Color, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextWrapped = true, 
        LayoutOrder = 2
    }, {
        l_Roact_0.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(math.huge, v54 * 2)
        })
    });
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        PrimaryNameContainer = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            PrimaryName = if not if v21 or v38 then v29.isLocalUser or v29.friendshipStatus == Enum.FriendStatus.Friend else v29.friendshipStatus == Enum.FriendStatus.Friend then v57 else l_Roact_0.createElement(l_Interactable_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                [l_Roact_0.Event.Activated] = v36, 
                onStateChanged = function()
                end
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                CustomizeNameIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Image = if not v29.isOverwrittenName then l_Images_0["icons/actions/edit/edit_small"] else l_Images_0["icons/actions/edit/editOn_small"], 
                    ImageColor3 = l_Theme_0.IconDefault.Color, 
                    ImageTransparency = l_Theme_0.IconDefault.Transparency, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    tooltip = if not v35 then nil else l_Roact_0.createElement(l_Tooltip_0, {
                        triggerPosition = Vector2.new(16, 0), 
                        triggerSize = Vector2.new(0, 0), 
                        headerText = v40.tooltipTitle, 
                        bodyText = v40.tooltipBody, 
                        orientation = l_TooltipOrientation_0.Top, 
                        forceClickTriggerPoint = true, 
                        isDirectChild = true
                    })
                }), 
                PrimaryName = v57
            })
        }), 
        Username = l_Roact_0.createElement(l_StyledTextLabel_0, {
            text = v56, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextDefault, 
            size = UDim2.new(1, 0, 0, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            textXAlignment = Enum.TextXAlignment.Left, 
            layoutOrder = 2
        })
    });
end;
