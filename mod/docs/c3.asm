; rom\Columns III (USA).gen
; код, найденный обходом от точки входа


; ======== sub_000200  ВЕКТОР зовут: 0 ========
000200: 4e71         nop        
000202: 4e71         nop        
000204: 60000aa2     bra.w      $ca8

; ======== sub_000208  ВЕКТОР зовут: 0 ========
000208: 48e7fffe     movem.l    d0-d7/a0-a6, -(a7)
00020C: 41f900c00004 lea.l      $c00004.l, a0
000212: 3010         move.w     (a0), d0
000214: 08b9000000ff0405 bclr.b     #$0, $ff0405.l
00021C: 670000e6     beq.w      $304
000220: 08b9000000ff040d bclr.b     #$0, $ff040d.l
000228: 67000068     beq.w      $292
00022C: 49f900c00004 lea.l      $c00004.l, a4
000232: 383900ffef86 move.w     $ffef86.l, d4
000238: 08c40004     bset.b     #$4, d4
00023C: 3884         move.w     d4, (a4)
00023E: 40e7         move.w     sr, -(a7)
000240: 007c0700     ori.w      #$700, sr
000244: 33fc010000a11100 move.w     #$100, $a11100.l
00024C: 38bc8f02     move.w     #$8f02, (a4)
000250: 28bc94019340 move.l     #$94019340, (a4)
000256: 28bc96809500 move.l     #$96809500, (a4)
00025C: 38bc977f     move.w     #$977f, (a4)
000260: 38bc6800     move.w     #$6800, (a4)
000264: 3f3c0082     move.w     #$82, -(a7)
000268: 0839000000a11100 btst.b     #$0, $a11100.l
000270: 66f6         bne.b      $268
000272: 389f         move.w     (a7)+, (a4)
000274: 33fc000000a11100 move.w     #$0, $a11100.l
00027C: 38b900ffef86 move.w     $ffef86.l, (a4)
000282: 28bc68000002 move.l     #$68000002, (a4)
000288: 397900ff0000fffc move.w     $ff0000.l, -$4(a4)
000290: 46df         move.w     (a7)+, sr
000292: 33f900ffef8a00c00004 move.w     $ffef8a.l, $c00004.l
00029C: 610003f6     bsr.w      $694
0002A0: 41f900000384 lea.l      $384.l, a0
0002A6: 303900ff0416 move.w     $ff0416.l, d0
0002AC: 20700000     movea.l    (a0, d0.w), a0
0002B0: 4e90         jsr        (a0)
0002B2: 2a3c6c000002 move.l     #$6c000002, d5
0002B8: 49f900c00000 lea.l      $c00000.l, a4
0002BE: 29450004     move.l     d5, $4(a4)
0002C2: 28b900ff040e move.l     $ff040e.l, (a4)
0002C8: 2a3c40000010 move.l     #$40000010, d5
0002CE: 29450004     move.l     d5, $4(a4)
0002D2: 28b900ff0412 move.l     $ff0412.l, (a4)
0002D8: 4a3900ff045c tst.b      $ff045c.l
0002DE: 67000024     beq.w      $304
0002E2: 203c6c000002 move.l     #$6c000002, d0
0002E8: 223c94009350 move.l     #$94009350, d1
0002EE: 243c96849500 move.l     #$96849500, d2
0002F4: 363c977f     move.w     #$977f, d3
0002F8: 4eb900003980 jsr        $3980.l
0002FE: 423900ff045c clr.b      $ff045c.l
000304: 43f900ffe000 lea.l      $ffe000.l, a1
00030A: 61000590     bsr.w      $89c
00030E: 0c39000700ffe000 cmpi.b     #$7, $ffe000.l
000316: 6600000e     bne.w      $326
00031A: 423900ffe00c clr.b      $ffe00c.l
000320: 423900ffe00d clr.b      $ffe00d.l
000326: 41f900ff0530 lea.l      $ff0530.l, a0
00032C: 4a10         tst.b      (a0)
00032E: 6700000e     beq.w      $33e
000332: 1e10         move.b     (a0), d7
000334: 4eb9000007d8 jsr        $7d8.l
00033A: 60000008     bra.w      $344
00033E: 4eb900000832 jsr        $832.l
000344: 43f900ff0530 lea.l      $ff0530.l, a1
00034A: 41e90001     lea.l      $1(a1), a0
00034E: 12d8         move.b     (a0)+, (a1)+
000350: 12d8         move.b     (a0)+, (a1)+
000352: 12d8         move.b     (a0)+, (a1)+
000354: 12d8         move.b     (a0)+, (a1)+
000356: 12d8         move.b     (a0)+, (a1)+
000358: 12d8         move.b     (a0)+, (a1)+
00035A: 12d0         move.b     (a0), (a1)+
00035C: 4211         clr.b      (a1)
00035E: 61000008     bsr.w      $368
000362: 4cdf7fff     movem.l    (a7)+, d0-d7/a0-a6
000366: 4e73         rte        

