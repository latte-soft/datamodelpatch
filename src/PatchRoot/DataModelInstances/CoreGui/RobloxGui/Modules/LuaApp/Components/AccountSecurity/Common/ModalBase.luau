local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Components.OnScreenKeyboardWindow);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local v14 = v2.PureComponent:extend(script.Name);
v14.defaultProps = {
    makeBodyFragment = function()
        return nil;
    end
};
v14.init = function(v15)
    v15.closeModal = function()
        v15.props.closeOverlay();
        if v15.props.closeCallback then
            v15.props.closeCallback();
        end;
    end;
    v15.getAdjustedTitleToScreenString = function(v16, v17, v18)
        if v16 == nil then
            return v16;
        else
            local v19 = math.floor(0.85 * (v17 / ((v18.Font.Body.RelativeSize * v18.Font.BaseSize) * 0.6)));
            if string.len(v16) <= v19 then
                return v16;
            elseif v16:find(" ") == nil then
                return v16;
            else
                v15.adjustedTitle = "";
                v15.remainingTitleToAnalyze = v16;
                for v20 = 1, 2 do
                    if v19 < string.len(v15.remainingTitleToAnalyze) then
                        local v21 = string.sub(v15.remainingTitleToAnalyze, 1, v19);
                        local v22 = v21:reverse():find(" ");
                        if v22 ~= nil then
                            local v23 = string.len(v21) - v22;
                            v15.remainingTitleToAnalyze = string.sub(v15.remainingTitleToAnalyze, v23 + 2);
                            v15.adjustedTitle = v15.adjustedTitle .. string.sub(v21, 0, v23);
                        else
                            v15.adjustedTitle = v15.adjustedTitle .. v21;
                            v15.remainingTitleToAnalyze = string.sub(v15.remainingTitleToAnalyze, v19 + 1);
                        end;
                        if v20 ~= 2 then
                            v15.adjustedTitle = v15.adjustedTitle .. "\n";
                        end;
                    else
                        v15.adjustedTitle = v15.adjustedTitle .. v15.remainingTitleToAnalyze;
                        break;
                    end;
                end;
                return v15.adjustedTitle;
            end;
        end;
    end;
end;
v14.render = function(v24)
    local _ = v24.props.closeOverlay;
    local l_screenSize_0 = v24.props.screenSize;
    local v27 = l_PartialPageModal_0:getMiddleContentWidth(l_screenSize_0.X);
    local l_buttonConfig_0 = v24.props.buttonConfig;
    local l_makeBodyFragment_0 = v24.props.makeBodyFragment;
    local v30 = not v24.props.hideCloseButton;
    local l_title_0 = v24.props.title;
    local _ = v24.props.closeCallback;
    return l_withStyle_0(function(v33)
        return v2.createElement(v6, {
            Contents = {
                Modal = v2.createElement(l_PartialPageModal_0, {
                    title = v24.getAdjustedTitleToScreenString(l_title_0, v27, v33), 
                    screenSize = l_screenSize_0, 
                    buttonStackProps = l_buttonConfig_0, 
                    onCloseClicked = v30 and v24.closeModal
                }, {
                    Middle = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0)
                    }, {
                        ContentPadding = v2.createElement("UIPadding", {
                            PaddingBottom = l_buttonConfig_0 and UDim.new(0, 24), 
                            PaddingTop = UDim.new(0, 24)
                        }), 
                        ListLayout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 24), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        BodyFragment = l_makeBodyFragment_0(v27)
                    })
                })
            }
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v9
})((v3.connect(function(v34, _)
    return {
        screenSize = v34.ScreenSize
    };
end, function(v36)
    return {
        closeOverlay = function()
            return v36(v5());
        end
    };
end)(v14))));
