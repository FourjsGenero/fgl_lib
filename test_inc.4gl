&define testconstant(fc,r1) \
    LET rs1 = fc \
    DISPLAY SFMT("%4 %1=\"%2\".  Expected Result=%3",#fc,rs1, #r1, IIF(rs1=r1,"PASS","FAIL"))

&define test11(fc,p1,r1) \
    CALL fc(p1) RETURNING rs1 \
    DISPLAY SFMT("%5 %1(%2)=\"%3\".  Expected Result=%4",#fc,#p1,rs1,#r1, IIF(nvl(rs1,"NULL")=nvl(r1,"NULL"),"PASS","FAIL"))

&define test21(fc,p1,p2,r1) \
    CALL fc(p1,p2) RETURNING rs1 \
    DISPLAY SFMT("%6 %1(%2,%3)=\"%4\".  Expected Result=%5",#fc,#p1,#p2,rs1,#r1, IIF(nvl(rs1,"NULL")=nvl(r1,"NULL"),"PASS","FAIL"))

&define test31(fc,p1,p2,p3,r1) \
    CALL fc(p1,p2,p3) RETURNING rs1 \
    DISPLAY SFMT("%7 %1(%2,%3,%4)=\"%5\".  Expected Result=%6",#fc,#p1,#p2,#p3,rs1,#r1, IIF(nvl(rs1,"NULL")=nvl(r1,"NULL"),"PASS","FAIL"))

    
&define test41(fc,p1,p2,p3,p4,r1) \
    CALL fc(p1,p2,p3,p4) RETURNING rs1 \
    DISPLAY SFMT("%8 %1(%2,%3,%4,%5)=\"%6\".  Expected Result=%7",#fc,#p1,#p2,#p3,#p4,rs1,#r1, IIF(nvl(rs1,"NULL")=nvl(r1,"NULL"),"PASS","FAIL"))

DEFINE rs1 STRING