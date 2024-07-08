local v0 = require(script.Parent.Parent.Parent.Parent.Parent.t);
return v0.strictInterface({
    Font = v0.EnumItem, 
    FontSize = v0.numberMinExclusive(0), 
    LineHeight = v0.numberMinExclusive(0), 
    LetterSpacing = v0.number
});