; ======== sub_000368   зовут: 1 ========
000368: 203900ffef90 move.l     $ffef90.l, d0
00036E: e580         asl.l      #$2, d0
000370: d0b900ffef90 add.l      $ffef90.l, d0
000376: 068075317531 addi.l     #$75317531, d0
00037C: 23c000ffef90 move.l     d0, $ffef90.l
000382: 4e75         rts        

; ---- разрыв: данные $000384..$000446 (194 байт) ----


; ======== sub_000446   зовут: 1 ========
000446: 41fa003a     lea.l      $482(pc), a0
00044A: 700e         moveq      #$e, d0
00044C: 33d800c00004 move.w     (a0)+, $c00004.l
000452: 51c8fff8     dbra       d0, $44c
000456: 41fa002a     lea.l      $482(pc), a0
00045A: 43f900ffef84 lea.l      $ffef84.l, a1
000460: 22d8         move.l     (a0)+, (a1)+
000462: 22d8         move.l     (a0)+, (a1)+
000464: 32d8         move.w     (a0)+, (a1)+
000466: 0839000600a10001 btst.b     #$6, $a10001.l
00046E: 6710         beq.b      $480
000470: 33fa002e00c00004 move.w     $4a0(pc), $c00004.l
000478: 33fa002600ffef86 move.w     $4a0(pc), $ffef86.l
000480: 4e75         rts        

; ---- разрыв: данные $000482..$0004A2 (32 байт) ----


; ======== sub_0004A2   зовут: 1 ========
0004A2: 23fcc000000000c00004 move.l     #$c0000000, $c00004.l
0004AC: 33fc000000c00000 move.w     #$0, $c00000.l
0004B4: 61000016     bsr.w      $4cc
0004B8: 61000054     bsr.w      $50e
0004BC: 61000024     bsr.w      $4e2
0004C0: 61000074     bsr.w      $536
0004C4: 61000078     bsr.w      $53e
0004C8: 60000060     bra.w      $52a

; ======== sub_0004CC   зовут: 1 ========
0004CC: 23fc6c00000200c00004 move.l     #$6c000002, $c00004.l
0004D6: 23fc0000000000c00000 move.l     #$0, $c00000.l
0004E0: 4e75         rts        

; ======== sub_0004E2   зовут: 1 ========
0004E2: 41f900ff0000 lea.l      $ff0000.l, a0
0004E8: 303c00bf     move.w     #$bf, d0
0004EC: 4298         clr.l      (a0)+
0004EE: 51c8fffc     dbra       d0, $4ec
0004F2: 42b900ff0000 clr.l      $ff0000.l
0004F8: 23fc6800000200c00004 move.l     #$68000002, $c00004.l
000502: 23fc0000000000c00000 move.l     #$0, $c00000.l
00050C: 4e75         rts        

; ======== sub_00050E   зовут: 1 ========
00050E: 2a3c40000010 move.l     #$40000010, d5
000514: 7e27         moveq      #$27, d7
000516: 7c00         moveq      #$0, d6
000518: 23c500c00004 move.l     d5, $c00004.l
00051E: 33c600c00000 move.w     d6, $c00000.l
000524: 51cffff8     dbra       d7, $51e
000528: 4e75         rts        
00052A: 2a3c70000002 move.l     #$70000002, d5
000530: 3e3c0dff     move.w     #$dff, d7
000534: 6012         bra.b      $548

