local l_UserInputService_0 = game:GetService("UserInputService");
local l_KeyCode_0 = Enum.KeyCode;
local l_UserInputType_0 = Enum.UserInputType;
local v3 = {
    KEYBOARD = "Keyboard", 
    GAMEPAD = "Gamepad"
};
local v4 = {
    [Enum.UserInputType.MouseButton2] = v3.KEYBOARD, 
    [Enum.UserInputType.MouseButton3] = v3.KEYBOARD, 
    [Enum.UserInputType.MouseWheel] = v3.KEYBOARD, 
    [Enum.UserInputType.MouseMovement] = v3.KEYBOARD, 
    [Enum.UserInputType.Keyboard] = v3.KEYBOARD, 
    [Enum.UserInputType.Gamepad1] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad2] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad3] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad4] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad5] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad6] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad7] = v3.GAMEPAD, 
    [Enum.UserInputType.Gamepad8] = v3.GAMEPAD
};
local v5 = {
    {
        title = "CoreScripts.InGameMenu.Controls.CharacterMovementTitle", 
        controls = {
            {
                desc = "CoreScripts.InGameMenu.Controls.MoveForward", 
                inputs = {
                    l_KeyCode_0.Up, 
                    l_KeyCode_0.W
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.MoveBackward", 
                inputs = {
                    l_KeyCode_0.Down, 
                    l_KeyCode_0.S
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.MoveLeft", 
                inputs = {
                    l_KeyCode_0.A
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.MoveRight", 
                inputs = {
                    l_KeyCode_0.D
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.Jump", 
                inputs = {
                    l_KeyCode_0.Space
                }
            }
        }
    }, 
    {
        title = "CoreScripts.InGameMenu.Controls.CameraMovementTitle", 
        controls = {
            {
                desc = "CoreScripts.InGameMenu.Controls.RotateCamera", 
                inputs = {
                    l_KeyCode_0.Left, 
                    l_KeyCode_0.Right, 
                    l_UserInputType_0.MouseButton2
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera", 
                inputs = {
                    l_UserInputType_0.MouseWheel
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.ZoomInCamera", 
                inputs = {
                    l_KeyCode_0.I
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.ZoomOutCamera", 
                inputs = {
                    l_KeyCode_0.O
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.MouseLock", 
                inputs = {
                    l_KeyCode_0.LeftShift
                }
            }
        }
    }, 
    {
        title = "CoreScripts.InGameMenu.Controls.AccessoriesTitle", 
        controls = {
            {
                desc = "CoreScripts.InGameMenu.Controls.EquipUnequipTools", 
                inputs = {
                    l_KeyCode_0.One, 
                    l_KeyCode_0.Two, 
                    l_KeyCode_0.Three
                }, 
                list = true
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.DropTool", 
                inputs = {
                    l_KeyCode_0.Backspace
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.UseTool", 
                inputs = {
                    l_UserInputType_0.MouseButton1
                }
            }
        }
    }, 
    {
        title = "CoreScripts.InGameMenu.Controls.MenuItemsTitle", 
        controls = {
            {
                desc = "CoreScripts.InGameMenu.Controls.RobloxMenu", 
                inputs = {
                    l_KeyCode_0.Escape
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.Backpack", 
                inputs = {
                    l_KeyCode_0.Tilde
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.Playerlist", 
                inputs = {
                    l_KeyCode_0.Tab
                }
            }, 
            {
                desc = "CoreScripts.InGameMenu.Controls.Chat", 
                inputs = {
                    l_KeyCode_0.Slash
                }
            }
        }
    }
};
local v6 = {
    title = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle", 
    controls = {
        {
            desc = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad", 
            inputs = {
                l_KeyCode_0.BackSlash
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.Screenshot", 
            inputs = {
                {
                    l_KeyCode_0.LeftSuper, 
                    l_KeyCode_0.LeftShift, 
                    l_KeyCode_0.Three
                }
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.DevConsole", 
            inputs = {
                {
                    l_KeyCode_0.LeftMeta, 
                    l_KeyCode_0.F9
                }, 
                l_KeyCode_0.F9
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp", 
            inputs = {
                {
                    l_KeyCode_0.LeftMeta, 
                    l_KeyCode_0.F10
                }, 
                l_KeyCode_0.F10
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown", 
            inputs = {
                {
                    l_KeyCode_0.LeftMeta, 
                    l_KeyCode_0.LeftShift, 
                    l_KeyCode_0.F10
                }, 
                {
                    l_KeyCode_0.LeftShift, 
                    l_KeyCode_0.F10
                }
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.ToggleFullscreen", 
            inputs = {
                {
                    l_KeyCode_0.LeftControl, 
                    l_KeyCode_0.LeftSuper, 
                    l_KeyCode_0.F
                }
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.PerformanceStats", 
            inputs = {
                {
                    l_KeyCode_0.LeftMeta, 
                    l_KeyCode_0.LeftAlt, 
                    l_KeyCode_0.LeftSuper, 
                    l_KeyCode_0.F7
                }
            }
        }
    }
};
local v7 = {
    title = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle", 
    controls = {
        {
            desc = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad", 
            inputs = {
                l_KeyCode_0.BackSlash
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.Screenshot", 
            inputs = {
                l_KeyCode_0.Print
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.RecordVideo", 
            inputs = {
                l_KeyCode_0.F12
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.DevConsole", 
            inputs = {
                l_KeyCode_0.F9
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelUp", 
            inputs = {
                l_KeyCode_0.F10
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.GraphicsLevelDown", 
            inputs = {
                {
                    l_KeyCode_0.LeftShift, 
                    l_KeyCode_0.F10
                }
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.ToggleFullscreen", 
            inputs = {
                l_KeyCode_0.F11
            }
        }, 
        {
            desc = "CoreScripts.InGameMenu.Controls.PerformanceStats", 
            inputs = {
                {
                    l_KeyCode_0.LeftControl, 
                    l_KeyCode_0.LeftShift, 
                    l_KeyCode_0.F7
                }
            }
        }
    }
};
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    table.insert(v5, v6);
else
    table.insert(v5, v7);
end;
return {
    ControlLayouts = v3, 
    keybinds = v5, 
    inputToControlTypeMap = v4, 
    gamepadLabels = {
        left = {
            "CoreScripts.InGameMenu.Controls.SwitchToolGamepad", 
            "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad", 
            "CoreScripts.InGameMenu.Controls.MoveGamepad", 
            "CoreScripts.InGameMenu.Controls.MenuNavigationGamepad"
        }, 
        right = {
            "CoreScripts.InGameMenu.Controls.UseTool", 
            "CoreScripts.InGameMenu.Controls.RobloxMenu", 
            "CoreScripts.InGameMenu.Controls.BackGamepad", 
            "CoreScripts.InGameMenu.Controls.Jump"
        }, 
        camera = {
            "CoreScripts.InGameMenu.Controls.RotateCameraGamepad", 
            "CoreScripts.InGameMenu.Controls.CameraZoomGamepad"
        }
    }, 
    questGamepadLabels = {
        {
            labelKey = "ResetCameraLabel", 
            xPosition = -0.015, 
            yPosition = 0.335, 
            xAlignment = Enum.TextXAlignment.Right, 
            width = 0.17
        }, 
        {
            labelKey = "MenuLabel", 
            xPosition = -0.015, 
            yPosition = 0.397, 
            xAlignment = Enum.TextXAlignment.Right, 
            width = 0.17
        }, 
        {
            labelKey = "SelectItemLabel", 
            xPosition = 0.442, 
            yPosition = 0.621, 
            xAlignment = Enum.TextXAlignment.Center, 
            width = 0.09
        }, 
        {
            labelKey = "BackExitLabel", 
            xPosition = 0.818, 
            yPosition = 0.287, 
            xAlignment = Enum.TextXAlignment.Left, 
            width = 0.17
        }, 
        {
            labelKey = "FirstPersonCameraLabel", 
            xPosition = 0.818, 
            yPosition = 0.342, 
            xAlignment = Enum.TextXAlignment.Left, 
            width = 0.17
        }, 
        {
            labelKey = "JumpSelectLabel", 
            xPosition = 0.818, 
            yPosition = 0.413, 
            xAlignment = Enum.TextXAlignment.Left, 
            width = 0.17
        }
    }
};
