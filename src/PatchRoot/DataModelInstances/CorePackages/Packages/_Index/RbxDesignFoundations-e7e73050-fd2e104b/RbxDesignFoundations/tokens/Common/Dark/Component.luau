return function(v0)
    return {
        VerticalTile = {
            Base = {
                Container = {
                    Background = {
                        Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                        Transparency = 0
                    }, 
                    BorderWidth = 1 * v0, 
                    BorderColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }, 
                    DropShadow = {
                        X = 0, 
                        Y = 4 * v0, 
                        Blur = 8 * v0, 
                        Color = {
                            Color3 = Color3.new(0, 0, 0), 
                            Transparency = 0.5
                        }
                    }, 
                    BorderRadius = {
                        LeadingTop = 8 * v0, 
                        TrailingTop = 8 * v0, 
                        TrailingBottom = 8 * v0, 
                        LeadingBottom = 8 * v0
                    }
                }, 
                ContentTop = {
                    Spacing = {
                        Top = 0, 
                        Trailing = 0, 
                        Bottom = 0, 
                        Leading = 0
                    }
                }, 
                ContentBottom = {
                    Spacing = {
                        Top = 8 * v0, 
                        Trailing = 8 * v0, 
                        Bottom = 8 * v0, 
                        Leading = 8 * v0
                    }
                }
            }
        }, 
        PlayerTileSmall = {
            Base = {
                Container = {
                    Gap = 8 * v0, 
                    Spacing = {
                        Top = 8 * v0, 
                        Trailing = 8 * v0, 
                        Bottom = 8 * v0, 
                        Leading = 8 * v0
                    }
                }, 
                Image = {
                    Size = 96 * v0, 
                    BackgroundColor = {
                        Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                        Transparency = 0
                    }, 
                    BorderColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }, 
                    BorderRadius = 9999, 
                    BorderWidth = 3 * v0
                }, 
                Status = {
                    Size = 16 * v0, 
                    BackgroundColor = {
                        Color3 = Color3.new(0, 0.70588, 0.42745), 
                        Transparency = 0
                    }, 
                    BorderColor = {
                        Color3 = Color3.new(0.13725, 0.1451, 0.15294), 
                        Transparency = 0
                    }, 
                    BorderWidth = 2.5 * v0
                }, 
                Content = {
                    Gap = 2 * v0, 
                    Typography = {
                        Font = Enum.Font.GothamMedium, 
                        FontSize = 12 * v0, 
                        LineHeight = 1.15, 
                        LetterSpacing = 0
                    }, 
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }
                }, 
                Icon = {
                    Size = 16 * v0
                }, 
                Presence = {
                    ContentColor = {
                        Color3 = Color3.new(0.74118, 0.7451, 0.7451), 
                        Transparency = 0
                    }
                }
            }
        }, 
        Facepile = {
            Container = {
                Gap = 4 * v0
            }, 
            FaceGroup = {
                Gap = -6 * v0
            }, 
            Face = {
                BackgroundColor = {
                    Color3 = Color3.new(0.74118, 0.7451, 0.7451), 
                    Transparency = 0
                }, 
                BorderWidth = 2 * v0, 
                BorderColor = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0
                }, 
                BorderRadius = 9999, 
                Width = 16 * v0, 
                Height = 16 * v0
            }, 
            Badge = {
                BackgroundColor = {
                    Color3 = Color3.new(0, 0.70588, 0.42745), 
                    Transparency = 0
                }, 
                BorderWidth = 2 * v0, 
                BorderColor = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0
                }, 
                BorderRadius = 9999, 
                Spacing = 4 * v0, 
                Height = 16 * v0, 
                MinWidth = 16 * v0, 
                ContentColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                Typography = {
                    Font = Enum.Font.GothamMedium, 
                    FontSize = 10 * v0, 
                    LineHeight = 1.2, 
                    LetterSpacing = 0
                }
            }, 
            Label = {
                ContentColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.3
                }, 
                Typography = {
                    Font = Enum.Font.Gotham, 
                    FontSize = 12 * v0, 
                    LineHeight = 1.15, 
                    LetterSpacing = 0
                }
            }
        }, 
        ControllerBar = {
            BackgroundColor = {
                Color3 = Color3.new(0.06667, 0.07059, 0.07843), 
                Transparency = 0.2
            }, 
            BorderRadius = {
                LeadingTop = 9999, 
                TrailingTop = 9999, 
                TrailingBottom = 9999, 
                LeadingBottom = 9999
            }, 
            Spacing = {
                Top = 8 * v0, 
                Trailing = 12 * v0, 
                Bottom = 8 * v0, 
                Leading = 12 * v0
            }, 
            Gap = 16 * v0
        }, 
        ControllerBarShortcut = {
            Container = {
                Gap = 4 * v0, 
                ContentColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }
            }, 
            Icon = {
                Size = 36 * v0
            }, 
            Label = {
                Typography = {
                    Font = Enum.Font.GothamMedium, 
                    FontSize = 12 * v0, 
                    LineHeight = 1.15, 
                    LetterSpacing = 0
                }
            }
        }, 
        SelectionCursor = {
            BorderWidth = 2 * v0, 
            Offset = 6 * v0, 
            Inset = 0, 
            Gradient = {
                Start = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                End = {
                    Color3 = Color3.new(0.39608, 0.4, 0.40784), 
                    Transparency = 0
                }
            }
        }, 
        StateLayer = {
            Base = {
                BorderWidth = 1 * v0
            }, 
            Standard = {
                Initialize = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Default = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Hover = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.88
                    }
                }, 
                Pressed = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Selected = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                SelectedPressed = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Disabled = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }
            }, 
            Lighten = {
                Initialize = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Default = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Hover = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.88
                    }
                }, 
                Pressed = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Selected = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                SelectedPressed = {
                    Color = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Disabled = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }
            }, 
            Inverse = {
                Initialize = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Default = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Hover = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.88
                    }
                }, 
                Pressed = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }, 
                Selected = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                SelectedPressed = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }, 
                Disabled = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }
            }, 
            Darken = {
                Initialize = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Default = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                Hover = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.88
                    }
                }, 
                Pressed = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }, 
                Selected = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }, 
                SelectedPressed = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }, 
                Disabled = {
                    Color = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }
                }
            }
        }, 
        MenuCell = {
            Base = {
                Container = {
                    Height = 56 * v0, 
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    BackgroundColor = {
                        Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                        Transparency = 0
                    }, 
                    BorderColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }, 
                    BorderRadius = {
                        TopLeading = 0, 
                        TopTrailing = 0, 
                        BottomTrailing = 0, 
                        BottomLeading = 0
                    }, 
                    BorderWidth = 0, 
                    Spacing = {
                        Top = 0, 
                        Trailing = 12 * v0, 
                        Bottom = 0, 
                        Leading = 12 * v0
                    }
                }, 
                IconFrame = {
                    Size = 32 * v0
                }, 
                TextFrame = {
                    Spacing = {
                        Top = 0, 
                        Trailing = 12 * v0, 
                        Bottom = 0, 
                        Leading = 12 * v0
                    }
                }, 
                Text = {
                    Typography = {
                        Font = Enum.Font.GothamMedium, 
                        FontSize = 16 * v0, 
                        LineHeight = 1.25, 
                        LetterSpacing = 0
                    }
                }, 
                CheckFrame = {
                    Size = 32 * v0
                }
            }, 
            Divider = {
                Container = {
                    BorderWidth = 1 * v0
                }
            }, 
            Disabled = {
                Container = {
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.5
                    }
                }
            }, 
            HasRoundBottom = {
                Container = {
                    BorderRadius = {
                        BottomTrailing = 8 * v0, 
                        BottomLeading = 8 * v0
                    }
                }
            }, 
            HasRoundTop = {
                Container = {
                    BorderRadius = {
                        TopLeading = 8 * v0, 
                        TopTrailing = 8 * v0
                    }
                }
            }
        }, 
        BaseMenu = {
            BorderRadius = 8 * v0, 
            BackgroundColor = {
                Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                Transparency = 0
            }
        }, 
        StatGroup = {
            Gap = 8 * v0
        }, 
        StatItem = {
            Container = {
                Gap = 2 * v0, 
                ContentColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.3
                }
            }, 
            Icon = {
                Size = 16 * v0
            }, 
            Label = {
                Typography = {
                    Font = Enum.Font.Gotham, 
                    FontSize = 12 * v0, 
                    LineHeight = 1.15, 
                    LetterSpacing = 0
                }
            }
        }, 
        MediaTile = {
            Container = {
                BorderRadius = 8 * v0
            }, 
            Icon = {
                Size = 36 * v0
            }
        }, 
        StatWidget = {
            Container = {
                Gap = 8 * v0, 
                ContentColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }
            }, 
            Icon = {
                Size = 48 * v0
            }, 
            DataGroup = {
                Gap = 0
            }, 
            Data = {
                Typography = {
                    Font = Enum.Font.GothamBlack, 
                    FontSize = 34 * v0, 
                    LineHeight = 1.2, 
                    LetterSpacing = 0
                }
            }, 
            Label = {
                Typography = {
                    Font = Enum.Font.GothamMedium, 
                    FontSize = 16 * v0, 
                    LineHeight = 1.25, 
                    LetterSpacing = 0
                }
            }
        }, 
        RateCount = {
            Container = {
                Spacing = 8 * v0, 
                Gap = 8 * v0, 
                BorderRadius = 8 * v0, 
                BackgroundColor = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.7
                }
            }, 
            ButtonGroup = {
                Gap = 8 * v0
            }
        }, 
        PlayerCount = {
            Container = {
                Spacing = 8 * v0, 
                BorderRadius = 0, 
                BackgroundColor = {
                    Color3 = Color3.new(0, 0, 0), 
                    Transparency = 1
                }
            }
        }, 
        VerticalScrollView = {
            Base = {
                Handle = {
                    BackgroundColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.7
                    }, 
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    BorderRadius = 9999
                }, 
                Icon = {
                    Size = 36 * v0
                }, 
                Track = {
                    Opacity = 0, 
                    Spacing = {
                        Top = 4 * v0, 
                        Bottom = 4 * v0
                    }
                }
            }, 
            Compact = {
                Handle = {
                    Width = 2 * v0
                }, 
                Track = {
                    Width = 12 * v0
                }
            }, 
            Wide = {
                Handle = {
                    Width = 8 * v0
                }, 
                Track = {
                    Width = 16 * v0
                }
            }, 
            Gamepad = {
                Handle = {
                    Width = 16 * v0
                }, 
                Track = {
                    Width = 16 * v0
                }
            }
        }, 
        TextField = {
            Base = {
                Field = {
                    BorderColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }, 
                    BorderRadius = 8 * v0, 
                    Typography = {
                        Font = Enum.Font.Gotham, 
                        FontSize = 16 * v0, 
                        LineHeight = 1.25, 
                        LetterSpacing = 0
                    }, 
                    Spacing = {
                        Leading = 12 * v0, 
                        Trailing = 12 * v0
                    }, 
                    Gap = 8 * v0, 
                    Opacity = 1
                }, 
                PlaceholderText = {
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.3
                    }
                }, 
                FieldValue = {
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }
                }, 
                IconLeading = {
                    ContentColor = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.3
                    }, 
                    Size = 16 * v0
                }
            }, 
            Error = {
                Field = {
                    BorderColor = {
                        Color3 = Color3.new(0.96863, 0.29412, 0.32157), 
                        Transparency = 0
                    }
                }
            }, 
            Disabled = {
                Field = {
                    Opacity = 0.32
                }
            }
        }, 
        InputLabel = {
            Base = {
                Typography = {
                    Font = Enum.Font.Gotham, 
                    FontSize = 12 * v0, 
                    LineHeight = 1.15, 
                    LetterSpacing = 0
                }, 
                ContentColor = {
                    Color3 = Color3.new(0.74118, 0.7451, 0.7451), 
                    Transparency = 0
                }, 
                Spacing = {
                    Bottom = 4 * v0
                }, 
                Opacity = 1
            }, 
            Disabled = {
                Opacity = 0.32
            }
        }, 
        HelperText = {
            Base = {
                Typography = {
                    Font = Enum.Font.GothamMedium, 
                    FontSize = 10 * v0, 
                    LineHeight = 1.2, 
                    LetterSpacing = 0
                }, 
                ContentColor = {
                    Color3 = Color3.new(0.74118, 0.7451, 0.7451), 
                    Transparency = 0
                }, 
                Padding = {
                    Top = 4 * v0
                }, 
                Opacity = 1
            }, 
            Error = {
                ContentColor = {
                    Color3 = Color3.new(0.96863, 0.29412, 0.32157), 
                    Transparency = 0
                }
            }
        }
    };
end;