; ======== sub_000536   зовут: 1 ========
000536: 2a3c40000003 move.l     #$40000003, d5
00053C: 6006         bra.b      $544

; ======== sub_00053E   зовут: 1 ========
00053E: 2a3c60000003 move.l     #$60000003, d5
000544: 3e3c1fff     move.w     #$1fff, d7
000548: 7c00         moveq      #$0, d6
00054A: 49f900c00004 lea.l      $c00004.l, a4
000550: 38bc8f01     move.w     #$8f01, (a4)
000554: 383900ffef86 move.w     $ffef86.l, d4
00055A: 08c40004     bset.b     #$4, d4
00055E: 3884         move.w     d4, (a4)
000560: 283c00940000 move.l     #$940000, d4
000566: 3807         move.w     d7, d4
000568: e18c         lsl.l      #$8, d4
00056A: 383c9300     move.w     #$9300, d4
00056E: 1807         move.b     d7, d4
000570: 2884         move.l     d4, (a4)
000572: 38bc9780     move.w     #$9780, (a4)
000576: 008540000080 ori.l      #$40000080, d5
00057C: 2885         move.l     d5, (a4)
00057E: 1946fffc     move.b     d6, -$4(a4)
000582: 3814         move.w     (a4), d4
000584: 08040001     btst.b     #$1, d4
000588: 66f8         bne.b      $582
00058A: 38b900ffef86 move.w     $ffef86.l, (a4)
000590: 38bc8f02     move.w     #$8f02, (a4)
000594: 4e75         rts        

; ---- разрыв: данные $000596..$000694 (254 байт) ----


; ======== sub_000694   зовут: 1 ========
000694: 08b9000000ff0400 bclr.b     #$0, $ff0400.l
00069C: 6778         beq.b      $716
00069E: 0839000600a10001 btst.b     #$6, $a10001.l
0006A6: 6708         beq.b      $6b0
0006A8: 3e3c06ee     move.w     #$6ee, d7
0006AC: 51cffffe     dbra       d7, $6ac
0006B0: 49f900c00004 lea.l      $c00004.l, a4
0006B6: 383900ffef86 move.w     $ffef86.l, d4
0006BC: 08c40004     bset.b     #$4, d4
0006C0: 3884         move.w     d4, (a4)
0006C2: 40e7         move.w     sr, -(a7)
0006C4: 007c0700     ori.w      #$700, sr
0006C8: 33fc010000a11100 move.w     #$100, $a11100.l
0006D0: 38bc8f02     move.w     #$8f02, (a4)
0006D4: 28bc94009340 move.l     #$94009340, (a4)
0006DA: 28bc96819580 move.l     #$96819580, (a4)
0006E0: 38bc977f     move.w     #$977f, (a4)
0006E4: 38bcc000     move.w     #$c000, (a4)
0006E8: 3f3c0080     move.w     #$80, -(a7)
0006EC: 0839000000a11100 btst.b     #$0, $a11100.l
0006F4: 66f6         bne.b      $6ec
0006F6: 389f         move.w     (a7)+, (a4)
0006F8: 33fc000000a11100 move.w     #$0, $a11100.l
000700: 38b900ffef86 move.w     $ffef86.l, (a4)
000706: 28bcc0000000 move.l     #$c0000000, (a4)
00070C: 397900ff0300fffc move.w     $ff0300.l, -$4(a4)
000714: 46df         move.w     (a7)+, sr
000716: 4e75         rts        

