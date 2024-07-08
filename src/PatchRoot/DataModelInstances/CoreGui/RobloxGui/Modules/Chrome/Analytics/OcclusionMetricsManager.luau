local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Unibar.Constants);
local v6 = require(l_Parent_0.Flags.GetFIntLuaUIOcclusionMetricsReportingPeriodSeconds)();
local l_game_EngineFeature_0 = game:GetEngineFeature("GuiServiceSendUIOcclusionMetricsForQueryRegion");
local function _(v8)
    return v8 + l_GuiService_0:GetGuiInset();
end;
local function _(v10)
    return UDim2.fromOffset(v10.X, v10.Y);
end;
local function _(v12)
    local v13 = v12.position + l_GuiService_0:GetGuiInset();
    local l_l_GuiService_0_0 = l_GuiService_0;
    local v15 = UDim2.fromOffset(v13.X, v13.Y);
    local l_size_0 = v12.size;
    l_l_GuiService_0_0:SendUIOcclusionMetricsForQueryRegion(v15, UDim2.fromOffset(l_size_0.X, l_size_0.Y), "currentSizeTR");
end;
return function()
    if l_game_EngineFeature_0 then
        local v18 = v2.useRef({
            id = v5.UNIBAR_KEEP_OUT_AREA_ID, 
            position = Vector2.new(), 
            size = Vector2.new()
        });
        local v20 = l_useSelector_0(function(v19)
            return v19.displayOptions.keepOutAreas[v5.UNIBAR_KEEP_OUT_AREA_ID];
        end);
        v2.useEffect(function()
            v18.current = v20;
        end, {
            v20
        });
        v2.useEffect(function()
            local v26 = task.spawn(function()
                while true do
                    if v18.current then
                        local l_current_0 = v18.current;
                        local v22 = l_current_0.position + l_GuiService_0:GetGuiInset();
                        local l_l_GuiService_0_1 = l_GuiService_0;
                        local v24 = UDim2.fromOffset(v22.X, v22.Y);
                        local l_size_1 = l_current_0.size;
                        l_l_GuiService_0_1:SendUIOcclusionMetricsForQueryRegion(v24, UDim2.fromOffset(l_size_1.X, l_size_1.Y), "currentSizeTR");
                    end;
                    task.wait(v6);
                end;
            end);
            return function()
                task.cancel(v26);
            end;
        end, {});
        return ;
    else
        return ;
    end;
end;
