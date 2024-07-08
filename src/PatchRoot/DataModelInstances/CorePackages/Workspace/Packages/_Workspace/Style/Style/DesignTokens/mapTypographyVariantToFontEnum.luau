local v0 = {
    Black = Enum.Font.GothamBlack, 
    Bold = Enum.Font.GothamBold, 
    Medium = Enum.Font.GothamMedium, 
    Book = Enum.Font.Gotham
};
return function(v1)
    if not v1.Font then
        if not v1.FontWeight then
            return v0.Book;
        else
            return v0[v1.FontWeight] or v0.Book;
        end;
    else
        return v1.Font;
    end;
end;
