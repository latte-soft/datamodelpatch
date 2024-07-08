local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Cryo_0 = v3.Cryo;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Constants);
local v10 = require(l_Parent_0.Components.PlayerLabel);
local v11 = require(l_Parent_0.Components.Divider);
local v12 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v13 = require(script.Parent.GameLabel);
local v14 = require(script.Parent.ReportButton);
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.ThemedTextLabel);
local v17 = require(l_Parent_0.Localization.withLocalization);
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local v20 = game:DefineFastFlag("DSAReportingIGMv2", true);
local v21 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v22 = l_Roact_0.PureComponent:extend("ReportList");
local v23 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
game:DefineFastFlag("IGMReportListMissingBottomEntry", false);
v22.validateProps = l_t_0.strictInterface({
    placeName = l_t_0.string, 
    players = l_t_0.array(l_t_0.union(l_t_0.instanceIsA("Player"), l_t_0.strictInterface({
        UserId = l_t_0.integer, 
        Name = l_t_0.string
    }))), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    currentPage = not not v23() and l_t_0.optional(l_t_0.string) or nil, 
    currentZone = not not v23() and l_t_0.optional(l_t_0.number) or nil
});
local function v26(v24, v25)
    return v24.Name:lower() < v25.Name:lower();
end;
v22.init = function(v27)
    v27.reportGameRef = l_Roact_0.createRef();
end;
v22.renderListEntries = function(v28)
    local v29 = l_Cryo_0.List.sort(v28.props.players, v26);
    local v30 = #v29;
    local v31 = 3;
    local v32 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    if v23() then
        local l_createElement_0 = l_Roact_0.createElement;
        local l_v15_0 = v15;
        local v35 = {
            isFocused = v28.props.canCaptureFocus
        };
        local v36 = true;
        if v28.props.currentPage ~= v9.MainPagePageKey then
            v36 = v28.props.currentZone == 0;
        end;
        v35.shouldForgetPreviousSelection = v36;
        v35.didFocus = function(v37)
            l_GuiService_0.SelectedCoreObject = v37 or v28.reportGameRef:getValue();
        end;
        v32.FocusHandler = l_createElement_0(l_v15_0, v35);
    end;
    v32.GameReport = l_Roact_0.createElement(v13, {
        gameId = game.GameId, 
        gameName = v28.props.placeName, 
        LayoutOrder = 1, 
        [l_Roact_0.Ref] = v28.reportGameRef, 
        onActivated = function()
            v21.openReportDialogForPlace(v9.AnalyticsInGameMenuName);
        end
    }, {
        ReportButton = l_Roact_0.createElement(v14, {
            LayoutOrder = 1
        })
    });
    if #v29 > 0 then
        v32["divider_" .. v31] = l_Roact_0.createElement(v11, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, -80, 0, 1)
        });
    end;
    for v38, v39 in pairs(v29) do
        v32["player_" .. v38] = l_Roact_0.createElement(v10, {
            username = v39.Name, 
            userId = v39.UserId, 
            isOnline = true, 
            isSelected = false, 
            LayoutOrder = v31, 
            onActivated = function()
                v21.openReportDialogForPlayer(v39, v9.AnalyticsInGameMenuName);
            end
        }, {
            ReportButton = l_Roact_0.createElement(v14, {
                userId = v39.UserId, 
                userName = v39.Name, 
                LayoutOrder = 1
            })
        });
        v31 = v31 + 1;
        if v38 < v30 then
            v32["divider_" .. v31] = l_Roact_0.createElement(v11, {
                LayoutOrder = v31, 
                Size = UDim2.new(1, -80, 0, 1)
            });
            v31 = v31 + 1;
        end;
    end;
    return v32;
end;
v22.didUpdate = function(v40, v41, _)
    if not ((v23() or not v40.props.canCaptureFocus) or v41.canCaptureFocus) then
        l_GuiService_0.SelectedCoreObject = v40.reportGameRef:getValue();
    end;
end;
v22.render = function(v43)
    local v44 = nil;
    v44 = if not game:GetFastFlag("IGMReportListMissingBottomEntry") then #v43.props.players * 71 else 70 + #v43.props.players * 71;
    if (not l_isShowEUDSAIllegalContentReportingLink_0() or not v20) or not v19() then
        return l_Roact_0.createElement(v12, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v44)
        }, v43:renderListEntries());
    else
        return v17({
            DSAFooterText = "CoreScripts.InGameMenu.Report.DSAFooter"
        })(function(v45)
            return l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, -50), 
                BackgroundTransparency = 1
            }, {
                ScrollingFrame = l_Roact_0.createElement(v12, {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, -50), 
                    CanvasSize = UDim2.new(1, 0, 0, v44)
                }, v43:renderListEntries()), 
                EUWarning = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 50), 
                    Position = UDim2.new(0, 0, 1, -50), 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 30), 
                        PaddingRight = UDim.new(0, 30), 
                        PaddingTop = UDim.new(0, 20)
                    }), 
                    TextLabel = l_Roact_0.createElement(v16, {
                        fontKey = "Footer", 
                        themeKey = "TextEmphasis", 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextWrapped = true, 
                        Text = v45.DSAFooterText, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                })
            });
        end);
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v46, _)
    local l_name_0 = v46.gameInfo.name;
    local v49 = false;
    if v46.menuPage == "Report" then
        v49 = false;
        if v46.displayOptions.inputType == v9.InputType.Gamepad then
            v49 = not ((v46.report.dialogOpen or v46.report.reportSentOpen) or v46.respawn.dialogOpen) and v46.currentZone == 1;
        end;
    end;
    return {
        placeName = l_name_0, 
        canCaptureFocus = v49, 
        currentPage = if v23() then v46.menuPage else nil, 
        currentZone = if v23() then v46.currentZone else nil
    };
end)(v22);