; ======== sub_000718   зовут: 1 ========
000718: 49f900a11100 lea.l      $a11100.l, a4
00071E: 40e7         move.w     sr, -(a7)
000720: 007c0700     ori.w      #$700, sr
000724: 38bc0100     move.w     #$100, (a4)
000728: 397c01000100 move.w     #$100, $100(a4)
00072E: 08140000     btst.b     #$0, (a4)
000732: 66fa         bne.b      $72e
000734: 4df900a00000 lea.l      $a00000.l, a6
00073A: 4bf90007552a lea.l      $7552a.l, a5
000740: 3e3c0f75     move.w     #$f75, d7
000744: 1cdd         move.b     (a5)+, (a6)+
000746: 51cffffc     dbra       d7, $744
00074A: 4df900a01000 lea.l      $a01000.l, a6
000750: 4bf9000764a0 lea.l      $764a0.l, a5
000756: 3e3c0b57     move.w     #$b57, d7
00075A: 1cdd         move.b     (a5)+, (a6)+
00075C: 51cffffc     dbra       d7, $75a
000760: 41f900a01c00 lea.l      $a01c00.l, a0
000766: 117c00000002 move.b     #$0, $2(a0)
00076C: 117c00800003 move.b     #$80, $3(a0)
000772: 117c00000009 move.b     #$0, $9(a0)
000778: 117c0000000a move.b     #$0, $a(a0)
00077E: 117c0000000b move.b     #$0, $b(a0)
000784: 117c0000000c move.b     #$0, $c(a0)
00078A: 397c00000100 move.w     #$0, $100(a4)
000790: 38bc0000     move.w     #$0, (a4)
000794: 397c01000100 move.w     #$100, $100(a4)
00079A: 46df         move.w     (a7)+, sr
00079C: 4e75         rts        

; ---- разрыв: данные $00079E..$0007D8 (58 байт) ----


; ======== sub_0007D8   зовут: 1 ========
0007D8: 40e7         move.w     sr, -(a7)
0007DA: 007c0700     ori.w      #$700, sr
0007DE: 33fc010000a11100 move.w     #$100, $a11100.l
0007E6: 0839000000a11100 btst.b     #$0, $a11100.l
0007EE: 66f6         bne.b      $7e6
0007F0: 13c700a01c0a move.b     d7, $a01c0a.l
0007F6: 4a3900ff0540 tst.b      $ff0540.l
0007FC: 67000028     beq.w      $826
000800: 0239007f00ff0540 andi.b     #$7f, $ff0540.l
000808: 1e3900ff4108 move.b     $ff4108.l, d7
00080E: 9e3900ff0540 sub.b      $ff0540.l, d7
000814: 13c700a01c13 move.b     d7, $a01c13.l
00081A: 13c700a01c14 move.b     d7, $a01c14.l
000820: 423900ff0540 clr.b      $ff0540.l
000826: 33fc000000a11100 move.w     #$0, $a11100.l
00082E: 46df         move.w     (a7)+, sr
000830: 4e75         rts        

; ======== sub_000832   зовут: 1 ========
000832: 40e7         move.w     sr, -(a7)
000834: 007c0700     ori.w      #$700, sr
000838: 33fc010000a11100 move.w     #$100, $a11100.l
000840: 0839000000a11100 btst.b     #$0, $a11100.l
000848: 66f6         bne.b      $840
00084A: 4a3900ff0540 tst.b      $ff0540.l
000850: 67000028     beq.w      $87a
000854: 0239007f00ff0540 andi.b     #$7f, $ff0540.l
00085C: 1e3900ff4108 move.b     $ff4108.l, d7
000862: 9e3900ff0540 sub.b      $ff0540.l, d7
000868: 13c700a01c13 move.b     d7, $a01c13.l
00086E: 13c700a01c14 move.b     d7, $a01c14.l
000874: 423900ff0540 clr.b      $ff0540.l
00087A: 33fc000000a11100 move.w     #$0, $a11100.l
000882: 46df         move.w     (a7)+, sr
000884: 4e75         rts        

; ======== sub_000886   зовут: 1 ========
000886: 7e40         moveq      #$40, d7
000888: 13c700a10009 move.b     d7, $a10009.l
00088E: 13c700a1000b move.b     d7, $a1000b.l
000894: 13c700a1000d move.b     d7, $a1000d.l
00089A: 4e75         rts        

