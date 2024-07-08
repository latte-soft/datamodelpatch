local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local l_Hooks_0 = l_Parent_0.Hooks;
local l_utils_0 = l_Parent_0.utils;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_0.dependencies);
local l_React_0 = v5.React;
local l_UIBlox_0 = v5.UIBlox;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_DarkTheme_0 = l_UIBlox_0.App.Style.Themes.DarkTheme;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v11 = require(l_Parent_0.type);
local l_ButtonStack_0 = l_UIBlox_0.App.Button.ButtonStack;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v14 = require(l_Parent_0.constants);
local l_DefaultCardPadding_0 = v14.Padding.DefaultCardPadding;
local l_DefaultContentPadding_0 = v14.DefaultContentPadding;
local l_DefaultButtonHeight_0 = v14.DefaultButtonHeight;
local l_getTimerFromCardData_0 = require(l_utils_0.toastNotificationHelper).getTimerFromCardData;
local v19 = require(l_context_0.useNotificationCardState);
local v20 = require(l_context_0.useNotificationCardData);
local v21 = require(l_Hooks_0.useTimeRemainingMap);
local l_GetFFlagFixToastStyleIssues_0 = require(l_Parent_1.SharedFlags).GetFFlagFixToastStyleIssues;
local l_GetFFlagToastNotificationTimerChangesEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagToastNotificationTimerChangesEnabled;
local function _(v24)
    if v24 == v11.SENDERButtonStyleEnum.Growth then
        return l_ButtonType_0.PrimaryContextual;
    elseif v24 == v11.SENDERButtonStyleEnum.Primary then
        return l_ButtonType_0.PrimarySystem;
    elseif v24 == v11.SENDERButtonStyleEnum.Secondary then
        return l_ButtonType_0.Secondary;
    elseif v24 == v11.SENDERButtonStyleEnum.Alert then
        return l_ButtonType_0.Alert;
    else
        return l_ButtonType_0.Secondary;
    end;
end;
local _ = function(v26, v27, v28)
    local _ = nil;
    return string.format("%s <font color='#%s'>(%ds)</font>", v26.label.text, if v28 == l_DarkTheme_0 then l_Colors_0.Graphite:ToHex() else l_Colors_0.Pumice:ToHex(), v27);
end;
local function v48(v31, v32)
    local v33 = l_useStyle_0();
    local v34 = v20();
    local v35 = nil;
    if l_GetFFlagToastNotificationTimerChangesEnabled_0() then
        local v36 = {};
        for _, v38 in ipairs(v31) do
            if not (not v38.timer or not v38.timer.showTimeOnElement) then
                v36[v38.timer.showTimeOnElement] = l_getTimerFromCardData_0(v34, v38.timer.showTimeOnElement);
            end;
        end;
        v35 = v21(v36, v34);
    end;
    local v39 = {};
    if v31 then
        for _, v41 in ipairs(v31) do
            local v42 = nil;
            if ((not l_GetFFlagToastNotificationTimerChangesEnabled_0() or not v41) or not v41.timer) or not v41.timer.showTimeOnElement then
                v42 = v41.label.text;
            else
                local v43 = v35[v41.timer.showTimeOnElement];
                local l_Theme_0 = v33.Theme;
                local _ = nil;
                v42 = string.format("%s <font color='#%s'>(%ds)</font>", v41.label.text, if l_Theme_0 == l_DarkTheme_0 then l_Colors_0.Graphite:ToHex() else l_Colors_0.Pumice:ToHex(), v43);
            end;
            local v46 = {};
            local l_buttonStyle_0 = v41.buttonStyle;
            v46.buttonType = if l_buttonStyle_0 == v11.SENDERButtonStyleEnum.Growth then l_ButtonType_0.PrimaryContextual else if l_buttonStyle_0 == v11.SENDERButtonStyleEnum.Primary then l_ButtonType_0.PrimarySystem else if l_buttonStyle_0 == v11.SENDERButtonStyleEnum.Secondary then l_ButtonType_0.Secondary else if l_buttonStyle_0 == v11.SENDERButtonStyleEnum.Alert then l_ButtonType_0.Alert else l_ButtonType_0.Secondary;
            v46.props = {
                text = v42, 
                onActivated = function()
                    if v32 then
                        v32(v41);
                    end;
                end, 
                buttonTextOverride = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else {
                    RichText = true
                }
            };
            table.insert(v39, v46);
        end;
    end;
    return v39;
end;
return function()
    local v49 = v19("button");
    local v50 = v20();
    local l_handleActions_0 = v50.handleActions;
    local l_cardSize_0 = v50.cardSize;
    local v53 = if not not l_cardSize_0 and l_cardSize_0.cardPadding then l_cardSize_0.cardPadding else l_DefaultCardPadding_0;
    local v54 = v48(v49, l_handleActions_0);
    if #v54 > 0 then
        return (l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = if l_GetFFlagFixToastStyleIssues_0() then nil else l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v53)
            }), 
            ActionButtons = v54 and l_React_0.createElement(l_ButtonStack_0, {
                buttonHeight = l_DefaultButtonHeight_0, 
                buttons = v54, 
                marginBetween = l_DefaultContentPadding_0
            })
        }));
    else
        return nil;
    end;
end;
