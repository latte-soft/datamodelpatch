local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_expect_0 = require(l_CorePackages_0.JestGlobals).expect;
local v4 = require(l_Modules_0.LuaApp.TestHelpers.MockStore);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Rhodium);
local l_Element_0 = v6.Element;
local l_XPath_0 = v6.XPath;
local v9 = require(l_Modules_0.LuaAppRhodiumTest.withServices);
local v10 = require(l_Modules_0.act);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v13 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.adjustScreenPath);
local v14 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.FakeNavigation);
local v15 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.withAvatarProviders);
beforeAll = nil;
afterAll = nil;
describe = nil;
it = nil;
itSKIP = nil;
return function(v16, v17, v18, v19)
    local v20 = {
        FetchingStatus = {
            [v18] = l_RetrievalStatus_0.NotStarted
        }, 
        ScreenSize = Vector2.new(500, 500)
    };
    v16 = v15(v16);
    local v21 = v4.new(v20);
    v19 = v5.Dictionary.join(v19 or {}, {
        navigation = v14.new({
            routeName = v17
        })
    });
    describe(v17, function()
        it("should mount the component", function()
            v9(function(v22)
                l_expect_0(l_Element_0.new((v13(l_XPath_0.new(v22)))):waitForRbxInstance(1)).toBeDefined();
            end, v16, v21, v19);
        end);
        it("should disable the Save button if there is no user input", function()
            v9(function(v23)
                v23 = v13(l_XPath_0.new(v23)):cat(l_XPath_0.new("Alert"));
                local v24 = v23:cat(l_XPath_0.new("AlertContents.MiddleContent.Content.CustomContent.Content")):cat(l_XPath_0.new("TextboxContainer.Textbox"));
                local v25 = v23:cat(l_XPath_0.new("AlertContents.Footer.Buttons"));
                local v26 = v25:cat(l_XPath_0.new("2"));
                l_expect_0(l_Element_0.new(v24):waitForRbxInstance(1)).toBeDefined();
                l_expect_0(l_Element_0.new(v25):waitForRbxInstance(1)).toBeDefined();
                local v27 = l_Element_0.new(v26);
                l_expect_0(v27:waitForRbxInstance(1)).toBeDefined();
                l_expect_0(v27:getAttribute("ImageTransparency")).toBe(v11.ActionBar.DisabledButtonTransparency);
            end, v16, v21, v19);
        end);
        it("should disable the Save button if the outfit's name is invalid", function(v28)
            v9(function(v29)
                v29 = v13(l_XPath_0.new(v29)):cat(l_XPath_0.new("Alert"));
                local v30 = v29:cat(l_XPath_0.new("AlertContents.MiddleContent.Content.CustomContent.Content"));
                local v31 = v30:cat(l_XPath_0.new("TextboxContainer.Textbox"));
                local v32 = v30:cat(l_XPath_0.new("WarningText"));
                local v33 = v29:cat(l_XPath_0.new("AlertContents.Footer.Buttons"));
                local v34 = v33:cat(l_XPath_0.new("2"));
                local v35 = l_Element_0.new(v31);
                l_expect_0(v35:waitForRbxInstance(1)).toBeDefined();
                v10(function()
                    wait(0.3);
                end);
                v28.actSendText(v35, "#abc", 0.3);
                l_expect_0(v35:getAttribute("Text")).toBe("#abc");
                l_expect_0(l_Element_0.new(v32):waitForRbxInstance(1)).toBeDefined();
                l_expect_0(l_Element_0.new(v33):waitForRbxInstance(1)).toBeDefined();
                local v36 = l_Element_0.new(v34);
                l_expect_0(v36:waitForRbxInstance(1)).toBeDefined();
                l_expect_0(v36:getAttribute("ImageTransparency")).toBe(v11.ActionBar.DisabledButtonTransparency);
            end, v16, v21, v19);
        end);
        it("should enable the Save button if the outfit's name is valid", function(v37)
            v9(function(v38)
                v38 = v13(l_XPath_0.new(v38)):cat(l_XPath_0.new("Alert"));
                local v39 = v38:cat(l_XPath_0.new("AlertContents.MiddleContent.Content.CustomContent.Content"));
                local v40 = v39:cat(l_XPath_0.new("TextboxContainer.Textbox"));
                local v41 = v39:cat(l_XPath_0.new("WarningText"));
                local v42 = v38:cat(l_XPath_0.new("AlertContents.Footer.Buttons"));
                local v43 = v42:cat(l_XPath_0.new("2"));
                local v44 = l_Element_0.new(v40);
                l_expect_0(v44:waitForRbxInstance(1)).toBeDefined();
                v10(function()
                    wait(0.3);
                end);
                v37.actSendText(v44, "abc", 0.3);
                l_expect_0(v44:getAttribute("Text")).toBe("abc");
                l_expect_0(l_Element_0.new(v41):waitForRbxInstance(1)).toBeNil();
                l_expect_0(l_Element_0.new(v42):waitForRbxInstance(1)).toBeDefined();
                local v45 = l_Element_0.new(v43);
                l_expect_0(v45:waitForRbxInstance(1)).toBeDefined();
                l_expect_0(v45:getAttribute("ImageTransparency")).never.toBe(v11.ActionBar.DisabledButtonTransparency);
            end, v16, v21, v19);
        end);
    end);
    describe(v17 .. "Gamepad", function()
        local v46 = {
            navigation = v14.new({
                routeName = v17
            })
        };
        it("should navigate the component with gamepad", function(v47)
            local v48 = v6.VirtualInput.GamePad.new();
            v48:hitButton(Enum.KeyCode.DPadUp);
            if not game:GetEngineFeature("VirtualInputEventsProcessed") then
                wait();
            else
                v6.VirtualInput.waitForInputEventsProcessed();
            end;
            v9(function(v49)
                v49 = v13(l_XPath_0.new(v49)):cat(l_XPath_0.new("Alert"));
                local v50 = l_Element_0.new(v49:cat(l_XPath_0.new("AlertContents.Footer.Buttons.1")));
                l_expect_0(v50:waitForRbxInstance(1)).toBeDefined();
                local v51 = l_Element_0.new(v49:cat(l_XPath_0.new("AlertContents.Footer.Buttons.2")));
                local v52 = l_Element_0.new((v49:cat(l_XPath_0.new("AlertContents.MiddleContent.Content.CustomContent.Content.TextboxContainer.Textbox"))));
                v10(function()
                    task.wait(0);
                end);
                l_expect_0(v50:getRbxInstance()).toBe(l_GuiService_0.SelectedCoreObject);
                v47.actGamepadInput(v48, Enum.KeyCode.DPadRight);
                l_expect_0(v51:getRbxInstance()).toBe(l_GuiService_0.SelectedCoreObject);
                v47.actGamepadInput(v48, Enum.KeyCode.DPadUp);
                l_expect_0(v52:getRbxInstance()).toBe(l_GuiService_0.SelectedCoreObject);
                v47.actGamepadInput(v48, Enum.KeyCode.DPadDown);
                l_expect_0(v50:getRbxInstance()).toBe(l_GuiService_0.SelectedCoreObject);
                v48:disconnect();
            end, v16, v21, v19, nil, v46);
        end);
    end);
end;
