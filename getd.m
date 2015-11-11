function [d] = getd(a1,a2,b1,b2)
    c1 = a1 - b1*(floor(a1/b1));
    c2 = a2 - b2*(floor(a1/b1));
    a1 = b1;
    a2 = b2;
    b1 = c1;
    b2 = c2;
    if (b2<0)
        b2 = mod(c2,40)
    end
    if (b1 == 1)
        d = b2;
        return;
    else
        d = getd(a1,a2,b1,b2);
    end