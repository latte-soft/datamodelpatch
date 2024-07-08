return function(v0)
    return {
        VerticalTile = v0.strictInterface({
            Base = v0.strictInterface({
                Container = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderWidth = v0.number, 
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    DropShadow = v0.strictInterface({
                        X = v0.number, 
                        Y = v0.number, 
                        Blur = v0.number, 
                        Color = v0.strictInterface({
                            Color3 = v0.Color3, 
                            Transparency = v0.number
                        })
                    }), 
                    BorderRadius = v0.strictInterface({
                        LeadingTop = v0.number, 
                        TrailingTop = v0.number, 
                        TrailingBottom = v0.number, 
                        LeadingBottom = v0.number
                    })
                }), 
                ContentTop = v0.strictInterface({
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Trailing = v0.number, 
                        Bottom = v0.number, 
                        Leading = v0.number
                    })
                }), 
                ContentBottom = v0.strictInterface({
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Trailing = v0.number, 
                        Bottom = v0.number, 
                        Leading = v0.number
                    })
                })
            })
        }), 
        PlayerTileSmall = v0.strictInterface({
            Base = v0.strictInterface({
                Container = v0.strictInterface({
                    Gap = v0.number, 
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Trailing = v0.number, 
                        Bottom = v0.number, 
                        Leading = v0.number
                    })
                }), 
                Image = v0.strictInterface({
                    Size = v0.number, 
                    BackgroundColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderRadius = v0.number, 
                    BorderWidth = v0.number
                }), 
                Status = v0.strictInterface({
                    Size = v0.number, 
                    BackgroundColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderWidth = v0.number
                }), 
                Content = v0.strictInterface({
                    Gap = v0.number, 
                    Typography = v0.strictInterface({
                        Font = v0.enum(Enum.Font), 
                        FontSize = v0.number, 
                        LineHeight = v0.number, 
                        LetterSpacing = v0.number
                    }), 
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Icon = v0.strictInterface({
                    Size = v0.number
                }), 
                Presence = v0.strictInterface({
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            })
        }), 
        Facepile = v0.strictInterface({
            Container = v0.strictInterface({
                Gap = v0.number
            }), 
            FaceGroup = v0.strictInterface({
                Gap = v0.number
            }), 
            Face = v0.strictInterface({
                BackgroundColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                BorderWidth = v0.number, 
                BorderColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                BorderRadius = v0.number, 
                Width = v0.number, 
                Height = v0.number
            }), 
            Badge = v0.strictInterface({
                BackgroundColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                BorderWidth = v0.number, 
                BorderColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                BorderRadius = v0.number, 
                Spacing = v0.number, 
                Height = v0.number, 
                MinWidth = v0.number, 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            }), 
            Label = v0.strictInterface({
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            })
        }), 
        ControllerBar = v0.strictInterface({
            BackgroundColor = v0.strictInterface({
                Color3 = v0.Color3, 
                Transparency = v0.number
            }), 
            BorderRadius = v0.strictInterface({
                LeadingTop = v0.number, 
                TrailingTop = v0.number, 
                TrailingBottom = v0.number, 
                LeadingBottom = v0.number
            }), 
            Spacing = v0.strictInterface({
                Top = v0.number, 
                Trailing = v0.number, 
                Bottom = v0.number, 
                Leading = v0.number
            }), 
            Gap = v0.number
        }), 
        ControllerBarShortcut = v0.strictInterface({
            Container = v0.strictInterface({
                Gap = v0.number, 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Icon = v0.strictInterface({
                Size = v0.number
            }), 
            Label = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            })
        }), 
        SelectionCursor = v0.strictInterface({
            BorderWidth = v0.number, 
            Offset = v0.number, 
            Inset = v0.number, 
            Gradient = v0.strictInterface({
                Start = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                End = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            })
        }), 
        StateLayer = v0.strictInterface({
            Base = v0.strictInterface({
                BorderWidth = v0.number
            }), 
            Standard = v0.strictInterface({
                Initialize = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Default = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Hover = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Pressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Selected = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                SelectedPressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Disabled = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            Lighten = v0.strictInterface({
                Initialize = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Default = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Hover = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Pressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Selected = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                SelectedPressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Disabled = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            Inverse = v0.strictInterface({
                Initialize = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Default = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Hover = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Pressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Selected = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                SelectedPressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Disabled = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            Darken = v0.strictInterface({
                Initialize = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Default = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Hover = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Pressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Selected = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                SelectedPressed = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Disabled = v0.strictInterface({
                    Color = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            })
        }), 
        MenuCell = v0.strictInterface({
            Base = v0.strictInterface({
                Container = v0.strictInterface({
                    Height = v0.number, 
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BackgroundColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderRadius = v0.strictInterface({
                        TopLeading = v0.number, 
                        TopTrailing = v0.number, 
                        BottomTrailing = v0.number, 
                        BottomLeading = v0.number
                    }), 
                    BorderWidth = v0.number, 
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Trailing = v0.number, 
                        Bottom = v0.number, 
                        Leading = v0.number
                    })
                }), 
                IconFrame = v0.strictInterface({
                    Size = v0.number
                }), 
                TextFrame = v0.strictInterface({
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Trailing = v0.number, 
                        Bottom = v0.number, 
                        Leading = v0.number
                    })
                }), 
                Text = v0.strictInterface({
                    Typography = v0.strictInterface({
                        Font = v0.enum(Enum.Font), 
                        FontSize = v0.number, 
                        LineHeight = v0.number, 
                        LetterSpacing = v0.number
                    })
                }), 
                CheckFrame = v0.strictInterface({
                    Size = v0.number
                })
            }), 
            Divider = v0.strictInterface({
                Container = v0.strictInterface({
                    BorderWidth = v0.number
                })
            }), 
            Disabled = v0.strictInterface({
                Container = v0.strictInterface({
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            HasRoundBottom = v0.strictInterface({
                Container = v0.strictInterface({
                    BorderRadius = v0.strictInterface({
                        BottomTrailing = v0.number, 
                        BottomLeading = v0.number
                    })
                })
            }), 
            HasRoundTop = v0.strictInterface({
                Container = v0.strictInterface({
                    BorderRadius = v0.strictInterface({
                        TopLeading = v0.number, 
                        TopTrailing = v0.number
                    })
                })
            })
        }), 
        BaseMenu = v0.strictInterface({
            BorderRadius = v0.number, 
            BackgroundColor = v0.strictInterface({
                Color3 = v0.Color3, 
                Transparency = v0.number
            })
        }), 
        StatGroup = v0.strictInterface({
            Gap = v0.number
        }), 
        StatItem = v0.strictInterface({
            Container = v0.strictInterface({
                Gap = v0.number, 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Icon = v0.strictInterface({
                Size = v0.number
            }), 
            Label = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            })
        }), 
        MediaTile = v0.strictInterface({
            Container = v0.strictInterface({
                BorderRadius = v0.number
            }), 
            Icon = v0.strictInterface({
                Size = v0.number
            })
        }), 
        StatWidget = v0.strictInterface({
            Container = v0.strictInterface({
                Gap = v0.number, 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Icon = v0.strictInterface({
                Size = v0.number
            }), 
            DataGroup = v0.strictInterface({
                Gap = v0.number
            }), 
            Data = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            }), 
            Label = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                })
            })
        }), 
        RateCount = v0.strictInterface({
            Container = v0.strictInterface({
                Spacing = v0.number, 
                Gap = v0.number, 
                BorderRadius = v0.number, 
                BackgroundColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            ButtonGroup = v0.strictInterface({
                Gap = v0.number
            })
        }), 
        PlayerCount = v0.strictInterface({
            Container = v0.strictInterface({
                Spacing = v0.number, 
                BorderRadius = v0.number, 
                BackgroundColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            })
        }), 
        VerticalScrollView = v0.strictInterface({
            Base = v0.strictInterface({
                Handle = v0.strictInterface({
                    BackgroundColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderRadius = v0.number
                }), 
                Icon = v0.strictInterface({
                    Size = v0.number
                }), 
                Track = v0.strictInterface({
                    Opacity = v0.number, 
                    Spacing = v0.strictInterface({
                        Top = v0.number, 
                        Bottom = v0.number
                    })
                })
            }), 
            Compact = v0.strictInterface({
                Handle = v0.strictInterface({
                    Width = v0.number
                }), 
                Track = v0.strictInterface({
                    Width = v0.number
                })
            }), 
            Wide = v0.strictInterface({
                Handle = v0.strictInterface({
                    Width = v0.number
                }), 
                Track = v0.strictInterface({
                    Width = v0.number
                })
            }), 
            Gamepad = v0.strictInterface({
                Handle = v0.strictInterface({
                    Width = v0.number
                }), 
                Track = v0.strictInterface({
                    Width = v0.number
                })
            })
        }), 
        TextField = v0.strictInterface({
            Base = v0.strictInterface({
                Field = v0.strictInterface({
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    BorderRadius = v0.number, 
                    Typography = v0.strictInterface({
                        Font = v0.enum(Enum.Font), 
                        FontSize = v0.number, 
                        LineHeight = v0.number, 
                        LetterSpacing = v0.number
                    }), 
                    Spacing = v0.strictInterface({
                        Leading = v0.number, 
                        Trailing = v0.number
                    }), 
                    Gap = v0.number, 
                    Opacity = v0.number
                }), 
                PlaceholderText = v0.strictInterface({
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                FieldValue = v0.strictInterface({
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                IconLeading = v0.strictInterface({
                    ContentColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Size = v0.number
                })
            }), 
            Error = v0.strictInterface({
                Field = v0.strictInterface({
                    BorderColor = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            Disabled = v0.strictInterface({
                Field = v0.strictInterface({
                    Opacity = v0.number
                })
            })
        }), 
        InputLabel = v0.strictInterface({
            Base = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                }), 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Spacing = v0.strictInterface({
                    Bottom = v0.number
                }), 
                Opacity = v0.number
            }), 
            Disabled = v0.strictInterface({
                Opacity = v0.number
            })
        }), 
        HelperText = v0.strictInterface({
            Base = v0.strictInterface({
                Typography = v0.strictInterface({
                    Font = v0.enum(Enum.Font), 
                    FontSize = v0.number, 
                    LineHeight = v0.number, 
                    LetterSpacing = v0.number
                }), 
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Padding = v0.strictInterface({
                    Top = v0.number
                }), 
                Opacity = v0.number
            }), 
            Error = v0.strictInterface({
                ContentColor = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            })
        })
    };
end;