; ======== sub_00089C   зовут: 1 ========
00089C: 33fc010000a11100 move.w     #$100, $a11100.l
0008A4: 45e9000a     lea.l      $a(a1), a2
0008A8: 7007         moveq      #$7, d0
0008AA: 34bcffff     move.w     #$ffff, (a2)
0008AE: 45ea000a     lea.l      $a(a2), a2
0008B2: 51c8fff6     dbra       d0, $8aa
0008B6: 7000         moveq      #$0, d0
0008B8: 61000018     bsr.w      $8d2
0008BC: 1280         move.b     d0, (a1)
0008BE: 7001         moveq      #$1, d0
0008C0: 61000010     bsr.w      $8d2
0008C4: 13400001     move.b     d0, $1(a1)
0008C8: 33fc000000a11100 move.w     #$0, $a11100.l
0008D0: 4e75         rts        

; ======== sub_0008D2   зовут: 2 ========
0008D2: 48e77f70     movem.l    d1-d7/a1-a3, -(a7)
0008D6: 41f900a10003 lea.l      $a10003.l, a0
0008DC: d040         add.w      d0, d0
0008DE: d0c0         adda.w     d0, a0
0008E0: d040         add.w      d0, d0
0008E2: 45f10002     lea.l      $2(a1, d0.w), a2
0008E6: c0fc000a     mulu.w     #$a, d0
0008EA: 43f1000a     lea.l      $a(a1, d0.w), a1
0008EE: 6134         bsr.b      $924
0008F0: 3f00         move.w     d0, -(a7)
0008F2: 0240000e     andi.w     #$e, d0
0008F6: d040         add.w      d0, d0
0008F8: 4ebb000a     jsr        $904(pc, d0.w)
0008FC: 301f         move.w     (a7)+, d0
0008FE: 4cdf0efe     movem.l    (a7)+, d1-d7/a1-a3
000902: 4e75         rts        

; ======== sub_000904   зовут: 1 ========
000904: 4e71         nop        
000906: 4e75         rts        

; ---- разрыв: данные $000908..$000924 (28 байт) ----


; ======== sub_000924   зовут: 1 ========
000924: 48e73000     movem.l    d2-d3, -(a7)
000928: 7000         moveq      #$0, d0
00092A: 10bc0070     move.b     #$70, (a0)
00092E: 6110         bsr.b      $940
000930: 4841         swap       d1
000932: 10bc0030     move.b     #$30, (a0)
000936: d040         add.w      d0, d0
000938: 6106         bsr.b      $940
00093A: 4cdf000c     movem.l    (a7)+, d2-d3
00093E: 4e75         rts        

; ======== sub_000940   зовут: 2 ========
000940: 1210         move.b     (a0), d1
000942: 1401         move.b     d1, d2
000944: 0202000c     andi.b     #$c, d2
000948: 6702         beq.b      $94c
00094A: 5240         addq.w     #$1, d0
00094C: d040         add.w      d0, d0
00094E: 1601         move.b     d1, d3
000950: 02430003     andi.w     #$3, d3
000954: 6702         beq.b      $958
000956: 5240         addq.w     #$1, d0
000958: 4e75         rts        

; ---- разрыв: данные $00095A..$000CA8 (846 байт) ----


