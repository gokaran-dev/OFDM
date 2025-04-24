function B = QAM16_DEM(I, Q, Thrd);
One  = xfix({xlUnsigned,1,0}, 1);
Zero = xfix({xlUnsigned,1,0}, 0);
    if (I > 0)
        B0 = One;
        if (I > Thrd)
            B1 = Zero;
        else
            B1 = One;
        end;
    else
        B0 = Zero;
        if (I > -Thrd)
            B1 = One;
        else
            B1 = Zero;
        end;
    end;
    if (Q > 0)
        B2 = One;
        if (Q > Thrd)
            B3 = Zero;
        else
            B3 = One;
        end;
    else
        B2 = Zero;
        if (Q > -Thrd)
            B3 = One;
        else
            B3 = Zero;
        end;
    end;        
    
    B = xl_concat(B3, B2, B1, B0);
    