; ======== sub_000CA8  ВЕКТОР зовут: 0 ========
000CA8: 4ab900a10008 tst.l      $a10008.l
000CAE: 6606         bne.b      $cb6
000CB0: 4a7900a1000c tst.w      $a1000c.l
000CB6: 667c         bne.b      $d34
000CB8: 4bfa007c     lea.l      $d36(pc), a5
000CBC: 4c9d00e0     movem.w    (a5)+, d5-d7
000CC0: 4cdd1f00     movem.l    (a5)+, a0-a4
000CC4: 1029ef01     move.b     -$10ff(a1), d0
000CC8: 0200000f     andi.b     #$f, d0
000CCC: 6708         beq.b      $cd6
000CCE: 237c534547412f00 move.l     #$53454741, $2f00(a1)
000CD6: 3014         move.w     (a4), d0
000CD8: 7000         moveq      #$0, d0
000CDA: 2c40         movea.l    d0, a6
000CDC: 4e66         move       a6, usp
000CDE: 7217         moveq      #$17, d1
000CE0: 1a1d         move.b     (a5)+, d5
000CE2: 3885         move.w     d5, (a4)
000CE4: da47         add.w      d7, d5
000CE6: 51c9fff8     dbra       d1, $ce0
000CEA: 289d         move.l     (a5)+, (a4)
000CEC: 3680         move.w     d0, (a3)
000CEE: 3287         move.w     d7, (a1)
000CF0: 3487         move.w     d7, (a2)
000CF2: 0111         btst.l     d0, (a1)
000CF4: 66fc         bne.b      $cf2
000CF6: 7425         moveq      #$25, d2
000CF8: 10dd         move.b     (a5)+, (a0)+
000CFA: 51cafffc     dbra       d2, $cf8
000CFE: 3480         move.w     d0, (a2)
000D00: 3280         move.w     d0, (a1)
000D02: 3487         move.w     d7, (a2)
000D04: 2d00         move.l     d0, -(a6)
000D06: 51cefffc     dbra       d6, $d04
000D0A: 289d         move.l     (a5)+, (a4)
000D0C: 289d         move.l     (a5)+, (a4)
000D0E: 761f         moveq      #$1f, d3
000D10: 2680         move.l     d0, (a3)
000D12: 51cbfffc     dbra       d3, $d10
000D16: 289d         move.l     (a5)+, (a4)
000D18: 7813         moveq      #$13, d4
000D1A: 2680         move.l     d0, (a3)
000D1C: 51ccfffc     dbra       d4, $d1a
000D20: 7a03         moveq      #$3, d5
000D22: 175d0011     move.b     (a5)+, $11(a3)
000D26: 51cdfffa     dbra       d5, $d22
000D2A: 3480         move.w     d0, (a2)
000D2C: 4cd67fff     movem.l    (a6), d0-d7/a0-a6
000D30: 46fc2700     move.w     #$2700, sr
000D34: 606c         bra.b      $da2

; ---- разрыв: данные $000D36..$000DA2 (108 байт) ----

000DA2: 4a7900c00004 tst.w      $c00004.l
000DA8: 4eb900000446 jsr        $446.l
000DAE: 4eb9000004a2 jsr        $4a2.l
000DB4: 207c000001a4 movea.l    #$1a4, a0
000DBA: 2210         move.l     (a0), d1
000DBC: 5281         addq.l     #$1, d1
000DBE: 207c00000200 movea.l    #$200, a0
000DC4: 9288         sub.l      a0, d1
000DC6: e281         asr.l      #$1, d1
000DC8: 3401         move.w     d1, d2
000DCA: 5342         subq.w     #$1, d2
000DCC: 4841         swap       d1
000DCE: 7000         moveq      #$0, d0
000DD0: d058         add.w      (a0)+, d0
000DD2: 51cafffc     dbra       d2, $dd0
000DD6: 51c9fff8     dbra       d1, $dd0
000DDA: b078018e     cmp.w      $18e.w, d0
000DDE: 67000016     beq.w      $df6
000DE2: 23fcc000000000c00004 move.l     #$c0000000, $c00004.l
000DEC: 33fc000e00c00000 move.w     #$e, $c00000.l
000DF4: 60ec         bra.b      $de2
000DF6: 0839000600a1000d btst.b     #$6, $a1000d.l
000DFE: 6600003a     bne.w      $e3a
000E02: 41f900ff0000 lea.l      $ff0000.l, a0
000E08: 303c039f     move.w     #$39f, d0
000E0C: 4298         clr.l      (a0)+
000E0E: 51c8fffc     dbra       d0, $e0c
000E12: 41f90000791e lea.l      $791e.l, a0
000E18: 43f900ffe200 lea.l      $ffe200.l, a1
000E1E: 303c005f     move.w     #$5f, d0
000E22: 22d8         move.l     (a0)+, (a1)+
000E24: 51c8fffc     dbra       d0, $e22
000E28: 41fa00ce     lea.l      $ef8(pc), a0
000E2C: 43f900ffe100 lea.l      $ffe100.l, a1
000E32: 701b         moveq      #$1b, d0
000E34: 22d8         move.l     (a0)+, (a1)+
000E36: 51c8fffc     dbra       d0, $e34
000E3A: 4eb900000718 jsr        $718.l
000E40: 41f900ff0000 lea.l      $ff0000.l, a0
000E46: 303c383f     move.w     #$383f, d0
000E4A: 4298         clr.l      (a0)+
000E4C: 51c8fffc     dbra       d0, $e4a
000E50: 6100fa34     bsr.w      $886
000E54: 027cf8ff     andi.w     #$f8ff, sr
000E58: 41f900ff0300 lea.l      $ff0300.l, a0
000E5E: 303c003f     move.w     #$3f, d0
000E62: 4258         clr.w      (a0)+
000E64: 51c8fffc     dbra       d0, $e62
000E68: 13fc000100ff0400 move.b     #$1, $ff0400.l
000E70: 4eb900000ee2 jsr        $ee2.l
000E76: 303900ff0406 move.w     $ff0406.l, d0
000E7C: 41f900000e8e lea.l      $e8e.l, a0
000E82: 20700000     movea.l    (a0, d0.w), a0
000E86: 4e90         jsr        (a0)
000E88: 61000058     bsr.w      $ee2
000E8C: 60e8         bra.b      $e76

; ---- разрыв: данные $000E8E..$000EE2 (84 байт) ----


; ======== sub_000EE2   зовут: 2 ========
000EE2: 13fc000100ff0405 move.b     #$1, $ff0405.l
000EEA: 027cf8ff     andi.w     #$f8ff, sr
000EEE: 4a3900ff0405 tst.b      $ff0405.l
000EF4: 66f8         bne.b      $eee
000EF6: 4e75         rts        

; ---- разрыв: данные $000EF8..$003980 (10888 байт) ----


; ======== sub_003980   зовут: 1 ========
003980: 49f900c00004 lea.l      $c00004.l, a4
003986: 383900ffef86 move.w     $ffef86.l, d4
00398C: 08c40004     bset.b     #$4, d4
003990: 3884         move.w     d4, (a4)
003992: 40e7         move.w     sr, -(a7)
003994: 007c0700     ori.w      #$700, sr
003998: 33fc010000a11100 move.w     #$100, $a11100.l
0039A0: 38bc8f02     move.w     #$8f02, (a4)
0039A4: 2881         move.l     d1, (a4)
0039A6: 2882         move.l     d2, (a4)
0039A8: 3883         move.w     d3, (a4)
0039AA: 00400080     ori.w      #$80, d0
0039AE: 3f00         move.w     d0, -(a7)
0039B0: 4840         swap       d0
0039B2: 3880         move.w     d0, (a4)
0039B4: 0839000000a11100 btst.b     #$0, $a11100.l
0039BC: 66f6         bne.b      $39b4
0039BE: 389f         move.w     (a7)+, (a4)
0039C0: 33fc000000a11100 move.w     #$0, $a11100.l
0039C8: 38b900ffef86 move.w     $ffef86.l, (a4)
0039CE: 4840         swap       d0
0039D0: 08800007     bclr.b     #$7, d0
0039D4: 2880         move.l     d0, (a4)
0039D6: 024300ff     andi.w     #$ff, d3
0039DA: 4843         swap       d3
0039DC: 4842         swap       d2
0039DE: 1602         move.b     d2, d3
0039E0: e143         asl.w      #$8, d3
0039E2: 4842         swap       d2
0039E4: 1602         move.b     d2, d3
0039E6: d683         add.l      d3, d3
0039E8: 2043         movea.l    d3, a0
0039EA: 3010         move.w     (a0), d0
0039EC: 3940fffc     move.w     d0, -$4(a4)
0039F0: 46df         move.w     (a7)+, sr
0039F2: 4e75         rts        
