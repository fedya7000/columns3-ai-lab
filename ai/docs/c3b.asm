; rom\Columns III (USA).gen
; код, найденный обходом + таблицами прыжков


; ==== sub_000200 ВЕКТОР зовут=0 ====
000200: 4e71             nop        
000202: 4e71             nop        
000204: 60000aa2         bra.w      $ca8

; ==== sub_000208 ВЕКТОР зовут=0 ====
000208: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00020C: 41f900c00004     lea.l      $c00004.l, a0
000212: 3010             move.w     (a0), d0
000214: 08b9000000ff0405 bclr.b     #$0, $ff0405.l
00021C: 670000e6         beq.w      $304
000220: 08b9000000ff040d bclr.b     #$0, $ff040d.l
000228: 67000068         beq.w      $292
00022C: 49f900c00004     lea.l      $c00004.l, a4
000232: 383900ffef86     move.w     $ffef86.l, d4
000238: 08c40004         bset.b     #$4, d4
00023C: 3884             move.w     d4, (a4)
00023E: 40e7             move.w     sr, -(a7)
000240: 007c0700         ori.w      #$700, sr
000244: 33fc010000a11100 move.w     #$100, $a11100.l
00024C: 38bc8f02         move.w     #$8f02, (a4)
000250: 28bc94019340     move.l     #$94019340, (a4)
000256: 28bc96809500     move.l     #$96809500, (a4)
00025C: 38bc977f         move.w     #$977f, (a4)
000260: 38bc6800         move.w     #$6800, (a4)
000264: 3f3c0082         move.w     #$82, -(a7)
000268: 0839000000a11100 btst.b     #$0, $a11100.l
000270: 66f6             bne.b      $268
000272: 389f             move.w     (a7)+, (a4)
000274: 33fc000000a11100 move.w     #$0, $a11100.l
00027C: 38b900ffef86     move.w     $ffef86.l, (a4)
000282: 28bc68000002     move.l     #$68000002, (a4)
000288: 397900ff0000fffc move.w     $ff0000.l, -$4(a4)
000290: 46df             move.w     (a7)+, sr
000292: 33f900ffef8a00c00004 move.w     $ffef8a.l, $c00004.l
00029C: 610003f6         bsr.w      $694
0002A0: 41f900000384     lea.l      $384.l, a0
0002A6: 303900ff0416     move.w     $ff0416.l, d0
0002AC: 20700000         movea.l    (a0, d0.w), a0
0002B0: 4e90             jsr        (a0)
0002B2: 2a3c6c000002     move.l     #$6c000002, d5
0002B8: 49f900c00000     lea.l      $c00000.l, a4
0002BE: 29450004         move.l     d5, $4(a4)
0002C2: 28b900ff040e     move.l     $ff040e.l, (a4)
0002C8: 2a3c40000010     move.l     #$40000010, d5
0002CE: 29450004         move.l     d5, $4(a4)
0002D2: 28b900ff0412     move.l     $ff0412.l, (a4)
0002D8: 4a3900ff045c     tst.b      $ff045c.l
0002DE: 67000024         beq.w      $304
0002E2: 203c6c000002     move.l     #$6c000002, d0
0002E8: 223c94009350     move.l     #$94009350, d1
0002EE: 243c96849500     move.l     #$96849500, d2
0002F4: 363c977f         move.w     #$977f, d3
0002F8: 4eb900003980     jsr        $3980.l
0002FE: 423900ff045c     clr.b      $ff045c.l
000304: 43f900ffe000     lea.l      $ffe000.l, a1
00030A: 61000590         bsr.w      $89c
00030E: 0c39000700ffe000 cmpi.b     #$7, $ffe000.l
000316: 6600000e         bne.w      $326
00031A: 423900ffe00c     clr.b      $ffe00c.l
000320: 423900ffe00d     clr.b      $ffe00d.l
000326: 41f900ff0530     lea.l      $ff0530.l, a0
00032C: 4a10             tst.b      (a0)
00032E: 6700000e         beq.w      $33e
000332: 1e10             move.b     (a0), d7
000334: 4eb9000007d8     jsr        $7d8.l
00033A: 60000008         bra.w      $344
00033E: 4eb900000832     jsr        $832.l
000344: 43f900ff0530     lea.l      $ff0530.l, a1
00034A: 41e90001         lea.l      $1(a1), a0
00034E: 12d8             move.b     (a0)+, (a1)+
000350: 12d8             move.b     (a0)+, (a1)+
000352: 12d8             move.b     (a0)+, (a1)+
000354: 12d8             move.b     (a0)+, (a1)+
000356: 12d8             move.b     (a0)+, (a1)+
000358: 12d8             move.b     (a0)+, (a1)+
00035A: 12d0             move.b     (a0), (a1)+
00035C: 4211             clr.b      (a1)
00035E: 61000008         bsr.w      $368
000362: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
000366: 4e73             rte        

; ==== sub_000368 зовут=18 ====
000368: 203900ffef90     move.l     $ffef90.l, d0
00036E: e580             asl.l      #$2, d0
000370: d0b900ffef90     add.l      $ffef90.l, d0
000376: 068075317531     addi.l     #$75317531, d0
00037C: 23c000ffef90     move.l     d0, $ffef90.l
000382: 4e75             rts        

; ---- ДАННЫЕ $000384..$000446 (194 байт) ----


; ==== sub_000446 зовут=1 ====
000446: 41fa003a         lea.l      $482(pc), a0
00044A: 700e             moveq      #$e, d0
00044C: 33d800c00004     move.w     (a0)+, $c00004.l
000452: 51c8fff8         dbra       d0, $44c
000456: 41fa002a         lea.l      $482(pc), a0
00045A: 43f900ffef84     lea.l      $ffef84.l, a1
000460: 22d8             move.l     (a0)+, (a1)+
000462: 22d8             move.l     (a0)+, (a1)+
000464: 32d8             move.w     (a0)+, (a1)+
000466: 0839000600a10001 btst.b     #$6, $a10001.l
00046E: 6710             beq.b      $480
000470: 33fa002e00c00004 move.w     $4a0(pc), $c00004.l
000478: 33fa002600ffef86 move.w     $4a0(pc), $ffef86.l
000480: 4e75             rts        

; ---- ДАННЫЕ $000482..$0004A2 (32 байт) ----


; ==== sub_0004A2 зовут=10 ====
0004A2: 23fcc000000000c00004 move.l     #$c0000000, $c00004.l
0004AC: 33fc000000c00000 move.w     #$0, $c00000.l
0004B4: 61000016         bsr.w      $4cc
0004B8: 61000054         bsr.w      $50e
0004BC: 61000024         bsr.w      $4e2
0004C0: 61000074         bsr.w      $536
0004C4: 61000078         bsr.w      $53e
0004C8: 60000060         bra.w      $52a

; ==== sub_0004CC зовут=1 ====
0004CC: 23fc6c00000200c00004 move.l     #$6c000002, $c00004.l
0004D6: 23fc0000000000c00000 move.l     #$0, $c00000.l
0004E0: 4e75             rts        

; ==== sub_0004E2 зовут=1 ====
0004E2: 41f900ff0000     lea.l      $ff0000.l, a0
0004E8: 303c00bf         move.w     #$bf, d0
0004EC: 4298             clr.l      (a0)+
0004EE: 51c8fffc         dbra       d0, $4ec
0004F2: 42b900ff0000     clr.l      $ff0000.l
0004F8: 23fc6800000200c00004 move.l     #$68000002, $c00004.l
000502: 23fc0000000000c00000 move.l     #$0, $c00000.l
00050C: 4e75             rts        

; ==== sub_00050E зовут=1 ====
00050E: 2a3c40000010     move.l     #$40000010, d5
000514: 7e27             moveq      #$27, d7
000516: 7c00             moveq      #$0, d6
000518: 23c500c00004     move.l     d5, $c00004.l
00051E: 33c600c00000     move.w     d6, $c00000.l
000524: 51cffff8         dbra       d7, $51e
000528: 4e75             rts        
00052A: 2a3c70000002     move.l     #$70000002, d5
000530: 3e3c0dff         move.w     #$dff, d7
000534: 6012             bra.b      $548

; ==== sub_000536 зовут=1 ====
000536: 2a3c40000003     move.l     #$40000003, d5
00053C: 6006             bra.b      $544

; ==== sub_00053E зовут=1 ====
00053E: 2a3c60000003     move.l     #$60000003, d5
000544: 3e3c1fff         move.w     #$1fff, d7
000548: 7c00             moveq      #$0, d6
00054A: 49f900c00004     lea.l      $c00004.l, a4
000550: 38bc8f01         move.w     #$8f01, (a4)
000554: 383900ffef86     move.w     $ffef86.l, d4
00055A: 08c40004         bset.b     #$4, d4
00055E: 3884             move.w     d4, (a4)
000560: 283c00940000     move.l     #$940000, d4
000566: 3807             move.w     d7, d4
000568: e18c             lsl.l      #$8, d4
00056A: 383c9300         move.w     #$9300, d4
00056E: 1807             move.b     d7, d4
000570: 2884             move.l     d4, (a4)
000572: 38bc9780         move.w     #$9780, (a4)
000576: 008540000080     ori.l      #$40000080, d5
00057C: 2885             move.l     d5, (a4)
00057E: 1946fffc         move.b     d6, -$4(a4)
000582: 3814             move.w     (a4), d4
000584: 08040001         btst.b     #$1, d4
000588: 66f8             bne.b      $582
00058A: 38b900ffef86     move.w     $ffef86.l, (a4)
000590: 38bc8f02         move.w     #$8f02, (a4)
000594: 4e75             rts        

; ---- ДАННЫЕ $000596..$000600 (106 байт) ----


; ==== sub_000600 ТАБЛИЦА зовут=0 ====
000600: 4bf900c00000     lea.l      $c00000.l, a5
000606: 263c00800000     move.l     #$800000, d3
00060C: 2b450004         move.l     d5, $4(a5)
000610: 3407             move.w     d7, d2
000612: 181e             move.b     (a6)+, d4
000614: 3a84             move.w     d4, (a5)
000616: 51cafffa         dbra       d2, $612
00061A: da83             add.l      d3, d5
00061C: 51ceffee         dbra       d6, $60c
000620: 4e75             rts        

; ==== sub_000622 зовут=12 ====
000622: 4bf900c00000     lea.l      $c00000.l, a5
000628: 263c00800000     move.l     #$800000, d3
00062E: 2b450004         move.l     d5, $4(a5)
000632: 3407             move.w     d7, d2
000634: 3a9e             move.w     (a6)+, (a5)
000636: 51cafffc         dbra       d2, $634
00063A: da83             add.l      d3, d5
00063C: 51cefff0         dbra       d6, $62e
000640: 4e75             rts        

; ==== sub_000642 зовут=12 ====
000642: 08f9000600ffef87 bset.b     #$6, $ffef87.l
00064A: 601a             bra.b      $666

; ==== sub_00064C зовут=9 ====
00064C: 23fcc000000000c00004 move.l     #$c0000000, $c00004.l
000656: 33fc000000c00000 move.w     #$0, $c00000.l
00065E: 08b9000600ffef87 bclr.b     #$6, $ffef87.l
000666: 33f900ffef8600c00004 move.w     $ffef86.l, $c00004.l
000670: 4e75             rts        

; ---- ДАННЫЕ $000672..$00067A (8 байт) ----


; ==== sub_00067A зовут=15 ====
00067A: 2f0b             move.l     a3, -(a7)
00067C: 7e00             moveq      #$0, d7
00067E: 1e1e             move.b     (a6)+, d7
000680: 47f900ff0380     lea.l      $ff0380.l, a3
000686: d6c7             adda.w     d7, a3
000688: 1e1e             move.b     (a6)+, d7
00068A: 36de             move.w     (a6)+, (a3)+
00068C: 51cffffc         dbra       d7, $68a
000690: 265f             movea.l    (a7)+, a3
000692: 4e75             rts        

; ==== sub_000694 зовут=1 ====
000694: 08b9000000ff0400 bclr.b     #$0, $ff0400.l
00069C: 6778             beq.b      $716
00069E: 0839000600a10001 btst.b     #$6, $a10001.l
0006A6: 6708             beq.b      $6b0
0006A8: 3e3c06ee         move.w     #$6ee, d7
0006AC: 51cffffe         dbra       d7, $6ac
0006B0: 49f900c00004     lea.l      $c00004.l, a4
0006B6: 383900ffef86     move.w     $ffef86.l, d4
0006BC: 08c40004         bset.b     #$4, d4
0006C0: 3884             move.w     d4, (a4)
0006C2: 40e7             move.w     sr, -(a7)
0006C4: 007c0700         ori.w      #$700, sr
0006C8: 33fc010000a11100 move.w     #$100, $a11100.l
0006D0: 38bc8f02         move.w     #$8f02, (a4)
0006D4: 28bc94009340     move.l     #$94009340, (a4)
0006DA: 28bc96819580     move.l     #$96819580, (a4)
0006E0: 38bc977f         move.w     #$977f, (a4)
0006E4: 38bcc000         move.w     #$c000, (a4)
0006E8: 3f3c0080         move.w     #$80, -(a7)
0006EC: 0839000000a11100 btst.b     #$0, $a11100.l
0006F4: 66f6             bne.b      $6ec
0006F6: 389f             move.w     (a7)+, (a4)
0006F8: 33fc000000a11100 move.w     #$0, $a11100.l
000700: 38b900ffef86     move.w     $ffef86.l, (a4)
000706: 28bcc0000000     move.l     #$c0000000, (a4)
00070C: 397900ff0300fffc move.w     $ff0300.l, -$4(a4)
000714: 46df             move.w     (a7)+, sr
000716: 4e75             rts        

; ==== sub_000718 зовут=1 ====
000718: 49f900a11100     lea.l      $a11100.l, a4
00071E: 40e7             move.w     sr, -(a7)
000720: 007c0700         ori.w      #$700, sr
000724: 38bc0100         move.w     #$100, (a4)
000728: 397c01000100     move.w     #$100, $100(a4)
00072E: 08140000         btst.b     #$0, (a4)
000732: 66fa             bne.b      $72e
000734: 4df900a00000     lea.l      $a00000.l, a6
00073A: 4bf90007552a     lea.l      $7552a.l, a5
000740: 3e3c0f75         move.w     #$f75, d7
000744: 1cdd             move.b     (a5)+, (a6)+
000746: 51cffffc         dbra       d7, $744
00074A: 4df900a01000     lea.l      $a01000.l, a6
000750: 4bf9000764a0     lea.l      $764a0.l, a5
000756: 3e3c0b57         move.w     #$b57, d7
00075A: 1cdd             move.b     (a5)+, (a6)+
00075C: 51cffffc         dbra       d7, $75a
000760: 41f900a01c00     lea.l      $a01c00.l, a0
000766: 117c00000002     move.b     #$0, $2(a0)
00076C: 117c00800003     move.b     #$80, $3(a0)

; ---- ДАННЫЕ $000772..$000770 (-2 байт) ----


; ==== sub_000770 ТАБЛИЦА зовут=0 ====
000770: 0003117c         ori.b      #$7c, d3

; ---- ДАННЫЕ $000774..$000772 (-2 байт) ----

000772: 117c00000009     move.b     #$0, $9(a0)

; ---- ДАННЫЕ $000778..$000774 (-4 байт) ----

000774: 00000009         ori.b      #$9, d0
000778: 117c0000000a     move.b     #$0, $a(a0)
00077E: 117c0000000b     move.b     #$0, $b(a0)
000784: 117c0000000c     move.b     #$0, $c(a0)
00078A: 397c00000100     move.w     #$0, $100(a4)
000790: 38bc0000         move.w     #$0, (a4)
000794: 397c01000100     move.w     #$100, $100(a4)
00079A: 46df             move.w     (a7)+, sr
00079C: 4e75             rts        

; ==== sub_00079E зовут=9 ====
00079E: 42b900ff0530     clr.l      $ff0530.l
0007A4: 42b900ff0534     clr.l      $ff0534.l
0007AA: 1e3c00e1         move.b     #$e1, d7
0007AE: 40e7             move.w     sr, -(a7)
0007B0: 007c0700         ori.w      #$700, sr
0007B4: 33fc010000a11100 move.w     #$100, $a11100.l
0007BC: 0839000000a11100 btst.b     #$0, $a11100.l
0007C4: 66f6             bne.b      $7bc
0007C6: 13c700a01c0a     move.b     d7, $a01c0a.l
0007CC: 33fc000000a11100 move.w     #$0, $a11100.l
0007D4: 46df             move.w     (a7)+, sr
0007D6: 4e75             rts        

; ==== sub_0007D8 зовут=1 ====
0007D8: 40e7             move.w     sr, -(a7)
0007DA: 007c0700         ori.w      #$700, sr
0007DE: 33fc010000a11100 move.w     #$100, $a11100.l
0007E6: 0839000000a11100 btst.b     #$0, $a11100.l
0007EE: 66f6             bne.b      $7e6
0007F0: 13c700a01c0a     move.b     d7, $a01c0a.l
0007F6: 4a3900ff0540     tst.b      $ff0540.l
0007FC: 67000028         beq.w      $826
000800: 0239007f00ff0540 andi.b     #$7f, $ff0540.l
000808: 1e3900ff4108     move.b     $ff4108.l, d7
00080E: 9e3900ff0540     sub.b      $ff0540.l, d7
000814: 13c700a01c13     move.b     d7, $a01c13.l
00081A: 13c700a01c14     move.b     d7, $a01c14.l
000820: 423900ff0540     clr.b      $ff0540.l
000826: 33fc000000a11100 move.w     #$0, $a11100.l
00082E: 46df             move.w     (a7)+, sr
000830: 4e75             rts        

; ==== sub_000832 зовут=1 ====
000832: 40e7             move.w     sr, -(a7)
000834: 007c0700         ori.w      #$700, sr
000838: 33fc010000a11100 move.w     #$100, $a11100.l
000840: 0839000000a11100 btst.b     #$0, $a11100.l
000848: 66f6             bne.b      $840
00084A: 4a3900ff0540     tst.b      $ff0540.l
000850: 67000028         beq.w      $87a
000854: 0239007f00ff0540 andi.b     #$7f, $ff0540.l
00085C: 1e3900ff4108     move.b     $ff4108.l, d7
000862: 9e3900ff0540     sub.b      $ff0540.l, d7
000868: 13c700a01c13     move.b     d7, $a01c13.l
00086E: 13c700a01c14     move.b     d7, $a01c14.l
000874: 423900ff0540     clr.b      $ff0540.l
00087A: 33fc000000a11100 move.w     #$0, $a11100.l
000882: 46df             move.w     (a7)+, sr
000884: 4e75             rts        

; ==== sub_000886 зовут=1 ====
000886: 7e40             moveq      #$40, d7
000888: 13c700a10009     move.b     d7, $a10009.l
00088E: 13c700a1000b     move.b     d7, $a1000b.l
000894: 13c700a1000d     move.b     d7, $a1000d.l
00089A: 4e75             rts        

; ==== sub_00089C зовут=1 ====
00089C: 33fc010000a11100 move.w     #$100, $a11100.l
0008A4: 45e9000a         lea.l      $a(a1), a2
0008A8: 7007             moveq      #$7, d0
0008AA: 34bcffff         move.w     #$ffff, (a2)
0008AE: 45ea000a         lea.l      $a(a2), a2
0008B2: 51c8fff6         dbra       d0, $8aa
0008B6: 7000             moveq      #$0, d0
0008B8: 61000018         bsr.w      $8d2
0008BC: 1280             move.b     d0, (a1)
0008BE: 7001             moveq      #$1, d0
0008C0: 61000010         bsr.w      $8d2
0008C4: 13400001         move.b     d0, $1(a1)
0008C8: 33fc000000a11100 move.w     #$0, $a11100.l
0008D0: 4e75             rts        

; ==== sub_0008D2 зовут=2 ====
0008D2: 48e77f70         movem.l    d1-d7/a1-a3, -(a7)
0008D6: 41f900a10003     lea.l      $a10003.l, a0
0008DC: d040             add.w      d0, d0
0008DE: d0c0             adda.w     d0, a0
0008E0: d040             add.w      d0, d0
0008E2: 45f10002         lea.l      $2(a1, d0.w), a2
0008E6: c0fc000a         mulu.w     #$a, d0
0008EA: 43f1000a         lea.l      $a(a1, d0.w), a1
0008EE: 6134             bsr.b      $924
0008F0: 3f00             move.w     d0, -(a7)
0008F2: 0240000e         andi.w     #$e, d0
0008F6: d040             add.w      d0, d0
0008F8: 4ebb000a         jsr        $904(pc, d0.w)
0008FC: 301f             move.w     (a7)+, d0
0008FE: 4cdf0efe         movem.l    (a7)+, d1-d7/a1-a3
000902: 4e75             rts        

; ==== sub_000904 зовут=1 ====
000904: 4e71             nop        
000906: 4e75             rts        

; ---- ДАННЫЕ $000908..$000924 (28 байт) ----


; ==== sub_000924 зовут=1 ====
000924: 48e73000         movem.l    d2-d3, -(a7)
000928: 7000             moveq      #$0, d0
00092A: 10bc0070         move.b     #$70, (a0)
00092E: 6110             bsr.b      $940
000930: 4841             swap       d1
000932: 10bc0030         move.b     #$30, (a0)
000936: d040             add.w      d0, d0
000938: 6106             bsr.b      $940
00093A: 4cdf000c         movem.l    (a7)+, d2-d3
00093E: 4e75             rts        

; ==== sub_000940 зовут=2 ====
000940: 1210             move.b     (a0), d1
000942: 1401             move.b     d1, d2
000944: 0202000c         andi.b     #$c, d2
000948: 6702             beq.b      $94c
00094A: 5240             addq.w     #$1, d0
00094C: d040             add.w      d0, d0
00094E: 1601             move.b     d1, d3
000950: 02430003         andi.w     #$3, d3
000954: 6702             beq.b      $958
000956: 5240             addq.w     #$1, d0
000958: 4e75             rts        

; ---- ДАННЫЕ $00095A..$000C56 (764 байт) ----


; ==== sub_000C56 зовут=1 ====
000C56: 48e76004         movem.l    d1-d2/a5, -(a7)
000C5A: 40e7             move.w     sr, -(a7)
000C5C: 007c0700         ori.w      #$700, sr
000C60: 33fc010000a11100 move.w     #$100, $a11100.l
000C68: 0839000000a11100 btst.b     #$0, $a11100.l
000C70: 66f6             bne.b      $c68
000C72: 4bfa002c         lea.l      $ca0(pc), a5
000C76: 1d550006         move.b     (a5), $6(a6)
000C7A: 7e00             moveq      #$0, d7
000C7C: 7208             moveq      #$8, d1
000C7E: 1c9d             move.b     (a5)+, (a6)
000C80: 4e71             nop        
000C82: 4e71             nop        
000C84: 1416             move.b     (a6), d2
000C86: c41d             and.b      (a5)+, d2
000C88: 6702             beq.b      $c8c
000C8A: 8e01             or.b       d1, d7
000C8C: e209             lsr.b      #$1, d1
000C8E: 66ee             bne.b      $c7e
000C90: 33fc000000a11100 move.w     #$0, $a11100.l
000C98: 46df             move.w     (a7)+, sr
000C9A: 4cdf2006         movem.l    (a7)+, d1-d2/a5
000C9E: 4e75             rts        

; ---- ДАННЫЕ $000CA0..$000CA8 (8 байт) ----


; ==== sub_000CA8 ВЕКТОР зовут=0 ====
000CA8: 4ab900a10008     tst.l      $a10008.l
000CAE: 6606             bne.b      $cb6
000CB0: 4a7900a1000c     tst.w      $a1000c.l
000CB6: 667c             bne.b      $d34
000CB8: 4bfa007c         lea.l      $d36(pc), a5
000CBC: 4c9d00e0         movem.w    (a5)+, d5-d7
000CC0: 4cdd1f00         movem.l    (a5)+, a0-a4
000CC4: 1029ef01         move.b     -$10ff(a1), d0
000CC8: 0200000f         andi.b     #$f, d0
000CCC: 6708             beq.b      $cd6
000CCE: 237c534547412f00 move.l     #$53454741, $2f00(a1)
000CD6: 3014             move.w     (a4), d0
000CD8: 7000             moveq      #$0, d0
000CDA: 2c40             movea.l    d0, a6
000CDC: 4e66             move       a6, usp
000CDE: 7217             moveq      #$17, d1
000CE0: 1a1d             move.b     (a5)+, d5
000CE2: 3885             move.w     d5, (a4)
000CE4: da47             add.w      d7, d5
000CE6: 51c9fff8         dbra       d1, $ce0
000CEA: 289d             move.l     (a5)+, (a4)
000CEC: 3680             move.w     d0, (a3)
000CEE: 3287             move.w     d7, (a1)
000CF0: 3487             move.w     d7, (a2)
000CF2: 0111             btst.l     d0, (a1)
000CF4: 66fc             bne.b      $cf2
000CF6: 7425             moveq      #$25, d2
000CF8: 10dd             move.b     (a5)+, (a0)+
000CFA: 51cafffc         dbra       d2, $cf8
000CFE: 3480             move.w     d0, (a2)
000D00: 3280             move.w     d0, (a1)
000D02: 3487             move.w     d7, (a2)
000D04: 2d00             move.l     d0, -(a6)
000D06: 51cefffc         dbra       d6, $d04
000D0A: 289d             move.l     (a5)+, (a4)
000D0C: 289d             move.l     (a5)+, (a4)
000D0E: 761f             moveq      #$1f, d3
000D10: 2680             move.l     d0, (a3)
000D12: 51cbfffc         dbra       d3, $d10
000D16: 289d             move.l     (a5)+, (a4)
000D18: 7813             moveq      #$13, d4
000D1A: 2680             move.l     d0, (a3)
000D1C: 51ccfffc         dbra       d4, $d1a
000D20: 7a03             moveq      #$3, d5
000D22: 175d0011         move.b     (a5)+, $11(a3)
000D26: 51cdfffa         dbra       d5, $d22
000D2A: 3480             move.w     d0, (a2)
000D2C: 4cd67fff         movem.l    (a6), d0-d7/a0-a6
000D30: 46fc2700         move.w     #$2700, sr
000D34: 606c             bra.b      $da2

; ---- ДАННЫЕ $000D36..$000DA2 (108 байт) ----

000DA2: 4a7900c00004     tst.w      $c00004.l
000DA8: 4eb900000446     jsr        $446.l
000DAE: 4eb9000004a2     jsr        $4a2.l
000DB4: 207c000001a4     movea.l    #$1a4, a0
000DBA: 2210             move.l     (a0), d1
000DBC: 5281             addq.l     #$1, d1
000DBE: 207c00000200     movea.l    #$200, a0
000DC4: 9288             sub.l      a0, d1
000DC6: e281             asr.l      #$1, d1
000DC8: 3401             move.w     d1, d2
000DCA: 5342             subq.w     #$1, d2
000DCC: 4841             swap       d1
000DCE: 7000             moveq      #$0, d0
000DD0: d058             add.w      (a0)+, d0
000DD2: 51cafffc         dbra       d2, $dd0
000DD6: 51c9fff8         dbra       d1, $dd0
000DDA: b078018e         cmp.w      $18e.w, d0
000DDE: 67000016         beq.w      $df6
000DE2: 23fcc000000000c00004 move.l     #$c0000000, $c00004.l
000DEC: 33fc000e00c00000 move.w     #$e, $c00000.l
000DF4: 60ec             bra.b      $de2
000DF6: 0839000600a1000d btst.b     #$6, $a1000d.l
000DFE: 6600003a         bne.w      $e3a
000E02: 41f900ff0000     lea.l      $ff0000.l, a0
000E08: 303c039f         move.w     #$39f, d0
000E0C: 4298             clr.l      (a0)+
000E0E: 51c8fffc         dbra       d0, $e0c
000E12: 41f90000791e     lea.l      $791e.l, a0
000E18: 43f900ffe200     lea.l      $ffe200.l, a1
000E1E: 303c005f         move.w     #$5f, d0
000E22: 22d8             move.l     (a0)+, (a1)+
000E24: 51c8fffc         dbra       d0, $e22
000E28: 41fa00ce         lea.l      $ef8(pc), a0
000E2C: 43f900ffe100     lea.l      $ffe100.l, a1
000E32: 701b             moveq      #$1b, d0
000E34: 22d8             move.l     (a0)+, (a1)+
000E36: 51c8fffc         dbra       d0, $e34
000E3A: 4eb900000718     jsr        $718.l
000E40: 41f900ff0000     lea.l      $ff0000.l, a0
000E46: 303c383f         move.w     #$383f, d0
000E4A: 4298             clr.l      (a0)+
000E4C: 51c8fffc         dbra       d0, $e4a
000E50: 6100fa34         bsr.w      $886
000E54: 027cf8ff         andi.w     #$f8ff, sr
000E58: 41f900ff0300     lea.l      $ff0300.l, a0
000E5E: 303c003f         move.w     #$3f, d0
000E62: 4258             clr.w      (a0)+
000E64: 51c8fffc         dbra       d0, $e62
000E68: 13fc000100ff0400 move.b     #$1, $ff0400.l
000E70: 4eb900000ee2     jsr        $ee2.l
000E76: 303900ff0406     move.w     $ff0406.l, d0
000E7C: 41f900000e8e     lea.l      $e8e.l, a0
000E82: 20700000         movea.l    (a0, d0.w), a0
000E86: 4e90             jsr        (a0)
000E88: 61000058         bsr.w      $ee2
000E8C: 60e8             bra.b      $e76

; ---- ДАННЫЕ $000E8E..$000EE2 (84 байт) ----


; ==== sub_000EE2 зовут=71 ====
000EE2: 13fc000100ff0405 move.b     #$1, $ff0405.l
000EEA: 027cf8ff         andi.w     #$f8ff, sr
000EEE: 4a3900ff0405     tst.b      $ff0405.l
000EF4: 66f8             bne.b      $eee
000EF6: 4e75             rts        

; ---- ДАННЫЕ $000EF8..$000F7E (134 байт) ----


; ==== sub_000F7E ТАБЛИЦА зовут=0 ====
000F7E: 007c0700         ori.w      #$700, sr
000F82: 4eb90000064c     jsr        $64c.l
000F88: 4eb9000004a2     jsr        $4a2.l
000F8E: 49f900c00004     lea.l      $c00004.l, a4
000F94: 45fa01b0         lea.l      $1146(pc), a2
000F98: 7008             moveq      #$8, d0
000F9A: 389a             move.w     (a2)+, (a4)
000F9C: 51c8fffc         dbra       d0, $f9a
000FA0: 103900a10001     move.b     $a10001.l, d0
000FA6: 020000c0         andi.b     #$c0, d0
000FAA: 0c000080         cmpi.b     #$80, d0
000FAE: 6700008a         beq.w      $103a
000FB2: 427900ff0300     clr.w      $ff0300.l
000FB8: 33fc0eee00ff031c move.w     #$eee, $ff031c.l
000FC0: 49f900c00004     lea.l      $c00004.l, a4
000FC6: 38bc4000         move.w     #$4000, (a4)
000FCA: 38bc0000         move.w     #$0, (a4)
000FCE: 303c000f         move.w     #$f, d0
000FD2: 47f900c00000     lea.l      $c00000.l, a3
000FD8: 36bc0000         move.w     #$0, (a3)
000FDC: 51c8fffa         dbra       d0, $fd8
000FE0: 41f900044ce0     lea.l      $44ce0.l, a0
000FE6: 43f900ffa000     lea.l      $ffa000.l, a1
000FEC: 4eb9000047aa     jsr        $47aa.l
000FF2: 203c40000000     move.l     #$40000000, d0
000FF8: 223c94089300     move.l     #$94089300, d1
000FFE: 243c96d09500     move.l     #$96d09500, d2
001004: 363c977f         move.w     #$977f, d3
001008: 4eb900003980     jsr        $3980.l
00100E: 7e1a             moveq      #$1a, d7
001010: 7c02             moveq      #$2, d6
001012: 2a3c460c0003     move.l     #$460c0003, d5
001018: 4df900001224     lea.l      $1224.l, a6
00101E: 4eb900000622     jsr        $622.l
001024: 13fc000100ff0400 move.b     #$1, $ff0400.l
00102C: 4eb900000642     jsr        $642.l
001032: 4eb900000ee2     jsr        $ee2.l
001038: 60f8             bra.b      $1032
00103A: 427900ff0300     clr.w      $ff0300.l
001040: 41f9000011e2     lea.l      $11e2.l, a0
001046: 43f900ff0300     lea.l      $ff0300.l, a1
00104C: 700c             moveq      #$c, d0
00104E: 32d8             move.w     (a0)+, (a1)+
001050: 51c8fffc         dbra       d0, $104e
001054: 49f900c00004     lea.l      $c00004.l, a4
00105A: 38bc4000         move.w     #$4000, (a4)
00105E: 38bc0000         move.w     #$0, (a4)
001062: 303c000f         move.w     #$f, d0
001066: 47f900c00000     lea.l      $c00000.l, a3
00106C: 36bc0000         move.w     #$0, (a3)
001070: 51c8fffa         dbra       d0, $106c
001074: 41f900020060     lea.l      $20060.l, a0
00107A: 43f900ffa000     lea.l      $ffa000.l, a1
001080: 4eb9000047aa     jsr        $47aa.l
001086: 203c40000000     move.l     #$40000000, d0
00108C: 223c94049300     move.l     #$94049300, d1
001092: 243c96d09500     move.l     #$96d09500, d2
001098: 363c977f         move.w     #$977f, d3
00109C: 4eb900003980     jsr        $3980.l
0010A2: 7e0b             moveq      #$b, d7
0010A4: 7c03             moveq      #$3, d6
0010A6: 2a3c461c0003     move.l     #$461c0003, d5
0010AC: 4df900020000     lea.l      $20000.l, a6
0010B2: 4eb900000622     jsr        $622.l
0010B8: 4a3900a10001     tst.b      $a10001.l
0010BE: 6a00001e         bpl.w      $10de
0010C2: 203c41600000     move.l     #$41600000, d0
0010C8: 223c94009320     move.l     #$94009320, d1
0010CE: 243c96d395e0     move.l     #$96d395e0, d2
0010D4: 363c977f         move.w     #$977f, d3
0010D8: 4eb900003980     jsr        $3980.l
0010DE: 4eb900000642     jsr        $642.l
0010E4: 13fc00e100ff0530 move.b     #$e1, $ff0530.l
0010EC: 4eb900000ee2     jsr        $ee2.l
0010F2: 4eb900000ee2     jsr        $ee2.l
0010F8: 13fc008300ff0530 move.b     #$83, $ff0530.l
001100: 4eb900000ee2     jsr        $ee2.l
001106: 4eb900000ee2     jsr        $ee2.l
00110C: 4eb900000ee2     jsr        $ee2.l
001112: 4eb900000ee2     jsr        $ee2.l
001118: 4eb900000ee2     jsr        $ee2.l
00111E: 33fc002800ff040a move.w     #$28, $ff040a.l
001126: 33fc008000ff0408 move.w     #$80, $ff0408.l
00112E: 13fc000a00ff040c move.b     #$a, $ff040c.l
001136: 33fc000400ff0406 move.w     #$4, $ff0406.l
00113E: 427900ff0500     clr.w      $ff0500.l
001144: 4e75             rts        

; ---- ДАННЫЕ $001146..$001158 (18 байт) ----


; ==== sub_001158 ТАБЛИЦА зовут=0 ====
001158: 6150             bsr.b      $11aa
00115A: 13fc000100ff0400 move.b     #$1, $ff0400.l
001162: 4df900a10003     lea.l      $a10003.l, a6
001168: 4eb900000c56     jsr        $c56.l
00116E: 0c07000f         cmpi.b     #$f, d7
001172: 6700000e         beq.w      $1182
001176: 0839000700ffe00d btst.b     #$7, $ffe00d.l
00117E: 6600000e         bne.w      $118e
001182: 537900ff0408     subq.w     #$1, $ff0408.l
001188: 67000004         beq.w      $118e
00118C: 4e75             rts        
00118E: 4eb900003940     jsr        $3940.l
001194: 13fc000100ff0400 move.b     #$1, $ff0400.l
00119C: 4eb900000ee2     jsr        $ee2.l
0011A2: 33fc000800ff0406 move.w     #$8, $ff0406.l

; ==== sub_0011AA зовут=1 ====
0011AA: 533900ff040c     subq.b     #$1, $ff040c.l
0011B0: 6a00002c         bpl.w      $11de
0011B4: 13fc000100ff040c move.b     #$1, $ff040c.l
0011BC: 303900ff040a     move.w     $ff040a.l, d0
0011C2: 6b00001a         bmi.w      $11de
0011C6: 557900ff040a     subq.w     #$2, $ff040a.l
0011CC: 41fb0018         lea.l      $11e6(pc, d0.w), a0
0011D0: 43f900ff0304     lea.l      $ff0304.l, a1
0011D6: 700a             moveq      #$a, d0
0011D8: 32d8             move.w     (a0)+, (a1)+
0011DA: 51c8fffc         dbra       d0, $11d8
0011DE: 4e75             rts        

; ---- ДАННЫЕ $0011E0..$0012C6 (230 байт) ----


; ==== sub_0012C6 ТАБЛИЦА зовут=0 ====
0012C6: 4eb900000ee2     jsr        $ee2.l
0012CC: 007c0700         ori.w      #$700, sr
0012D0: 4eb90000064c     jsr        $64c.l
0012D6: 4eb9000004a2     jsr        $4a2.l
0012DC: 4eb900003952     jsr        $3952.l
0012E2: 427900ff0300     clr.w      $ff0300.l
0012E8: 4df90000146e     lea.l      $146e.l, a6
0012EE: 4eb90000067a     jsr        $67a.l
0012F4: 41f90003e58a     lea.l      $3e58a.l, a0
0012FA: 43f900ffa000     lea.l      $ffa000.l, a1
001300: 4eb9000047aa     jsr        $47aa.l
001306: 203c40000000     move.l     #$40000000, d0
00130C: 223c941a9380     move.l     #$941a9380, d1
001312: 243c96d09500     move.l     #$96d09500, d2
001318: 363c977f         move.w     #$977f, d3
00131C: 4eb900003980     jsr        $3980.l
001322: 41f900040dac     lea.l      $40dac.l, a0
001328: 43f900ffa000     lea.l      $ffa000.l, a1
00132E: 4eb9000047aa     jsr        $47aa.l
001334: 203c40000001     move.l     #$40000001, d0
00133A: 223c94109300     move.l     #$94109300, d1
001340: 243c96d09500     move.l     #$96d09500, d2
001346: 363c977f         move.w     #$977f, d3
00134A: 4eb900003980     jsr        $3980.l
001350: 41f90006a212     lea.l      $6a212.l, a0
001356: 43f900ffa000     lea.l      $ffa000.l, a1
00135C: 4eb9000047aa     jsr        $47aa.l
001362: 203c60000001     move.l     #$60000001, d0
001368: 223c94069300     move.l     #$94069300, d1
00136E: 243c96d09500     move.l     #$96d09500, d2
001374: 363c977f         move.w     #$977f, d3
001378: 4eb900003980     jsr        $3980.l
00137E: 41f900042426     lea.l      $42426.l, a0
001384: 43f900ffa000     lea.l      $ffa000.l, a1
00138A: 4eb9000047aa     jsr        $47aa.l
001390: 41f900ffa5f0     lea.l      $ffa5f0.l, a0
001396: 303c0167         move.w     #$167, d0
00139A: 3210             move.w     (a0), d1
00139C: 00418000         ori.w      #$8000, d1
0013A0: 30c1             move.w     d1, (a0)+
0013A2: 51c8fff6         dbra       d0, $139a
0013A6: 7e27             moveq      #$27, d7
0013A8: 7c1b             moveq      #$1b, d6
0013AA: 2a3c60000003     move.l     #$60000003, d5
0013B0: 4df900ffa000     lea.l      $ffa000.l, a6
0013B6: 4eb900000622     jsr        $622.l
0013BC: 41f900ff8000     lea.l      $ff8000.l, a0
0013C2: 303c03ff         move.w     #$3ff, d0
0013C6: 4298             clr.l      (a0)+
0013C8: 51c8fffc         dbra       d0, $13c6
0013CC: 41f900040bc6     lea.l      $40bc6.l, a0
0013D2: 43f900ffa000     lea.l      $ffa000.l, a1
0013D8: 4eb9000047aa     jsr        $47aa.l
0013DE: 61000d2e         bsr.w      $210e
0013E2: 33fc007000ff0412 move.w     #$70, $ff0412.l
0013EA: 427900ff0432     clr.w      $ff0432.l
0013F0: 33fc000400ff0416 move.w     #$4, $ff0416.l
0013F8: 1e3c008c         move.b     #$8c, d7
0013FC: 4eb900003d7a     jsr        $3d7a.l
001402: 08b9000000ff4100 bclr.b     #$0, $ff4100.l
00140A: 6700003e         beq.w      $144a
00140E: 41f900ff0380     lea.l      $ff0380.l, a0
001414: 43f900ff0300     lea.l      $ff0300.l, a1
00141A: 701f             moveq      #$1f, d0
00141C: 22d8             move.l     (a0)+, (a1)+
00141E: 51c8fffc         dbra       d0, $141c
001422: 33fc000c00ff0406 move.w     #$c, $ff0406.l
00142A: 610000c4         bsr.w      $14f0
00142E: 4eb900000642     jsr        $642.l
001434: 13fc000100ff0400 move.b     #$1, $ff0400.l
00143C: 13fc000100ff040d move.b     #$1, $ff040d.l
001444: 4ef900000ee2     jmp        $ee2.l
00144A: 33fc000c00ff0406 move.w     #$c, $ff0406.l
001452: 4eb900000642     jsr        $642.l
001458: 13fc000100ff0400 move.b     #$1, $ff0400.l
001460: 4eb900000ee2     jsr        $ee2.l
001466: 4eb90000392e     jsr        $392e.l
00146C: 4e75             rts        

; ---- ДАННЫЕ $00146E..$0014F0 (130 байт) ----


; ==== sub_0014F0 зовут=1 ====
0014F0: 427900ff0412     clr.w      $ff0412.l
0014F6: 4eb90000210e     jsr        $210e.l
0014FC: 4eb900002128     jsr        $2128.l
001502: 33fc619d00ff000c move.w     #$619d, $ff000c.l
00150A: 41f90003e41c     lea.l      $3e41c.l, a0
001510: 43f900ff8990     lea.l      $ff8990.l, a1
001516: 3e3c0017         move.w     #$17, d7
00151A: 3c3c0001         move.w     #$1, d6
00151E: 4eb900010fdc     jsr        $10fdc.l
001524: 41f90003e47c     lea.l      $3e47c.l, a0
00152A: 43f900ff8b16     lea.l      $ff8b16.l, a1
001530: 3e3c0011         move.w     #$11, d7
001534: 3c3c0000         move.w     #$0, d6
001538: 4eb900010fdc     jsr        $10fdc.l
00153E: 41f90003e4c4     lea.l      $3e4c4.l, a0
001544: 43f900ff8c06     lea.l      $ff8c06.l, a1
00154A: 3e3c0020         move.w     #$20, d7
00154E: 3c3c0002         move.w     #$2, d6
001552: 4eb900010fdc     jsr        $10fdc.l
001558: 423900ff0500     clr.b      $ff0500.l
00155E: 6100002a         bsr.w      $158a
001562: 33fc001000ff0432 move.w     #$10, $ff0432.l
00156A: 33fc04b000ff0408 move.w     #$4b0, $ff0408.l
001572: 13fc000200ff0508 move.b     #$2, $ff0508.l
00157A: 423900ff0509     clr.b      $ff0509.l
001580: 33fc000100ff050e move.w     #$1, $ff050e.l
001588: 4e75             rts        

; ==== sub_00158A зовут=2 ====
00158A: 41fa0014         lea.l      $15a0(pc), a0
00158E: 43f900ffa000     lea.l      $ffa000.l, a1
001594: 303c01df         move.w     #$1df, d0
001598: 22d8             move.l     (a0)+, (a1)+
00159A: 51c8fffc         dbra       d0, $1598
00159E: 4e75             rts        

; ---- ДАННЫЕ $0015A0..$001D20 (1920 байт) ----


; ==== sub_001D20 ТАБЛИЦА зовут=0 ====
001D20: 303900ff0432     move.w     $ff0432.l, d0
001D26: 41fa0012         lea.l      $1d3a(pc), a0
001D2A: 20700000         movea.l    (a0, d0.w), a0
001D2E: 4e90             jsr        (a0)
001D30: 13fc000100ff040d move.b     #$1, $ff040d.l
001D38: 4e75             rts        

; ---- ДАННЫЕ $001D3A..$001D4E (20 байт) ----


; ==== sub_001D4E ТАБЛИЦА зовут=0 ====
001D4E: 0839000700ffe00d btst.b     #$7, $ffe00d.l
001D56: 6600f798         bne.w      $14f0
001D5A: 537900ff0412     subq.w     #$1, $ff0412.l
001D60: 66000032         bne.w      $1d94
001D64: 61000392         bsr.w      $20f8
001D68: 610003be         bsr.w      $2128
001D6C: 41f900ff0000     lea.l      $ff0000.l, a0
001D72: 700b             moveq      #$b, d0
001D74: 3210             move.w     (a0), d1
001D76: 04410088         subi.w     #$88, d1
001D7A: 3081             move.w     d1, (a0)
001D7C: 41e80008         lea.l      $8(a0), a0
001D80: 51c8fff2         dbra       d0, $1d74
001D84: 13fc008800ff0500 move.b     #$88, $ff0500.l
001D8C: 33fc000400ff0432 move.w     #$4, $ff0432.l
001D94: 4e75             rts        

; ==== sub_001D96 ТАБЛИЦА зовут=0 ====
001D96: 0839000700ffe00d btst.b     #$7, $ffe00d.l
001D9E: 6600f750         bne.w      $14f0
001DA2: 4a3900ff0500     tst.b      $ff0500.l
001DA8: 6700001c         beq.w      $1dc6
001DAC: 533900ff0500     subq.b     #$1, $ff0500.l
001DB2: 41f900ff0000     lea.l      $ff0000.l, a0
001DB8: 700b             moveq      #$b, d0
001DBA: 5250             addq.w     #$1, (a0)
001DBC: 41e80008         lea.l      $8(a0), a0
001DC0: 51c8fff8         dbra       d0, $1dba
001DC4: 4e75             rts        
001DC6: 423900ff0500     clr.b      $ff0500.l
001DCC: 13fc000100ff0501 move.b     #$1, $ff0501.l
001DD4: 33fc000800ff0432 move.w     #$8, $ff0432.l
001DDC: 4e75             rts        

; ==== sub_001DDE ТАБЛИЦА зовут=0 ====
001DDE: 0839000700ffe00d btst.b     #$7, $ffe00d.l
001DE6: 6600f708         bne.w      $14f0
001DEA: 533900ff0501     subq.b     #$1, $ff0501.l
001DF0: 67000004         beq.w      $1df6
001DF4: 4e75             rts        
001DF6: 13fc000200ff0501 move.b     #$2, $ff0501.l
001DFE: 7000             moveq      #$0, d0
001E00: 103900ff0500     move.b     $ff0500.l, d0
001E06: e540             asl.w      #$2, d0
001E08: 41fa0038         lea.l      $1e42(pc), a0
001E0C: 20700000         movea.l    (a0, d0.w), a0
001E10: 43f900ff8990     lea.l      $ff8990.l, a1
001E16: 3e3c0017         move.w     #$17, d7
001E1A: 3c3c0001         move.w     #$1, d6
001E1E: 4eb900010fdc     jsr        $10fdc.l
001E24: 523900ff0500     addq.b     #$1, $ff0500.l
001E2A: 0c39000c00ff0500 cmpi.b     #$c, $ff0500.l
001E32: 67000004         beq.w      $1e38
001E36: 4e75             rts        
001E38: 33fc000c00ff0432 move.w     #$c, $ff0432.l
001E40: 4e75             rts        

; ---- ДАННЫЕ $001E42..$001E72 (48 байт) ----


; ==== sub_001E72 ТАБЛИЦА зовут=0 ====
001E72: 533900ff0508     subq.b     #$1, $ff0508.l
001E78: 66000022         bne.w      $1e9c
001E7C: 13fc000200ff0508 move.b     #$2, $ff0508.l
001E84: 523900ff0509     addq.b     #$1, $ff0509.l
001E8A: 0c39000400ff0509 cmpi.b     #$4, $ff0509.l
001E92: 66000008         bne.w      $1e9c
001E96: 423900ff0509     clr.b      $ff0509.l
001E9C: 7000             moveq      #$0, d0
001E9E: 103900ff0509     move.b     $ff0509.l, d0
001EA4: 0c79002800ff050e cmpi.w     #$28, $ff050e.l
001EAC: 6c000004         bge.w      $1eb2
001EB0: 7000             moveq      #$0, d0
001EB2: eb40             asl.w      #$5, d0
001EB4: 41fa00f2         lea.l      $1fa8(pc), a0
001EB8: d1c0             adda.l     d0, a0
001EBA: 43f900ff0340     lea.l      $ff0340.l, a1
001EC0: 7007             moveq      #$7, d0
001EC2: 22d8             move.l     (a0)+, (a1)+
001EC4: 51c8fffc         dbra       d0, $1ec2
001EC8: 13fc000100ff0400 move.b     #$1, $ff0400.l
001ED0: 0839000700ffe00d btst.b     #$7, $ffe00d.l
001ED8: 6600020a         bne.w      $20e4
001EDC: 537900ff0408     subq.w     #$1, $ff0408.l
001EE2: 66000184         bne.w      $2068
001EE6: 13fc000100ff4100 move.b     #$1, $ff4100.l
001EEE: 4eb900003940     jsr        $3940.l
001EF4: 33fc000600ff0418 move.w     #$6, $ff0418.l
001EFC: 41fa039a         lea.l      $2298(pc), a0
001F00: 43f900ff0460     lea.l      $ff0460.l, a1
001F06: 7e0f             moveq      #$f, d7
001F08: 12d8             move.b     (a0)+, (a1)+
001F0A: 51cffffc         dbra       d7, $1f08
001F0E: 23fc00ffe00c00ff0470 move.l     #$ffe00c, $ff0470.l
001F18: 23fc00ffe03400ff0474 move.l     #$ffe034, $ff0474.l
001F22: 4eb900004b44     jsr        $4b44.l
001F28: 41f90002545e     lea.l      $2545e.l, a0
001F2E: 43f900ffa000     lea.l      $ffa000.l, a1
001F34: 4eb9000047aa     jsr        $47aa.l
001F3A: 203c6a000001     move.l     #$6a000001, d0
001F40: 223c94109300     move.l     #$94109300, d1
001F46: 243c96d09500     move.l     #$96d09500, d2
001F4C: 363c977f         move.w     #$977f, d3
001F50: 4eb900003980     jsr        $3980.l
001F56: 33fc000100ff0418 move.w     #$1, $ff0418.l
001F5E: 41fa00c8         lea.l      $2028(pc), a0
001F62: 43f900ff03e0     lea.l      $ff03e0.l, a1
001F68: 45fa00de         lea.l      $2048(pc), a2
001F6C: 47f900ff03a0     lea.l      $ff03a0.l, a3
001F72: 303c0007         move.w     #$7, d0
001F76: 22d8             move.l     (a0)+, (a1)+
001F78: 26da             move.l     (a2)+, (a3)+
001F7A: 51c8fffa         dbra       d0, $1f76
001F7E: 4eb900000642     jsr        $642.l
001F84: 4eb90000392e     jsr        $392e.l
001F8A: 13fc008f00ff0530 move.b     #$8f, $ff0530.l
001F92: 33fc004c00ff0406 move.w     #$4c, $ff0406.l
001F9A: 423900ff4202     clr.b      $ff4202.l
001FA0: 423900ff4203     clr.b      $ff4203.l
001FA6: 4e75             rts        

; ---- ДАННЫЕ $001FA8..$002068 (192 байт) ----

002068: 0c79004000ff0408 cmpi.w     #$40, $ff0408.l
002070: 6600003c         bne.w      $20ae
002074: 40e7             move.w     sr, -(a7)
002076: 007c0700         ori.w      #$700, sr
00207A: 33fc010000a11100 move.w     #$100, $a11100.l
002082: 0839000000a11100 btst.b     #$0, $a11100.l
00208A: 66f6             bne.b      $2082
00208C: 13fc00a800a01c0d move.b     #$a8, $a01c0d.l
002094: 13fc000c00a01c0e move.b     #$c, $a01c0e.l
00209C: 13fc000c00a01c0f move.b     #$c, $a01c0f.l
0020A4: 33fc000000a11100 move.w     #$0, $a11100.l
0020AC: 46df             move.w     (a7)+, sr
0020AE: 610000fc         bsr.w      $21ac
0020B2: 41f90003e47c     lea.l      $3e47c.l, a0
0020B8: 523900ff0500     addq.b     #$1, $ff0500.l
0020BE: 0839000400ff0500 btst.b     #$4, $ff0500.l
0020C6: 67000008         beq.w      $20d0
0020CA: 41f90003e4a0     lea.l      $3e4a0.l, a0
0020D0: 43f900ff8b16     lea.l      $ff8b16.l, a1
0020D6: 3e3c0011         move.w     #$11, d7
0020DA: 3c3c0000         move.w     #$0, d6
0020DE: 4ef900010fdc     jmp        $10fdc.l
0020E4: 427900ff0432     clr.w      $ff0432.l
0020EA: 33fc001000ff0406 move.w     #$10, $ff0406.l
0020F2: 4ef900003940     jmp        $3940.l

; ==== sub_0020F8 зовут=1 ====
0020F8: 41f900ffa000     lea.l      $ffa000.l, a0
0020FE: 3e3c017f         move.w     #$17f, d7
002102: 3010             move.w     (a0), d0
002104: 00408000         ori.w      #$8000, d0
002108: 30c0             move.w     d0, (a0)+
00210A: 51cffff6         dbra       d7, $2102

; ==== sub_00210E зовут=2 ====
00210E: 41f900ffa000     lea.l      $ffa000.l, a0
002114: 43f900ff8108     lea.l      $ff8108.l, a1
00211A: 3e3c001f         move.w     #$1f, d7
00211E: 3c3c000b         move.w     #$b, d6
002122: 4ef900010fdc     jmp        $10fdc.l

; ==== sub_002128 зовут=2 ====
002128: 41fa0022         lea.l      $214c(pc), a0
00212C: 43f900ff0000     lea.l      $ff0000.l, a1
002132: 7e0b             moveq      #$b, d7
002134: 32d8             move.w     (a0)+, (a1)+
002136: 3018             move.w     (a0)+, d0
002138: 3211             move.w     (a1), d1
00213A: 024100ff         andi.w     #$ff, d1
00213E: 8240             or.w       d0, d1
002140: 32c1             move.w     d1, (a1)+
002142: 32d8             move.w     (a0)+, (a1)+
002144: 32d8             move.w     (a0)+, (a1)+
002146: 51cfffec         dbra       d7, $2134
00214A: 4e75             rts        

; ---- ДАННЫЕ $00214C..$0021AC (96 байт) ----


; ==== sub_0021AC зовут=1 ====
0021AC: 537900ff050e     subq.w     #$1, $ff050e.l
0021B2: 66000018         bne.w      $21cc
0021B6: 6100f3d2         bsr.w      $158a
0021BA: 33fc00dc00ff050e move.w     #$dc, $ff050e.l
0021C2: 1e3c00a0         move.b     #$a0, d7
0021C6: 4eb900003d7a     jsr        $3d7a.l
0021CC: 7e2f             moveq      #$2f, d7
0021CE: 41f900ffa000     lea.l      $ffa000.l, a0
0021D4: 43f900ff0060     lea.l      $ff0060.l, a1
0021DA: 3f07             move.w     d7, -(a7)
0021DC: 2f08             move.l     a0, -(a7)
0021DE: 2f09             move.l     a1, -(a7)
0021E0: 6100001e         bsr.w      $2200
0021E4: 225f             movea.l    (a7)+, a1
0021E6: 205f             movea.l    (a7)+, a0
0021E8: 3e1f             move.w     (a7)+, d7
0021EA: 41e80028         lea.l      $28(a0), a0
0021EE: 43e90008         lea.l      $8(a1), a1
0021F2: 51cfffe6         dbra       d7, $21da
0021F6: 13fc000100ff040d move.b     #$1, $ff040d.l
0021FE: 4e75             rts        

; ==== sub_002200 зовут=1 ====
002200: 4251             clr.w      (a1)
002202: 4a680000         tst.w      $0(a0)
002206: 6b00003a         bmi.w      $2242
00220A: 67000038         beq.w      $2244
00220E: 53680000         subq.w     #$1, $0(a0)
002212: 6600002e         bne.w      $2242
002216: 316800020008     move.w     $2(a0), $8(a0)
00221C: 4268000a         clr.w      $a(a0)
002220: 31680006000c     move.w     $6(a0), $c(a0)
002226: 4268000e         clr.w      $e(a0)
00222A: 20280020         move.l     $20(a0), d0
00222E: 21400010         move.l     d0, $10(a0)
002232: 20280024         move.l     $24(a0), d0
002236: 21400014         move.l     d0, $14(a0)
00223A: 4268001a         clr.w      $1a(a0)
00223E: 4268001c         clr.w      $1c(a0)
002242: 4e75             rts        
002244: 0c680030001a     cmpi.w     #$30, $1a(a0)
00224A: 67000030         beq.w      $227c
00224E: 5268001a         addq.w     #$1, $1a(a0)

; ==== sub_002252 зовут=1 ====
002252: 20280008         move.l     $8(a0), d0
002256: d0a80010         add.l      $10(a0), d0
00225A: 21400008         move.l     d0, $8(a0)
00225E: 4840             swap       d0
002260: 3280             move.w     d0, (a1)
002262: 336800040004     move.w     $4(a0), $4(a1)
002268: 2028000c         move.l     $c(a0), d0
00226C: d0a80014         add.l      $14(a0), d0
002270: 2140000c         move.l     d0, $c(a0)
002274: 4840             swap       d0
002276: 33400006         move.w     d0, $6(a1)
00227A: 4e75             rts        
00227C: 06a8000008000010 addi.l     #$800, $10(a0)
002284: 61cc             bsr.b      $2252
002286: 0c510110         cmpi.w     #$110, (a1)
00228A: 6c000004         bge.w      $2290
00228E: 4e75             rts        
002290: 317cffff0000     move.w     #$ffff, $0(a0)
002296: 4e75             rts        

; ---- ДАННЫЕ $002298..$0022A8 (16 байт) ----


; ==== sub_0022A8 ТАБЛИЦА зовут=0 ====
0022A8: 007c0700         ori.w      #$700, sr
0022AC: 4eb90000064c     jsr        $64c.l
0022B2: 4eb9000004a2     jsr        $4a2.l
0022B8: 61001536         bsr.w      $37f0
0022BC: 33fc000100ff050e move.w     #$1, $ff050e.l
0022C4: 41f900ff0470     lea.l      $ff0470.l, a0
0022CA: 20bc00ff0490     move.l     #$ff0490, (a0)
0022D0: 217c00ff04900004 move.l     #$ff0490, $4(a0)
0022D8: 217c00ff04900008 move.l     #$ff0490, $8(a0)
0022E0: 217c00ff0490000c move.l     #$ff0490, $c(a0)
0022E8: 217c00ff04900010 move.l     #$ff0490, $10(a0)
0022F0: 217c00ff04900014 move.l     #$ff0490, $14(a0)
0022F8: 217c00ff04900018 move.l     #$ff0490, $18(a0)
002300: 217c00ff0490001c move.l     #$ff0490, $1c(a0)
002308: 7e07             moveq      #$7, d7
00230A: 43f900ffe00a     lea.l      $ffe00a.l, a1
002310: 3211             move.w     (a1), d1
002312: 0241000f         andi.w     #$f, d1
002316: 0c41000f         cmpi.w     #$f, d1
00231A: 6700000c         beq.w      $2328
00231E: 2009             move.l     a1, d0
002320: 5440             addq.w     #$2, d0
002322: 2080             move.l     d0, (a0)
002324: 41e80004         lea.l      $4(a0), a0
002328: 43e9000a         lea.l      $a(a1), a1
00232C: 51cfffe2         dbra       d7, $2310
002330: 13fc000100ff4010 move.b     #$1, $ff4010.l
002338: 13fc000200ff4011 move.b     #$2, $ff4011.l
002340: 13fc000300ff4012 move.b     #$3, $ff4012.l
002348: 13fc000400ff4013 move.b     #$4, $ff4013.l
002350: 13fc000500ff4014 move.b     #$5, $ff4014.l
002358: 13fc000100ff4030 move.b     #$1, $ff4030.l
002360: 13fc000200ff4031 move.b     #$2, $ff4031.l
002368: 13fc000300ff4032 move.b     #$3, $ff4032.l
002370: 13fc000400ff4033 move.b     #$4, $ff4033.l
002378: 13fc000500ff4034 move.b     #$5, $ff4034.l
002380: 41f900ff0470     lea.l      $ff0470.l, a0
002386: 43f900ff4018     lea.l      $ff4018.l, a1
00238C: 22d8             move.l     (a0)+, (a1)+
00238E: 22d8             move.l     (a0)+, (a1)+
002390: 22d8             move.l     (a0)+, (a1)+
002392: 22d8             move.l     (a0)+, (a1)+
002394: 2298             move.l     (a0)+, (a1)
002396: 427900ff0300     clr.w      $ff0300.l
00239C: 4dfa0184         lea.l      $2522(pc), a6
0023A0: 4eb90000067a     jsr        $67a.l
0023A6: 41f90006623c     lea.l      $6623c.l, a0
0023AC: 43f900ffa000     lea.l      $ffa000.l, a1
0023B2: 4eb9000047aa     jsr        $47aa.l
0023B8: 203c40000000     move.l     #$40000000, d0
0023BE: 223c941d9300     move.l     #$941d9300, d1
0023C4: 243c96d09500     move.l     #$96d09500, d2
0023CA: 363c977f         move.w     #$977f, d3
0023CE: 4eb900003980     jsr        $3980.l
0023D4: 41f900068ba6     lea.l      $68ba6.l, a0
0023DA: 43f900ffa000     lea.l      $ffa000.l, a1
0023E0: 4eb9000047aa     jsr        $47aa.l
0023E6: 41f900ffa000     lea.l      $ffa000.l, a0
0023EC: 43f900ff8000     lea.l      $ff8000.l, a1
0023F2: 3e3c0027         move.w     #$27, d7
0023F6: 3c3c001b         move.w     #$1b, d6
0023FA: 4eb900010fdc     jsr        $10fdc.l
002400: 47f90002d89e     lea.l      $2d89e.l, a3
002406: 7001             moveq      #$1, d0
002408: 4eb900003c9a     jsr        $3c9a.l
00240E: 203c40000001     move.l     #$40000001, d0
002414: 223c94049300     move.l     #$94049300, d1
00241A: 243c96d09500     move.l     #$96d09500, d2
002420: 363c977f         move.w     #$977f, d3
002424: 4eb900003980     jsr        $3980.l
00242A: 41f90003032a     lea.l      $3032a.l, a0
002430: 7001             moveq      #$1, d0
002432: 3e3c002d         move.w     #$2d, d7
002436: 4eb900003c74     jsr        $3c74.l
00243C: 203c48000001     move.l     #$48000001, d0
002442: 223c940b9380     move.l     #$940b9380, d1
002448: 243c96d09500     move.l     #$96d09500, d2
00244E: 363c977f         move.w     #$977f, d3
002452: 4eb900003980     jsr        $3980.l
002458: 41f9000308ea     lea.l      $308ea.l, a0
00245E: 7001             moveq      #$1, d0
002460: 3e3c001a         move.w     #$1a, d7
002464: 4eb900003c74     jsr        $3c74.l
00246A: 203c60000001     move.l     #$60000001, d0
002470: 223c940693c0     move.l     #$940693c0, d1
002476: 243c96d09500     move.l     #$96d09500, d2
00247C: 363c977f         move.w     #$977f, d3
002480: 4eb900003980     jsr        $3980.l
002486: 41f90006b750     lea.l      $6b750.l, a0
00248C: 43f900ffa000     lea.l      $ffa000.l, a1
002492: 4eb9000047aa     jsr        $47aa.l
002498: 203c6d800001     move.l     #$6d800001, d0
00249E: 223c94029300     move.l     #$94029300, d1
0024A4: 243c96d09500     move.l     #$96d09500, d2
0024AA: 363c977f         move.w     #$977f, d3
0024AE: 4eb900003980     jsr        $3980.l
0024B4: 33fc000400ff0416 move.w     #$4, $ff0416.l
0024BC: 6100130a         bsr.w      $37c8
0024C0: 4eb900000642     jsr        $642.l
0024C6: 33fc001400ff0406 move.w     #$14, $ff0406.l
0024CE: 303900ff4106     move.w     $ff4106.l, d0
0024D4: 41fa0044         lea.l      $251a(pc), a0
0024D8: 7200             moveq      #$0, d1
0024DA: 12300000         move.b     (a0, d0.w), d1
0024DE: b27900ff043a     cmp.w      $ff043a.l, d1
0024E4: 6f000008         ble.w      $24ee
0024E8: 427900ff4106     clr.w      $ff4106.l
0024EE: 33f900ff410600ff0500 move.w     $ff4106.l, $ff0500.l
0024F8: 33fc000400ff0502 move.w     #$4, $ff0502.l
002500: 427900ff0504     clr.w      $ff0504.l
002506: 610001a4         bsr.w      $26ac
00250A: 4eb90000392e     jsr        $392e.l
002510: 1e3c0082         move.b     #$82, d7
002514: 4ef900003d7a     jmp        $3d7a.l

; ---- ДАННЫЕ $00251A..$0025A4 (138 байт) ----


; ==== sub_0025A4 ТАБЛИЦА зовут=0 ====
0025A4: 61000746         bsr.w      $2cec
0025A8: 103900ffe00d     move.b     $ffe00d.l, d0
0025AE: 020000f0         andi.b     #$f0, d0
0025B2: 670000e0         beq.w      $2694
0025B6: 1e3c00a3         move.b     #$a3, d7
0025BA: 4eb900003d7a     jsr        $3d7a.l
0025C0: 303900ff0500     move.w     $ff0500.l, d0
0025C6: 0c400007         cmpi.w     #$7, d0
0025CA: 6600002c         bne.w      $25f8
0025CE: 4eb90000079e     jsr        $79e.l
0025D4: 13fc000000ff410a move.b     #$0, $ff410a.l
0025DC: 13fc000000ff410b move.b     #$0, $ff410b.l
0025E4: 13fc000000ff410c move.b     #$0, $ff410c.l
0025EC: 33fc000700ff4106 move.w     #$7, $ff4106.l
0025F4: 60000524         bra.w      $2b1a
0025F8: 427900ff0432     clr.w      $ff0432.l
0025FE: 33fc001800ff0406 move.w     #$18, $ff0406.l
002606: 423900ff0458     clr.b      $ff0458.l
00260C: 33c000ff4106     move.w     d0, $ff4106.l
002612: e340             asl.w      #$1, d0
002614: 41fa0086         lea.l      $269c(pc), a0
002618: 30300000         move.w     (a0, d0.w), d0
00261C: 0c400001         cmpi.w     #$1, d0
002620: 67000008         beq.w      $262a
002624: 423900ff0459     clr.b      $ff0459.l
00262A: 33c000ff0418     move.w     d0, $ff0418.l
002630: 6600000a         bne.w      $263c
002634: 33fc002800ff0406 move.w     #$28, $ff0406.l
00263C: 41f900ffe100     lea.l      $ffe100.l, a0
002642: 7000             moveq      #$0, d0
002644: 303900ff0418     move.w     $ff0418.l, d0
00264A: e940             asl.w      #$4, d0
00264C: d1c0             adda.l     d0, a0
00264E: 43f900ff0460     lea.l      $ff0460.l, a1
002654: 7e0f             moveq      #$f, d7
002656: 12d8             move.b     (a0)+, (a1)+
002658: 51cffffc         dbra       d7, $2656
00265C: 13fc000100ff4038 move.b     #$1, $ff4038.l
002664: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00266C: 67000014         beq.w      $2682
002670: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
002678: 67000008         beq.w      $2682
00267C: 423900ff4038     clr.b      $ff4038.l
002682: 4eb900003940     jsr        $3940.l
002688: 427900ff0416     clr.w      $ff0416.l
00268E: 4ef90000079e     jmp        $79e.l
002694: 610000b4         bsr.w      $274a
002698: 60000012         bra.w      $26ac

; ---- ДАННЫЕ $00269C..$0026AC (16 байт) ----


; ==== sub_0026AC зовут=1 ====
0026AC: 7000             moveq      #$0, d0
0026AE: 41fa0082         lea.l      $2732(pc), a0
0026B2: 45fa008e         lea.l      $2742(pc), a2
0026B6: 6100000e         bsr.w      $26c6
0026BA: 5240             addq.w     #$1, d0
0026BC: 0c400008         cmpi.w     #$8, d0
0026C0: 66f4             bne.b      $26b6
0026C2: 600001ac         bra.w      $2870

; ==== sub_0026C6 зовут=1 ====
0026C6: 7200             moveq      #$0, d1
0026C8: 3218             move.w     (a0)+, d1
0026CA: 43f900ff8000     lea.l      $ff8000.l, a1
0026D0: d3c1             adda.l     d1, a1
0026D2: 343c6000         move.w     #$6000, d2
0026D6: b07900ff0500     cmp.w      $ff0500.l, d0
0026DC: 67000038         beq.w      $2716
0026E0: 0c400006         cmpi.w     #$6, d0
0026E4: 66000018         bne.w      $26fe
0026E8: 343c0000         move.w     #$0, d2
0026EC: 4a7900ff050e     tst.w      $ff050e.l
0026F2: 67000022         beq.w      $2716
0026F6: 343c2000         move.w     #$2000, d2
0026FA: 6000001a         bra.w      $2716
0026FE: 343c0000         move.w     #$0, d2
002702: 7800             moveq      #$0, d4
002704: 18320000         move.b     (a2, d0.w), d4
002708: b87900ff043a     cmp.w      $ff043a.l, d4
00270E: 6f000006         ble.w      $2716
002712: 343c2000         move.w     #$2000, d2
002716: 7806             moveq      #$6, d4
002718: 7606             moveq      #$6, d3
00271A: 3211             move.w     (a1), d1
00271C: 02419fff         andi.w     #$9fff, d1
002720: 8242             or.w       d2, d1
002722: 32c1             move.w     d1, (a1)+
002724: 51cbfff4         dbra       d3, $271a
002728: 43e90072         lea.l      $72(a1), a1
00272C: 51ccffea         dbra       d4, $2718
002730: 4e75             rts        

; ---- ДАННЫЕ $002732..$00274A (24 байт) ----


; ==== sub_00274A зовут=1 ====
00274A: 41fa006c         lea.l      $27b8(pc), a0
00274E: 303900ff043a     move.w     $ff043a.l, d0
002754: e540             asl.w      #$2, d0
002756: 20700000         movea.l    (a0, d0.w), a0
00275A: 7000             moveq      #$0, d0
00275C: 303900ff0500     move.w     $ff0500.l, d0
002762: e540             asl.w      #$2, d0
002764: d1c0             adda.l     d0, a0
002766: 7200             moveq      #$0, d1
002768: 0839000300ffe00d btst.b     #$3, $ffe00d.l
002770: 6600002e         bne.w      $27a0
002774: 7201             moveq      #$1, d1
002776: 0839000200ffe00d btst.b     #$2, $ffe00d.l
00277E: 66000020         bne.w      $27a0
002782: 7202             moveq      #$2, d1
002784: 0839000100ffe00d btst.b     #$1, $ffe00d.l
00278C: 66000012         bne.w      $27a0
002790: 7203             moveq      #$3, d1
002792: 0839000000ffe00d btst.b     #$0, $ffe00d.l
00279A: 66000004         bne.w      $27a0
00279E: 4e75             rts        
0027A0: 7000             moveq      #$0, d0
0027A2: 10301000         move.b     (a0, d1.w), d0
0027A6: 33c000ff0500     move.w     d0, $ff0500.l
0027AC: 1e3c00c6         move.b     #$c6, d7
0027B0: 4eb900003d7a     jsr        $3d7a.l
0027B6: 4e75             rts        

; ---- ДАННЫЕ $0027B8..$0027D0 (24 байт) ----


; ==== sub_0027D0 ТАБЛИЦА зовут=0 ====
0027D0: 0707             btst.l     d3, d7
0027D2: 0707             btst.l     d3, d7
0027D4: 00000000         ori.b      #$0, d0
0027D8: 00000000         ori.b      #$0, d0
0027DC: 00000000         ori.b      #$0, d0
0027E0: 00000000         ori.b      #$0, d0
0027E4: 00000000         ori.b      #$0, d0
0027E8: 00000000         ori.b      #$0, d0
0027EC: 00000000         ori.b      #$0, d0
0027F0: 0101             btst.l     d0, d1
0027F2: 0707             btst.l     d3, d7
0027F4: 00000707         ori.b      #$7, d0
0027F8: 00000000         ori.b      #$0, d0
0027FC: 00000000         ori.b      #$0, d0
002800: 00000000         ori.b      #$0, d0
002804: 00000000         ori.b      #$0, d0
002808: 00000000         ori.b      #$0, d0
00280C: 00010101         ori.b      #$1, d1
002810: 0103             btst.l     d0, d3
002812: 0707             btst.l     d3, d7
002814: 02000707         andi.b     #$7, d0
002818: 0301             btst.l     d1, d1
00281A: 0707             btst.l     d3, d7
00281C: 00020707         ori.b      #$7, d2
002820: 00000000         ori.b      #$0, d0
002824: 00000000         ori.b      #$0, d0
002828: 00000000         ori.b      #$0, d0
00282C: 00010303         ori.b      #$3, d1
002830: 0103             btst.l     d0, d3
002832: 04040200         subi.b     #$0, d4
002836: 04040301         subi.b     #$1, d4
00283A: 0707             btst.l     d3, d7
00283C: 00020707         ori.b      #$7, d2
002840: 0707             btst.l     d3, d7
002842: 00000000         ori.b      #$0, d0
002846: 00000704         ori.b      #$4, d0
00284A: 02020404         andi.b     #$4, d2
00284E: 0303             btst.l     d1, d3
002850: 0103             btst.l     d0, d3
002852: 04040200         subi.b     #$0, d4
002856: 0505             btst.l     d2, d5
002858: 0301             btst.l     d1, d1
00285A: 0505             btst.l     d2, d5
00285C: 00020707         ori.b      #$7, d2
002860: 0507             btst.l     d2, d7
002862: 00000704         ori.b      #$4, d0
002866: 0101             btst.l     d0, d1
002868: 0705             btst.l     d3, d5
00286A: 02020405         andi.b     #$5, d2
00286E: 0303             btst.l     d1, d3
002870: 41fa0028         lea.l      $289a(pc), a0
002874: 7000             moveq      #$0, d0
002876: 303900ff0500     move.w     $ff0500.l, d0
00287C: e940             asl.w      #$4, d0
00287E: 3200             move.w     d0, d1
002880: e540             asl.w      #$2, d0
002882: d041             add.w      d1, d0
002884: d1c0             adda.l     d0, a0
002886: 43f900ff8394     lea.l      $ff8394.l, a1
00288C: 3e3c0013         move.w     #$13, d7
002890: 3c3c0001         move.w     #$1, d6
002894: 4ef900010fdc     jmp        $10fdc.l

; ---- ДАННЫЕ $00289A..$002B1A (640 байт) ----

002B1A: 427900ff0500     clr.w      $ff0500.l
002B20: 4eb900003940     jsr        $3940.l
002B26: 41f900ffa000     lea.l      $ffa000.l, a0
002B2C: 303c037f         move.w     #$37f, d0
002B30: 4298             clr.l      (a0)+
002B32: 51c8fffc         dbra       d0, $2b30
002B36: 41f900068eb8     lea.l      $68eb8.l, a0
002B3C: 43f900ffa000     lea.l      $ffa000.l, a1
002B42: 4eb9000047aa     jsr        $47aa.l
002B48: 41f900ffa000     lea.l      $ffa000.l, a0
002B4E: 43f900ff8000     lea.l      $ff8000.l, a1
002B54: 3e3c0027         move.w     #$27, d7
002B58: 3c3c001b         move.w     #$1b, d6
002B5C: 4eb900010fdc     jsr        $10fdc.l
002B62: 427900ff0300     clr.w      $ff0300.l
002B68: 4df9000032b2     lea.l      $32b2.l, a6
002B6E: 4eb90000067a     jsr        $67a.l
002B74: 610000d4         bsr.w      $2c4a
002B78: 610001d4         bsr.w      $2d4e
002B7C: 33fc000800ff0412 move.w     #$8, $ff0412.l
002B84: 4eb90000392e     jsr        $392e.l
002B8A: 4eb900000ee2     jsr        $ee2.l
002B90: 6100015a         bsr.w      $2cec
002B94: 6100003a         bsr.w      $2bd0
002B98: 610000b0         bsr.w      $2c4a
002B9C: 610001b0         bsr.w      $2d4e
002BA0: 0c400001         cmpi.w     #$1, d0
002BA4: 670004ca         beq.w      $3070
002BA8: 0c400002         cmpi.w     #$2, d0
002BAC: 6700092c         beq.w      $34da
002BB0: 0c400003         cmpi.w     #$3, d0
002BB4: 67000004         beq.w      $2bba
002BB8: 60d0             bra.b      $2b8a
002BBA: 4eb900003940     jsr        $3940.l
002BC0: 427900ff0412     clr.w      $ff0412.l
002BC6: 33fc001000ff0406 move.w     #$10, $ff0406.l
002BCE: 4e75             rts        

; ==== sub_002BD0 зовут=1 ====
002BD0: 7000             moveq      #$0, d0
002BD2: 0839000300ffe00d btst.b     #$3, $ffe00d.l
002BDA: 6600002e         bne.w      $2c0a
002BDE: 7001             moveq      #$1, d0
002BE0: 0839000200ffe00d btst.b     #$2, $ffe00d.l
002BE8: 66000020         bne.w      $2c0a
002BEC: 7002             moveq      #$2, d0
002BEE: 0839000000ffe00d btst.b     #$0, $ffe00d.l
002BF6: 66000012         bne.w      $2c0a
002BFA: 7003             moveq      #$3, d0
002BFC: 0839000100ffe00d btst.b     #$1, $ffe00d.l
002C04: 66000004         bne.w      $2c0a
002C08: 4e75             rts        
002C0A: 41fa0026         lea.l      $2c32(pc), a0
002C0E: 7200             moveq      #$0, d1
002C10: 323900ff0500     move.w     $ff0500.l, d1
002C16: e541             asl.w      #$2, d1
002C18: d240             add.w      d0, d1
002C1A: 7000             moveq      #$0, d0
002C1C: 10301000         move.b     (a0, d1.w), d0
002C20: 33c000ff0500     move.w     d0, $ff0500.l
002C26: 1e3c00c6         move.b     #$c6, d7
002C2A: 4eb900003d7a     jsr        $3d7a.l
002C30: 4e75             rts        

; ---- ДАННЫЕ $002C32..$002C4A (24 байт) ----


; ==== sub_002C4A зовут=2 ====
002C4A: 7000             moveq      #$0, d0
002C4C: 6100000c         bsr.w      $2c5a
002C50: 5240             addq.w     #$1, d0
002C52: 0c400006         cmpi.w     #$6, d0
002C56: 66f4             bne.b      $2c4c
002C58: 4e75             rts        

; ==== sub_002C5A зовут=1 ====
002C5A: 323c0000         move.w     #$0, d1
002C5E: b07900ff0500     cmp.w      $ff0500.l, d0
002C64: 66000006         bne.w      $2c6c
002C68: 323c6000         move.w     #$6000, d1
002C6C: 41fa0072         lea.l      $2ce0(pc), a0
002C70: 7400             moveq      #$0, d2
002C72: 3400             move.w     d0, d2
002C74: e342             asl.w      #$1, d2
002C76: 34302000         move.w     (a0, d2.w), d2
002C7A: 41f900ff8000     lea.l      $ff8000.l, a0
002C80: d1c2             adda.l     d2, a0
002C82: 7e06             moveq      #$6, d7
002C84: 2f08             move.l     a0, -(a7)
002C86: 3410             move.w     (a0), d2
002C88: 02429fff         andi.w     #$9fff, d2
002C8C: 8441             or.w       d1, d2
002C8E: 30c2             move.w     d2, (a0)+
002C90: 51cffff4         dbra       d7, $2c86
002C94: 205f             movea.l    (a7)+, a0
002C96: 2f08             move.l     a0, -(a7)
002C98: 7e06             moveq      #$6, d7
002C9A: 3410             move.w     (a0), d2
002C9C: 02429fff         andi.w     #$9fff, d2
002CA0: 8441             or.w       d1, d2
002CA2: 3082             move.w     d2, (a0)
002CA4: 41e80080         lea.l      $80(a0), a0
002CA8: 51cffff0         dbra       d7, $2c9a
002CAC: 205f             movea.l    (a7)+, a0
002CAE: 2f08             move.l     a0, -(a7)
002CB0: 41e8000c         lea.l      $c(a0), a0
002CB4: 7e06             moveq      #$6, d7
002CB6: 3410             move.w     (a0), d2
002CB8: 02429fff         andi.w     #$9fff, d2
002CBC: 8441             or.w       d1, d2
002CBE: 3082             move.w     d2, (a0)
002CC0: 41e80080         lea.l      $80(a0), a0
002CC4: 51cffff0         dbra       d7, $2cb6
002CC8: 205f             movea.l    (a7)+, a0
002CCA: 41e80300         lea.l      $300(a0), a0
002CCE: 7e06             moveq      #$6, d7
002CD0: 3410             move.w     (a0), d2
002CD2: 02429fff         andi.w     #$9fff, d2
002CD6: 8441             or.w       d1, d2
002CD8: 30c2             move.w     d2, (a0)+
002CDA: 51cffff4         dbra       d7, $2cd0
002CDE: 4e75             rts        

; ---- ДАННЫЕ $002CE0..$002CEC (12 байт) ----


; ==== sub_002CEC зовут=2 ====
002CEC: 537900ff0502     subq.w     #$1, $ff0502.l
002CF2: 66000032         bne.w      $2d26
002CF6: 33fc000400ff0502 move.w     #$4, $ff0502.l
002CFE: 303900ff0370     move.w     $ff0370.l, d0
002D04: 33f900ff037200ff0370 move.w     $ff0372.l, $ff0370.l
002D0E: 33f900ff037400ff0372 move.w     $ff0374.l, $ff0372.l
002D18: 33c000ff0374     move.w     d0, $ff0374.l
002D1E: 13fc000100ff0400 move.b     #$1, $ff0400.l
002D26: 4e75             rts        

; ==== sub_002D28 зовут=3 ====
002D28: 7000             moveq      #$0, d0
002D2A: 1018             move.b     (a0)+, d0
002D2C: 06400240         addi.w     #$240, d0
002D30: 3280             move.w     d0, (a1)
002D32: 5240             addq.w     #$1, d0
002D34: 33400080         move.w     d0, $80(a1)
002D38: 5240             addq.w     #$1, d0
002D3A: 33400002         move.w     d0, $2(a1)
002D3E: 5240             addq.w     #$1, d0
002D40: 33400082         move.w     d0, $82(a1)
002D44: 43e90004         lea.l      $4(a1), a1
002D48: 51cfffde         dbra       d7, $2d28
002D4C: 4e75             rts        

; ==== sub_002D4E зовут=2 ====
002D4E: 61000872         bsr.w      $35c2
002D52: 6100002e         bsr.w      $2d82
002D56: 7000             moveq      #$0, d0
002D58: 303900ff0500     move.w     $ff0500.l, d0
002D5E: e540             asl.w      #$2, d0
002D60: 43fa0008         lea.l      $2d6a(pc), a1
002D64: 22710000         movea.l    (a1, d0.w), a1
002D68: 4ed1             jmp        (a1)

; ---- ДАННЫЕ $002D6A..$002D82 (24 байт) ----


; ==== sub_002D82 зовут=1 ====
002D82: 41f900ff8896     lea.l      $ff8896.l, a0
002D88: 43f900ff8916     lea.l      $ff8916.l, a1
002D8E: 7012             moveq      #$12, d0
002D90: 30fc0240         move.w     #$240, (a0)+
002D94: 32fc0240         move.w     #$240, (a1)+
002D98: 51c8fff6         dbra       d0, $2d90
002D9C: 4e75             rts        

; ==== sub_002D9E ТАБЛИЦА зовут=0 ====
002D9E: 0839000600ffe00d btst.b     #$6, $ffe00d.l
002DA6: 67000014         beq.w      $2dbc
002DAA: 0c39000000ff410a cmpi.b     #$0, $ff410a.l
002DB2: 67000008         beq.w      $2dbc
002DB6: 533900ff410a     subq.b     #$1, $ff410a.l
002DBC: 0839000400ffe00d btst.b     #$4, $ffe00d.l
002DC4: 67000014         beq.w      $2dda
002DC8: 0c39001d00ff410a cmpi.b     #$1d, $ff410a.l
002DD0: 67000008         beq.w      $2dda
002DD4: 523900ff410a     addq.b     #$1, $ff410a.l
002DDA: 0839000500ffe00d btst.b     #$5, $ffe00d.l
002DE2: 6700003a         beq.w      $2e1e
002DE6: 7000             moveq      #$0, d0
002DE8: 103900ff410a     move.b     $ff410a.l, d0
002DEE: 41fa0010         lea.l      $2e00(pc), a0
002DF2: 10300000         move.b     (a0, d0.w), d0
002DF6: 13c000ff0530     move.b     d0, $ff0530.l
002DFC: 60000020         bra.w      $2e1e

; ---- ДАННЫЕ $002E00..$002E1E (30 байт) ----

002E1E: 41fa0050         lea.l      $2e70(pc), a0
002E22: 43f900ff8896     lea.l      $ff8896.l, a1
002E28: 7e05             moveq      #$5, d7
002E2A: 6100fefc         bsr.w      $2d28
002E2E: 41fa0046         lea.l      $2e76(pc), a0
002E32: 43f900ff88ae     lea.l      $ff88ae.l, a1
002E38: 7e01             moveq      #$1, d7
002E3A: 7c01             moveq      #$1, d6
002E3C: 4eb900010fdc     jsr        $10fdc.l
002E42: 41f900ff88b2     lea.l      $ff88b2.l, a0
002E48: 7000             moveq      #$0, d0
002E4A: 103900ff410a     move.b     $ff410a.l, d0
002E50: e808             lsr.b      #$4, d0
002E52: 6100002a         bsr.w      $2e7e
002E56: 41f900ff88b6     lea.l      $ff88b6.l, a0
002E5C: 7000             moveq      #$0, d0
002E5E: 103900ff410a     move.b     $ff410a.l, d0
002E64: 0240000f         andi.w     #$f, d0
002E68: 61000014         bsr.w      $2e7e
002E6C: 7000             moveq      #$0, d0
002E6E: 4e75             rts        

; ---- ДАННЫЕ $002E70..$002E7E (14 байт) ----


; ==== sub_002E7E зовут=6 ====
002E7E: e540             asl.w      #$2, d0
002E80: 06400200         addi.w     #$200, d0
002E84: 3080             move.w     d0, (a0)
002E86: 5240             addq.w     #$1, d0
002E88: 31400080         move.w     d0, $80(a0)
002E8C: 5240             addq.w     #$1, d0
002E8E: 31400002         move.w     d0, $2(a0)
002E92: 5240             addq.w     #$1, d0
002E94: 31400082         move.w     d0, $82(a0)
002E98: 4e75             rts        

; ==== sub_002E9A ТАБЛИЦА зовут=0 ====
002E9A: 0839000600ffe00d btst.b     #$6, $ffe00d.l
002EA2: 67000014         beq.w      $2eb8
002EA6: 0c39000000ff410b cmpi.b     #$0, $ff410b.l
002EAE: 67000008         beq.w      $2eb8
002EB2: 533900ff410b     subq.b     #$1, $ff410b.l
002EB8: 0839000400ffe00d btst.b     #$4, $ffe00d.l
002EC0: 67000014         beq.w      $2ed6
002EC4: 0c39003300ff410b cmpi.b     #$33, $ff410b.l
002ECC: 67000008         beq.w      $2ed6
002ED0: 523900ff410b     addq.b     #$1, $ff410b.l
002ED6: 0839000500ffe00d btst.b     #$5, $ffe00d.l
002EDE: 67000050         beq.w      $2f30
002EE2: 7000             moveq      #$0, d0
002EE4: 103900ff410b     move.b     $ff410b.l, d0
002EEA: 41fa0010         lea.l      $2efc(pc), a0
002EEE: 10300000         move.b     (a0, d0.w), d0
002EF2: 13c000ff0530     move.b     d0, $ff0530.l
002EF8: 60000036         bra.w      $2f30

; ---- ДАННЫЕ $002EFC..$002F30 (52 байт) ----

002F30: 41fa0050         lea.l      $2f82(pc), a0
002F34: 43f900ff8896     lea.l      $ff8896.l, a1
002F3A: 7e05             moveq      #$5, d7
002F3C: 6100fdea         bsr.w      $2d28
002F40: 41faff34         lea.l      $2e76(pc), a0
002F44: 43f900ff88ae     lea.l      $ff88ae.l, a1
002F4A: 7e01             moveq      #$1, d7
002F4C: 7c01             moveq      #$1, d6
002F4E: 4eb900010fdc     jsr        $10fdc.l
002F54: 41f900ff88b2     lea.l      $ff88b2.l, a0
002F5A: 7000             moveq      #$0, d0
002F5C: 103900ff410b     move.b     $ff410b.l, d0
002F62: e808             lsr.b      #$4, d0
002F64: 6100ff18         bsr.w      $2e7e
002F68: 41f900ff88b6     lea.l      $ff88b6.l, a0
002F6E: 7000             moveq      #$0, d0
002F70: 103900ff410b     move.b     $ff410b.l, d0
002F76: 0240000f         andi.w     #$f, d0
002F7A: 6100ff02         bsr.w      $2e7e
002F7E: 7000             moveq      #$0, d0
002F80: 4e75             rts        

; ---- ДАННЫЕ $002F82..$002F88 (6 байт) ----


; ==== sub_002F88 ТАБЛИЦА зовут=0 ====
002F88: 0839000600ffe00d btst.b     #$6, $ffe00d.l
002F90: 67000014         beq.w      $2fa6
002F94: 0c39000000ff410c cmpi.b     #$0, $ff410c.l
002F9C: 67000008         beq.w      $2fa6
002FA0: 533900ff410c     subq.b     #$1, $ff410c.l
002FA6: 0839000400ffe00d btst.b     #$4, $ffe00d.l
002FAE: 67000014         beq.w      $2fc4
002FB2: 0c39000500ff410c cmpi.b     #$5, $ff410c.l
002FBA: 67000008         beq.w      $2fc4
002FBE: 523900ff410c     addq.b     #$1, $ff410c.l
002FC4: 0839000500ffe00d btst.b     #$5, $ffe00d.l
002FCC: 67000022         beq.w      $2ff0
002FD0: 7000             moveq      #$0, d0
002FD2: 103900ff410c     move.b     $ff410c.l, d0
002FD8: 41fa0010         lea.l      $2fea(pc), a0
002FDC: 10300000         move.b     (a0, d0.w), d0
002FE0: 13c000ff0530     move.b     d0, $ff0530.l
002FE6: 60000008         bra.w      $2ff0

; ---- ДАННЫЕ $002FEA..$002FF0 (6 байт) ----

002FF0: 41fa003c         lea.l      $302e(pc), a0
002FF4: 43f900ff8896     lea.l      $ff8896.l, a1
002FFA: 7e04             moveq      #$4, d7
002FFC: 6100fd2a         bsr.w      $2d28
003000: 41f900ff88b4     lea.l      $ff88b4.l, a0
003006: 7000             moveq      #$0, d0
003008: 103900ff410c     move.b     $ff410c.l, d0
00300E: e808             lsr.b      #$4, d0
003010: 6100fe6c         bsr.w      $2e7e
003014: 41f900ff88b8     lea.l      $ff88b8.l, a0
00301A: 7000             moveq      #$0, d0
00301C: 103900ff410c     move.b     $ff410c.l, d0
003022: 0240000f         andi.w     #$f, d0
003026: 6100fe56         bsr.w      $2e7e
00302A: 7000             moveq      #$0, d0
00302C: 4e75             rts        

; ---- ДАННЫЕ $00302E..$003034 (6 байт) ----


; ==== sub_003034 ТАБЛИЦА зовут=0 ====
003034: 7000             moveq      #$0, d0
003036: 123900ffe00d     move.b     $ffe00d.l, d1
00303C: 020100f0         andi.b     #$f0, d1
003040: 6700002c         beq.w      $306e
003044: 7001             moveq      #$1, d0
003046: 4e75             rts        

; ==== sub_003048 ТАБЛИЦА зовут=0 ====
003048: 7000             moveq      #$0, d0
00304A: 123900ffe00d     move.b     $ffe00d.l, d1
003050: 020100f0         andi.b     #$f0, d1
003054: 67000018         beq.w      $306e
003058: 7002             moveq      #$2, d0
00305A: 4e75             rts        

; ==== sub_00305C ТАБЛИЦА зовут=0 ====
00305C: 7000             moveq      #$0, d0
00305E: 123900ffe00d     move.b     $ffe00d.l, d1
003064: 020100f0         andi.b     #$f0, d1
003068: 67000004         beq.w      $306e
00306C: 7003             moveq      #$3, d0
00306E: 4e75             rts        
003070: 4eb900003940     jsr        $3940.l
003076: 41f900069142     lea.l      $69142.l, a0
00307C: 43f900ffa000     lea.l      $ffa000.l, a1
003082: 4eb9000047aa     jsr        $47aa.l
003088: 41f900ffa000     lea.l      $ffa000.l, a0
00308E: 43f900ff8000     lea.l      $ff8000.l, a1
003094: 3e3c0027         move.w     #$27, d7
003098: 3c3c001b         move.w     #$1b, d6
00309C: 4eb900010fdc     jsr        $10fdc.l
0030A2: 427900ff0300     clr.w      $ff0300.l
0030A8: 4df9000032b2     lea.l      $32b2.l, a6
0030AE: 4eb90000067a     jsr        $67a.l
0030B4: 4df900003334     lea.l      $3334.l, a6
0030BA: 4eb90000067a     jsr        $67a.l
0030C0: 303900ff043a     move.w     $ff043a.l, d0
0030C6: 7200             moveq      #$0, d1
0030C8: 41fa01d4         lea.l      $329e(pc), a0
0030CC: 4a40             tst.w      d0
0030CE: 67000054         beq.w      $3124
0030D2: 22701000         movea.l    (a0, d1.w), a1
0030D6: 5841             addq.w     #$4, d1
0030D8: 7c07             moveq      #$7, d6
0030DA: 7e06             moveq      #$6, d7
0030DC: 3411             move.w     (a1), d2
0030DE: 02429fff         andi.w     #$9fff, d2
0030E2: 32c2             move.w     d2, (a1)+
0030E4: 51cffff6         dbra       d7, $30dc
0030E8: 43e90072         lea.l      $72(a1), a1
0030EC: 5346             subq.w     #$1, d6
0030EE: 66ea             bne.b      $30da
0030F0: 5340             subq.w     #$1, d0
0030F2: 66de             bne.b      $30d2
0030F4: 4eb900003952     jsr        $3952.l
0030FA: 23fc0101010100ffa000 move.l     #$1010101, $ffa000.l
003104: 13fc000100ffa004 move.b     #$1, $ffa004.l
00310C: 41f900ffa000     lea.l      $ffa000.l, a0
003112: 303900ff043a     move.w     $ff043a.l, d0
003118: 4a40             tst.w      d0
00311A: 67000008         beq.w      $3124
00311E: 4218             clr.b      (a0)+
003120: 5340             subq.w     #$1, d0
003122: 66fa             bne.b      $311e
003124: 303900ff0500     move.w     $ff0500.l, d0
00312A: 3f00             move.w     d0, -(a7)
00312C: 4eb9000035c2     jsr        $35c2.l
003132: 301f             move.w     (a7)+, d0
003134: 33c000ff0500     move.w     d0, $ff0500.l
00313A: 33fc000800ff0412 move.w     #$8, $ff0412.l
003142: 4eb90000392e     jsr        $392e.l
003148: 427900ff0510     clr.w      $ff0510.l
00314E: 61000230         bsr.w      $3380
003152: 0c79003800ff0510 cmpi.w     #$38, $ff0510.l
00315A: 67000310         beq.w      $346c
00315E: 6100004c         bsr.w      $31ac
003162: 13fc000100ff040d move.b     #$1, $ff040d.l
00316A: 41f900ffa000     lea.l      $ffa000.l, a0
003170: 7000             moveq      #$0, d0
003172: 7e04             moveq      #$4, d7
003174: 4a18             tst.b      (a0)+
003176: 67000004         beq.w      $317c
00317A: 5240             addq.w     #$1, d0
00317C: 51cffff6         dbra       d7, $3174
003180: 0c000005         cmpi.b     #$5, d0
003184: 6700000a         beq.w      $3190
003188: 4eb900000ee2     jsr        $ee2.l
00318E: 60be             bra.b      $314e
003190: 7e0a             moveq      #$a, d7
003192: 3f07             move.w     d7, -(a7)
003194: 4eb900000ee2     jsr        $ee2.l
00319A: 3e1f             move.w     (a7)+, d7
00319C: 51cffff4         dbra       d7, $3192
0031A0: 33fc000300ff0500 move.w     #$3, $ff0500.l
0031A8: 6000f976         bra.w      $2b20

; ==== sub_0031AC зовут=1 ====
0031AC: 61000076         bsr.w      $3224
0031B0: 43f900ff0000     lea.l      $ff0000.l, a1
0031B6: 7800             moveq      #$0, d4
0031B8: 41fa00c0         lea.l      $327a(pc), a0
0031BC: 30304000         move.w     (a0, d4.w), d0
0031C0: 32304002         move.w     $2(a0, d4.w), d1
0031C4: 61000042         bsr.w      $3208
0031C8: 5844             addq.w     #$4, d4
0031CA: 0c440014         cmpi.w     #$14, d4
0031CE: 66e8             bne.b      $31b8
0031D0: 41f900ff0000     lea.l      $ff0000.l, a0
0031D6: 43f900ff0470     lea.l      $ff0470.l, a1
0031DC: 47f900ffa000     lea.l      $ffa000.l, a3
0031E2: 7604             moveq      #$4, d3
0031E4: 2459             movea.l    (a1)+, a2
0031E6: 1012             move.b     (a2), d0
0031E8: 4a1b             tst.b      (a3)+
0031EA: 67000004         beq.w      $31f0
0031EE: 7000             moveq      #$0, d0
0031F0: 7206             moveq      #$6, d1
0031F2: e208             lsr.b      #$1, d0
0031F4: 65000004         bcs.w      $31fa
0031F8: 4250             clr.w      (a0)
0031FA: 41e80008         lea.l      $8(a0), a0
0031FE: 51c9fff2         dbra       d1, $31f2
003202: 51cbffe0         dbra       d3, $31e4
003206: 4e75             rts        

; ==== sub_003208 зовут=1 ====
003208: 41fa014c         lea.l      $3356(pc), a0
00320C: 7606             moveq      #$6, d3
00320E: 3418             move.w     (a0)+, d2
003210: d440             add.w      d0, d2
003212: 32c2             move.w     d2, (a1)+
003214: 3419             move.w     (a1)+, d2
003216: 32d8             move.w     (a0)+, (a1)+
003218: 3418             move.w     (a0)+, d2
00321A: d441             add.w      d1, d2
00321C: 32c2             move.w     d2, (a1)+
00321E: 51cbffee         dbra       d3, $320e
003222: 4e75             rts        

; ==== sub_003224 зовут=1 ====
003224: 7004             moveq      #$4, d0
003226: 41f900ffa000     lea.l      $ffa000.l, a0
00322C: 43f900ff0470     lea.l      $ff0470.l, a1
003232: 47fa006a         lea.l      $329e(pc), a3
003236: 2459             movea.l    (a1)+, a2
003238: 4a10             tst.b      (a0)
00323A: 66000030         bne.w      $326c
00323E: 082a00070001     btst.b     #$7, $1(a2)
003244: 67000026         beq.w      $326c
003248: 10bc0001         move.b     #$1, (a0)
00324C: 2853             movea.l    (a3), a4
00324E: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
003252: 41fa003a         lea.l      $328e(pc), a0
003256: 43ec0082         lea.l      $82(a4), a1
00325A: 303c0100         move.w     #$100, d0
00325E: 7e04             moveq      #$4, d7
003260: 7c02             moveq      #$2, d6
003262: 4eb900010fc2     jsr        $10fc2.l
003268: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00326C: 47eb0004         lea.l      $4(a3), a3
003270: 41e80001         lea.l      $1(a0), a0
003274: 51c8ffc0         dbra       d0, $3236
003278: 4e75             rts        

; ---- ДАННЫЕ $00327A..$003380 (262 байт) ----


; ==== sub_003380 зовут=1 ====
003380: 103900ffe00d     move.b     $ffe00d.l, d0
003386: 803900ffe035     or.b       $ffe035.l, d0
00338C: 66000004         bne.w      $3392
003390: 4e75             rts        
003392: 103900ffe00d     move.b     $ffe00d.l, d0
003398: 123900ffe035     move.b     $ffe035.l, d1
00339E: 343900ff0510     move.w     $ff0510.l, d2
0033A4: 41fa0008         lea.l      $33ae(pc), a0
0033A8: 20702000         movea.l    (a0, d2.w), a0
0033AC: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $0033AE..$0033EA (60 байт) ----


; ==== sub_0033EA ТАБЛИЦА зовут=0 ====
0033EA: 0c000040         cmpi.b     #$40, d0
0033EE: 6700000a         beq.w      $33fa
0033F2: 427900ff0510     clr.w      $ff0510.l
0033F8: 4e75             rts        
0033FA: 587900ff0510     addq.w     #$4, $ff0510.l
003400: 4e75             rts        

; ==== sub_003402 ТАБЛИЦА зовут=0 ====
003402: 0c000010         cmpi.b     #$10, d0
003406: 67f2             beq.b      $33fa
003408: 60e8             bra.b      $33f2

; ==== sub_00340A ТАБЛИЦА зовут=0 ====
00340A: 0c000020         cmpi.b     #$20, d0
00340E: 67ea             beq.b      $33fa
003410: 60e0             bra.b      $33f2

; ==== sub_003412 ТАБЛИЦА зовут=0 ====
003412: 0c010040         cmpi.b     #$40, d1
003416: 67e2             beq.b      $33fa
003418: 60d8             bra.b      $33f2

; ==== sub_00341A ТАБЛИЦА зовут=0 ====
00341A: 0c010010         cmpi.b     #$10, d1
00341E: 67da             beq.b      $33fa
003420: 60d0             bra.b      $33f2

; ==== sub_003422 ТАБЛИЦА зовут=0 ====
003422: 0c010020         cmpi.b     #$20, d1
003426: 67d2             beq.b      $33fa
003428: 60c8             bra.b      $33f2

; ==== sub_00342A ТАБЛИЦА зовут=0 ====
00342A: 0c000001         cmpi.b     #$1, d0
00342E: 67ca             beq.b      $33fa
003430: 60c0             bra.b      $33f2

; ==== sub_003432 ТАБЛИЦА зовут=0 ====
003432: 0c000002         cmpi.b     #$2, d0
003436: 67c2             beq.b      $33fa
003438: 60b8             bra.b      $33f2

; ==== sub_00343A ТАБЛИЦА зовут=0 ====
00343A: 0c000004         cmpi.b     #$4, d0
00343E: 67ba             beq.b      $33fa
003440: 60b0             bra.b      $33f2

; ==== sub_003442 ТАБЛИЦА зовут=0 ====
003442: 0c000008         cmpi.b     #$8, d0
003446: 67b2             beq.b      $33fa
003448: 60a8             bra.b      $33f2

; ==== sub_00344A ТАБЛИЦА зовут=0 ====
00344A: 0c010001         cmpi.b     #$1, d1
00344E: 67aa             beq.b      $33fa
003450: 60a0             bra.b      $33f2

; ==== sub_003452 ТАБЛИЦА зовут=0 ====
003452: 0c010002         cmpi.b     #$2, d1
003456: 67a2             beq.b      $33fa
003458: 6098             bra.b      $33f2

; ==== sub_00345A ТАБЛИЦА зовут=0 ====
00345A: 0c010004         cmpi.b     #$4, d1
00345E: 679a             beq.b      $33fa
003460: 6090             bra.b      $33f2

; ==== sub_003462 ТАБЛИЦА зовут=0 ====
003462: 0c010008         cmpi.b     #$8, d1
003466: 6792             beq.b      $33fa
003468: 6088             bra.b      $33f2

; ---- ДАННЫЕ $00346A..$00346C (2 байт) ----

00346C: 4eb900003940     jsr        $3940.l
003472: 41f900ff8000     lea.l      $ff8000.l, a0
003478: 303c03ff         move.w     #$3ff, d0
00347C: 4298             clr.l      (a0)+
00347E: 51c8fffc         dbra       d0, $347c
003482: 41f9000034c0     lea.l      $34c0.l, a0
003488: 43f900ff8698     lea.l      $ff8698.l, a1
00348E: 7e0c             moveq      #$c, d7
003490: 7c00             moveq      #$0, d6
003492: 4eb900010fdc     jsr        $10fdc.l
003498: 33fc0eee00ff039e move.w     #$eee, $ff039e.l
0034A0: 4eb900000ee2     jsr        $ee2.l
0034A6: 4eb90000392e     jsr        $392e.l
0034AC: 0839000700ffe00d btst.b     #$7, $ffe00d.l
0034B4: 6600fbba         bne.w      $3070
0034B8: 4eb900000ee2     jsr        $ee2.l
0034BE: 60ec             bra.b      $34ac

; ---- ДАННЫЕ $0034C0..$0034DA (26 байт) ----

0034DA: 4eb900003940     jsr        $3940.l
0034E0: 4dfa005e         lea.l      $3540(pc), a6
0034E4: 4eb90000067a     jsr        $67a.l
0034EA: 41f9000693b0     lea.l      $693b0.l, a0
0034F0: 43f900ffa000     lea.l      $ffa000.l, a1
0034F6: 4eb9000047aa     jsr        $47aa.l
0034FC: 41f900ffa000     lea.l      $ffa000.l, a0
003502: 43f900ff8000     lea.l      $ff8000.l, a1
003508: 3e3c0027         move.w     #$27, d7
00350C: 3c3c001b         move.w     #$1b, d6
003510: 4eb900010fdc     jsr        $10fdc.l
003516: 427900ff0412     clr.w      $ff0412.l
00351C: 4eb90000392e     jsr        $392e.l
003522: 33fc000400ff0500 move.w     #$4, $ff0500.l
00352A: 103900ffe00d     move.b     $ffe00d.l, d0
003530: 020000f0         andi.b     #$f0, d0
003534: 6600f5ea         bne.w      $2b20
003538: 4eb900000ee2     jsr        $ee2.l
00353E: 60e2             bra.b      $3522

; ---- ДАННЫЕ $003540..$0035C2 (130 байт) ----


; ==== sub_0035C2 зовут=2 ====
0035C2: 41f900ff8214     lea.l      $ff8214.l, a0
0035C8: 43f900ff8294     lea.l      $ff8294.l, a1
0035CE: 7014             moveq      #$14, d0
0035D0: 30fc0240         move.w     #$240, (a0)+
0035D4: 32fc0240         move.w     #$240, (a1)+
0035D8: 51c8fff6         dbra       d0, $35d0
0035DC: 41fa01ae         lea.l      $378c(pc), a0
0035E0: 7000             moveq      #$0, d0
0035E2: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
0035EA: 67000078         beq.w      $3664
0035EE: 0c79000400ff0500 cmpi.w     #$4, $ff0500.l
0035F6: 670000da         beq.w      $36d2
0035FA: 0c79000500ff0500 cmpi.w     #$5, $ff0500.l
003602: 6700012a         beq.w      $372e
003606: 41f900003610     lea.l      $3610.l, a0
00360C: 6000005c         bra.w      $366a

; ---- ДАННЫЕ $003610..$003664 (84 байт) ----

003664: 41f90000367e     lea.l      $367e.l, a0
00366A: 43f900ff8214     lea.l      $ff8214.l, a1
003670: 3e3c0014         move.w     #$14, d7
003674: 3c3c0001         move.w     #$1, d6
003678: 4ef900010fdc     jmp        $10fdc.l

; ---- ДАННЫЕ $00367E..$0036D2 (84 байт) ----

0036D2: 41f9000036da     lea.l      $36da.l, a0
0036D8: 6090             bra.b      $366a

; ---- ДАННЫЕ $0036DA..$00372E (84 байт) ----

00372E: 41f900003738     lea.l      $3738.l, a0
003734: 6000ff34         bra.w      $366a

; ---- ДАННЫЕ $003738..$0037C8 (144 байт) ----


; ==== sub_0037C8 зовут=1 ====
0037C8: 41f9000697b4     lea.l      $697b4.l, a0
0037CE: 43f900ffa000     lea.l      $ffa000.l, a1
0037D4: 4eb9000047aa     jsr        $47aa.l
0037DA: 7e27             moveq      #$27, d7
0037DC: 7c1b             moveq      #$1b, d6
0037DE: 2a3c60000003     move.l     #$60000003, d5
0037E4: 4df900ffa000     lea.l      $ffa000.l, a6
0037EA: 4ef900000622     jmp        $622.l

; ==== sub_0037F0 зовут=3 ====
0037F0: 7e07             moveq      #$7, d7
0037F2: 7000             moveq      #$0, d0
0037F4: 41f900ffe00a     lea.l      $ffe00a.l, a0
0037FA: 0c39000700ffe000 cmpi.b     #$7, $ffe000.l
003802: 66000018         bne.w      $381c
003806: 30bc000f         move.w     #$f, (a0)
00380A: 317c000f000a     move.w     #$f, $a(a0)
003810: 317c000f0014     move.w     #$f, $14(a0)
003816: 317c000f001e     move.w     #$f, $1e(a0)
00381C: 3210             move.w     (a0), d1
00381E: 0241000f         andi.w     #$f, d1
003822: 0c01000f         cmpi.b     #$f, d1
003826: 67000004         beq.w      $382c
00382A: 5240             addq.w     #$1, d0
00382C: 41e8000a         lea.l      $a(a0), a0
003830: 51cfffea         dbra       d7, $381c
003834: 33c000ff043a     move.w     d0, $ff043a.l
00383A: 4e75             rts        

; ==== sub_00383C зовут=2 ====
00383C: 7e07             moveq      #$7, d7
00383E: 61000070         bsr.w      $38b0
003842: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
003846: 13fc000100ff0400 move.b     #$1, $ff0400.l
00384E: 4eb900000ee2     jsr        $ee2.l
003854: 4eb900000ee2     jsr        $ee2.l
00385A: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00385E: 51cfffde         dbra       d7, $383e
003862: 4e75             rts        

; ==== sub_003864 зовут=4 ====
003864: 7e07             moveq      #$7, d7
003866: 61000048         bsr.w      $38b0
00386A: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00386E: 13fc000100ff0400 move.b     #$1, $ff0400.l
003876: 4eb900000ee2     jsr        $ee2.l
00387C: 4eb900000ee2     jsr        $ee2.l
003882: 4eb900000ee2     jsr        $ee2.l
003888: 4eb900000ee2     jsr        $ee2.l
00388E: 4eb900000ee2     jsr        $ee2.l
003894: 4eb900000ee2     jsr        $ee2.l
00389A: 4eb900000ee2     jsr        $ee2.l
0038A0: 4eb900000ee2     jsr        $ee2.l
0038A6: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
0038AA: 51cfffba         dbra       d7, $3866
0038AE: 4e75             rts        

; ==== sub_0038B0 зовут=6 ====
0038B0: 41f900ff0380     lea.l      $ff0380.l, a0
0038B6: 43e8ff80         lea.l      -$80(a0), a1
0038BA: 7c3f             moveq      #$3f, d6
0038BC: 7400             moveq      #$0, d2
0038BE: 3010             move.w     (a0), d0
0038C0: 3211             move.w     (a1), d1
0038C2: 0240000f         andi.w     #$f, d0
0038C6: 0241000f         andi.w     #$f, d1
0038CA: b240             cmp.w      d0, d1
0038CC: 6700000e         beq.w      $38dc
0038D0: 6d000008         blt.w      $38da
0038D4: 5541             subq.w     #$2, d1
0038D6: 60000004         bra.w      $38dc
0038DA: 5441             addq.w     #$2, d1
0038DC: 3401             move.w     d1, d2
0038DE: 3010             move.w     (a0), d0
0038E0: 3211             move.w     (a1), d1
0038E2: 024000f0         andi.w     #$f0, d0
0038E6: 024100f0         andi.w     #$f0, d1
0038EA: b240             cmp.w      d0, d1
0038EC: 67000012         beq.w      $3900
0038F0: 6d00000a         blt.w      $38fc
0038F4: 04410020         subi.w     #$20, d1
0038F8: 60000006         bra.w      $3900
0038FC: 06410020         addi.w     #$20, d1
003900: 8441             or.w       d1, d2
003902: 3018             move.w     (a0)+, d0
003904: 3211             move.w     (a1), d1
003906: 02400f00         andi.w     #$f00, d0
00390A: 02410f00         andi.w     #$f00, d1
00390E: b240             cmp.w      d0, d1
003910: 67000012         beq.w      $3924
003914: 6d00000a         blt.w      $3920
003918: 04410200         subi.w     #$200, d1
00391C: 60000006         bra.w      $3924
003920: 06410200         addi.w     #$200, d1
003924: 8441             or.w       d1, d2
003926: 32c2             move.w     d2, (a1)+
003928: 51ceff92         dbra       d6, $38bc
00392C: 4e75             rts        

; ==== sub_00392E зовут=11 ====
00392E: 7e1f             moveq      #$1f, d7
003930: 41f900ff0300     lea.l      $ff0300.l, a0
003936: 4298             clr.l      (a0)+
003938: 51cffffc         dbra       d7, $3936
00393C: 6000fefe         bra.w      $383c

; ==== sub_003940 зовут=17 ====
003940: 7e1f             moveq      #$1f, d7
003942: 41f900ff0380     lea.l      $ff0380.l, a0
003948: 4298             clr.l      (a0)+
00394A: 51cffffc         dbra       d7, $3948
00394E: 6000feec         bra.w      $383c

; ==== sub_003952 зовут=18 ====
003952: 41f900ff0000     lea.l      $ff0000.l, a0
003958: 7001             moveq      #$1, d0
00395A: 4258             clr.w      (a0)+
00395C: 30c0             move.w     d0, (a0)+
00395E: 4258             clr.w      (a0)+
003960: 4258             clr.w      (a0)+
003962: 5240             addq.w     #$1, d0
003964: 0c00004e         cmpi.b     #$4e, d0
003968: 66f0             bne.b      $395a
00396A: 4258             clr.w      (a0)+
00396C: 4258             clr.w      (a0)+
00396E: 4258             clr.w      (a0)+
003970: 4258             clr.w      (a0)+
003972: 4e75             rts        

; ---- ДАННЫЕ $003974..$003980 (12 байт) ----


; ==== sub_003980 зовут=56 ====
003980: 49f900c00004     lea.l      $c00004.l, a4
003986: 383900ffef86     move.w     $ffef86.l, d4
00398C: 08c40004         bset.b     #$4, d4
003990: 3884             move.w     d4, (a4)
003992: 40e7             move.w     sr, -(a7)
003994: 007c0700         ori.w      #$700, sr
003998: 33fc010000a11100 move.w     #$100, $a11100.l
0039A0: 38bc8f02         move.w     #$8f02, (a4)
0039A4: 2881             move.l     d1, (a4)
0039A6: 2882             move.l     d2, (a4)
0039A8: 3883             move.w     d3, (a4)
0039AA: 00400080         ori.w      #$80, d0
0039AE: 3f00             move.w     d0, -(a7)
0039B0: 4840             swap       d0
0039B2: 3880             move.w     d0, (a4)
0039B4: 0839000000a11100 btst.b     #$0, $a11100.l
0039BC: 66f6             bne.b      $39b4
0039BE: 389f             move.w     (a7)+, (a4)
0039C0: 33fc000000a11100 move.w     #$0, $a11100.l
0039C8: 38b900ffef86     move.w     $ffef86.l, (a4)
0039CE: 4840             swap       d0
0039D0: 08800007         bclr.b     #$7, d0
0039D4: 2880             move.l     d0, (a4)
0039D6: 024300ff         andi.w     #$ff, d3
0039DA: 4843             swap       d3
0039DC: 4842             swap       d2
0039DE: 1602             move.b     d2, d3
0039E0: e143             asl.w      #$8, d3
0039E2: 4842             swap       d2
0039E4: 1602             move.b     d2, d3
0039E6: d683             add.l      d3, d3
0039E8: 2043             movea.l    d3, a0
0039EA: 3010             move.w     (a0), d0
0039EC: 3940fffc         move.w     d0, -$4(a4)
0039F0: 46df             move.w     (a7)+, sr
0039F2: 4e75             rts        

; ---- ДАННЫЕ $0039F4..$003C74 (640 байт) ----


; ==== sub_003C74 зовут=4 ====
003C74: 43f900ffa000     lea.l      $ffa000.l, a1
003C7A: 02800000ffff     andi.l     #$ffff, d0
003C80: e540             asl.w      #$2, d0
003C82: 45fa00aa         lea.l      $3d2e(pc), a2
003C86: d5c0             adda.l     d0, a2
003C88: 2f08             move.l     a0, -(a7)
003C8A: 6100006e         bsr.w      $3cfa
003C8E: 205f             movea.l    (a7)+, a0
003C90: 41e80020         lea.l      $20(a0), a0
003C94: 51cffff2         dbra       d7, $3c88
003C98: 4e75             rts        

; ==== sub_003C9A зовут=1 ====
003C9A: 43f900ffa000     lea.l      $ffa000.l, a1
003CA0: 02800000ffff     andi.l     #$ffff, d0
003CA6: e540             asl.w      #$2, d0
003CA8: 45fa0084         lea.l      $3d2e(pc), a2
003CAC: d5c0             adda.l     d0, a2
003CAE: 7e00             moveq      #$0, d7
003CB0: 1e1b             move.b     (a3)+, d7
003CB2: 7c00             moveq      #$0, d6
003CB4: 1c1b             move.b     (a3)+, d6
003CB6: eb46             asl.w      #$5, d6
003CB8: 41f90002d98a     lea.l      $2d98a.l, a0
003CBE: d1c6             adda.l     d6, a0
003CC0: 61000038         bsr.w      $3cfa
003CC4: 51cfffec         dbra       d7, $3cb2
003CC8: 4e75             rts        

; ==== sub_003CCA зовут=3 ====
003CCA: 43f900ffa000     lea.l      $ffa000.l, a1
003CD0: 02800000ffff     andi.l     #$ffff, d0
003CD6: e540             asl.w      #$2, d0
003CD8: 45fa0054         lea.l      $3d2e(pc), a2
003CDC: d5c0             adda.l     d0, a2
003CDE: 7e00             moveq      #$0, d7
003CE0: 3e1b             move.w     (a3)+, d7
003CE2: 7c00             moveq      #$0, d6
003CE4: 3c1b             move.w     (a3)+, d6
003CE6: eb46             asl.w      #$5, d6
003CE8: 41f90002d98a     lea.l      $2d98a.l, a0
003CEE: d1c6             adda.l     d6, a0
003CF0: 61000008         bsr.w      $3cfa
003CF4: 51cfffec         dbra       d7, $3ce2
003CF8: 4e75             rts        

; ==== sub_003CFA зовут=3 ====
003CFA: 2f08             move.l     a0, -(a7)
003CFC: 61000008         bsr.w      $3d06
003D00: 205f             movea.l    (a7)+, a0
003D02: 41e80001         lea.l      $1(a0), a0

; ==== sub_003D06 зовут=1 ====
003D06: 7a0f             moveq      #$f, d5
003D08: 1010             move.b     (a0), d0
003D0A: 6100000c         bsr.w      $3d18
003D0E: 41e80002         lea.l      $2(a0), a0
003D12: 51cdfff4         dbra       d5, $3d08
003D16: 4e75             rts        

; ==== sub_003D18 зовут=1 ====
003D18: 7c03             moveq      #$3, d6
003D1A: e518             rol.b      #$2, d0
003D1C: 1200             move.b     d0, d1
003D1E: 02410003         andi.w     #$3, d1
003D22: 12321000         move.b     (a2, d1.w), d1
003D26: 12c1             move.b     d1, (a1)+
003D28: 51cefff0         dbra       d6, $3d1a
003D2C: 4e75             rts        

; ---- ДАННЫЕ $003D2E..$003D3E (16 байт) ----


; ==== sub_003D3E зовут=4 ====
003D3E: 41faffee         lea.l      $3d2e(pc), a0
003D42: e540             asl.w      #$2, d0
003D44: d1c0             adda.l     d0, a0
003D46: 43f900ffa000     lea.l      $ffa000.l, a1
003D4C: 1211             move.b     (a1), d1
003D4E: 7400             moveq      #$0, d2
003D50: 0c010000         cmpi.b     #$0, d1
003D54: 67000018         beq.w      $3d6e
003D58: 7401             moveq      #$1, d2
003D5A: 0c010001         cmpi.b     #$1, d1
003D5E: 6700000e         beq.w      $3d6e
003D62: 7402             moveq      #$2, d2
003D64: 0c010010         cmpi.b     #$10, d1
003D68: 67000004         beq.w      $3d6e
003D6C: 7403             moveq      #$3, d2
003D6E: 14302000         move.b     (a0, d2.w), d2
003D72: 12c2             move.b     d2, (a1)+
003D74: 51cfffd6         dbra       d7, $3d4c
003D78: 4e75             rts        

; ==== sub_003D7A зовут=67 ====
003D7A: 48e74080         movem.l    d1/a0, -(a7)
003D7E: 41f900ff0530     lea.l      $ff0530.l, a0
003D84: 7207             moveq      #$7, d1
003D86: be10             cmp.b      (a0), d7
003D88: 67000014         beq.w      $3d9e
003D8C: 4a18             tst.b      (a0)+
003D8E: 6700000c         beq.w      $3d9c
003D92: 51c9fff2         dbra       d1, $3d86
003D96: 4cdf0102         movem.l    (a7)+, d1/a0
003D9A: 4e75             rts        
003D9C: 1107             move.b     d7, -(a0)
003D9E: 4cdf0102         movem.l    (a7)+, d1/a0
003DA2: 4e75             rts        

; ==== sub_003DA4 зовут=1 ====
003DA4: 523900ff0456     addq.b     #$1, $ff0456.l
003DAA: 3e3900ff0422     move.w     $ff0422.l, d7
003DB0: 5347             subq.w     #$1, d7
003DB2: 7206             moveq      #$6, d1
003DB4: 41fa00d8         lea.l      $3e8e(pc), a0
003DB8: 4a7900ff1002     tst.w      $ff1002.l
003DBE: 67000008         beq.w      $3dc8
003DC2: 7205             moveq      #$5, d1
003DC4: 41fa00e4         lea.l      $3eaa(pc), a0
003DC8: 303900ff0418     move.w     $ff0418.l, d0
003DCE: e540             asl.w      #$2, d0
003DD0: 49f900003e56     lea.l      $3e56.l, a4
003DD6: 28740000         movea.l    (a4, d0.w), a4
003DDA: 4df900ff1000     lea.l      $ff1000.l, a6
003DE0: 225c             movea.l    (a4)+, a1
003DE2: 4a6e0002         tst.w      $2(a6)
003DE6: 6700000a         beq.w      $3df2
003DEA: 226e000a         movea.l    $a(a6), a1
003DEE: 43e90100         lea.l      $100(a1), a1
003DF2: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
003DF6: bdf900ff044c     cmpa.l     $ff044c.l, a6
003DFC: 66000012         bne.w      $3e10
003E00: 0839000400ff0456 btst.b     #$4, $ff0456.l
003E08: 67000006         beq.w      $3e10
003E0C: 41e8000e         lea.l      $e(a0), a0
003E10: 4a7900ff0418     tst.w      $ff0418.l
003E16: 66000014         bne.w      $3e2c
003E1A: bdfc00ff1400     cmpa.l     #$ff1400, a6
003E20: 67000026         beq.w      $3e48
003E24: 303c4300         move.w     #$4300, d0
003E28: 60000006         bra.w      $3e30
003E2C: 303c4000         move.w     #$4000, d0
003E30: 3e01             move.w     d1, d7
003E32: 7c01             moveq      #$1, d6
003E34: 4eb900010fc2     jsr        $10fc2.l
003E3A: 4a7900ff0418     tst.w      $ff0418.l
003E40: 67000006         beq.w      $3e48
003E44: 6100007e         bsr.w      $3ec4
003E48: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
003E4C: 4dee0400         lea.l      $400(a6), a6
003E50: 51cfff8e         dbra       d7, $3de0
003E54: 4e75             rts        

; ---- ДАННЫЕ $003E56..$003EC4 (110 байт) ----


; ==== sub_003EC4 зовут=4 ====
003EC4: 7000             moveq      #$0, d0
003EC6: 303900ff0418     move.w     $ff0418.l, d0
003ECC: e540             asl.w      #$2, d0
003ECE: 41fa0008         lea.l      $3ed8(pc), a0
003ED2: 20700000         movea.l    (a0, d0.w), a0
003ED6: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $003ED8..$003EF4 (28 байт) ----


; ==== sub_003EF4 ТАБЛИЦА зовут=0 ====
003EF4: 223c00000704     move.l     #$704, d1
003EFA: 60000018         bra.w      $3f14

; ==== sub_003EFE ТАБЛИЦА зовут=0 ====
003EFE: 223c00000702     move.l     #$702, d1
003F04: 0c6e00020000     cmpi.w     #$2, $0(a6)
003F0A: 66000008         bne.w      $3f14
003F0E: 223c00000704     move.l     #$704, d1
003F14: 0c39000200ff0457 cmpi.b     #$2, $ff0457.l
003F1C: 66000008         bne.w      $3f26
003F20: 048100000600     subi.l     #$600, d1
003F26: 41fa00fc         lea.l      $4024(pc), a0
003F2A: 43f900ffb000     lea.l      $ffb000.l, a1
003F30: 7e07             moveq      #$7, d7
003F32: 22d8             move.l     (a0)+, (a1)+
003F34: 51cffffc         dbra       d7, $3f32
003F38: 610003d6         bsr.w      $4310
003F3C: 41f900ffb000     lea.l      $ffb000.l, a0
003F42: 226e000a         movea.l    $a(a6), a1
003F46: d3c1             adda.l     d1, a1
003F48: 4a2e00da         tst.b      $da(a6)
003F4C: 6600000e         bne.w      $3f5c
003F50: 427900ffb014     clr.w      $ffb014.l
003F56: 427900ffb01c     clr.w      $ffb01c.l
003F5C: 303c4000         move.w     #$4000, d0
003F60: 3e3c0007         move.w     #$7, d7
003F64: 7c03             moveq      #$3, d6
003F66: 4eb900010fc2     jsr        $10fc2.l
003F6C: 4a3900ff0458     tst.b      $ff0458.l
003F72: 670000ae         beq.w      $4022
003F76: 7000             moveq      #$0, d0
003F78: 102e00d8         move.b     $d8(a6), d0
003F7C: 226e000a         movea.l    $a(a6), a1
003F80: 43e90704         lea.l      $704(a1), a1
003F84: 61000026         bsr.w      $3fac
003F88: 7000             moveq      #$0, d0
003F8A: 102e00d9         move.b     $d9(a6), d0
003F8E: 226e000a         movea.l    $a(a6), a1
003F92: 43e9070c         lea.l      $70c(a1), a1
003F96: 61000014         bsr.w      $3fac
003F9A: 7000             moveq      #$0, d0
003F9C: 102e00da         move.b     $da(a6), d0
003FA0: 67000080         beq.w      $4022
003FA4: 226e000a         movea.l    $a(a6), a1
003FA8: 43e90808         lea.l      $808(a1), a1

; ==== sub_003FAC зовут=2 ====
003FAC: 0c39000200ff0457 cmpi.b     #$2, $ff0457.l
003FB4: 66000006         bne.w      $3fbc
003FB8: 43e9fa00         lea.l      -$600(a1), a1
003FBC: 41f900ffb000     lea.l      $ffb000.l, a0
003FC2: 0c400064         cmpi.w     #$64, d0
003FC6: 6600001c         bne.w      $3fe4
003FCA: 30bc40a6         move.w     #$40a6, (a0)
003FCE: 317c40a70004     move.w     #$40a7, $4(a0)
003FD4: 317c40a80002     move.w     #$40a8, $2(a0)
003FDA: 317c40a90006     move.w     #$40a9, $6(a0)
003FE0: 60000036         bra.w      $4018
003FE4: 81fc000a         divs.w     #$a, d0
003FE8: 4a40             tst.w      d0
003FEA: 6600000c         bne.w      $3ff8
003FEE: 4250             clr.w      (a0)
003FF0: 42680004         clr.w      $4(a0)
003FF4: 60000010         bra.w      $4006
003FF8: e340             asl.w      #$1, d0
003FFA: 06400010         addi.w     #$10, d0
003FFE: 3080             move.w     d0, (a0)
004000: 5240             addq.w     #$1, d0
004002: 31400004         move.w     d0, $4(a0)
004006: 4840             swap       d0
004008: e340             asl.w      #$1, d0
00400A: 06400010         addi.w     #$10, d0
00400E: 31400002         move.w     d0, $2(a0)
004012: 5240             addq.w     #$1, d0
004014: 31400006         move.w     d0, $6(a0)
004018: 7e01             moveq      #$1, d7
00401A: 7c01             moveq      #$1, d6
00401C: 4ef900010fdc     jmp        $10fdc.l
004022: 4e75             rts        

; ---- ДАННЫЕ $004024..$004044 (32 байт) ----


; ==== sub_004044 ТАБЛИЦА зовут=0 ====
004044: 41fa01ae         lea.l      $41f4(pc), a0
004048: 43f900ffb000     lea.l      $ffb000.l, a1
00404E: 7e06             moveq      #$6, d7
004050: 32d8             move.w     (a0)+, (a1)+
004052: 51cffffc         dbra       d7, $4050
004056: 7000             moveq      #$0, d0
004058: 102e00d8         move.b     $d8(a6), d0
00405C: 81fc000a         divs.w     #$a, d0
004060: 4a40             tst.w      d0
004062: 67000022         beq.w      $4086
004066: e540             asl.w      #$2, d0
004068: 06400030         addi.w     #$30, d0
00406C: 41f900ffb000     lea.l      $ffb000.l, a0
004072: 1080             move.b     d0, (a0)
004074: 5240             addq.w     #$1, d0
004076: 11400004         move.b     d0, $4(a0)
00407A: 5240             addq.w     #$1, d0
00407C: 11400001         move.b     d0, $1(a0)
004080: 5240             addq.w     #$1, d0
004082: 11400005         move.b     d0, $5(a0)
004086: 4840             swap       d0
004088: e540             asl.w      #$2, d0
00408A: 06400030         addi.w     #$30, d0
00408E: 41f900ffb002     lea.l      $ffb002.l, a0
004094: 1080             move.b     d0, (a0)
004096: 5240             addq.w     #$1, d0
004098: 11400004         move.b     d0, $4(a0)
00409C: 5240             addq.w     #$1, d0
00409E: 11400001         move.b     d0, $1(a0)
0040A2: 5240             addq.w     #$1, d0
0040A4: 11400005         move.b     d0, $5(a0)
0040A8: 41f900ffb000     lea.l      $ffb000.l, a0
0040AE: 226e000a         movea.l    $a(a6), a1
0040B2: 43e90b04         lea.l      $b04(a1), a1
0040B6: 303c4000         move.w     #$4000, d0
0040BA: 3e3c0003         move.w     #$3, d7
0040BE: 7c01             moveq      #$1, d6
0040C0: 4eb900010fc2     jsr        $10fc2.l
0040C6: 226e000a         movea.l    $a(a6), a1
0040CA: 43e90b8c         lea.l      $b8c(a1), a1
0040CE: 32fc007a         move.w     #$7a, (a1)+
0040D2: 32fc007b         move.w     #$7b, (a1)+
0040D6: 32fc007c         move.w     #$7c, (a1)+
0040DA: 226e000a         movea.l    $a(a6), a1
0040DE: 43e90a02         lea.l      $a02(a1), a1
0040E2: 22fc00aa00ab     move.l     #$aa00ab, (a1)+
0040E8: 22fc00aa00ac     move.l     #$aa00ac, (a1)+
0040EE: 32bc00ad         move.w     #$ad, (a1)
0040F2: 08b9000000ff0457 bclr.b     #$0, $ff0457.l
0040FA: 66000004         bne.w      $4100
0040FE: 4e75             rts        
004100: 226e000a         movea.l    $a(a6), a1
004104: 43e90604         lea.l      $604(a1), a1
004108: 7000             moveq      #$0, d0
00410A: 102e00db         move.b     $db(a6), d0
00410E: 81fc000a         divs.w     #$a, d0
004112: 4a40             tst.w      d0
004114: 67000022         beq.w      $4138
004118: 3200             move.w     d0, d1
00411A: e541             asl.w      #$2, d1
00411C: 06410030         addi.w     #$30, d1
004120: 0041c000         ori.w      #$c000, d1
004124: 3281             move.w     d1, (a1)
004126: 5241             addq.w     #$1, d1
004128: 33410080         move.w     d1, $80(a1)
00412C: 5241             addq.w     #$1, d1
00412E: 33410002         move.w     d1, $2(a1)
004132: 5241             addq.w     #$1, d1
004134: 33410082         move.w     d1, $82(a1)
004138: 43e90004         lea.l      $4(a1), a1
00413C: 4840             swap       d0
00413E: 3200             move.w     d0, d1
004140: e541             asl.w      #$2, d1
004142: 06410030         addi.w     #$30, d1
004146: 0041c000         ori.w      #$c000, d1
00414A: 3281             move.w     d1, (a1)
00414C: 5241             addq.w     #$1, d1
00414E: 33410080         move.w     d1, $80(a1)
004152: 5241             addq.w     #$1, d1
004154: 33410002         move.w     d1, $2(a1)
004158: 5241             addq.w     #$1, d1
00415A: 33410082         move.w     d1, $82(a1)
00415E: 337c007a0084     move.w     #$7a, $84(a1)
004164: 337c007b0086     move.w     #$7b, $86(a1)
00416A: 337c007c0088     move.w     #$7c, $88(a1)
004170: 226e000a         movea.l    $a(a6), a1
004174: 43e90682         lea.l      $682(a1), a1
004178: 0c2e000a00db     cmpi.b     #$a, $db(a6)
00417E: 6c000004         bge.w      $4184
004182: 5849             addq.w     #$4, a1
004184: 32bc007d         move.w     #$7d, (a1)
004188: 7000             moveq      #$0, d0
00418A: 102e00dd         move.b     $dd(a6), d0
00418E: e540             asl.w      #$2, d0
004190: 06400030         addi.w     #$30, d0
004194: 41f900ffb000     lea.l      $ffb000.l, a0
00419A: 1080             move.b     d0, (a0)
00419C: 5240             addq.w     #$1, d0
00419E: 11400004         move.b     d0, $4(a0)
0041A2: 5240             addq.w     #$1, d0
0041A4: 11400001         move.b     d0, $1(a0)
0041A8: 5240             addq.w     #$1, d0
0041AA: 11400005         move.b     d0, $5(a0)
0041AE: 7000             moveq      #$0, d0
0041B0: 102e00dd         move.b     $dd(a6), d0
0041B4: 41fa0046         lea.l      $41fc(pc), a0
0041B8: 10300000         move.b     (a0, d0.w), d0
0041BC: 41f900ffb002     lea.l      $ffb002.l, a0
0041C2: 1080             move.b     d0, (a0)
0041C4: 5240             addq.w     #$1, d0
0041C6: 11400004         move.b     d0, $4(a0)
0041CA: 5240             addq.w     #$1, d0
0041CC: 11400001         move.b     d0, $1(a0)
0041D0: 5240             addq.w     #$1, d0
0041D2: 11400005         move.b     d0, $5(a0)
0041D6: 41f900ffb000     lea.l      $ffb000.l, a0
0041DC: 226e000a         movea.l    $a(a6), a1
0041E0: 43e90306         lea.l      $306(a1), a1
0041E4: 303c4000         move.w     #$4000, d0
0041E8: 3e3c0003         move.w     #$3, d7
0041EC: 7c01             moveq      #$1, d6
0041EE: 4ef900010fc2     jmp        $10fc2.l

; ---- ДАННЫЕ $0041F4..$004202 (14 байт) ----


; ==== sub_004202 ТАБЛИЦА зовут=0 ====
004202: 33fc6c6e00ffb002 move.w     #$6c6e, $ffb002.l
00420A: 33fc6d6f00ffb006 move.w     #$6d6f, $ffb006.l
004212: 302e0000         move.w     $0(a6), d0
004216: e540             asl.w      #$2, d0
004218: 06400030         addi.w     #$30, d0
00421C: 41f900ffb000     lea.l      $ffb000.l, a0
004222: 1080             move.b     d0, (a0)
004224: 5240             addq.w     #$1, d0
004226: 11400004         move.b     d0, $4(a0)
00422A: 5240             addq.w     #$1, d0
00422C: 11400001         move.b     d0, $1(a0)
004230: 5240             addq.w     #$1, d0
004232: 11400005         move.b     d0, $5(a0)
004236: 41f900ffb000     lea.l      $ffb000.l, a0
00423C: 226e000a         movea.l    $a(a6), a1
004240: 43e90582         lea.l      $582(a1), a1
004244: 303c4000         move.w     #$4000, d0
004248: 3e3c0003         move.w     #$3, d7
00424C: 7c01             moveq      #$1, d6
00424E: 4eb900010fc2     jsr        $10fc2.l
004254: 08b9000000ff0457 bclr.b     #$0, $ff0457.l
00425C: 66000004         bne.w      $4262
004260: 4e75             rts        
004262: 226e000a         movea.l    $a(a6), a1
004266: 43e90280         lea.l      $280(a1), a1
00426A: 32fc007d         move.w     #$7d, (a1)+
00426E: 7000             moveq      #$0, d0
004270: 102e00db         move.b     $db(a6), d0
004274: 81fc000a         divs.w     #$a, d0
004278: 4a40             tst.w      d0
00427A: 6700000c         beq.w      $4288
00427E: 06400070         addi.w     #$70, d0
004282: 00408000         ori.w      #$8000, d0
004286: 3280             move.w     d0, (a1)
004288: 43e90002         lea.l      $2(a1), a1
00428C: 4840             swap       d0
00428E: 06400070         addi.w     #$70, d0
004292: 00408000         ori.w      #$8000, d0
004296: 32c0             move.w     d0, (a1)+
004298: 32fc007a         move.w     #$7a, (a1)+
00429C: 32fc007b         move.w     #$7b, (a1)+
0042A0: 32fc007c         move.w     #$7c, (a1)+
0042A4: 7000             moveq      #$0, d0
0042A6: 102e00dd         move.b     $dd(a6), d0
0042AA: e540             asl.w      #$2, d0
0042AC: 06400030         addi.w     #$30, d0
0042B0: 41f900ffb000     lea.l      $ffb000.l, a0
0042B6: 1080             move.b     d0, (a0)
0042B8: 5240             addq.w     #$1, d0
0042BA: 11400004         move.b     d0, $4(a0)
0042BE: 5240             addq.w     #$1, d0
0042C0: 11400001         move.b     d0, $1(a0)
0042C4: 5240             addq.w     #$1, d0
0042C6: 11400005         move.b     d0, $5(a0)
0042CA: 7000             moveq      #$0, d0
0042CC: 102e00dd         move.b     $dd(a6), d0
0042D0: 41faff2a         lea.l      $41fc(pc), a0
0042D4: 10300000         move.b     (a0, d0.w), d0
0042D8: 41f900ffb002     lea.l      $ffb002.l, a0
0042DE: 1080             move.b     d0, (a0)
0042E0: 5240             addq.w     #$1, d0
0042E2: 11400004         move.b     d0, $4(a0)
0042E6: 5240             addq.w     #$1, d0
0042E8: 11400001         move.b     d0, $1(a0)
0042EC: 5240             addq.w     #$1, d0
0042EE: 11400005         move.b     d0, $5(a0)
0042F2: 41f900ffb000     lea.l      $ffb000.l, a0
0042F8: 226e000a         movea.l    $a(a6), a1
0042FC: 43e90102         lea.l      $102(a1), a1
004300: 303c4000         move.w     #$4000, d0
004304: 3e3c0003         move.w     #$3, d7
004308: 7c01             moveq      #$1, d6
00430A: 4ef900010fc2     jmp        $10fc2.l

; ==== sub_004310 зовут=1 ====
004310: 7000             moveq      #$0, d0
004312: 102e00d8         move.b     $d8(a6), d0
004316: 45f900ffb000     lea.l      $ffb000.l, a2
00431C: 61000028         bsr.w      $4346
004320: 7000             moveq      #$0, d0
004322: 102e00d9         move.b     $d9(a6), d0
004326: 45f900ffb004     lea.l      $ffb004.l, a2
00432C: 61000018         bsr.w      $4346
004330: 7000             moveq      #$0, d0
004332: 102e00da         move.b     $da(a6), d0
004336: 6700000c         beq.w      $4344
00433A: 45f900ffb012     lea.l      $ffb012.l, a2
004340: 61000004         bsr.w      $4346
004344: 4e75             rts        

; ==== sub_004346 зовут=3 ====
004346: e540             asl.w      #$2, d0
004348: 06400030         addi.w     #$30, d0
00434C: 1480             move.b     d0, (a2)
00434E: 5240             addq.w     #$1, d0
004350: 15400008         move.b     d0, $8(a2)
004354: 5240             addq.w     #$1, d0
004356: 15400001         move.b     d0, $1(a2)
00435A: 5240             addq.w     #$1, d0
00435C: 15400009         move.b     d0, $9(a2)
004360: 4e75             rts        

; ==== sub_004362 зовут=1 ====
004362: 303900ff0418     move.w     $ff0418.l, d0
004368: e540             asl.w      #$2, d0
00436A: 41fa0008         lea.l      $4374(pc), a0
00436E: 20700000         movea.l    (a0, d0.w), a0
004372: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $004374..$004390 (28 байт) ----


; ==== sub_004390 ТАБЛИЦА зовут=0 ====
004390: 303900ff1488     move.w     $ff1488.l, d0
004396: b07900ff1088     cmp.w      $ff1088.l, d0
00439C: 67000022         beq.w      $43c0
0043A0: 6e000010         bgt.w      $43b2
0043A4: 523900ff10d8     addq.b     #$1, $ff10d8.l
0043AA: 523900ff14d9     addq.b     #$1, $ff14d9.l
0043B0: 4e75             rts        
0043B2: 523900ff10d9     addq.b     #$1, $ff10d9.l
0043B8: 523900ff14d8     addq.b     #$1, $ff14d8.l
0043BE: 4e75             rts        
0043C0: 523900ff10da     addq.b     #$1, $ff10da.l
0043C6: 523900ff14da     addq.b     #$1, $ff14da.l
0043CC: 4e75             rts        

; ==== sub_0043CE ТАБЛИЦА зовут=0 ====
0043CE: 303900ff1488     move.w     $ff1488.l, d0
0043D4: b07900ff1088     cmp.w      $ff1088.l, d0
0043DA: 6700002e         beq.w      $440a
0043DE: 6e000016         bgt.w      $43f6
0043E2: 523900ff10d8     addq.b     #$1, $ff10d8.l
0043E8: 523900ff18d8     addq.b     #$1, $ff18d8.l
0043EE: 523900ff14d9     addq.b     #$1, $ff14d9.l
0043F4: 4e75             rts        
0043F6: 523900ff10d9     addq.b     #$1, $ff10d9.l
0043FC: 523900ff18d9     addq.b     #$1, $ff18d9.l
004402: 523900ff14d8     addq.b     #$1, $ff14d8.l
004408: 4e75             rts        
00440A: 523900ff10da     addq.b     #$1, $ff10da.l
004410: 523900ff18da     addq.b     #$1, $ff18da.l
004416: 523900ff14da     addq.b     #$1, $ff14da.l
00441C: 4e75             rts        

; ==== sub_00441E ТАБЛИЦА зовут=0 ====
00441E: 61000060         bsr.w      $4480
004422: 41fa004e         lea.l      $4472(pc), a0
004426: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
00442E: 67000016         beq.w      $4446
004432: 41fa0042         lea.l      $4476(pc), a0
004436: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00443E: 67000006         beq.w      $4446
004442: 41fa0036         lea.l      $447a(pc), a0
004446: 3e3900ff0422     move.w     $ff0422.l, d7
00444C: 5347             subq.w     #$1, d7
00444E: 4df900ff1000     lea.l      $ff1000.l, a6
004454: 7400             moveq      #$0, d2
004456: 7200             moveq      #$0, d1
004458: 122e00dd         move.b     $dd(a6), d1
00445C: 143010ff         move.b     -$1(a0, d1.w), d2
004460: 1d4200db         move.b     d2, $db(a6)
004464: d52e00d8         add.b      d2, $d8(a6)
004468: 4dee0400         lea.l      $400(a6), a6
00446C: 51cfffe8         dbra       d7, $4456
004470: 4e75             rts        

; ---- ДАННЫЕ $004472..$004480 (14 байт) ----


; ==== sub_004480 зовут=2 ====
004480: 42b900ffa000     clr.l      $ffa000.l
004486: 42b900ffa004     clr.l      $ffa004.l
00448C: 427900ffa008     clr.w      $ffa008.l
004492: 7000             moveq      #$0, d0
004494: 4df900ff1000     lea.l      $ff1000.l, a6
00449A: 41f900ffa000     lea.l      $ffa000.l, a0
0044A0: 3e3900ff0422     move.w     $ff0422.l, d7
0044A6: 5347             subq.w     #$1, d7
0044A8: 4a7900ff041c     tst.w      $ff041c.l
0044AE: 6600000a         bne.w      $44ba
0044B2: 10ee00d8         move.b     $d8(a6), (a0)+
0044B6: 60000006         bra.w      $44be
0044BA: 10ee0089         move.b     $89(a6), (a0)+
0044BE: 10c0             move.b     d0, (a0)+
0044C0: 5240             addq.w     #$1, d0
0044C2: 4dee0400         lea.l      $400(a6), a6
0044C6: 51cfffe0         dbra       d7, $44a8
0044CA: 43f900ffa010     lea.l      $ffa010.l, a1
0044D0: 7c04             moveq      #$4, d6
0044D2: 41f900ffa000     lea.l      $ffa000.l, a0
0044D8: 7000             moveq      #$0, d0
0044DA: 7e04             moveq      #$4, d7
0044DC: 3218             move.w     (a0)+, d1
0044DE: b240             cmp.w      d0, d1
0044E0: 6f000004         ble.w      $44e6
0044E4: c141             exg.l      d0, d1
0044E6: 51cffff4         dbra       d7, $44dc
0044EA: 32c0             move.w     d0, (a1)+
0044EC: 41f900ffa000     lea.l      $ffa000.l, a0
0044F2: 7204             moveq      #$4, d1
0044F4: b050             cmp.w      (a0), d0
0044F6: 67000008         beq.w      $4500
0044FA: 41e80002         lea.l      $2(a0), a0
0044FE: 60f4             bra.b      $44f4
004500: 4250             clr.w      (a0)
004502: 51ceffce         dbra       d6, $44d2
004506: 7200             moveq      #$0, d1
004508: 3e3900ff0422     move.w     $ff0422.l, d7
00450E: 5347             subq.w     #$1, d7
004510: 41f900ffa010     lea.l      $ffa010.l, a0
004516: 343c00ff         move.w     #$ff, d2
00451A: 7601             moveq      #$1, d3
00451C: 7000             moveq      #$0, d0
00451E: b410             cmp.b      (a0), d2
004520: 67000006         beq.w      $4528
004524: 1410             move.b     (a0), d2
004526: 3203             move.w     d3, d1
004528: 10280001         move.b     $1(a0), d0
00452C: e140             asl.w      #$8, d0
00452E: e540             asl.w      #$2, d0
004530: 4df900ff1000     lea.l      $ff1000.l, a6
004536: ddc0             adda.l     d0, a6
004538: 1d4100dd         move.b     d1, $dd(a6)
00453C: 41e80002         lea.l      $2(a0), a0
004540: 5243             addq.w     #$1, d3
004542: 51cfffd8         dbra       d7, $451c
004546: 4e75             rts        

; ==== sub_004548 зовут=1 ====
004548: 0c79004c00ff0406 cmpi.w     #$4c, $ff0406.l
004550: 66000004         bne.w      $4556
004554: 4e75             rts        
004556: 303900ff0418     move.w     $ff0418.l, d0
00455C: e540             asl.w      #$2, d0
00455E: 41fa0008         lea.l      $4568(pc), a0
004562: 20700000         movea.l    (a0, d0.w), a0
004566: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $004568..$004584 (28 байт) ----


; ==== sub_004584 ТАБЛИЦА зовут=0 ====
004584: 207900ff1006     movea.l    $ff1006.l, a0
00458A: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
004592: 6d000008         blt.w      $459c
004596: 207c00ff2600     movea.l    #$ff2600, a0
00459C: 7e00             moveq      #$0, d7
00459E: 7c07             moveq      #$7, d6
0045A0: 7000             moveq      #$0, d0
0045A2: 2010             move.l     (a0), d0
0045A4: 80a80004         or.l       $4(a0), d0
0045A8: 80a80008         or.l       $8(a0), d0
0045AC: 6600000c         bne.w      $45ba
0045B0: 41e80010         lea.l      $10(a0), a0
0045B4: 5247             addq.w     #$1, d7
0045B6: 51ceffe8         dbra       d6, $45a0
0045BA: 41fa001e         lea.l      $45da(pc), a0
0045BE: 1e307000         move.b     (a0, d7.w), d7
0045C2: be3900ff0541     cmp.b      $ff0541.l, d7
0045C8: 6700000e         beq.w      $45d8
0045CC: 13c700ff0540     move.b     d7, $ff0540.l
0045D2: 13c700ff0541     move.b     d7, $ff0541.l
0045D8: 4e75             rts        

; ---- ДАННЫЕ $0045DA..$0045EA (16 байт) ----


; ==== sub_0045EA ТАБЛИЦА зовут=0 ====
0045EA: 207900ff1006     movea.l    $ff1006.l, a0
0045F0: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
0045F8: 6d000008         blt.w      $4602
0045FC: 207c00ff2600     movea.l    #$ff2600, a0
004602: 227900ff1406     movea.l    $ff1406.l, a1
004608: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
004610: 6d000008         blt.w      $461a
004614: 227c00ff2600     movea.l    #$ff2600, a1
00461A: 7e00             moveq      #$0, d7
00461C: 7c07             moveq      #$7, d6
00461E: 7000             moveq      #$0, d0
004620: 2010             move.l     (a0), d0
004622: 80a80004         or.l       $4(a0), d0
004626: 80a80008         or.l       $8(a0), d0
00462A: 8091             or.l       (a1), d0
00462C: 80a90004         or.l       $4(a1), d0
004630: 80a90008         or.l       $8(a1), d0
004634: 6684             bne.b      $45ba
004636: 41e80010         lea.l      $10(a0), a0
00463A: 43e90010         lea.l      $10(a1), a1
00463E: 5247             addq.w     #$1, d7
004640: 51ceffdc         dbra       d6, $461e
004644: 6000ff74         bra.w      $45ba

; ==== sub_004648 ТАБЛИЦА зовут=0 ====
004648: 207900ff1006     movea.l    $ff1006.l, a0
00464E: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
004656: 6d000008         blt.w      $4660
00465A: 207c00ff2600     movea.l    #$ff2600, a0
004660: 227900ff1406     movea.l    $ff1406.l, a1
004666: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
00466E: 6d000008         blt.w      $4678
004672: 227c00ff2600     movea.l    #$ff2600, a1
004678: 247900ff1806     movea.l    $ff1806.l, a2
00467E: 0c79001800ff184c cmpi.w     #$18, $ff184c.l
004686: 6d000008         blt.w      $4690
00468A: 247c00ff2600     movea.l    #$ff2600, a2
004690: 7e00             moveq      #$0, d7
004692: 7c07             moveq      #$7, d6
004694: 7000             moveq      #$0, d0
004696: 2010             move.l     (a0), d0
004698: 80a80004         or.l       $4(a0), d0
00469C: 80680008         or.w       $8(a0), d0
0046A0: 8091             or.l       (a1), d0
0046A2: 80a90004         or.l       $4(a1), d0
0046A6: 80690008         or.w       $8(a1), d0
0046AA: 8092             or.l       (a2), d0
0046AC: 80aa0004         or.l       $4(a2), d0
0046B0: 806a0008         or.w       $8(a2), d0
0046B4: 4a80             tst.l      d0
0046B6: 6600ff02         bne.w      $45ba
0046BA: 41e80010         lea.l      $10(a0), a0
0046BE: 43e90010         lea.l      $10(a1), a1
0046C2: 45ea0010         lea.l      $10(a2), a2
0046C6: 5247             addq.w     #$1, d7
0046C8: 51ceffca         dbra       d6, $4694
0046CC: 6000feec         bra.w      $45ba

; ==== sub_0046D0 ТАБЛИЦА зовут=0 ====
0046D0: 207900ff1006     movea.l    $ff1006.l, a0
0046D6: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
0046DE: 6d000008         blt.w      $46e8
0046E2: 207c00ff2600     movea.l    #$ff2600, a0
0046E8: 227900ff1406     movea.l    $ff1406.l, a1
0046EE: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
0046F6: 6d000008         blt.w      $4700
0046FA: 227c00ff2600     movea.l    #$ff2600, a1
004700: 247900ff1806     movea.l    $ff1806.l, a2
004706: 0c79001800ff184c cmpi.w     #$18, $ff184c.l
00470E: 6d000008         blt.w      $4718
004712: 247c00ff2600     movea.l    #$ff2600, a2
004718: 7e00             moveq      #$0, d7
00471A: 7c07             moveq      #$7, d6
00471C: 7000             moveq      #$0, d0
00471E: 2010             move.l     (a0), d0
004720: 80a80004         or.l       $4(a0), d0
004724: 80680008         or.w       $8(a0), d0
004728: 8091             or.l       (a1), d0
00472A: 80a90004         or.l       $4(a1), d0
00472E: 80a90008         or.l       $8(a1), d0
004732: 8092             or.l       (a2), d0
004734: 80aa0004         or.l       $4(a2), d0
004738: 806a0008         or.w       $8(a2), d0
00473C: 4a80             tst.l      d0
00473E: 6600fe7a         bne.w      $45ba
004742: 41e80010         lea.l      $10(a0), a0
004746: 43e90010         lea.l      $10(a1), a1
00474A: 45ea0010         lea.l      $10(a2), a2
00474E: 5247             addq.w     #$1, d7
004750: 51ceffca         dbra       d6, $471c
004754: 6000fe64         bra.w      $45ba

; ==== sub_004758 ТАБЛИЦА зовут=0 ====
004758: 7e03             moveq      #$3, d7
00475A: 60000004         bra.w      $4760

; ==== sub_00475E ТАБЛИЦА зовут=0 ====
00475E: 7e04             moveq      #$4, d7
004760: 2f0e             move.l     a6, -(a7)
004762: 7000             moveq      #$0, d0
004764: 4df900ff1000     lea.l      $ff1000.l, a6
00476A: 41f900ff4110     lea.l      $ff4110.l, a0
004770: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
004776: 6c000006         bge.w      $477e
00477A: 20ce             move.l     a6, (a0)+
00477C: 5240             addq.w     #$1, d0
00477E: 4dee0400         lea.l      $400(a6), a6
004782: 51cfffec         dbra       d7, $4770
004786: 2c5f             movea.l    (a7)+, a6
004788: 0c400002         cmpi.w     #$2, d0
00478C: 67000004         beq.w      $4792
004790: 4e75             rts        
004792: 207900ff4110     movea.l    $ff4110.l, a0
004798: 20680006         movea.l    $6(a0), a0
00479C: 227900ff4114     movea.l    $ff4114.l, a1
0047A2: 22690006         movea.l    $6(a1), a1
0047A6: 6000fe72         bra.w      $461a

; ==== sub_0047AA зовут=61 ====
0047AA: 13d000ff0600     move.b     (a0), $ff0600.l
0047B0: 13e8000100ff0603 move.b     $1(a0), $ff0603.l
0047B8: 13e8000200ff0602 move.b     $2(a0), $ff0602.l
0047C0: 13e8000300ff0609 move.b     $3(a0), $ff0609.l
0047C8: 13e8000400ff0608 move.b     $4(a0), $ff0608.l
0047D0: 303900ff0608     move.w     $ff0608.l, d0
0047D6: 02800000ffff     andi.l     #$ffff, d0
0047DC: 2440             movea.l    d0, a2
0047DE: d5c8             adda.l     a0, a2
0047E0: 41e80005         lea.l      $5(a0), a0
0047E4: 423900ff0606     clr.b      $ff0606.l
0047EA: 4eb900004a20     jsr        $4a20.l
0047F0: 0c000000         cmpi.b     #$0, d0
0047F4: 6600000c         bne.w      $4802
0047F8: 4eb900004b10     jsr        $4b10.l
0047FE: 60000060         bra.w      $4860
004802: 0c000001         cmpi.b     #$1, d0
004806: 66000012         bne.w      $481a
00480A: 4eb900004894     jsr        $4894.l
004810: 4eb900004ade     jsr        $4ade.l
004816: 60000048         bra.w      $4860
00481A: 0c000002         cmpi.b     #$2, d0
00481E: 66000018         bne.w      $4838
004822: 4eb900004894     jsr        $4894.l
004828: 4eb900004938     jsr        $4938.l
00482E: 4eb900004ade     jsr        $4ade.l
004834: 6000002a         bra.w      $4860
004838: 0c39001000ff0600 cmpi.b     #$10, $ff0600.l
004840: 6c00000c         bge.w      $484e
004844: 4eb90000486a     jsr        $486a.l
00484A: 60000014         bra.w      $4860
00484E: 4eb900004894     jsr        $4894.l
004854: 4eb9000049e2     jsr        $49e2.l
00485A: 4eb900004ade     jsr        $4ade.l
004860: 537900ff0602     subq.w     #$1, $ff0602.l
004866: 6682             bne.b      $47ea
004868: 4e75             rts        

; ==== sub_00486A зовут=1 ====
00486A: 7200             moveq      #$0, d1
00486C: 123900ff0600     move.b     $ff0600.l, d1
004872: 0201000f         andi.b     #$f, d1
004876: 47f900004890     lea.l      $4890.l, a3
00487C: 14331000         move.b     (a3, d1.w), d2
004880: 13c200ff0604     move.b     d2, $ff0604.l
004886: 12d8             move.b     (a0)+, (a1)+
004888: 12d8             move.b     (a0)+, (a1)+
00488A: 5302             subq.b     #$1, d2
00488C: 66f8             bne.b      $4886
00488E: 4e75             rts        

; ---- ДАННЫЕ $004890..$004894 (4 байт) ----


; ==== sub_004894 зовут=3 ====
004894: 7200             moveq      #$0, d1
004896: 123900ff0600     move.b     $ff0600.l, d1
00489C: 0201000f         andi.b     #$f, d1
0048A0: 47f900004930     lea.l      $4930.l, a3
0048A6: 13f3100000ff0604 move.b     (a3, d1.w), $ff0604.l
0048AE: 47f900004934     lea.l      $4934.l, a3
0048B4: 13f3100000ff0605 move.b     (a3, d1.w), $ff0605.l
0048BC: 7400             moveq      #$0, d2
0048BE: 47f900ff0610     lea.l      $ff0610.l, a3
0048C4: 49f900ff0620     lea.l      $ff0620.l, a4
0048CA: 16d8             move.b     (a0)+, (a3)+
0048CC: 533900ff0604     subq.b     #$1, $ff0604.l
0048D2: 66f6             bne.b      $48ca
0048D4: 1e3900ff0617     move.b     $ff0617.l, d7
0048DA: 1c3900ff0616     move.b     $ff0616.l, d6
0048E0: 1a3900ff0615     move.b     $ff0615.l, d5
0048E6: 183900ff0614     move.b     $ff0614.l, d4
0048EC: 163900ff0613     move.b     $ff0613.l, d3
0048F2: 143900ff0612     move.b     $ff0612.l, d2
0048F8: 123900ff0611     move.b     $ff0611.l, d1
0048FE: 103900ff0610     move.b     $ff0610.l, d0
004904: e217             roxr.b     #$1, d7
004906: e216             roxr.b     #$1, d6
004908: e215             roxr.b     #$1, d5
00490A: e214             roxr.b     #$1, d4
00490C: e213             roxr.b     #$1, d3
00490E: e212             roxr.b     #$1, d2
004910: e211             roxr.b     #$1, d1
004912: e210             roxr.b     #$1, d0
004914: 6500000e         bcs.w      $4924
004918: 421c             clr.b      (a4)+
00491A: 533900ff0605     subq.b     #$1, $ff0605.l
004920: 66e2             bne.b      $4904
004922: 4e75             rts        
004924: 18d8             move.b     (a0)+, (a4)+
004926: 533900ff0605     subq.b     #$1, $ff0605.l
00492C: 66d6             bne.b      $4904
00492E: 4e75             rts        

; ---- ДАННЫЕ $004930..$004938 (8 байт) ----


; ==== sub_004938 зовут=1 ====
004938: 3e3c0006         move.w     #$6, d7
00493C: 7000             moveq      #$0, d0
00493E: 49f900ff0620     lea.l      $ff0620.l, a4
004944: 123900ff0600     move.b     $ff0600.l, d1
00494A: 0201000f         andi.b     #$f, d1
00494E: 67000032         beq.w      $4982
004952: 02010002         andi.b     #$2, d1
004956: 66000042         bne.w      $499a
00495A: 12340000         move.b     (a4, d0.w), d1
00495E: b3340002         eor.b      d1, $2(a4, d0.w)
004962: 12340001         move.b     $1(a4, d0.w), d1
004966: b3340003         eor.b      d1, $3(a4, d0.w)
00496A: 12340010         move.b     $10(a4, d0.w), d1
00496E: b3340012         eor.b      d1, $12(a4, d0.w)
004972: 12340011         move.b     $11(a4, d0.w), d1
004976: b3340013         eor.b      d1, $13(a4, d0.w)
00497A: 5440             addq.w     #$2, d0
00497C: 51cfffdc         dbra       d7, $495a
004980: 4e75             rts        
004982: 12340000         move.b     (a4, d0.w), d1
004986: b3340002         eor.b      d1, $2(a4, d0.w)
00498A: 12340001         move.b     $1(a4, d0.w), d1
00498E: b3340003         eor.b      d1, $3(a4, d0.w)
004992: 5440             addq.w     #$2, d0
004994: 51cfffec         dbra       d7, $4982
004998: 4e75             rts        
00499A: 12340000         move.b     (a4, d0.w), d1
00499E: b3340002         eor.b      d1, $2(a4, d0.w)
0049A2: 12340001         move.b     $1(a4, d0.w), d1
0049A6: b3340003         eor.b      d1, $3(a4, d0.w)
0049AA: 12340010         move.b     $10(a4, d0.w), d1
0049AE: b3340012         eor.b      d1, $12(a4, d0.w)
0049B2: 12340011         move.b     $11(a4, d0.w), d1
0049B6: b3340013         eor.b      d1, $13(a4, d0.w)
0049BA: 12340020         move.b     $20(a4, d0.w), d1
0049BE: b3340022         eor.b      d1, $22(a4, d0.w)
0049C2: 12340021         move.b     $21(a4, d0.w), d1
0049C6: b3340023         eor.b      d1, $23(a4, d0.w)
0049CA: 12340030         move.b     $30(a4, d0.w), d1
0049CE: b3340032         eor.b      d1, $32(a4, d0.w)
0049D2: 12340031         move.b     $31(a4, d0.w), d1
0049D6: b3340033         eor.b      d1, $33(a4, d0.w)
0049DA: 5440             addq.w     #$2, d0
0049DC: 51cfffbc         dbra       d7, $499a
0049E0: 4e75             rts        

; ==== sub_0049E2 зовут=1 ====
0049E2: 49f900ff0620     lea.l      $ff0620.l, a4
0049E8: 7000             moveq      #$0, d0
0049EA: 123900ff0600     move.b     $ff0600.l, d1
0049F0: 6700001a         beq.w      $4a0c
0049F4: 02010002         andi.b     #$2, d1
0049F8: 6600000a         bne.w      $4a04
0049FC: 3e3c001e         move.w     #$1e, d7
004A00: 6000000e         bra.w      $4a10
004A04: 3e3c00fe         move.w     #$fe, d7
004A08: 60000006         bra.w      $4a10
004A0C: 3e3c000e         move.w     #$e, d7
004A10: 12340000         move.b     (a4, d0.w), d1
004A14: b3340001         eor.b      d1, $1(a4, d0.w)
004A18: 5240             addq.w     #$1, d0
004A1A: 51cffff4         dbra       d7, $4a10
004A1E: 4e75             rts        

; ==== sub_004A20 зовут=1 ====
004A20: 103900ff0600     move.b     $ff0600.l, d0
004A26: 0200000f         andi.b     #$f, d0
004A2A: 67000052         beq.w      $4a7e
004A2E: 423900ff0605     clr.b      $ff0605.l
004A34: 13f900ff060600ff0604 move.b     $ff0606.l, $ff0604.l
004A3E: 0c39000400ff0604 cmpi.b     #$4, $ff0604.l
004A46: 66000010         bne.w      $4a58
004A4A: 524a             addq.w     #$1, a2
004A4C: 427900ff0604     clr.w      $ff0604.l
004A52: 423900ff0606     clr.b      $ff0606.l
004A58: 1012             move.b     (a2), d0
004A5A: 123900ff0605     move.b     $ff0605.l, d1
004A60: e141             asl.w      #$8, d1
004A62: 123900ff0604     move.b     $ff0604.l, d1
004A68: 5341             subq.w     #$1, d1
004A6A: 6b000006         bmi.w      $4a72
004A6E: e410             roxr.b     #$2, d0
004A70: 60f6             bra.b      $4a68
004A72: 02000003         andi.b     #$3, d0
004A76: 523900ff0606     addq.b     #$1, $ff0606.l
004A7C: 4e75             rts        
004A7E: 423900ff0605     clr.b      $ff0605.l
004A84: 13f900ff060600ff0604 move.b     $ff0606.l, $ff0604.l
004A8E: 0c39000800ff0606 cmpi.b     #$8, $ff0606.l
004A96: 66000010         bne.w      $4aa8
004A9A: 524a             addq.w     #$1, a2
004A9C: 427900ff0604     clr.w      $ff0604.l
004AA2: 423900ff0606     clr.b      $ff0606.l
004AA8: 1012             move.b     (a2), d0
004AAA: 123900ff0605     move.b     $ff0605.l, d1
004AB0: e141             asl.w      #$8, d1
004AB2: 123900ff0604     move.b     $ff0604.l, d1
004AB8: 5341             subq.w     #$1, d1
004ABA: 6b000006         bmi.w      $4ac2
004ABE: e210             roxr.b     #$1, d0
004AC0: 60f6             bra.b      $4ab8
004AC2: 02000001         andi.b     #$1, d0
004AC6: 523900ff0606     addq.b     #$1, $ff0606.l
004ACC: 7400             moveq      #$0, d2
004ACE: 1400             move.b     d0, d2
004AD0: 47f900004adc     lea.l      $4adc.l, a3
004AD6: 10332000         move.b     (a3, d2.w), d0
004ADA: 4e75             rts        

; ---- ДАННЫЕ $004ADC..$004ADE (2 байт) ----


; ==== sub_004ADE зовут=3 ====
004ADE: 7200             moveq      #$0, d1
004AE0: 123900ff0600     move.b     $ff0600.l, d1
004AE6: 0201000f         andi.b     #$f, d1
004AEA: 47f900004934     lea.l      $4934.l, a3
004AF0: 12331000         move.b     (a3, d1.w), d1
004AF4: 13c100ff0604     move.b     d1, $ff0604.l
004AFA: 423900ff0605     clr.b      $ff0605.l
004B00: 5341             subq.w     #$1, d1
004B02: 49f900ff0620     lea.l      $ff0620.l, a4
004B08: 12dc             move.b     (a4)+, (a1)+
004B0A: 51c9fffc         dbra       d1, $4b08
004B0E: 4e75             rts        

; ==== sub_004B10 зовут=1 ====
004B10: 7200             moveq      #$0, d1
004B12: 123900ff0600     move.b     $ff0600.l, d1
004B18: 0201000f         andi.b     #$f, d1
004B1C: 47f900004934     lea.l      $4934.l, a3
004B22: 12331000         move.b     (a3, d1.w), d1
004B26: e609             lsr.b      #$3, d1
004B28: 13c100ff0604     move.b     d1, $ff0604.l
004B2E: 423900ff0605     clr.b      $ff0605.l
004B34: 5341             subq.w     #$1, d1
004B36: 4259             clr.w      (a1)+
004B38: 4259             clr.w      (a1)+
004B3A: 4259             clr.w      (a1)+
004B3C: 4259             clr.w      (a1)+
004B3E: 51c9fff6         dbra       d1, $4b36
004B42: 4e75             rts        

; ==== sub_004B44 ТАБЛИЦА зовут=2 ====
004B44: 423900ff0541     clr.b      $ff0541.l
004B4A: 4a7900ff0434     tst.w      $ff0434.l
004B50: 66000684         bne.w      $51d6
004B54: 007c0700         ori.w      #$700, sr
004B58: 4a7900ff0418     tst.w      $ff0418.l
004B5E: 6700000e         beq.w      $4b6e
004B62: 4eb90000064c     jsr        $64c.l
004B68: 4eb9000004a2     jsr        $4a2.l
004B6E: 4eb900003952     jsr        $3952.l
004B74: 08b9000000ff0438 bclr.b     #$0, $ff0438.l
004B7C: 660001ce         bne.w      $4d4c
004B80: 42b900ff10d8     clr.l      $ff10d8.l
004B86: 42b900ff14d8     clr.l      $ff14d8.l
004B8C: 42b900ff18d8     clr.l      $ff18d8.l
004B92: 42b900ff1cd8     clr.l      $ff1cd8.l
004B98: 42b900ff20d8     clr.l      $ff20d8.l
004B9E: 303900ff0418     move.w     $ff0418.l, d0
004BA4: 41fa0952         lea.l      $54f8(pc), a0
004BA8: 13f0000000ff053c move.b     (a0, d0.w), $ff053c.l
004BB0: 13fc009d00ff053d move.b     #$9d, $ff053d.l
004BB8: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
004BC0: 6700005c         beq.w      $4c1e
004BC4: 13fc009600ff053d move.b     #$96, $ff053d.l
004BCC: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
004BD4: 67000048         beq.w      $4c1e
004BD8: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
004BE0: 6700003c         beq.w      $4c1e
004BE4: 13fc009800ff053d move.b     #$98, $ff053d.l
004BEC: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
004BF4: 67000028         beq.w      $4c1e
004BF8: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
004C00: 6700001c         beq.w      $4c1e
004C04: 13fc008b00ff053d move.b     #$8b, $ff053d.l
004C0C: 4a7900ff0418     tst.w      $ff0418.l
004C12: 6600000a         bne.w      $4c1e
004C16: 13fc008800ff053d move.b     #$88, $ff053d.l
004C1E: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
004C26: 66000008         bne.w      $4c30
004C2A: 4eb9000101f2     jsr        $101f2.l
004C30: 13fc00a200ff0538 move.b     #$a2, $ff0538.l
004C38: 13fc00a500ff0539 move.b     #$a5, $ff0539.l
004C40: 13fc00ca00ff053a move.b     #$ca, $ff053a.l
004C48: 13fc00a900ff053b move.b     #$a9, $ff053b.l
004C50: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
004C58: 6f000026         ble.w      $4c80
004C5C: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
004C64: 6700001a         beq.w      $4c80
004C68: 423900ff0539     clr.b      $ff0539.l
004C6E: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
004C76: 6d000008         blt.w      $4c80
004C7A: 423900ff0538     clr.b      $ff0538.l
004C80: 41f900042a5e     lea.l      $42a5e.l, a0
004C86: 43f900ffa000     lea.l      $ffa000.l, a1
004C8C: 4eb9000047aa     jsr        $47aa.l
004C92: 203c40000000     move.l     #$40000000, d0
004C98: 223c94109300     move.l     #$94109300, d1
004C9E: 243c96d09500     move.l     #$96d09500, d2
004CA4: 363c977f         move.w     #$977f, d3
004CA8: 4eb900003980     jsr        $3980.l
004CAE: 4a7900ff0418     tst.w      $ff0418.l
004CB4: 6600003c         bne.w      $4cf2
004CB8: 41f90006a8ec     lea.l      $6a8ec.l, a0
004CBE: 43f900ffa000     lea.l      $ffa000.l, a1
004CC4: 4eb9000047aa     jsr        $47aa.l
004CCA: 7003             moveq      #$3, d0
004CCC: 3e3c16a0         move.w     #$16a0, d7
004CD0: 4eb900003d3e     jsr        $3d3e.l
004CD6: 203c46000000     move.l     #$46000000, d0
004CDC: 223c940b9350     move.l     #$940b9350, d1
004CE2: 243c96d09500     move.l     #$96d09500, d2
004CE8: 363c977f         move.w     #$977f, d3
004CEC: 4eb900003980     jsr        $3980.l
004CF2: 41f900043570     lea.l      $43570.l, a0
004CF8: 43f900ffa000     lea.l      $ffa000.l, a1
004CFE: 4eb9000047aa     jsr        $47aa.l
004D04: 4a3900ff0459     tst.b      $ff0459.l
004D0A: 67000024         beq.w      $4d30
004D0E: 41f900043a7e     lea.l      $43a7e.l, a0
004D14: 43f900ffa080     lea.l      $ffa080.l, a1
004D1A: 45f900043abe     lea.l      $43abe.l, a2
004D20: 47f900ffa280     lea.l      $ffa280.l, a3
004D26: 700f             moveq      #$f, d0
004D28: 22d8             move.l     (a0)+, (a1)+
004D2A: 26da             move.l     (a2)+, (a3)+
004D2C: 51c8fffa         dbra       d0, $4d28
004D30: 203c4e000001     move.l     #$4e000001, d0
004D36: 223c94049300     move.l     #$94049300, d1
004D3C: 243c96d09500     move.l     #$96d09500, d2
004D42: 363c977f         move.w     #$977f, d3
004D46: 4eb900003980     jsr        $3980.l
004D4C: 41f900024dd4     lea.l      $24dd4.l, a0
004D52: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
004D5A: 66000026         bne.w      $4d82
004D5E: 0c79000300ffe180 cmpi.w     #$3, $ffe180.l
004D66: 6d00001a         blt.w      $4d82
004D6A: 41f900024f86     lea.l      $24f86.l, a0
004D70: 0c79000300ffe180 cmpi.w     #$3, $ffe180.l
004D78: 67000008         beq.w      $4d82
004D7C: 41f9000251a2     lea.l      $251a2.l, a0
004D82: 43f900ffa000     lea.l      $ffa000.l, a1
004D88: 4eb9000047aa     jsr        $47aa.l
004D8E: 41f9000253dc     lea.l      $253dc.l, a0
004D94: 43f900ffa400     lea.l      $ffa400.l, a1
004D9A: 4eb9000047aa     jsr        $47aa.l
004DA0: 203c76800000     move.l     #$76800000, d0
004DA6: 223c940293c0     move.l     #$940293c0, d1
004DAC: 243c96d09500     move.l     #$96d09500, d2
004DB2: 363c977f         move.w     #$977f, d3
004DB6: 4eb900003980     jsr        $3980.l
004DBC: 7000             moveq      #$0, d0
004DBE: 303900ff0418     move.w     $ff0418.l, d0
004DC4: 41fa073a         lea.l      $5500(pc), a0
004DC8: 4a300000         tst.b      (a0, d0.w)
004DCC: 660000d4         bne.w      $4ea2
004DD0: 41f9000205d0     lea.l      $205d0.l, a0
004DD6: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
004DDE: 66000012         bne.w      $4df2
004DE2: 303900ffe180     move.w     $ffe180.l, d0
004DE8: e540             asl.w      #$2, d0
004DEA: 41fa071c         lea.l      $5508(pc), a0
004DEE: 20700000         movea.l    (a0, d0.w), a0
004DF2: 43f900ffa000     lea.l      $ffa000.l, a1
004DF8: 4eb9000047aa     jsr        $47aa.l
004DFE: 203c60000000     move.l     #$60000000, d0
004E04: 223c940b9340     move.l     #$940b9340, d1
004E0A: 243c96d09500     move.l     #$96d09500, d2
004E10: 363c977f         move.w     #$977f, d3
004E14: 4eb900003980     jsr        $3980.l
004E1A: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
004E22: 6600004c         bne.w      $4e70
004E26: 0c79000300ffe180 cmpi.w     #$3, $ffe180.l
004E2E: 6d000040         blt.w      $4e70
004E32: 0c79000400ffe180 cmpi.w     #$4, $ffe180.l
004E3A: 66000094         bne.w      $4ed0
004E3E: 41f900043b7e     lea.l      $43b7e.l, a0
004E44: 43f900ffa000     lea.l      $ffa000.l, a1
004E4A: 4eb9000047aa     jsr        $47aa.l
004E50: 203c7c000000     move.l     #$7c000000, d0
004E56: 223c94059300     move.l     #$94059300, d1
004E5C: 243c96d09500     move.l     #$96d09500, d2
004E62: 363c977f         move.w     #$977f, d3
004E66: 4eb900003980     jsr        $3980.l
004E6C: 60000062         bra.w      $4ed0
004E70: 41f9000216e6     lea.l      $216e6.l, a0
004E76: 43f900ffa000     lea.l      $ffa000.l, a1
004E7C: 4eb9000047aa     jsr        $47aa.l
004E82: 203c7c000000     move.l     #$7c000000, d0
004E88: 223c94079380     move.l     #$94079380, d1
004E8E: 243c96d09500     move.l     #$96d09500, d2
004E94: 363c977f         move.w     #$977f, d3
004E98: 4eb900003980     jsr        $3980.l
004E9E: 60000030         bra.w      $4ed0
004EA2: 41f900023fec     lea.l      $23fec.l, a0
004EA8: 43f900ffa000     lea.l      $ffa000.l, a1
004EAE: 4eb9000047aa     jsr        $47aa.l
004EB4: 203c60000000     move.l     #$60000000, d0
004EBA: 223c94089330     move.l     #$94089330, d1
004EC0: 243c96d09500     move.l     #$96d09500, d2
004EC6: 363c977f         move.w     #$977f, d3
004ECA: 4eb900003980     jsr        $3980.l
004ED0: 303900ff0418     move.w     $ff0418.l, d0
004ED6: 0c400001         cmpi.w     #$1, d0
004EDA: 66000016         bne.w      $4ef2
004EDE: 303900ffe180     move.w     $ffe180.l, d0
004EE4: e540             asl.w      #$2, d0
004EE6: 41fa0634         lea.l      $551c(pc), a0
004EEA: 20700000         movea.l    (a0, d0.w), a0
004EEE: 6000000c         bra.w      $4efc
004EF2: e540             asl.w      #$2, d0
004EF4: 41fa063a         lea.l      $5530(pc), a0
004EF8: 20700000         movea.l    (a0, d0.w), a0
004EFC: 43f900ffa000     lea.l      $ffa000.l, a1
004F02: 4eb9000047aa     jsr        $47aa.l
004F08: 4a3900ff4100     tst.b      $ff4100.l
004F0E: 6700009c         beq.w      $4fac
004F12: 41f900045ed6     lea.l      $45ed6.l, a0
004F18: 43f900ffa640     lea.l      $ffa640.l, a1
004F1E: 4eb9000047aa     jsr        $47aa.l
004F24: 41f90005fe9e     lea.l      $5fe9e.l, a0
004F2A: 43f900ffa140     lea.l      $ffa140.l, a1
004F30: 45f90005febe     lea.l      $5febe.l, a2
004F36: 47f900ffa160     lea.l      $ffa160.l, a3
004F3C: 7007             moveq      #$7, d0
004F3E: 22d8             move.l     (a0)+, (a1)+
004F40: 26da             move.l     (a2)+, (a3)+
004F42: 51c8fffa         dbra       d0, $4f3e
004F46: 41f90005fede     lea.l      $5fede.l, a0
004F4C: 43f900ffa280     lea.l      $ffa280.l, a1
004F52: 45f90005fefe     lea.l      $5fefe.l, a2
004F58: 47f900ffa240     lea.l      $ffa240.l, a3
004F5E: 7007             moveq      #$7, d0
004F60: 22d8             move.l     (a0)+, (a1)+
004F62: 26da             move.l     (a2)+, (a3)+
004F64: 51c8fffa         dbra       d0, $4f60
004F68: 41f90005ff1e     lea.l      $5ff1e.l, a0
004F6E: 43f900ffa5e0     lea.l      $ffa5e0.l, a1
004F74: 45f90005ff3e     lea.l      $5ff3e.l, a2
004F7A: 47f900ffa480     lea.l      $ffa480.l, a3
004F80: 7007             moveq      #$7, d0
004F82: 22d8             move.l     (a0)+, (a1)+
004F84: 26da             move.l     (a2)+, (a3)+
004F86: 51c8fffa         dbra       d0, $4f82
004F8A: 41f90005ff5e     lea.l      $5ff5e.l, a0
004F90: 43f900ffa420     lea.l      $ffa420.l, a1
004F96: 45f90005ff7e     lea.l      $5ff7e.l, a2
004F9C: 47f900ffa460     lea.l      $ffa460.l, a3
004FA2: 7007             moveq      #$7, d0
004FA4: 22d8             move.l     (a0)+, (a1)+
004FA6: 26da             move.l     (a2)+, (a3)+
004FA8: 51c8fffa         dbra       d0, $4fa4
004FAC: 203c60000001     move.l     #$60000001, d0
004FB2: 243c96d09500     move.l     #$96d09500, d2
004FB8: 363c977f         move.w     #$977f, d3
004FBC: 223c941c9300     move.l     #$941c9300, d1
004FC2: 4a7900ff0418     tst.w      $ff0418.l
004FC8: 66000008         bne.w      $4fd2
004FCC: 223c94109300     move.l     #$94109300, d1
004FD2: 4eb900003980     jsr        $3980.l
004FD8: 4a3900ff4100     tst.b      $ff4100.l
004FDE: 67000030         beq.w      $5010
004FE2: 41f90006b248     lea.l      $6b248.l, a0
004FE8: 43f900ffa000     lea.l      $ffa000.l, a1
004FEE: 4eb9000047aa     jsr        $47aa.l
004FF4: 203c46000000     move.l     #$46000000, d0
004FFA: 223c94049300     move.l     #$94049300, d1
005000: 243c96d09500     move.l     #$96d09500, d2
005006: 363c977f         move.w     #$977f, d3
00500A: 4eb900003980     jsr        $3980.l
005010: 4a7900ff0418     tst.w      $ff0418.l
005016: 66000078         bne.w      $5090
00501A: 41f900042a5e     lea.l      $42a5e.l, a0
005020: 43f900ffa000     lea.l      $ffa000.l, a1
005026: 4eb9000047aa     jsr        $47aa.l
00502C: 203c70000001     move.l     #$70000001, d0
005032: 223c94009370     move.l     #$94009370, d1
005038: 243c96d89500     move.l     #$96d89500, d2
00503E: 363c977f         move.w     #$977f, d3
005042: 4eb900003980     jsr        $3980.l
005048: 203c72000001     move.l     #$72000001, d0
00504E: 223c94009370     move.l     #$94009370, d1
005054: 243c96d99500     move.l     #$96d99500, d2
00505A: 363c977f         move.w     #$977f, d3
00505E: 4eb900003980     jsr        $3980.l
005064: 41f90002d90a     lea.l      $2d90a.l, a0
00506A: 7003             moveq      #$3, d0
00506C: 7e03             moveq      #$3, d7
00506E: 4eb900003c74     jsr        $3c74.l
005074: 203c7bc00001     move.l     #$7bc00001, d0
00507A: 223c94019300     move.l     #$94019300, d1
005080: 243c96d09500     move.l     #$96d09500, d2
005086: 363c977f         move.w     #$977f, d3
00508A: 4eb900003980     jsr        $3980.l
005090: 303900ff0418     move.w     $ff0418.l, d0
005096: 0c400001         cmpi.w     #$1, d0
00509A: 66000016         bne.w      $50b2
00509E: 303900ffe180     move.w     $ffe180.l, d0
0050A4: e540             asl.w      #$2, d0
0050A6: 41fa04a8         lea.l      $5550(pc), a0
0050AA: 20700000         movea.l    (a0, d0.w), a0
0050AE: 6000000c         bra.w      $50bc
0050B2: e540             asl.w      #$2, d0
0050B4: 41fa04ae         lea.l      $5564(pc), a0
0050B8: 20700000         movea.l    (a0, d0.w), a0
0050BC: 43f900ffa000     lea.l      $ffa000.l, a1
0050C2: 4eb9000047aa     jsr        $47aa.l
0050C8: 4a7900ff0418     tst.w      $ff0418.l
0050CE: 6600000c         bne.w      $50dc
0050D2: 203c60000002     move.l     #$60000002, d0
0050D8: 60000008         bra.w      $50e2
0050DC: 203c58000002     move.l     #$58000002, d0
0050E2: 223c940393c0     move.l     #$940393c0, d1
0050E8: 243c96d09500     move.l     #$96d09500, d2
0050EE: 363c977f         move.w     #$977f, d3
0050F2: 4eb900003980     jsr        $3980.l
0050F8: 7e27             moveq      #$27, d7
0050FA: 7c1b             moveq      #$1b, d6
0050FC: 2a3c60000003     move.l     #$60000003, d5
005102: 4df90005ff9e     lea.l      $5ff9e.l, a6
005108: 4a3900ff4100     tst.b      $ff4100.l
00510E: 6600002e         bne.w      $513e
005112: 303900ff0418     move.w     $ff0418.l, d0
005118: 0c400001         cmpi.w     #$1, d0
00511C: 66000016         bne.w      $5134
005120: 303900ffe180     move.w     $ffe180.l, d0
005126: e540             asl.w      #$2, d0
005128: 41fa045a         lea.l      $5584(pc), a0
00512C: 2c700000         movea.l    (a0, d0.w), a6
005130: 6000000c         bra.w      $513e
005134: e540             asl.w      #$2, d0
005136: 41fa0460         lea.l      $5598(pc), a0
00513A: 2c700000         movea.l    (a0, d0.w), a6
00513E: 4eb900000622     jsr        $622.l
005144: 41f900ff8000     lea.l      $ff8000.l, a0
00514A: 303c037f         move.w     #$37f, d0
00514E: 4298             clr.l      (a0)+
005150: 51c8fffc         dbra       d0, $514e
005154: 41f900062912     lea.l      $62912.l, a0
00515A: 4a3900ff4100     tst.b      $ff4100.l
005160: 66000024         bne.w      $5186
005164: 41fa06b0         lea.l      $5816(pc), a0
005168: 303900ff0418     move.w     $ff0418.l, d0
00516E: 0c400001         cmpi.w     #$1, d0
005172: 6600000c         bne.w      $5180
005176: 41fa06be         lea.l      $5836(pc), a0
00517A: 303900ffe180     move.w     $ffe180.l, d0
005180: e540             asl.w      #$2, d0
005182: 20700000         movea.l    (a0, d0.w), a0
005186: 43f900ffa000     lea.l      $ffa000.l, a1
00518C: 4eb9000047aa     jsr        $47aa.l
005192: 610026e2         bsr.w      $7876
005196: 41f900ffa000     lea.l      $ffa000.l, a0
00519C: 43f900ffa870     lea.l      $ffa870.l, a1
0051A2: 45f900ff0560     lea.l      $ff0560.l, a2
0051A8: 47f900ff05b0     lea.l      $ff05b0.l, a3
0051AE: 7013             moveq      #$13, d0
0051B0: 24d8             move.l     (a0)+, (a2)+
0051B2: 26d9             move.l     (a1)+, (a3)+
0051B4: 51c8fffa         dbra       d0, $51b0
0051B8: 303900ff0418     move.w     $ff0418.l, d0
0051BE: 41fa03f8         lea.l      $55b8(pc), a0
0051C2: 13f0000000ff0426 move.b     (a0, d0.w), $ff0426.l
0051CA: 4df90000584a     lea.l      $584a.l, a6
0051D0: 4eb90000067a     jsr        $67a.l
0051D6: 427900ff0300     clr.w      $ff0300.l
0051DC: 4df900005758     lea.l      $5758.l, a6
0051E2: 4a3900ff4100     tst.b      $ff4100.l
0051E8: 66000030         bne.w      $521a
0051EC: 303900ff0418     move.w     $ff0418.l, d0
0051F2: 0c400001         cmpi.w     #$1, d0
0051F6: 66000018         bne.w      $5210
0051FA: 303900ffe180     move.w     $ffe180.l, d0
005200: e540             asl.w      #$2, d0
005202: 41f9000055f0     lea.l      $55f0.l, a0
005208: 2c700000         movea.l    (a0, d0.w), a6
00520C: 6000000c         bra.w      $521a
005210: e540             asl.w      #$2, d0
005212: 4dfa03bc         lea.l      $55d0(pc), a6
005216: 2c760000         movea.l    (a6, d0.w), a6
00521A: 4eb90000067a     jsr        $67a.l
005220: 4df90000577a     lea.l      $577a.l, a6
005226: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00522E: 67000030         beq.w      $5260
005232: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00523A: 67000024         beq.w      $5260
00523E: 4df9000057b0     lea.l      $57b0.l, a6
005244: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00524C: 66000012         bne.w      $5260
005250: 303900ffe180     move.w     $ffe180.l, d0
005256: e540             asl.w      #$2, d0
005258: 41fa0542         lea.l      $579c(pc), a0
00525C: 2c700000         movea.l    (a0, d0.w), a6
005260: 4eb90000067a     jsr        $67a.l
005266: 4eb900000368     jsr        $368.l
00526C: 303900ffef90     move.w     $ffef90.l, d0
005272: 02400003         andi.w     #$3, d0
005276: 13c000ff410d     move.b     d0, $ff410d.l
00527C: 4eb90000921c     jsr        $921c.l
005282: 4a7900ff0418     tst.w      $ff0418.l
005288: 6600004e         bne.w      $52d8
00528C: 41f900ffe200     lea.l      $ffe200.l, a0
005292: 43f900ff3230     lea.l      $ff3230.l, a1
005298: 7000             moveq      #$0, d0
00529A: 103900ff0449     move.b     $ff0449.l, d0
0052A0: e940             asl.w      #$4, d0
0052A2: d1c0             adda.l     d0, a0
0052A4: 7003             moveq      #$3, d0
0052A6: 22d8             move.l     (a0)+, (a1)+
0052A8: 51c8fffc         dbra       d0, $52a6
0052AC: 4a3900ff0448     tst.b      $ff0448.l
0052B2: 6600000a         bne.w      $52be
0052B6: 13fc000100ff10b0 move.b     #$1, $ff10b0.l
0052BE: 4eb90001534e     jsr        $1534e.l
0052C4: 423900ff3300     clr.b      $ff3300.l
0052CA: 41f900ff3310     lea.l      $ff3310.l, a0
0052D0: 700f             moveq      #$f, d0
0052D2: 4298             clr.l      (a0)+
0052D4: 51c8fffc         dbra       d0, $52d2
0052D8: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
0052E0: 6600005a         bne.w      $533c
0052E4: 4df900ff1000     lea.l      $ff1000.l, a6
0052EA: 1d7c000000b8     move.b     #$0, $b8(a6)
0052F0: 2d7c00ff898200bc move.l     #$ff8982, $bc(a6)
0052F8: 3d7c250000c0     move.w     #$2500, $c0(a6)
0052FE: 2d7c6000000200c2 move.l     #$60000002, $c2(a6)
005306: 422e00bb         clr.b      $bb(a6)
00530A: 4eb90001068c     jsr        $1068c.l
005310: 4dee0400         lea.l      $400(a6), a6
005314: 1d7c000000b8     move.b     #$0, $b8(a6)
00531A: 2d7c00ff89ce00bc move.l     #$ff89ce, $bc(a6)
005322: 3d7c251800c0     move.w     #$2518, $c0(a6)
005328: 2d7c6300000200c2 move.l     #$63000002, $c2(a6)
005330: 1d7c000100bb     move.b     #$1, $bb(a6)
005336: 4eb90001068c     jsr        $1068c.l
00533C: 4a3900ff4100     tst.b      $ff4100.l
005342: 66000074         bne.w      $53b8
005346: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
00534E: 66000068         bne.w      $53b8
005352: 427900ff043c     clr.w      $ff043c.l
005358: 4df900ff1800     lea.l      $ff1800.l, a6
00535E: 426e004c         clr.w      $4c(a6)
005362: 1d7c000c00b8     move.b     #$c, $b8(a6)
005368: 2d7c00ff8a9e00bc move.l     #$ff8a9e, $bc(a6)
005370: 3d7c250000c0     move.w     #$2500, $c0(a6)
005376: 2d7c6000000200c2 move.l     #$60000002, $c2(a6)
00537E: 422e00bb         clr.b      $bb(a6)
005382: 4eb90001068c     jsr        $1068c.l
005388: 4dee0400         lea.l      $400(a6), a6
00538C: 426e004c         clr.w      $4c(a6)
005390: 1d7c000c00b8     move.b     #$c, $b8(a6)
005396: 2d7c00ff8ab200bc move.l     #$ff8ab2, $bc(a6)
00539E: 3d7c251800c0     move.w     #$2518, $c0(a6)
0053A4: 2d7c6300000200c2 move.l     #$63000002, $c2(a6)
0053AC: 1d7c000100bb     move.b     #$1, $bb(a6)
0053B2: 4eb90001068c     jsr        $1068c.l
0053B8: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
0053C0: 6700000e         beq.w      $53d0
0053C4: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
0053CC: 66000008         bne.w      $53d6
0053D0: 4eb90001042e     jsr        $1042e.l
0053D6: 41f900ff8000     lea.l      $ff8000.l, a0
0053DC: 43f900ff9000     lea.l      $ff9000.l, a1
0053E2: 303c037f         move.w     #$37f, d0
0053E6: 22d8             move.l     (a0)+, (a1)+
0053E8: 51c8fffc         dbra       d0, $53e6
0053EC: 303900ff0418     move.w     $ff0418.l, d0
0053F2: e340             asl.w      #$1, d0
0053F4: 41fa01ca         lea.l      $55c0(pc), a0
0053F8: 33f0000000ff0422 move.w     (a0, d0.w), $ff0422.l
005400: 4a3900ff4100     tst.b      $ff4100.l
005406: 66000016         bne.w      $541e
00540A: 4a7900ff0418     tst.w      $ff0418.l
005410: 6700000c         beq.w      $541e
005414: 4a7900ff0434     tst.w      $ff0434.l
00541A: 67000038         beq.w      $5454
00541E: 43f900ff0300     lea.l      $ff0300.l, a1
005424: 41f900ff0380     lea.l      $ff0380.l, a0
00542A: 701f             moveq      #$1f, d0
00542C: 22d8             move.l     (a0)+, (a1)+
00542E: 51c8fffc         dbra       d0, $542c
005432: 4a3900ff4100     tst.b      $ff4100.l
005438: 67000004         beq.w      $543e
00543C: 4e75             rts        
00543E: 33fc001c00ff0406 move.w     #$1c, $ff0406.l
005446: 33fc000400ff0500 move.w     #$4, $ff0500.l
00544E: 4ef90000f238     jmp        $f238.l
005454: 41f90004399c     lea.l      $4399c.l, a0
00545A: 43f900ffa000     lea.l      $ffa000.l, a1
005460: 4eb9000047aa     jsr        $47aa.l
005466: 41f900ffa000     lea.l      $ffa000.l, a0
00546C: 43f900ff8318     lea.l      $ff8318.l, a1
005472: 720e             moveq      #$e, d1
005474: 7007             moveq      #$7, d0
005476: 22d8             move.l     (a0)+, (a1)+
005478: 51c8fffc         dbra       d0, $5476
00547C: d3fc00000060     adda.l     #$60, a1
005482: 51c9fff0         dbra       d1, $5474
005486: 41f9000054f0     lea.l      $54f0.l, a0
00548C: 43f900ff0000     lea.l      $ff0000.l, a1
005492: 7200             moveq      #$0, d1
005494: 32d8             move.w     (a0)+, (a1)+
005496: 3018             move.w     (a0)+, d0
005498: 8159             or.w       d0, (a1)+
00549A: 32d8             move.w     (a0)+, (a1)+
00549C: 32d8             move.w     (a0)+, (a1)+
00549E: 51c9fff4         dbra       d1, $5494
0054A2: 427900ff0500     clr.w      $ff0500.l
0054A8: 13fc000100ff040d move.b     #$1, $ff040d.l
0054B0: 427900ff0408     clr.w      $ff0408.l
0054B6: 33fc000400ff0416 move.w     #$4, $ff0416.l
0054BE: 4eb900000642     jsr        $642.l
0054C4: 427900ff0432     clr.w      $ff0432.l
0054CA: 33fc001c00ff0406 move.w     #$1c, $ff0406.l
0054D2: 4eb90000392e     jsr        $392e.l
0054D8: 08b9000100ff0438 bclr.b     #$1, $ff0438.l
0054E0: 67000004         beq.w      $54e6
0054E4: 4e75             rts        
0054E6: 3e3c0087         move.w     #$87, d7
0054EA: 4ef900003d7a     jmp        $3d7a.l

; ---- ДАННЫЕ $0054F0..$0058AC (956 байт) ----


; ==== sub_0058AC ТАБЛИЦА зовут=0 ====
0058AC: 4eb9000099d0     jsr        $99d0.l
0058B2: 103900ff10dc     move.b     $ff10dc.l, d0
0058B8: 803900ff14dc     or.b       $ff14dc.l, d0
0058BE: 803900ff18dc     or.b       $ff18dc.l, d0
0058C4: 803900ff1cdc     or.b       $ff1cdc.l, d0
0058CA: 803900ff20dc     or.b       $ff20dc.l, d0
0058D0: 670001a2         beq.w      $5a74
0058D4: 4a7900ff0418     tst.w      $ff0418.l
0058DA: 6600000e         bne.w      $58ea
0058DE: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
0058E6: 6c00018c         bge.w      $5a74
0058EA: 4df900ff1000     lea.l      $ff1000.l, a6
0058F0: 08ae000000dc     bclr.b     #$0, $dc(a6)
0058F6: 66000008         bne.w      $5900
0058FA: 4dee0400         lea.l      $400(a6), a6
0058FE: 60f0             bra.b      $58f0
005900: 23ce00ff044c     move.l     a6, $ff044c.l
005906: 423900ff0456     clr.b      $ff0456.l
00590C: 423900ff10dc     clr.b      $ff10dc.l
005912: 423900ff14dc     clr.b      $ff14dc.l
005918: 423900ff18dc     clr.b      $ff18dc.l
00591E: 423900ff1cdc     clr.b      $ff1cdc.l
005924: 423900ff20dc     clr.b      $ff20dc.l
00592A: 33fc003c00ff0406 move.w     #$3c, $ff0406.l
005932: 41f900ff8000     lea.l      $ff8000.l, a0
005938: 43f900ff9000     lea.l      $ff9000.l, a1
00593E: 303c03ff         move.w     #$3ff, d0
005942: 22d8             move.l     (a0)+, (a1)+
005944: 51c8fffc         dbra       d0, $5942
005948: 41f900ff0300     lea.l      $ff0300.l, a0
00594E: 43f900ff0380     lea.l      $ff0380.l, a1
005954: 303c001f         move.w     #$1f, d0
005958: 22d8             move.l     (a0)+, (a1)+
00595A: 51c8fffc         dbra       d0, $5958
00595E: 41f900007a9e     lea.l      $7a9e.l, a0
005964: 43f900ff0340     lea.l      $ff0340.l, a1
00596A: 7007             moveq      #$7, d0
00596C: 22d8             move.l     (a0)+, (a1)+
00596E: 51c8fffc         dbra       d0, $596c
005972: 13fc000100ff0400 move.b     #$1, $ff0400.l
00597A: 41f900ff0000     lea.l      $ff0000.l, a0
005980: 43f900ff2800     lea.l      $ff2800.l, a1
005986: 303c00bf         move.w     #$bf, d0
00598A: 22d8             move.l     (a0)+, (a1)+
00598C: 51c8fffc         dbra       d0, $598a
005990: 4eb900003952     jsr        $3952.l
005996: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00599E: 66000014         bne.w      $59b4
0059A2: 4df900ff1000     lea.l      $ff1000.l, a6
0059A8: 610000a0         bsr.w      $5a4a
0059AC: 4dee0400         lea.l      $400(a6), a6
0059B0: 61000098         bsr.w      $5a4a
0059B4: 13fc000100ff040d move.b     #$1, $ff040d.l
0059BC: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
0059C6: 4df900ff1000     lea.l      $ff1000.l, a6
0059CC: 302e00f4         move.w     $f4(a6), d0
0059D0: 3f00             move.w     d0, -(a7)
0059D2: 3d7c000100f4     move.w     #$1, $f4(a6)
0059D8: 4eb90000e62c     jsr        $e62c.l
0059DE: 301f             move.w     (a7)+, d0
0059E0: 3d4000f4         move.w     d0, $f4(a6)
0059E4: 4eb90000dfae     jsr        $dfae.l
0059EA: 6100005a         bsr.w      $5a46
0059EE: 4dee0400         lea.l      $400(a6), a6
0059F2: 537900ff0424     subq.w     #$1, $ff0424.l
0059F8: 66d2             bne.b      $59cc
0059FA: 1e3c00b0         move.b     #$b0, d7
0059FE: 4eb900003d7a     jsr        $3d7a.l
005A04: 4eb900000ee2     jsr        $ee2.l
005A0A: 4eb900000ee2     jsr        $ee2.l
005A10: 4a7900ff0418     tst.w      $ff0418.l
005A16: 6700002c         beq.w      $5a44
005A1A: 40e7             move.w     sr, -(a7)
005A1C: 007c0700         ori.w      #$700, sr
005A20: 33fc010000a11100 move.w     #$100, $a11100.l
005A28: 0839000000a11100 btst.b     #$0, $a11100.l
005A30: 66f6             bne.b      $5a28
005A32: 13fc000100a01c10 move.b     #$1, $a01c10.l
005A3A: 33fc000000a11100 move.w     #$0, $a11100.l
005A42: 46df             move.w     (a7)+, sr
005A44: 4e75             rts        

; ==== sub_005A46 зовут=1 ====
005A46: 60002076         bra.w      $7abe

; ==== sub_005A4A зовут=2 ====
005A4A: 1d6e00b800d7     move.b     $b8(a6), $d7(a6)
005A50: 4eb900000368     jsr        $368.l
005A56: 303900ffef90     move.w     $ffef90.l, d0
005A5C: 02400003         andi.w     #$3, d0
005A60: 41fa000e         lea.l      $5a70(pc), a0
005A64: 1d70000000b8     move.b     (a0, d0.w), $b8(a6)
005A6A: 4ef90001068c     jmp        $1068c.l

; ---- ДАННЫЕ $005A70..$005A74 (4 байт) ----

005A74: 4eb900009e12     jsr        $9e12.l
005A7A: 4df900ff1000     lea.l      $ff1000.l, a6
005A80: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005A8A: 610011c8         bsr.w      $6c54
005A8E: 4dee0400         lea.l      $400(a6), a6
005A92: 537900ff0424     subq.w     #$1, $ff0424.l
005A98: 66f0             bne.b      $5a8a
005A9A: 4eb900004548     jsr        $4548.l
005AA0: 610012d6         bsr.w      $6d78
005AA4: 4df900ff1000     lea.l      $ff1000.l, a6
005AAA: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005AB4: 4eb90000e9b8     jsr        $e9b8.l
005ABA: 4dee0400         lea.l      $400(a6), a6
005ABE: 537900ff0424     subq.w     #$1, $ff0424.l
005AC4: 66ee             bne.b      $5ab4
005AC6: 4a7900ff1002     tst.w      $ff1002.l
005ACC: 66000026         bne.w      $5af4
005AD0: 41f900ff0560     lea.l      $ff0560.l, a0
005AD6: 43f900ff8000     lea.l      $ff8000.l, a1
005ADC: 45f900ff05b0     lea.l      $ff05b0.l, a2
005AE2: 47f900ff8d80     lea.l      $ff8d80.l, a3
005AE8: 303c0013         move.w     #$13, d0
005AEC: 22d8             move.l     (a0)+, (a1)+
005AEE: 26da             move.l     (a2)+, (a3)+
005AF0: 51c8fffa         dbra       d0, $5aec
005AF4: 4eb90000ec1e     jsr        $ec1e.l
005AFA: 4eb900009c34     jsr        $9c34.l
005B00: 4eb9000104de     jsr        $104de.l
005B06: 61001d92         bsr.w      $789a
005B0A: 13fc000100ff040d move.b     #$1, $ff040d.l
005B12: 13fc000100ff0400 move.b     #$1, $ff0400.l
005B1A: 4e75             rts        

; ==== sub_005B1C ТАБЛИЦА зовут=0 ====
005B1C: 0c79000800ff0432 cmpi.w     #$8, $ff0432.l
005B24: 6c000024         bge.w      $5b4a
005B28: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005B32: 4df900ff1000     lea.l      $ff1000.l, a6
005B38: 4eb90000cfee     jsr        $cfee.l
005B3E: 4dee0400         lea.l      $400(a6), a6
005B42: 537900ff0424     subq.w     #$1, $ff0424.l
005B48: 66ee             bne.b      $5b38
005B4A: 41fa0084         lea.l      $5bd0(pc), a0
005B4E: 303900ff0432     move.w     $ff0432.l, d0
005B54: 20700000         movea.l    (a0, d0.w), a0
005B58: 4e90             jsr        (a0)
005B5A: 4a7900ff0418     tst.w      $ff0418.l
005B60: 66000014         bne.w      $5b76
005B64: 0c79000c00ff0432 cmpi.w     #$c, $ff0432.l
005B6C: 6c000008         bge.w      $5b76
005B70: 4eb9000139aa     jsr        $139aa.l
005B76: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
005B7E: 6600001a         bne.w      $5b9a
005B82: 4df900ff1000     lea.l      $ff1000.l, a6
005B88: 4eb9000106b2     jsr        $106b2.l
005B8E: 4df900ff1400     lea.l      $ff1400.l, a6
005B94: 4eb9000106b2     jsr        $106b2.l
005B9A: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
005BA2: 6600001a         bne.w      $5bbe
005BA6: 4df900ff1800     lea.l      $ff1800.l, a6
005BAC: 4eb9000106b2     jsr        $106b2.l
005BB2: 4df900ff1c00     lea.l      $ff1c00.l, a6
005BB8: 4eb9000106b2     jsr        $106b2.l
005BBE: 13fc000100ff040d move.b     #$1, $ff040d.l
005BC6: 13fc000100ff0400 move.b     #$1, $ff0400.l
005BCE: 4e75             rts        

; ---- ДАННЫЕ $005BD0..$005BE4 (20 байт) ----


; ==== sub_005BE4 ТАБЛИЦА зовут=0 ====
005BE4: 13fc000100ff0400 move.b     #$1, $ff0400.l
005BEC: 537900ff0408     subq.w     #$1, $ff0408.l
005BF2: 67000004         beq.w      $5bf8
005BF6: 4e75             rts        
005BF8: 33fc000400ff0432 move.w     #$4, $ff0432.l
005C00: 33fc000400ff0408 move.w     #$4, $ff0408.l
005C08: 4e75             rts        

; ==== sub_005C0A ТАБЛИЦА зовут=0 ====
005C0A: 537900ff0408     subq.w     #$1, $ff0408.l
005C10: 67000004         beq.w      $5c16
005C14: 4e75             rts        
005C16: 33fc000400ff0408 move.w     #$4, $ff0408.l
005C1E: 4df900ff1000     lea.l      $ff1000.l, a6
005C24: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005C2E: 7e00             moveq      #$0, d7
005C30: 61000fd4         bsr.w      $6c06
005C34: 4dee0400         lea.l      $400(a6), a6
005C38: 537900ff0424     subq.w     #$1, $ff0424.l
005C3E: 66f0             bne.b      $5c30
005C40: be7900ff0422     cmp.w      $ff0422.l, d7
005C46: 660000d2         bne.w      $5d1a
005C4A: 33fc000800ff0432 move.w     #$8, $ff0432.l
005C52: 33fc008c00ff0408 move.w     #$8c, $ff0408.l
005C5A: 423900ff0508     clr.b      $ff0508.l
005C60: 4eb900004362     jsr        $4362.l
005C66: 4a7900ff0418     tst.w      $ff0418.l
005C6C: 670011e2         beq.w      $6e50
005C70: 41f900007a9e     lea.l      $7a9e.l, a0
005C76: 43f900ff0340     lea.l      $ff0340.l, a1
005C7C: 7007             moveq      #$7, d0
005C7E: 22d8             move.l     (a0)+, (a1)+
005C80: 51c8fffc         dbra       d0, $5c7e
005C84: 41f900ff0300     lea.l      $ff0300.l, a0
005C8A: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005C94: 7000             moveq      #$0, d0
005C96: 4df900ff1000     lea.l      $ff1000.l, a6
005C9C: 102e0034         move.b     $34(a6), d0
005CA0: 42700000         clr.w      (a0, d0.w)
005CA4: 4dee0400         lea.l      $400(a6), a6
005CA8: 537900ff0424     subq.w     #$1, $ff0424.l
005CAE: 66ec             bne.b      $5c9c
005CB0: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
005CB8: 67001196         beq.w      $6e50
005CBC: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
005CC4: 6700118a         beq.w      $6e50
005CC8: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
005CD0: 6700117e         beq.w      $6e50
005CD4: 1e3c0091         move.b     #$91, d7
005CD8: 4eb900003d7a     jsr        $3d7a.l
005CDE: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
005CE6: 6d000008         blt.w      $5cf0
005CEA: 4eb90001042e     jsr        $1042e.l
005CF0: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005CFA: 4df900ff1000     lea.l      $ff1000.l, a6
005D00: 13fc000100ff0457 move.b     #$1, $ff0457.l
005D08: 4eb900003ec4     jsr        $3ec4.l
005D0E: 4dee0400         lea.l      $400(a6), a6
005D12: 537900ff0424     subq.w     #$1, $ff0424.l
005D18: 66e6             bne.b      $5d00
005D1A: 4e75             rts        

; ==== sub_005D1C ТАБЛИЦА зовут=0 ====
005D1C: 4a7900ff0418     tst.w      $ff0418.l
005D22: 6600000e         bne.w      $5d32
005D26: 427900ff3222     clr.w      $ff3222.l
005D2C: 427900ff3210     clr.w      $ff3210.l
005D32: 523900ff0508     addq.b     #$1, $ff0508.l
005D38: 0839000000ff0508 btst.b     #$0, $ff0508.l
005D40: 67000008         beq.w      $5d4a
005D44: 4eb90000fb4e     jsr        $fb4e.l
005D4A: 4a7900ff0408     tst.w      $ff0408.l
005D50: 670000b2         beq.w      $5e04
005D54: 537900ff0408     subq.w     #$1, $ff0408.l
005D5A: 66000040         bne.w      $5d9c
005D5E: 4a7900ff0418     tst.w      $ff0418.l
005D64: 66000036         bne.w      $5d9c
005D68: 61000034         bsr.w      $5d9e
005D6C: 3e3c003c         move.w     #$3c, d7
005D70: 3f07             move.w     d7, -(a7)
005D72: 523900ff0508     addq.b     #$1, $ff0508.l
005D78: 0839000000ff0508 btst.b     #$0, $ff0508.l
005D80: 67000008         beq.w      $5d8a
005D84: 4eb90000fb4e     jsr        $fb4e.l
005D8A: 4eb9000139aa     jsr        $139aa.l
005D90: 4eb900000ee2     jsr        $ee2.l
005D96: 3e1f             move.w     (a7)+, d7
005D98: 51cfffd6         dbra       d7, $5d70
005D9C: 4e75             rts        

; ==== sub_005D9E зовут=1 ====
005D9E: 3e3900ff1088     move.w     $ff1088.l, d7
005DA4: be7900ff1488     cmp.w      $ff1488.l, d7
005DAA: 6700000c         beq.w      $5db8
005DAE: 1e3c00bf         move.b     #$bf, d7
005DB2: 4eb900003d7a     jsr        $3d7a.l
005DB8: 1a3900ff044a     move.b     $ff044a.l, d5
005DBE: 6700000c         beq.w      $5dcc
005DC2: 43f900ff869e     lea.l      $ff869e.l, a1
005DC8: 61000012         bsr.w      $5ddc
005DCC: 1a3900ff044b     move.b     $ff044b.l, d5
005DD2: 6700002a         beq.w      $5dfe
005DD6: 43f900ff86ae     lea.l      $ff86ae.l, a1

; ==== sub_005DDC зовут=1 ====
005DDC: 41fa0022         lea.l      $5e00(pc), a0
005DE0: 303c0300         move.w     #$300, d0
005DE4: 7e01             moveq      #$1, d7
005DE6: 7c01             moveq      #$1, d6
005DE8: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
005DEC: 4eb900010fc2     jsr        $10fc2.l
005DF2: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
005DF6: 43e90100         lea.l      $100(a1), a1
005DFA: 5345             subq.w     #$1, d5
005DFC: 66de             bne.b      $5ddc
005DFE: 4e75             rts        

; ---- ДАННЫЕ $005E00..$005E04 (4 байт) ----

005E04: 4a7900ff0418     tst.w      $ff0418.l
005E0A: 67000030         beq.w      $5e3c
005E0E: 4eb9000099d0     jsr        $99d0.l
005E14: 103900ff1041     move.b     $ff1041.l, d0
005E1A: 803900ff1441     or.b       $ff1441.l, d0
005E20: 803900ff1841     or.b       $ff1841.l, d0
005E26: 803900ff1c41     or.b       $ff1c41.l, d0
005E2C: 803900ff2041     or.b       $ff2041.l, d0
005E32: 020000f0         andi.b     #$f0, d0
005E36: 66000004         bne.w      $5e3c
005E3A: 4e75             rts        
005E3C: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
005E44: 6700000e         beq.w      $5e54
005E48: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
005E50: 66000014         bne.w      $5e66
005E54: 0c79000100ff041c cmpi.w     #$1, $ff041c.l
005E5C: 67000008         beq.w      $5e66
005E60: 4eb90000b206     jsr        $b206.l
005E66: 4a7900ff0418     tst.w      $ff0418.l
005E6C: 6600001a         bne.w      $5e88
005E70: 0c39000200ff044a cmpi.b     #$2, $ff044a.l
005E78: 67000162         beq.w      $5fdc
005E7C: 0c39000200ff044b cmpi.b     #$2, $ff044b.l
005E84: 670002e6         beq.w      $616c
005E88: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
005E90: 6700000e         beq.w      $5ea0
005E94: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
005E9C: 6600000e         bne.w      $5eac
005EA0: 0c79000100ff041c cmpi.w     #$1, $ff041c.l
005EA8: 66000028         bne.w      $5ed2
005EAC: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
005EB6: 4df900ff1000     lea.l      $ff1000.l, a6
005EBC: 61001c00         bsr.w      $7abe
005EC0: 4dee0400         lea.l      $400(a6), a6
005EC4: 537900ff0424     subq.w     #$1, $ff0424.l
005ECA: 66f0             bne.b      $5ebc
005ECC: 4eb900000ee2     jsr        $ee2.l
005ED2: 4a7900ff0418     tst.w      $ff0418.l
005ED8: 670000c8         beq.w      $5fa2
005EDC: 537900ff041c     subq.w     #$1, $ff041c.l
005EE2: 67000060         beq.w      $5f44
005EE6: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
005EEE: 6700001a         beq.w      $5f0a
005EF2: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
005EFA: 6700000e         beq.w      $5f0a
005EFE: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
005F06: 6600009a         bne.w      $5fa2
005F0A: 4a3900ff0458     tst.b      $ff0458.l
005F10: 66000090         bne.w      $5fa2
005F14: 343900ff041c     move.w     $ff041c.l, d2
005F1A: 103900ff10d8     move.b     $ff10d8.l, d0
005F20: 123900ff14d8     move.b     $ff14d8.l, d1
005F26: b200             cmp.b      d0, d1
005F28: 67000078         beq.w      $5fa2
005F2C: 6d00000e         blt.w      $5f3c
005F30: d002             add.b      d2, d0
005F32: b001             cmp.b      d1, d0
005F34: 6c00006c         bge.w      $5fa2
005F38: 6000000a         bra.w      $5f44
005F3C: d202             add.b      d2, d1
005F3E: b200             cmp.b      d0, d1
005F40: 6c000060         bge.w      $5fa2
005F44: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
005F4C: 67000022         beq.w      $5f70
005F50: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
005F58: 67000016         beq.w      $5f70
005F5C: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
005F64: 6700000a         beq.w      $5f70
005F68: 61002a6a         bsr.w      $89d4
005F6C: 60000006         bra.w      $5f74
005F70: 61001ba4         bsr.w      $7b16
005F74: 4eb900003940     jsr        $3940.l
005F7A: 33fc001000ff0406 move.w     #$10, $ff0406.l
005F82: 423900ff4109     clr.b      $ff4109.l
005F88: 427900ff0434     clr.w      $ff0434.l
005F8E: 427900ff0420     clr.w      $ff0420.l
005F94: 427900ff044a     clr.w      $ff044a.l
005F9A: 423900ff4109     clr.b      $ff4109.l
005FA0: 4e75             rts        
005FA2: 423900ff4109     clr.b      $ff4109.l
005FA8: 427900ff0420     clr.w      $ff0420.l
005FAE: 33fc000100ff0434 move.w     #$1, $ff0434.l
005FB6: 33fc001800ff0406 move.w     #$18, $ff0406.l
005FBE: 4a7900ff0418     tst.w      $ff0418.l
005FC4: 66000014         bne.w      $5fda
005FC8: 7000             moveq      #$0, d0
005FCA: 4eb900013982     jsr        $13982.l
005FD0: 1e3c0085         move.b     #$85, d7
005FD4: 4eb900003d7a     jsr        $3d7a.l
005FDA: 4e75             rts        
005FDC: 33fc000c00ff0432 move.w     #$c, $ff0432.l
005FE4: 427900ff0500     clr.w      $ff0500.l
005FEA: 7000             moveq      #$0, d0
005FEC: 103900ff0449     move.b     $ff0449.l, d0
005FF2: e540             asl.w      #$2, d0
005FF4: 41fa00b6         lea.l      $60ac(pc), a0
005FF8: 23f0000000ff04d0 move.l     (a0, d0.w), $ff04d0.l
006000: 423900ff04d8     clr.b      $ff04d8.l
006006: 13fc000600ff04d9 move.b     #$6, $ff04d9.l
00600E: 13fc000600ff04da move.b     #$6, $ff04da.l
006016: 41f900ffa000     lea.l      $ffa000.l, a0
00601C: 701f             moveq      #$1f, d0
00601E: 20fc04040404     move.l     #$4040404, (a0)+
006024: 51c8fff8         dbra       d0, $601e
006028: 41f900ff86a4     lea.l      $ff86a4.l, a0
00602E: 4290             clr.l      (a0)
006030: 42a80004         clr.l      $4(a0)
006034: 42a80080         clr.l      $80(a0)
006038: 42a80084         clr.l      $84(a0)
00603C: 33fc003c00ff0406 move.w     #$3c, $ff0406.l
006044: 4df900ff1000     lea.l      $ff1000.l, a6
00604A: 4eb90000dfae     jsr        $dfae.l
006050: 41f900ffa000     lea.l      $ffa000.l, a0
006056: 226e0044         movea.l    $44(a6), a1
00605A: 303c0000         move.w     #$0, d0
00605E: 7e09             moveq      #$9, d7
006060: 7c02             moveq      #$2, d6
006062: 4eb900010fc2     jsr        $10fc2.l
006068: 4dee0400         lea.l      $400(a6), a6
00606C: 4eb90000dfae     jsr        $dfae.l
006072: 41f900ffa000     lea.l      $ffa000.l, a0
006078: 226e0044         movea.l    $44(a6), a1
00607C: 303c0000         move.w     #$0, d0
006080: 7e09             moveq      #$9, d7
006082: 7c02             moveq      #$2, d6
006084: 4eb900010fc2     jsr        $10fc2.l
00608A: 33fc002400ff0406 move.w     #$24, $ff0406.l
006092: 41f900ff8000     lea.l      $ff8000.l, a0
006098: 43f900ff9000     lea.l      $ff9000.l, a1
00609E: 303c03ff         move.w     #$3ff, d0
0060A2: 22d8             move.l     (a0)+, (a1)+
0060A4: 51c8fffc         dbra       d0, $60a2
0060A8: 600016de         bra.w      $7788

; ---- ДАННЫЕ $0060AC..$00616C (192 байт) ----

00616C: 33fc001000ff0432 move.w     #$10, $ff0432.l
006174: 427900ff0500     clr.w      $ff0500.l
00617A: 7000             moveq      #$0, d0
00617C: 103900ff0449     move.b     $ff0449.l, d0
006182: e540             asl.w      #$2, d0
006184: 41faff86         lea.l      $610c(pc), a0
006188: 23f0000000ff04d0 move.l     (a0, d0.w), $ff04d0.l
006190: 423900ff04d8     clr.b      $ff04d8.l
006196: 13fc000600ff04d9 move.b     #$6, $ff04d9.l
00619E: 13fc000600ff04da move.b     #$6, $ff04da.l
0061A6: 6000fe6e         bra.w      $6016

; ==== sub_0061AA ТАБЛИЦА зовут=0 ====
0061AA: 303900ff0500     move.w     $ff0500.l, d0
0061B0: 41fa0008         lea.l      $61ba(pc), a0
0061B4: 20700000         movea.l    (a0, d0.w), a0
0061B8: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $0061BA..$0061D2 (24 байт) ----


; ==== sub_0061D2 ТАБЛИЦА зовут=0 ====
0061D2: 4a3900ff04d8     tst.b      $ff04d8.l
0061D8: 6600000e         bne.w      $61e8
0061DC: 4eb9000139aa     jsr        $139aa.l
0061E2: 4ef900013366     jmp        $13366.l
0061E8: 33fc000400ff0500 move.w     #$4, $ff0500.l
0061F0: 4e75             rts        

; ==== sub_0061F2 ТАБЛИЦА зовут=0 ====
0061F2: 4eb9000139aa     jsr        $139aa.l
0061F8: 103900ffe00d     move.b     $ffe00d.l, d0
0061FE: 020000e0         andi.b     #$e0, d0
006202: 66000004         bne.w      $6208
006206: 4e75             rts        
006208: 41f900ff9000     lea.l      $ff9000.l, a0
00620E: 43f900ff8000     lea.l      $ff8000.l, a1
006214: 303c03ff         move.w     #$3ff, d0
006218: 22d8             move.l     (a0)+, (a1)+
00621A: 51c8fffc         dbra       d0, $6218
00621E: 41f900030d0a     lea.l      $30d0a.l, a0
006224: 43f900ffa000     lea.l      $ffa000.l, a1
00622A: 4eb9000047aa     jsr        $47aa.l
006230: 007c0700         ori.w      #$700, sr
006234: 203c5e000000     move.l     #$5e000000, d0
00623A: 223c94019300     move.l     #$94019300, d1
006240: 243c96d09500     move.l     #$96d09500, d2
006246: 363c977f         move.w     #$977f, d3
00624A: 4eb900003980     jsr        $3980.l
006250: 027cf8ff         andi.w     #$f8ff, sr
006254: 33fc000800ff0500 move.w     #$8, $ff0500.l
00625C: 33fc00c700ffa000 move.w     #$c7, $ffa000.l
006264: 33fc00cf00ffa002 move.w     #$cf, $ffa002.l
00626C: 33fc00d700ffa004 move.w     #$d7, $ffa004.l
006274: 33fc00df00ffa006 move.w     #$df, $ffa006.l
00627C: 33fc00e700ffa008 move.w     #$e7, $ffa008.l
006284: 33fc00ef00ffa00a move.w     #$ef, $ffa00a.l
00628C: 1e3c0086         move.b     #$86, d7
006290: 4eb900003d7a     jsr        $3d7a.l
006296: 3e3c0078         move.w     #$78, d7
00629A: 3f07             move.w     d7, -(a7)
00629C: 4eb9000139aa     jsr        $139aa.l
0062A2: 13fc000100ff040d move.b     #$1, $ff040d.l
0062AA: 4eb900000ee2     jsr        $ee2.l
0062B0: 3e1f             move.w     (a7)+, d7
0062B2: 51cfffe6         dbra       d7, $629a
0062B6: 1e3c00c9         move.b     #$c9, d7
0062BA: 4ef900003d7a     jmp        $3d7a.l

; ==== sub_0062C0 ТАБЛИЦА зовут=0 ====
0062C0: 45f900ffa000     lea.l      $ffa000.l, a2
0062C6: 43f900ff89a2     lea.l      $ff89a2.l, a1
0062CC: 7e05             moveq      #$5, d7
0062CE: 2f09             move.l     a1, -(a7)
0062D0: 3012             move.w     (a2), d0
0062D2: 0c4000ff         cmpi.w     #$ff, d0
0062D6: 67000006         beq.w      $62de
0062DA: 5240             addq.w     #$1, d0
0062DC: 5252             addq.w     #$1, (a2)
0062DE: 0c4000f0         cmpi.w     #$f0, d0
0062E2: 6d00000e         blt.w      $62f2
0062E6: 00408000         ori.w      #$8000, d0
0062EA: 7c05             moveq      #$5, d6
0062EC: 32c0             move.w     d0, (a1)+
0062EE: 51cefffc         dbra       d6, $62ec
0062F2: 225f             movea.l    (a7)+, a1
0062F4: 43e90080         lea.l      $80(a1), a1
0062F8: 45ea0002         lea.l      $2(a2), a2
0062FC: 51cfffd0         dbra       d7, $62ce
006300: 0c7900ff00ffa000 cmpi.w     #$ff, $ffa000.l
006308: 66000128         bne.w      $6432
00630C: 4eb900003952     jsr        $3952.l
006312: 13fc000100ff040d move.b     #$1, $ff040d.l
00631A: 41f900ff4000     lea.l      $ff4000.l, a0
006320: 10280001         move.b     $1(a0), d0
006324: d0280003         add.b      $3(a0), d0
006328: d0280005         add.b      $5(a0), d0
00632C: d0280007         add.b      $7(a0), d0
006330: d0280009         add.b      $9(a0), d0
006334: d028000b         add.b      $b(a0), d0
006338: 0c000009         cmpi.b     #$9, d0
00633C: 67000d86         beq.w      $70c4
006340: 4eb900000368     jsr        $368.l
006346: 323900ffef90     move.w     $ffef90.l, d1
00634C: 0241000f         andi.w     #$f, d1
006350: 41f900007188     lea.l      $7188.l, a0
006356: 7000             moveq      #$0, d0
006358: 103900ff0449     move.b     $ff0449.l, d0
00635E: ed40             asl.w      #$6, d0
006360: d041             add.w      d1, d0
006362: 7200             moveq      #$0, d1
006364: 0c7900b400ff0446 cmpi.w     #$b4, $ff0446.l
00636C: 6f000020         ble.w      $638e
006370: 7210             moveq      #$10, d1
006372: 0c7900f000ff0446 cmpi.w     #$f0, $ff0446.l
00637A: 6f000012         ble.w      $638e
00637E: 7220             moveq      #$20, d1
006380: 0c79016800ff0446 cmpi.w     #$168, $ff0446.l
006388: 6f000004         ble.w      $638e
00638C: 7230             moveq      #$30, d1
00638E: d041             add.w      d1, d0
006390: 10300000         move.b     (a0, d0.w), d0
006394: 67000d2e         beq.w      $70c4
006398: 13c000ff0508     move.b     d0, $ff0508.l
00639E: 41f9000448ce     lea.l      $448ce.l, a0
0063A4: 43f900ffa000     lea.l      $ffa000.l, a1
0063AA: 4eb9000047aa     jsr        $47aa.l
0063B0: 007c0700         ori.w      #$700, sr
0063B4: 203c40000002     move.l     #$40000002, d0
0063BA: 223c940293a0     move.l     #$940293a0, d1
0063C0: 243c96d09500     move.l     #$96d09500, d2
0063C6: 363c977f         move.w     #$977f, d3
0063CA: 4eb900003980     jsr        $3980.l
0063D0: 027cf8ff         andi.w     #$f8ff, sr
0063D4: 41f900006434     lea.l      $6434.l, a0
0063DA: 43f900ff8aa2     lea.l      $ff8aa2.l, a1
0063E0: 303c6400         move.w     #$6400, d0
0063E4: 3e3c0005         move.w     #$5, d7
0063E8: 3c3c0003         move.w     #$3, d6
0063EC: 4eb900010fc2     jsr        $10fc2.l
0063F2: 61001394         bsr.w      $7788
0063F6: 41f90000a386     lea.l      $a386.l, a0
0063FC: 43f900ff0360     lea.l      $ff0360.l, a1
006402: 7007             moveq      #$7, d0
006404: 22d8             move.l     (a0)+, (a1)+
006406: 51c8fffc         dbra       d0, $6404
00640A: 41fa0052         lea.l      $645e(pc), a0
00640E: 23c800ff04d0     move.l     a0, $ff04d0.l
006414: 423900ff04d8     clr.b      $ff04d8.l
00641A: 13fc000600ff04d9 move.b     #$6, $ff04d9.l
006422: 13fc000600ff04da move.b     #$6, $ff04da.l
00642A: 33fc000c00ff0500 move.w     #$c, $ff0500.l
006432: 4e75             rts        

; ---- ДАННЫЕ $006434..$006488 (84 байт) ----


; ==== sub_006488 ТАБЛИЦА зовут=0 ====
006488: 4a3900ff04d8     tst.b      $ff04d8.l
00648E: 66000008         bne.w      $6498
006492: 4ef900013366     jmp        $13366.l
006498: 33fc001000ff0500 move.w     #$10, $ff0500.l
0064A0: 4e75             rts        

; ==== sub_0064A2 ТАБЛИЦА зовут=0 ====
0064A2: 103900ffe00d     move.b     $ffe00d.l, d0
0064A8: 020000e0         andi.b     #$e0, d0
0064AC: 66000004         bne.w      $64b2
0064B0: 4e75             rts        
0064B2: 41f90000644c     lea.l      $644c.l, a0
0064B8: 43f900ff8a22     lea.l      $ff8a22.l, a1
0064BE: 303c6400         move.w     #$6400, d0
0064C2: 3e3c0005         move.w     #$5, d7
0064C6: 3c3c0002         move.w     #$2, d6
0064CA: 4eb900010fc2     jsr        $10fc2.l
0064D0: 1e3c00b8         move.b     #$b8, d7
0064D4: 4eb900003d7a     jsr        $3d7a.l
0064DA: 41f900ffa000     lea.l      $ffa000.l, a0
0064E0: 7077             moveq      #$77, d0
0064E2: 10fc0004         move.b     #$4, (a0)+
0064E6: 51c8fffa         dbra       d0, $64e2
0064EA: 41f900ffa000     lea.l      $ffa000.l, a0
0064F0: 43f900ff8514     lea.l      $ff8514.l, a1
0064F6: 303c8000         move.w     #$8000, d0
0064FA: 3e3c0013         move.w     #$13, d7
0064FE: 3c3c0005         move.w     #$5, d6
006502: 4eb900010fc2     jsr        $10fc2.l
006508: 4eb900000ee2     jsr        $ee2.l
00650E: 41f900ffa000     lea.l      $ffa000.l, a0
006514: 303c00ff         move.w     #$ff, d0
006518: 20fc11111111     move.l     #$11111111, (a0)+
00651E: 51c8fff8         dbra       d0, $6518
006522: 7000             moveq      #$0, d0
006524: 103900ff0508     move.b     $ff0508.l, d0
00652A: 5340             subq.w     #$1, d0
00652C: e540             asl.w      #$2, d0
00652E: 41fa002c         lea.l      $655c(pc), a0
006532: 20700000         movea.l    (a0, d0.w), a0
006536: 23c800ff04d0     move.l     a0, $ff04d0.l
00653C: 423900ff04d8     clr.b      $ff04d8.l
006542: 13fc000600ff04d9 move.b     #$6, $ff04d9.l
00654A: 13fc000600ff04da move.b     #$6, $ff04da.l
006552: 33fc001400ff0500 move.w     #$14, $ff0500.l
00655A: 4e75             rts        

; ---- ДАННЫЕ $00655C..$0066CA (366 байт) ----


; ==== sub_0066CA ТАБЛИЦА зовут=0 ====
0066CA: 4a3900ff04d8     tst.b      $ff04d8.l
0066D0: 66000008         bne.w      $66da
0066D4: 4ef900013366     jmp        $13366.l
0066DA: 103900ffe00d     move.b     $ffe00d.l, d0
0066E0: 020000e0         andi.b     #$e0, d0
0066E4: 66000004         bne.w      $66ea
0066E8: 4e75             rts        
0066EA: 103900ff0508     move.b     $ff0508.l, d0
0066F0: 41f900ff4000     lea.l      $ff4000.l, a0
0066F6: 0c000001         cmpi.b     #$1, d0
0066FA: 6600000e         bne.w      $670a
0066FE: 10bc0001         move.b     #$1, (a0)
006702: 52280001         addq.b     #$1, $1(a0)
006706: 600009bc         bra.w      $70c4
00670A: 41e80002         lea.l      $2(a0), a0
00670E: b010             cmp.b      (a0), d0
006710: 6600000a         bne.w      $671c
006714: 52280001         addq.b     #$1, $1(a0)
006718: 600009aa         bra.w      $70c4
00671C: 4a10             tst.b      (a0)
00671E: 67000008         beq.w      $6728
006722: 41e80002         lea.l      $2(a0), a0
006726: 60e6             bra.b      $670e
006728: 1080             move.b     d0, (a0)
00672A: 117c00010001     move.b     #$1, $1(a0)
006730: 60000992         bra.w      $70c4

; ==== sub_006734 ТАБЛИЦА зовут=0 ====
006734: 303900ff0500     move.w     $ff0500.l, d0
00673A: 41fa0008         lea.l      $6744(pc), a0
00673E: 20700000         movea.l    (a0, d0.w), a0
006742: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $006744..$006760 (28 байт) ----


; ==== sub_006760 ТАБЛИЦА зовут=0 ====
006760: 4eb9000139aa     jsr        $139aa.l
006766: 4a3900ff04d8     tst.b      $ff04d8.l
00676C: 66000008         bne.w      $6776
006770: 4ef900013366     jmp        $13366.l
006776: 0c79000100ff3012 cmpi.w     #$1, $ff3012.l
00677E: 67000004         beq.w      $6784
006782: 4e75             rts        
006784: 33fc000400ff0500 move.w     #$4, $ff0500.l
00678C: 4e75             rts        

; ==== sub_00678E ТАБЛИЦА зовут=0 ====
00678E: 4eb9000139aa     jsr        $139aa.l
006794: 103900ffe00d     move.b     $ffe00d.l, d0
00679A: 020000e0         andi.b     #$e0, d0
00679E: 66000004         bne.w      $67a4
0067A2: 4e75             rts        
0067A4: 4eb900003952     jsr        $3952.l
0067AA: 13fc000100ff040d move.b     #$1, $ff040d.l
0067B2: 4eb9000138d2     jsr        $138d2.l
0067B8: e540             asl.w      #$2, d0
0067BA: 41f900039ab8     lea.l      $39ab8.l, a0
0067C0: 20700000         movea.l    (a0, d0.w), a0
0067C4: 43f900ff89a2     lea.l      $ff89a2.l, a1
0067CA: 3e3c0005         move.w     #$5, d7
0067CE: 3c3c0005         move.w     #$5, d6
0067D2: 4eb900010fdc     jsr        $10fdc.l
0067D8: 4a3900ff4001     tst.b      $ff4001.l
0067DE: 67000082         beq.w      $6862
0067E2: 533900ff4001     subq.b     #$1, $ff4001.l
0067E8: 66000008         bne.w      $67f2
0067EC: 423900ff4000     clr.b      $ff4000.l
0067F2: 33fc8b0300ffef8a move.w     #$8b03, $ffef8a.l
0067FA: 427900ff0508     clr.w      $ff0508.l
006800: 23fc0000000000ff050c move.l     #$0, $ff050c.l
00680A: 33fc000800ff0504 move.w     #$8, $ff0504.l
006812: 427900ff0506     clr.w      $ff0506.l
006818: 42b900ff0530     clr.l      $ff0530.l
00681E: 42b900ff0534     clr.l      $ff0534.l
006824: 13fc00e100ff0530 move.b     #$e1, $ff0530.l
00682C: 13fc00c800ff0532 move.b     #$c8, $ff0532.l
006834: 33fc000800ff0500 move.w     #$8, $ff0500.l
00683C: 007c0700         ori.w      #$700, sr
006840: 203c6c000002     move.l     #$6c000002, d0
006846: 223c94029300     move.l     #$94029300, d1
00684C: 243c96849500     move.l     #$96849500, d2
006852: 363c977f         move.w     #$977f, d3
006856: 4eb900003980     jsr        $3980.l
00685C: 027cf8ff         andi.w     #$f8ff, sr
006860: 4e75             rts        
006862: 423900ff4109     clr.b      $ff4109.l
006868: 427900ff0420     clr.w      $ff0420.l
00686E: 427900ff0434     clr.w      $ff0434.l
006874: 427900ff044a     clr.w      $ff044a.l
00687A: 4eb90000079e     jsr        $79e.l
006880: 4eb900003940     jsr        $3940.l
006886: 4eb9000088e6     jsr        $88e6.l
00688C: 41f900ff0000     lea.l      $ff0000.l, a0
006892: 303c383f         move.w     #$383f, d0
006896: 4298             clr.l      (a0)+
006898: 51c8fffc         dbra       d0, $6896
00689C: 33fc001000ff0406 move.w     #$10, $ff0406.l
0068A4: 4e75             rts        

; ==== sub_0068A6 ТАБЛИЦА зовут=0 ====
0068A6: 610002ba         bsr.w      $6b62
0068AA: 0c79003000ff050c cmpi.w     #$30, $ff050c.l
0068B2: 67000004         beq.w      $68b8
0068B6: 4e75             rts        
0068B8: 41f900ff0300     lea.l      $ff0300.l, a0
0068BE: 43f900ff4040     lea.l      $ff4040.l, a1
0068C4: 701f             moveq      #$1f, d0
0068C6: 22d8             move.l     (a0)+, (a1)+
0068C8: 51c8fffc         dbra       d0, $68c6
0068CC: 41f900ff0380     lea.l      $ff0380.l, a0
0068D2: 701f             moveq      #$1f, d0
0068D4: 4298             clr.l      (a0)+
0068D6: 51c8fffc         dbra       d0, $68d4
0068DA: 33fc000c00ff0500 move.w     #$c, $ff0500.l
0068E2: 13fc000800ff0502 move.b     #$8, $ff0502.l
0068EA: 13fc000800ff0503 move.b     #$8, $ff0503.l
0068F2: 4e75             rts        

; ==== sub_0068F4 ТАБЛИЦА зовут=0 ====
0068F4: 6100026c         bsr.w      $6b62
0068F8: 533900ff0503     subq.b     #$1, $ff0503.l
0068FE: 66000064         bne.w      $6964
006902: 13fc000800ff0503 move.b     #$8, $ff0503.l
00690A: 4eb9000038b0     jsr        $38b0.l
006910: 533900ff0502     subq.b     #$1, $ff0502.l
006916: 6600004c         bne.w      $6964
00691A: 33fc001000ff0500 move.w     #$10, $ff0500.l
006922: 41f900ff4040     lea.l      $ff4040.l, a0
006928: 43f900ff0380     lea.l      $ff0380.l, a1
00692E: 701f             moveq      #$1f, d0
006930: 22d8             move.l     (a0)+, (a1)+
006932: 51c8fffc         dbra       d0, $6930
006936: 13fc000800ff0502 move.b     #$8, $ff0502.l
00693E: 13fc000800ff0503 move.b     #$8, $ff0503.l
006946: 33fc000100ff0506 move.w     #$1, $ff0506.l
00694E: 41f90006085e     lea.l      $6085e.l, a0
006954: 43f900ffa000     lea.l      $ffa000.l, a1
00695A: 4eb9000047aa     jsr        $47aa.l
006960: 61000f14         bsr.w      $7876
006964: 4e75             rts        

; ==== sub_006966 ТАБЛИЦА зовут=0 ====
006966: 610001fa         bsr.w      $6b62
00696A: 4a7900ff050c     tst.w      $ff050c.l
006970: 6600004c         bne.w      $69be
006974: 33fc001400ff0500 move.w     #$14, $ff0500.l
00697C: 33fc8b0000ffef8a move.w     #$8b00, $ffef8a.l
006984: 41f900ff8000     lea.l      $ff8000.l, a0
00698A: 43f900ff9000     lea.l      $ff9000.l, a1
006990: 303c03ff         move.w     #$3ff, d0
006994: 22d8             move.l     (a0)+, (a1)+
006996: 51c8fffc         dbra       d0, $6994
00699A: 41fa011e         lea.l      $6aba(pc), a0
00699E: 23c800ff04d0     move.l     a0, $ff04d0.l
0069A4: 423900ff04d8     clr.b      $ff04d8.l
0069AA: 13fc000600ff04d9 move.b     #$6, $ff04d9.l
0069B2: 13fc000600ff04da move.b     #$6, $ff04da.l
0069BA: 60000dcc         bra.w      $7788
0069BE: 533900ff0503     subq.b     #$1, $ff0503.l
0069C4: 66000020         bne.w      $69e6
0069C8: 13fc000800ff0503 move.b     #$8, $ff0503.l
0069D0: 4a7900ff0502     tst.w      $ff0502.l
0069D6: 6700000e         beq.w      $69e6
0069DA: 4eb9000038b0     jsr        $38b0.l
0069E0: 533900ff0502     subq.b     #$1, $ff0502.l
0069E6: 4e75             rts        

; ==== sub_0069E8 ТАБЛИЦА зовут=0 ====
0069E8: 4a3900ff04d8     tst.b      $ff04d8.l
0069EE: 66000008         bne.w      $69f8
0069F2: 4ef900013366     jmp        $13366.l
0069F8: 103900ffe00d     move.b     $ffe00d.l, d0
0069FE: 020000e0         andi.b     #$e0, d0
006A02: 66000004         bne.w      $6a08
006A06: 4e75             rts        
006A08: 41f900ff9000     lea.l      $ff9000.l, a0
006A0E: 43f900ff8000     lea.l      $ff8000.l, a1
006A14: 303c03ff         move.w     #$3ff, d0
006A18: 22d8             move.l     (a0)+, (a1)+
006A1A: 51c8fffc         dbra       d0, $6a18
006A1E: 7000             moveq      #$0, d0
006A20: 4eb900013982     jsr        $13982.l
006A26: 13fc000100ff040d move.b     #$1, $ff040d.l
006A2E: 41f900ff0320     lea.l      $ff0320.l, a0
006A34: 7007             moveq      #$7, d0
006A36: 4298             clr.l      (a0)+
006A38: 51c8fffc         dbra       d0, $6a36
006A3C: 33fc001800ff0500 move.w     #$18, $ff0500.l
006A44: 13fc000800ff0502 move.b     #$8, $ff0502.l
006A4C: 13fc000800ff0503 move.b     #$8, $ff0503.l
006A54: 13fc000100ff0400 move.b     #$1, $ff0400.l
006A5C: 4e75             rts        

; ==== sub_006A5E ТАБЛИЦА зовут=0 ====
006A5E: 533900ff0503     subq.b     #$1, $ff0503.l
006A64: 66000052         bne.w      $6ab8
006A68: 13fc000800ff0503 move.b     #$8, $ff0503.l
006A70: 4eb9000038b0     jsr        $38b0.l
006A76: 533900ff0502     subq.b     #$1, $ff0502.l
006A7C: 6600003a         bne.w      $6ab8
006A80: 1e3c0085         move.b     #$85, d7
006A84: 4eb900003d7a     jsr        $3d7a.l
006A8A: 4eb900000ee2     jsr        $ee2.l
006A90: 423900ff4109     clr.b      $ff4109.l
006A96: 423900ff044a     clr.b      $ff044a.l
006A9C: 423900ff044b     clr.b      $ff044b.l
006AA2: 427900ff0420     clr.w      $ff0420.l
006AA8: 33fc000100ff0434 move.w     #$1, $ff0434.l
006AB0: 33fc001800ff0406 move.w     #$18, $ff0406.l
006AB8: 4e75             rts        

; ---- ДАННЫЕ $006ABA..$006B62 (168 байт) ----


; ==== sub_006B62 зовут=3 ====
006B62: 41f9000039f4     lea.l      $39f4.l, a0
006B68: 43f900ff0800     lea.l      $ff0800.l, a1
006B6E: 323900ff0508     move.w     $ff0508.l, d1
006B74: 383c00df         move.w     #$df, d4
006B78: 3401             move.w     d1, d2
006B7A: e342             asl.w      #$1, d2
006B7C: 36302000         move.w     (a0, d2.w), d3
006B80: 303900ff050c     move.w     $ff050c.l, d0
006B86: 024000ff         andi.w     #$ff, d0
006B8A: c7c0             muls.w     d0, d3
006B8C: e08b             lsr.l      #$8, d3
006B8E: 0243ffff         andi.w     #$ffff, d3
006B92: 32c3             move.w     d3, (a1)+
006B94: 32c3             move.w     d3, (a1)+
006B96: 5841             addq.w     #$4, d1
006B98: 024100ff         andi.w     #$ff, d1
006B9C: 51ccffda         dbra       d4, $6b78
006BA0: 007c0700         ori.w      #$700, sr
006BA4: 203c6c000002     move.l     #$6c000002, d0
006BAA: 223c94029300     move.l     #$94029300, d1
006BB0: 243c96849500     move.l     #$96849500, d2
006BB6: 363c977f         move.w     #$977f, d3
006BBA: 4eb900003980     jsr        $3980.l
006BC0: 027cf8ff         andi.w     #$f8ff, sr
006BC4: 587900ff0508     addq.w     #$4, $ff0508.l
006BCA: 027900ff00ff0508 andi.w     #$ff, $ff0508.l
006BD2: 537900ff0504     subq.w     #$1, $ff0504.l
006BD8: 6600001e         bne.w      $6bf8
006BDC: 33fc000400ff0504 move.w     #$4, $ff0504.l
006BE4: 4a7900ff0506     tst.w      $ff0506.l
006BEA: 6600000e         bne.w      $6bfa
006BEE: 06b90001000000ff050c addi.l     #$10000, $ff050c.l
006BF8: 4e75             rts        
006BFA: 04b90001000000ff050c subi.l     #$10000, $ff050c.l
006C04: 4e75             rts        

; ==== sub_006C06 зовут=1 ====
006C06: 49ee0200         lea.l      $200(a6), a4
006C0A: 303c0012         move.w     #$12, d0
006C0E: 429c             clr.l      (a4)+
006C10: 429c             clr.l      (a4)+
006C12: 429c             clr.l      (a4)+
006C14: 429c             clr.l      (a4)+
006C16: 51c8fff6         dbra       d0, $6c0e
006C1A: 5247             addq.w     #$1, d7
006C1C: 4a6e007e         tst.w      $7e(a6)
006C20: 67000020         beq.w      $6c42
006C24: 5347             subq.w     #$1, d7
006C26: 536e007e         subq.w     #$1, $7e(a6)
006C2A: 04ae000000100006 subi.l     #$10, $6(a6)
006C32: 3f07             move.w     d7, -(a7)
006C34: 1e3900ff053b     move.b     $ff053b.l, d7
006C3A: 4eb900003d7a     jsr        $3d7a.l
006C40: 3e1f             move.w     (a7)+, d7
006C42: 1d7c00010098     move.b     #$1, $98(a6)
006C48: 3f07             move.w     d7, -(a7)
006C4A: 4eb90000bb28     jsr        $bb28.l
006C50: 3e1f             move.w     (a7)+, d7
006C52: 4e75             rts        

; ==== sub_006C54 зовут=1 ====
006C54: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
006C5A: 6d00000a         blt.w      $6c66
006C5E: 4eb90000cfee     jsr        $cfee.l
006C64: 4e75             rts        
006C66: 4eb90000ee7e     jsr        $ee7e.l
006C6C: 522e0093         addq.b     #$1, $93(a6)
006C70: 0c2e00060093     cmpi.b     #$6, $93(a6)
006C76: 66000010         bne.w      $6c88
006C7A: 422e0093         clr.b      $93(a6)
006C7E: 522e0092         addq.b     #$1, $92(a6)
006C82: 022e00070092     andi.b     #$7, $92(a6)
006C88: 422e0098         clr.b      $98(a6)
006C8C: 4bee0100         lea.l      $100(a6), a5
006C90: 4eb90000eac8     jsr        $eac8.l
006C96: 4eb90000eba8     jsr        $eba8.l
006C9C: 4eb900013de6     jsr        $13de6.l
006CA2: 4eb90000d116     jsr        $d116.l
006CA8: 4eb900009bf2     jsr        $9bf2.l
006CAE: 4eb90000e62c     jsr        $e62c.l
006CB4: 4eb900009d5e     jsr        $9d5e.l
006CBA: 0c6e0014004c     cmpi.w     #$14, $4c(a6)
006CC0: 67000014         beq.w      $6cd6
006CC4: 4eb90000c84a     jsr        $c84a.l
006CCA: 4eb90000cfee     jsr        $cfee.l
006CD0: 4eb90000ce52     jsr        $ce52.l
006CD6: 4eb90000bb28     jsr        $bb28.l
006CDC: 302e00f0         move.w     $f0(a6), d0
006CE0: 806e00f2         or.w       $f2(a6), d0
006CE4: 806e00f4         or.w       $f4(a6), d0
006CE8: 806e00f6         or.w       $f6(a6), d0
006CEC: 806e00f8         or.w       $f8(a6), d0
006CF0: 806e00ca         or.w       $ca(a6), d0
006CF4: 6600000a         bne.w      $6d00
006CF8: 422e00a9         clr.b      $a9(a6)
006CFC: 6000000c         bra.w      $6d0a
006D00: 522e00a9         addq.b     #$1, $a9(a6)
006D04: 022e000f00a9     andi.b     #$f, $a9(a6)
006D0A: 7200             moveq      #$0, d1
006D0C: 122e00a9         move.b     $a9(a6), d1
006D10: e301             asl.b      #$1, d1
006D12: 41fa0024         lea.l      $6d38(pc), a0
006D16: 4a6e00ca         tst.w      $ca(a6)
006D1A: 67000006         beq.w      $6d22
006D1E: 41fa0038         lea.l      $6d58(pc), a0
006D22: 32301000         move.w     (a0, d1.w), d1
006D26: 41f900ff0300     lea.l      $ff0300.l, a0
006D2C: 7000             moveq      #$0, d0
006D2E: 102e0034         move.b     $34(a6), d0
006D32: 31810000         move.w     d1, (a0, d0.w)
006D36: 4e75             rts        

; ---- ДАННЫЕ $006D38..$006D78 (64 байт) ----


; ==== sub_006D78 зовут=1 ====
006D78: 423900ff10e1     clr.b      $ff10e1.l
006D7E: 423900ff14e1     clr.b      $ff14e1.l
006D84: 423900ff18e1     clr.b      $ff18e1.l
006D8A: 423900ff1ce1     clr.b      $ff1ce1.l
006D90: 423900ff20e1     clr.b      $ff20e1.l
006D96: 303900ff0418     move.w     $ff0418.l, d0
006D9C: e540             asl.w      #$2, d0
006D9E: 41fa007a         lea.l      $6e1a(pc), a0
006DA2: 20700000         movea.l    (a0, d0.w), a0
006DA6: 4e90             jsr        (a0)
006DA8: 3e3900ff0422     move.w     $ff0422.l, d7
006DAE: 5347             subq.w     #$1, d7
006DB0: 41f900ff1000     lea.l      $ff1000.l, a0
006DB6: 0c680018004c     cmpi.w     #$18, $4c(a0)
006DBC: 6d000008         blt.w      $6dc6
006DC0: 317c1000005c     move.w     #$1000, $5c(a0)
006DC6: 41e80400         lea.l      $400(a0), a0
006DCA: 51cfffea         dbra       d7, $6db6
006DCE: 41f900ff1000     lea.l      $ff1000.l, a0
006DD4: 43f900ff1400     lea.l      $ff1400.l, a1
006DDA: 3228005c         move.w     $5c(a0), d1
006DDE: b269005c         cmp.w      $5c(a1), d1
006DE2: 6d000018         blt.w      $6dfc
006DE6: 66000010         bne.w      $6df8
006DEA: 343900ffef90     move.w     $ffef90.l, d2
006DF0: 02420001         andi.w     #$1, d2
006DF4: 67000006         beq.w      $6dfc
006DF8: c149             exg.l      a0, a1
006DFA: 2248             movea.l    a0, a1
006DFC: 43e90400         lea.l      $400(a1), a1
006E00: b1fc00ff2000     cmpa.l     #$ff2000, a0
006E06: 6700000a         beq.w      $6e12
006E0A: b3fc00ff2400     cmpa.l     #$ff2400, a1
006E10: 66c8             bne.b      $6dda
006E12: 117c000100e1     move.b     #$1, $e1(a0)
006E18: 4e75             rts        

; ---- ДАННЫЕ $006E1A..$006E36 (28 байт) ----


; ==== sub_006E36 ТАБЛИЦА зовут=0 ====
006E36: 33fc100000ff185c move.w     #$1000, $ff185c.l
006E3E: 33fc100000ff1c5c move.w     #$1000, $ff1c5c.l
006E46: 33fc100000ff205c move.w     #$1000, $ff205c.l
006E4E: 4e75             rts        
006E50: 4df900ff1000     lea.l      $ff1000.l, a6
006E56: 4bee0400         lea.l      $400(a6), a5
006E5A: 302e0088         move.w     $88(a6), d0
006E5E: b06d0088         cmp.w      $88(a5), d0
006E62: 670000d0         beq.w      $6f34
006E66: 6c000008         bge.w      $6e70
006E6A: cd4d             exg.l      a6, a5
006E6C: 6000005c         bra.w      $6eca
006E70: 523900ff044a     addq.b     #$1, $ff044a.l
006E76: 4a7900ff0418     tst.w      $ff0418.l
006E7C: 67000040         beq.w      $6ebe
006E80: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
006E88: 66000096         bne.w      $6f20
006E8C: 48e70006         movem.l    a5-a6, -(a7)
006E90: 1d7c001e00b8     move.b     #$1e, $b8(a6)
006E96: 4eb90001068c     jsr        $1068c.l
006E9C: 4cdf6000         movem.l    (a7)+, a5-a6
006EA0: 48e70006         movem.l    a5-a6, -(a7)
006EA4: cb4e             exg.l      a5, a6
006EA6: 1d7c001f00b8     move.b     #$1f, $b8(a6)
006EAC: 4eb90001068c     jsr        $1068c.l
006EB2: 4cdf6000         movem.l    (a7)+, a5-a6
006EB6: 61000068         bsr.w      $6f20
006EBA: 6000015c         bra.w      $7018
006EBE: 700c             moveq      #$c, d0
006EC0: 4eb900013982     jsr        $13982.l
006EC6: 60000058         bra.w      $6f20
006ECA: 523900ff044b     addq.b     #$1, $ff044b.l
006ED0: 4a7900ff0418     tst.w      $ff0418.l
006ED6: 67000040         beq.w      $6f18
006EDA: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
006EE2: 6600003c         bne.w      $6f20
006EE6: 48e70006         movem.l    a5-a6, -(a7)
006EEA: 1d7c001e00b8     move.b     #$1e, $b8(a6)
006EF0: 4eb90001068c     jsr        $1068c.l
006EF6: 4cdf6000         movem.l    (a7)+, a5-a6
006EFA: 48e70006         movem.l    a5-a6, -(a7)
006EFE: cb4e             exg.l      a5, a6
006F00: 1d7c001f00b8     move.b     #$1f, $b8(a6)
006F06: 4eb90001068c     jsr        $1068c.l
006F0C: 4cdf6000         movem.l    (a7)+, a5-a6
006F10: 6100000e         bsr.w      $6f20
006F14: 60000102         bra.w      $7018
006F18: 7008             moveq      #$8, d0
006F1A: 4eb900013982     jsr        $13982.l

; ==== sub_006F20 зовут=2 ====
006F20: 41fa0148         lea.l      $706a(pc), a0
006F24: 2d480044         move.l     a0, $44(a6)
006F28: 41fa015e         lea.l      $7088(pc), a0
006F2C: 2b480044         move.l     a0, $44(a5)
006F30: 6000004a         bra.w      $6f7c
006F34: 7000             moveq      #$0, d0
006F36: 4eb900013982     jsr        $13982.l
006F3C: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
006F44: 66000026         bne.w      $6f6c
006F48: 4df900ff1000     lea.l      $ff1000.l, a6
006F4E: 1d7c000000b8     move.b     #$0, $b8(a6)
006F54: 4eb90001068c     jsr        $1068c.l
006F5A: 4df900ff1400     lea.l      $ff1400.l, a6
006F60: 1d7c000000b8     move.b     #$0, $b8(a6)
006F66: 4eb90001068c     jsr        $1068c.l
006F6C: 41fa0138         lea.l      $70a6(pc), a0
006F70: 23c800ff1044     move.l     a0, $ff1044.l
006F76: 23c800ff1444     move.l     a0, $ff1444.l
006F7C: 41f90000f7ac     lea.l      $f7ac.l, a0
006F82: 43f900ff0360     lea.l      $ff0360.l, a1
006F88: 7007             moveq      #$7, d0
006F8A: 22d8             move.l     (a0)+, (a1)+
006F8C: 51c8fffc         dbra       d0, $6f8a
006F90: 7000             moveq      #$0, d0
006F92: 303900ff0418     move.w     $ff0418.l, d0
006F98: e540             asl.w      #$2, d0
006F9A: 41f90000f762     lea.l      $f762.l, a0
006FA0: 24700000         movea.l    (a0, d0.w), a2
006FA4: 4df900ff1000     lea.l      $ff1000.l, a6
006FAA: 23f900ff104400ff1844 move.l     $ff1044.l, $ff1844.l
006FB4: 6100001c         bsr.w      $6fd2
006FB8: 4dee0400         lea.l      $400(a6), a6
006FBC: 61000014         bsr.w      $6fd2
006FC0: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
006FC8: 67000004         beq.w      $6fce
006FCC: 4e75             rts        
006FCE: 4dee0400         lea.l      $400(a6), a6

; ==== sub_006FD2 зовут=2 ====
006FD2: 7000             moveq      #$0, d0
006FD4: 301a             move.w     (a2)+, d0
006FD6: 43f900ff8000     lea.l      $ff8000.l, a1
006FDC: d3c0             adda.l     d0, a1
006FDE: 206e0044         movea.l    $44(a6), a0
006FE2: 2d490044         move.l     a1, $44(a6)
006FE6: 303c6200         move.w     #$6200, d0
006FEA: 7e09             moveq      #$9, d7
006FEC: 7c02             moveq      #$2, d6
006FEE: 4eb900010fc2     jsr        $10fc2.l
006FF4: 1e3c0091         move.b     #$91, d7
006FF8: 4eb900003d7a     jsr        $3d7a.l
006FFE: 4a7900ff0418     tst.w      $ff0418.l
007004: 67000010         beq.w      $7016
007008: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00700C: 4eb900003ec4     jsr        $3ec4.l
007012: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
007016: 4e75             rts        
007018: 4a3900ff0458     tst.b      $ff0458.l
00701E: 66000020         bne.w      $7040
007022: 3e3c0078         move.w     #$78, d7
007026: 6100001a         bsr.w      $7042
00702A: 61001810         bsr.w      $883c
00702E: 1e3c00bf         move.b     #$bf, d7
007032: 4eb900003d7a     jsr        $3d7a.l
007038: 3e3c0020         move.w     #$20, d7
00703C: 61000004         bsr.w      $7042
007040: 4e75             rts        

; ==== sub_007042 зовут=2 ====
007042: 3f07             move.w     d7, -(a7)
007044: 523900ff0508     addq.b     #$1, $ff0508.l
00704A: 0839000000ff0508 btst.b     #$0, $ff0508.l
007052: 67000008         beq.w      $705c
007056: 4eb90000fb4e     jsr        $fb4e.l
00705C: 4eb900000ee2     jsr        $ee2.l
007062: 3e1f             move.w     (a7)+, d7
007064: 51cfffdc         dbra       d7, $7042
007068: 4e75             rts        

; ---- ДАННЫЕ $00706A..$0070C4 (90 байт) ----

0070C4: 423900ff4109     clr.b      $ff4109.l
0070CA: 427900ff0420     clr.w      $ff0420.l
0070D0: 427900ff0434     clr.w      $ff0434.l
0070D6: 427900ff044a     clr.w      $ff044a.l
0070DC: 4eb900003940     jsr        $3940.l
0070E2: 523900ff0449     addq.b     #$1, $ff0449.l
0070E8: 7003             moveq      #$3, d0
0070EA: 4a3900ff0448     tst.b      $ff0448.l
0070F0: 67000012         beq.w      $7104
0070F4: 700d             moveq      #$d, d0
0070F6: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
0070FE: 67000004         beq.w      $7104
007102: 7018             moveq      #$18, d0
007104: b03900ff0449     cmp.b      $ff0449.l, d0
00710A: 6600003e         bne.w      $714a
00710E: 4a3900ff0448     tst.b      $ff0448.l
007114: 6700000c         beq.w      $7122
007118: 33fc004400ff0406 move.w     #$44, $ff0406.l
007120: 4e75             rts        
007122: 33fc001000ff0406 move.w     #$10, $ff0406.l
00712A: 423900ff4109     clr.b      $ff4109.l
007130: 427900ff0434     clr.w      $ff0434.l
007136: 427900ff0420     clr.w      $ff0420.l
00713C: 427900ff044a     clr.w      $ff044a.l
007142: 423900ff4109     clr.b      $ff4109.l
007148: 4e75             rts        
00714A: 33fc003400ff0406 move.w     #$34, $ff0406.l
007152: 41f900ffa000     lea.l      $ffa000.l, a0
007158: 303c09ff         move.w     #$9ff, d0
00715C: 4298             clr.l      (a0)+
00715E: 51c8fffc         dbra       d0, $715c
007162: 007c0700         ori.w      #$700, sr
007166: 203c40000002     move.l     #$40000002, d0
00716C: 223c94149300     move.l     #$94149300, d1
007172: 243c96d09500     move.l     #$96d09500, d2
007178: 363c977f         move.w     #$977f, d3
00717C: 4eb900003980     jsr        $3980.l
007182: 027cf8ff         andi.w     #$f8ff, sr
007186: 4e75             rts        

; ---- ДАННЫЕ $007188..$007676 (1262 байт) ----


; ==== sub_007676 ТАБЛИЦА зовут=0 ====
007676: 00000500         ori.b      #$0, d0
00767A: 00000000         ori.b      #$0, d0
00767E: 00000000         ori.b      #$0, d0
007682: 00000000         ori.b      #$0, d0
007686: 00000303         ori.b      #$3, d0
00768A: 02020605         andi.b     #$5, d2
00768E: 04000000         subi.b     #$0, d0
007692: 00000000         ori.b      #$0, d0
007696: 00000303         ori.b      #$3, d0
00769A: 0302             btst.l     d1, d2
00769C: 0500             btst.l     d2, d0
00769E: 00000000         ori.b      #$0, d0
0076A2: 00000000         ori.b      #$0, d0
0076A6: 00000300         ori.b      #$0, d0
0076AA: 00000000         ori.b      #$0, d0
0076AE: 00000000         ori.b      #$0, d0
0076B2: 00000000         ori.b      #$0, d0
0076B6: 00000500         ori.b      #$0, d0
0076BA: 00000000         ori.b      #$0, d0
0076BE: 00000000         ori.b      #$0, d0
0076C2: 00000000         ori.b      #$0, d0
0076C6: 00000303         ori.b      #$3, d0
0076CA: 02020605         andi.b     #$5, d2
0076CE: 04000000         subi.b     #$0, d0
0076D2: 00000000         ori.b      #$0, d0
0076D6: 00000303         ori.b      #$3, d0
0076DA: 0302             btst.l     d1, d2
0076DC: 0500             btst.l     d2, d0
0076DE: 00000000         ori.b      #$0, d0
0076E2: 00000000         ori.b      #$0, d0
0076E6: 00000300         ori.b      #$0, d0
0076EA: 00000000         ori.b      #$0, d0
0076EE: 00000000         ori.b      #$0, d0
0076F2: 00000000         ori.b      #$0, d0
0076F6: 00000500         ori.b      #$0, d0
0076FA: 00000000         ori.b      #$0, d0
0076FE: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007702..$007700 (-2 байт) ----


; ==== sub_007700 ТАБЛИЦА зовут=0 ====
007700: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007704..$007702 (-2 байт) ----

007702: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007706..$007704 (-2 байт) ----

007704: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007708..$007706 (-2 байт) ----

007706: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00770A..$007708 (-2 байт) ----

007708: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00770C..$00770A (-2 байт) ----

00770A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00770E..$00770C (-2 байт) ----

00770C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007710..$00770E (-2 байт) ----

00770E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007712..$007710 (-2 байт) ----

007710: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007714..$007712 (-2 байт) ----

007712: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007716..$007714 (-2 байт) ----

007714: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007718..$007716 (-2 байт) ----

007716: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00771A..$007718 (-2 байт) ----

007718: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00771C..$00771A (-2 байт) ----

00771A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00771E..$00771C (-2 байт) ----

00771C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007720..$00771E (-2 байт) ----

00771E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007722..$007720 (-2 байт) ----

007720: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007724..$007722 (-2 байт) ----

007722: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007726..$007724 (-2 байт) ----

007724: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007728..$007726 (-2 байт) ----

007726: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00772A..$007728 (-2 байт) ----

007728: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00772C..$00772A (-2 байт) ----

00772A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00772E..$00772C (-2 байт) ----

00772C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007730..$00772E (-2 байт) ----

00772E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007732..$007730 (-2 байт) ----

007730: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007734..$007732 (-2 байт) ----

007732: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007736..$007734 (-2 байт) ----

007734: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007738..$007736 (-2 байт) ----

007736: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00773A..$007738 (-2 байт) ----

007738: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00773C..$00773A (-2 байт) ----

00773A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00773E..$00773C (-2 байт) ----

00773C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007740..$00773E (-2 байт) ----

00773E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007742..$007740 (-2 байт) ----

007740: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007744..$007742 (-2 байт) ----

007742: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007746..$007744 (-2 байт) ----

007744: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007748..$007746 (-2 байт) ----

007746: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00774A..$007748 (-2 байт) ----

007748: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00774C..$00774A (-2 байт) ----

00774A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00774E..$00774C (-2 байт) ----

00774C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007750..$00774E (-2 байт) ----

00774E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007752..$007750 (-2 байт) ----

007750: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007754..$007752 (-2 байт) ----

007752: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007756..$007754 (-2 байт) ----

007754: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007758..$007756 (-2 байт) ----

007756: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00775A..$007758 (-2 байт) ----

007758: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00775C..$00775A (-2 байт) ----

00775A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00775E..$00775C (-2 байт) ----

00775C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007760..$00775E (-2 байт) ----

00775E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007762..$007760 (-2 байт) ----

007760: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007764..$007762 (-2 байт) ----

007762: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007766..$007764 (-2 байт) ----

007764: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007768..$007766 (-2 байт) ----

007766: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00776A..$007768 (-2 байт) ----

007768: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00776C..$00776A (-2 байт) ----

00776A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00776E..$00776C (-2 байт) ----

00776C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007770..$00776E (-2 байт) ----

00776E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007772..$007770 (-2 байт) ----

007770: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007774..$007772 (-2 байт) ----

007772: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007776..$007774 (-2 байт) ----

007774: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007778..$007776 (-2 байт) ----

007776: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00777A..$007778 (-2 байт) ----

007778: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00777C..$00777A (-2 байт) ----

00777A: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $00777E..$00777C (-2 байт) ----

00777C: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007780..$00777E (-2 байт) ----

00777E: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007782..$007780 (-2 байт) ----

007780: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007784..$007782 (-2 байт) ----

007782: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007786..$007784 (-2 байт) ----

007784: 00000000         ori.b      #$0, d0

; ---- ДАННЫЕ $007788..$007786 (-2 байт) ----

007786: 000041f9         ori.b      #$f9, d0

; ---- ДАННЫЕ $00778A..$007788 (-2 байт) ----


; ==== sub_007788 зовут=1 ====
007788: 41f9000077c4     lea.l      $77c4.l, a0

; ---- ДАННЫЕ $00778E..$00778A (-4 байт) ----

00778A: 000077c4         ori.b      #$c4, d0
00778E: 43f900ff8492     lea.l      $ff8492.l, a1
007794: 303c0300         move.w     #$300, d0
007798: 3e3c0015         move.w     #$15, d7
00779C: 3c3c0007         move.w     #$7, d6
0077A0: 4eb900010fc2     jsr        $10fc2.l
0077A6: 41f900007874     lea.l      $7874.l, a0
0077AC: 43f900ff88a6     lea.l      $ff88a6.l, a1
0077B2: 303c0300         move.w     #$300, d0
0077B6: 3e3c0001         move.w     #$1, d7
0077BA: 3c3c0000         move.w     #$0, d6
0077BE: 4ef900010fc2     jmp        $10fc2.l

; ---- ДАННЫЕ $0077C4..$007876 (178 байт) ----


; ==== sub_007876 зовут=5 ====
007876: 41f900ffa000     lea.l      $ffa000.l, a0
00787C: 43f900ff8000     lea.l      $ff8000.l, a1
007882: 303c001b         move.w     #$1b, d0
007886: 323c0013         move.w     #$13, d1
00788A: 22d8             move.l     (a0)+, (a1)+
00788C: 51c9fffc         dbra       d1, $788a
007890: 43e90030         lea.l      $30(a1), a1
007894: 51c8fff0         dbra       d0, $7886
007898: 4e75             rts        

; ==== sub_00789A зовут=1 ====
00789A: 4a3900ff4100     tst.b      $ff4100.l
0078A0: 67000004         beq.w      $78a6
0078A4: 4e75             rts        

; ==== sub_0078A6 зовут=1 ====
0078A6: 4a3900ff0455     tst.b      $ff0455.l
0078AC: 66000026         bne.w      $78d4
0078B0: 13fc000400ff0455 move.b     #$4, $ff0455.l
0078B8: 523900ff0454     addq.b     #$1, $ff0454.l
0078BE: 0c39000500ff0454 cmpi.b     #$5, $ff0454.l
0078C6: 6d000012         blt.w      $78da
0078CA: 423900ff0454     clr.b      $ff0454.l
0078D0: 60000008         bra.w      $78da
0078D4: 533900ff0455     subq.b     #$1, $ff0455.l
0078DA: 7000             moveq      #$0, d0
0078DC: 103900ff0454     move.b     $ff0454.l, d0
0078E2: e740             asl.w      #$3, d0
0078E4: 41fa0010         lea.l      $78f6(pc), a0
0078E8: d1c0             adda.l     d0, a0
0078EA: 43f900ff0324     lea.l      $ff0324.l, a1
0078F0: 22d8             move.l     (a0)+, (a1)+
0078F2: 2290             move.l     (a0), (a1)
0078F4: 4e75             rts        

; ---- ДАННЫЕ $0078F6..$007ABE (456 байт) ----


; ==== sub_007ABE зовут=1 ====
007ABE: 226e000a         movea.l    $a(a6), a1
007AC2: 4a6e0002         tst.w      $2(a6)
007AC6: 67000022         beq.w      $7aea
007ACA: 740c             moveq      #$c, d2
007ACC: 302e0004         move.w     $4(a6), d0
007AD0: 2f09             move.l     a1, -(a7)
007AD2: 7200             moveq      #$0, d1
007AD4: 3281             move.w     d1, (a1)
007AD6: 43e90002         lea.l      $2(a1), a1
007ADA: 51c8fff6         dbra       d0, $7ad2
007ADE: 225f             movea.l    (a7)+, a1
007AE0: 43e90080         lea.l      $80(a1), a1
007AE4: 51caffe6         dbra       d2, $7acc
007AE8: 4e75             rts        
007AEA: 740c             moveq      #$c, d2
007AEC: 302e0004         move.w     $4(a6), d0
007AF0: 2f09             move.l     a1, -(a7)
007AF2: 7200             moveq      #$0, d1
007AF4: 3281             move.w     d1, (a1)
007AF6: 33410002         move.w     d1, $2(a1)
007AFA: 33410080         move.w     d1, $80(a1)
007AFE: 33410082         move.w     d1, $82(a1)
007B02: 43e90004         lea.l      $4(a1), a1
007B06: 51c8ffea         dbra       d0, $7af2
007B0A: 225f             movea.l    (a7)+, a1
007B0C: 43e90100         lea.l      $100(a1), a1
007B10: 51caffda         dbra       d2, $7aec
007B14: 4e75             rts        

; ==== sub_007B16 зовут=1 ====
007B16: 4eb900003952     jsr        $3952.l
007B1C: 41fadcf8         lea.l      $5816(pc), a0
007B20: 303900ff0418     move.w     $ff0418.l, d0
007B26: 0c400001         cmpi.w     #$1, d0
007B2A: 6600000c         bne.w      $7b38
007B2E: 41fadd06         lea.l      $5836(pc), a0
007B32: 303900ffe180     move.w     $ffe180.l, d0
007B38: e540             asl.w      #$2, d0
007B3A: 20700000         movea.l    (a0, d0.w), a0
007B3E: 43f900ffa000     lea.l      $ffa000.l, a1
007B44: 4eb9000047aa     jsr        $47aa.l
007B4A: 6100fd2a         bsr.w      $7876
007B4E: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
007B58: 4df900ff1000     lea.l      $ff1000.l, a6
007B5E: 13fc000200ff0457 move.b     #$2, $ff0457.l
007B66: 4eb900003ec4     jsr        $3ec4.l
007B6C: 4dee0400         lea.l      $400(a6), a6
007B70: 537900ff0424     subq.w     #$1, $ff0424.l
007B76: 66e6             bne.b      $7b5e
007B78: 423900ff0457     clr.b      $ff0457.l
007B7E: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
007B86: 66000014         bne.w      $7b9c
007B8A: 4a3900ff0458     tst.b      $ff0458.l
007B90: 66000006         bne.w      $7b98
007B94: 61000ca6         bsr.w      $883c
007B98: 6000000e         bra.w      $7ba8
007B9C: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
007BA4: 66000002         bne.w      $7ba8
007BA8: 4df900ff1000     lea.l      $ff1000.l, a6
007BAE: 4bf900ff1400     lea.l      $ff1400.l, a5
007BB4: 102e00d8         move.b     $d8(a6), d0
007BB8: b02d00d8         cmp.b      $d8(a5), d0
007BBC: 67000026         beq.w      $7be4
007BC0: 6c000004         bge.w      $7bc6
007BC4: cd4d             exg.l      a6, a5
007BC6: 2d7c000080b80044 move.l     #$80b8, $44(a6)
007BCE: 3d7c00010088     move.w     #$1, $88(a6)
007BD4: 2b7c000080d00044 move.l     #$80d0, $44(a5)
007BDC: 426d0088         clr.w      $88(a5)
007BE0: 6000001e         bra.w      $7c00
007BE4: 2d7c000080e80044 move.l     #$80e8, $44(a6)
007BEC: 2b7c000080e80044 move.l     #$80e8, $44(a5)
007BF4: 3d7c00020088     move.w     #$2, $88(a6)
007BFA: 3b7c00020088     move.w     #$2, $88(a5)
007C00: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
007C08: 66000016         bne.w      $7c20
007C0C: 23f900ff104400ff1844 move.l     $ff1044.l, $ff1844.l
007C16: 33f900ff108800ff1888 move.w     $ff1088.l, $ff1888.l
007C20: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
007C28: 6600002a         bne.w      $7c54
007C2C: 33fc00c000ff105e move.w     #$c0, $ff105e.l
007C34: 23fc00ff8a9600ff1006 move.l     #$ff8a96, $ff1006.l
007C3E: 33fc013000ff145e move.w     #$130, $ff145e.l
007C46: 23fc00ff8ab200ff1406 move.l     #$ff8ab2, $ff1406.l
007C50: 6000006c         bra.w      $7cbe
007C54: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
007C5C: 6600003c         bne.w      $7c9a
007C60: 33fc009000ff105e move.w     #$90, $ff105e.l
007C68: 23fc00ff8a8800ff1006 move.l     #$ff8a88, $ff1006.l
007C72: 33fc00f800ff145e move.w     #$f8, $ff145e.l
007C7A: 23fc00ff8aa400ff1406 move.l     #$ff8aa4, $ff1406.l
007C84: 33fc017000ff185e move.w     #$170, $ff185e.l
007C8C: 23fc00ff8ac000ff1806 move.l     #$ff8ac0, $ff1806.l
007C96: 60000026         bra.w      $7cbe
007C9A: 33fc00a000ff105e move.w     #$a0, $ff105e.l
007CA2: 23fc00ff8a8c00ff1006 move.l     #$ff8a8c, $ff1006.l
007CAC: 33fc015800ff145e move.w     #$158, $ff145e.l
007CB4: 23fc00ff8abc00ff1406 move.l     #$ff8abc, $ff1406.l
007CBE: 3e3900ff0422     move.w     $ff0422.l, d7
007CC4: 5347             subq.w     #$1, d7
007CC6: 4df900ff1000     lea.l      $ff1000.l, a6
007CCC: 206e0044         movea.l    $44(a6), a0
007CD0: 226e000e         movea.l    $e(a6), a1
007CD4: 7002             moveq      #$2, d0
007CD6: 32d8             move.w     (a0)+, (a1)+
007CD8: 3218             move.w     (a0)+, d1
007CDA: 3411             move.w     (a1), d2
007CDC: 8441             or.w       d1, d2
007CDE: 32c2             move.w     d2, (a1)+
007CE0: 32d8             move.w     (a0)+, (a1)+
007CE2: 322e005e         move.w     $5e(a6), d1
007CE6: d258             add.w      (a0)+, d1
007CE8: 32c1             move.w     d1, (a1)+
007CEA: 51c8ffea         dbra       d0, $7cd6
007CEE: 4dee0400         lea.l      $400(a6), a6
007CF2: 51cfffd8         dbra       d7, $7ccc
007CF6: 1e3c0086         move.b     #$86, d7
007CFA: 4eb900003d7a     jsr        $3d7a.l
007D00: 7c00             moveq      #$0, d6
007D02: 3e3900ff0422     move.w     $ff0422.l, d7
007D08: 5347             subq.w     #$1, d7
007D0A: 4df900ff1000     lea.l      $ff1000.l, a6
007D10: 206e000e         movea.l    $e(a6), a0
007D14: 0c5000c0         cmpi.w     #$c0, (a0)
007D18: 67000012         beq.w      $7d2c
007D1C: 7002             moveq      #$2, d0
007D1E: 5950             subq.w     #$4, (a0)
007D20: 59680008         subq.w     #$4, $8(a0)
007D24: 59680010         subq.w     #$4, $10(a0)
007D28: 60000004         bra.w      $7d2e
007D2C: 5246             addq.w     #$1, d6
007D2E: 4dee0400         lea.l      $400(a6), a6
007D32: 51cfffdc         dbra       d7, $7d10
007D36: 13fc000100ff040d move.b     #$1, $ff040d.l
007D3E: 3f06             move.w     d6, -(a7)
007D40: 61000420         bsr.w      $8162
007D44: 4eb900000ee2     jsr        $ee2.l
007D4A: 3c1f             move.w     (a7)+, d6
007D4C: bc7900ff0422     cmp.w      $ff0422.l, d6
007D52: 66ac             bne.b      $7d00
007D54: 41fa03aa         lea.l      $8100(pc), a0
007D58: 7e06             moveq      #$6, d7
007D5A: 007c0700         ori.w      #$700, sr
007D5E: 3f07             move.w     d7, -(a7)
007D60: 2018             move.l     (a0)+, d0
007D62: 2218             move.l     (a0)+, d1
007D64: 2418             move.l     (a0)+, d2
007D66: 7600             moveq      #$0, d3
007D68: 3618             move.w     (a0)+, d3
007D6A: 2f08             move.l     a0, -(a7)
007D6C: 4eb900003980     jsr        $3980.l
007D72: 205f             movea.l    (a7)+, a0
007D74: 3e1f             move.w     (a7)+, d7
007D76: 51cfffe6         dbra       d7, $7d5e
007D7A: 027cf8ff         andi.w     #$f8ff, sr
007D7E: 3e3900ff0422     move.w     $ff0422.l, d7
007D84: 5347             subq.w     #$1, d7
007D86: 4df900ff1000     lea.l      $ff1000.l, a6
007D8C: 3f07             move.w     d7, -(a7)
007D8E: 41fa01d8         lea.l      $7f68(pc), a0
007D92: 226e0006         movea.l    $6(a6), a1
007D96: 7e03             moveq      #$3, d7
007D98: 7c05             moveq      #$5, d6
007D9A: 4eb900010fdc     jsr        $10fdc.l
007DA0: 4dee0400         lea.l      $400(a6), a6
007DA4: 3e1f             move.w     (a7)+, d7
007DA6: 51cfffe4         dbra       d7, $7d8c
007DAA: 0c79000200ff1088 cmpi.w     #$2, $ff1088.l
007DB2: 67000162         beq.w      $7f16
007DB6: 33fc006400ff0500 move.w     #$64, $ff0500.l
007DBE: 610003a2         bsr.w      $8162
007DC2: 4eb900000ee2     jsr        $ee2.l
007DC8: 537900ff0500     subq.w     #$1, $ff0500.l
007DCE: 66ee             bne.b      $7dbe
007DD0: 33fc000c00ff0500 move.w     #$c, $ff0500.l
007DD8: 61000388         bsr.w      $8162
007DDC: 3e3900ff0422     move.w     $ff0422.l, d7
007DE2: 5347             subq.w     #$1, d7
007DE4: 4df900ff1000     lea.l      $ff1000.l, a6
007DEA: 1d7c001000ba     move.b     #$10, $ba(a6)
007DF0: 422e00b9         clr.b      $b9(a6)
007DF4: 4a6e0088         tst.w      $88(a6)
007DF8: 66000010         bne.w      $7e0a
007DFC: 206e000e         movea.l    $e(a6), a0
007E00: 5050             addq.w     #$8, (a0)
007E02: 50680008         addq.w     #$8, $8(a0)
007E06: 50680010         addq.w     #$8, $10(a0)
007E0A: 4dee0400         lea.l      $400(a6), a6
007E0E: 51cfffda         dbra       d7, $7dea
007E12: 13fc000100ff040d move.b     #$1, $ff040d.l
007E1A: 4eb900000ee2     jsr        $ee2.l
007E20: 537900ff0500     subq.w     #$1, $ff0500.l
007E26: 66b0             bne.b      $7dd8
007E28: 1e3c00a7         move.b     #$a7, d7
007E2C: 4eb900003d7a     jsr        $3d7a.l
007E32: 33fc003000ff0500 move.w     #$30, $ff0500.l
007E3A: 61000326         bsr.w      $8162
007E3E: 61000040         bsr.w      $7e80
007E42: 4a7900ff0500     tst.w      $ff0500.l
007E48: 6700000c         beq.w      $7e56
007E4C: 537900ff0500     subq.w     #$1, $ff0500.l
007E52: 60000022         bra.w      $7e76
007E56: 4eb9000099d0     jsr        $99d0.l
007E5C: 103900ff1041     move.b     $ff1041.l, d0
007E62: 803900ff1441     or.b       $ff1441.l, d0
007E68: 803900ff1841     or.b       $ff1841.l, d0
007E6E: 020000f0         andi.b     #$f0, d0
007E72: 6600000a         bne.w      $7e7e
007E76: 4eb900000ee2     jsr        $ee2.l
007E7C: 60bc             bra.b      $7e3a
007E7E: 4e75             rts        

; ==== sub_007E80 зовут=1 ====
007E80: 3e3900ff0422     move.w     $ff0422.l, d7
007E86: 5347             subq.w     #$1, d7
007E88: 4df900ff1000     lea.l      $ff1000.l, a6
007E8E: 532e00ba         subq.b     #$1, $ba(a6)
007E92: 6600004a         bne.w      $7ede
007E96: 1d7c001000ba     move.b     #$10, $ba(a6)
007E9C: 522e00b9         addq.b     #$1, $b9(a6)
007EA0: 4a6e0088         tst.w      $88(a6)
007EA4: 6700001a         beq.w      $7ec0
007EA8: 0c2e000200b9     cmpi.b     #$2, $b9(a6)
007EAE: 66000010         bne.w      $7ec0
007EB2: 3f07             move.w     d7, -(a7)
007EB4: 1e3c00c7         move.b     #$c7, d7
007EB8: 4eb900003d7a     jsr        $3d7a.l
007EBE: 3e1f             move.w     (a7)+, d7
007EC0: 0c2e000300b9     cmpi.b     #$3, $b9(a6)
007EC6: 66000016         bne.w      $7ede
007ECA: 1d7c000200b9     move.b     #$2, $b9(a6)
007ED0: 1d7c00ff00ba     move.b     #$ff, $ba(a6)
007ED6: 60000006         bra.w      $7ede

; ---- ДАННЫЕ $007EDA..$007EDE (4 байт) ----

007EDE: 41fa0070         lea.l      $7f50(pc), a0
007EE2: 4a6e0088         tst.w      $88(a6)
007EE6: 66000006         bne.w      $7eee
007EEA: 41fa0070         lea.l      $7f5c(pc), a0
007EEE: 7000             moveq      #$0, d0
007EF0: 102e00b9         move.b     $b9(a6), d0
007EF4: e540             asl.w      #$2, d0
007EF6: 20700000         movea.l    (a0, d0.w), a0
007EFA: 3f07             move.w     d7, -(a7)
007EFC: 226e0006         movea.l    $6(a6), a1
007F00: 7e03             moveq      #$3, d7
007F02: 7c05             moveq      #$5, d6
007F04: 4eb900010fdc     jsr        $10fdc.l
007F0A: 4dee0400         lea.l      $400(a6), a6
007F0E: 3e1f             move.w     (a7)+, d7
007F10: 51cfff7c         dbra       d7, $7e8e
007F14: 4e75             rts        
007F16: 6100024a         bsr.w      $8162
007F1A: 4eb9000099d0     jsr        $99d0.l
007F20: 103900ff1041     move.b     $ff1041.l, d0
007F26: 803900ff1441     or.b       $ff1441.l, d0
007F2C: 803900ff1841     or.b       $ff1841.l, d0
007F32: 020000f0         andi.b     #$f0, d0
007F36: 6600000a         bne.w      $7f42
007F3A: 4eb900000ee2     jsr        $ee2.l
007F40: 60d4             bra.b      $7f16
007F42: 4e75             rts        

; ---- ДАННЫЕ $007F44..$007F68 (36 байт) ----


; ==== sub_007F68 ТАБЛИЦА зовут=0 ====
007F68: 2000             move.l     d0, d0
007F6A: 2000             move.l     d0, d0
007F6C: 2000             move.l     d0, d0
007F6E: 2000             move.l     d0, d0
007F70: 2000             move.l     d0, d0
007F72: 2100             move.l     d0, -(a0)
007F74: 2101             move.l     d1, -(a0)
007F76: 2000             move.l     d0, d0
007F78: 2000             move.l     d0, d0
007F7A: 2102             move.l     d2, -(a0)
007F7C: 2103             move.l     d3, -(a0)
007F7E: 2000             move.l     d0, d0
007F80: 2104             move.l     d4, -(a0)
007F82: 2105             move.l     d5, -(a0)
007F84: 2106             move.l     d6, -(a0)
007F86: 2107             move.l     d7, -(a0)
007F88: 2108             move.l     a0, -(a0)
007F8A: 2109             move.l     a1, -(a0)
007F8C: 210a             move.l     a2, -(a0)
007F8E: 210b             move.l     a3, -(a0)
007F90: 210c             move.l     a4, -(a0)
007F92: 210d             move.l     a5, -(a0)
007F94: 210e             move.l     a6, -(a0)
007F96: 210f             move.l     a7, -(a0)
007F98: 2000             move.l     d0, d0
007F9A: 2000             move.l     d0, d0
007F9C: 2000             move.l     d0, d0
007F9E: 2000             move.l     d0, d0
007FA0: 2000             move.l     d0, d0
007FA2: 2000             move.l     d0, d0
007FA4: 2000             move.l     d0, d0
007FA6: 2000             move.l     d0, d0
007FA8: 2000             move.l     d0, d0
007FAA: 2110             move.l     (a0), -(a0)
007FAC: 2111             move.l     (a1), -(a0)
007FAE: 2112             move.l     (a2), -(a0)
007FB0: 2113             move.l     (a3), -(a0)
007FB2: 2114             move.l     (a4), -(a0)
007FB4: 2115             move.l     (a5), -(a0)
007FB6: 2116             move.l     (a6), -(a0)
007FB8: 2117             move.l     (a7), -(a0)
007FBA: 2118             move.l     (a0)+, -(a0)
007FBC: 2119             move.l     (a1)+, -(a0)
007FBE: 211a             move.l     (a2)+, -(a0)
007FC0: 211b             move.l     (a3)+, -(a0)
007FC2: 211c             move.l     (a4)+, -(a0)
007FC4: 211d             move.l     (a5)+, -(a0)
007FC6: 211e             move.l     (a6)+, -(a0)
007FC8: 2000             move.l     d0, d0
007FCA: 2000             move.l     d0, d0
007FCC: 2000             move.l     d0, d0
007FCE: 2000             move.l     d0, d0
007FD0: 2000             move.l     d0, d0
007FD2: 2000             move.l     d0, d0
007FD4: 2000             move.l     d0, d0
007FD6: 2000             move.l     d0, d0
007FD8: 211f             move.l     (a7)+, -(a0)
007FDA: 2000             move.l     d0, d0
007FDC: 2120             move.l     -(a0), -(a0)
007FDE: 2000             move.l     d0, d0
007FE0: 2121             move.l     -(a1), -(a0)
007FE2: 2122             move.l     -(a2), -(a0)
007FE4: 2123             move.l     -(a3), -(a0)
007FE6: 2124             move.l     -(a4), -(a0)
007FE8: 2125             move.l     -(a5), -(a0)
007FEA: 2126             move.l     -(a6), -(a0)
007FEC: 2127             move.l     -(a7), -(a0)
007FEE: 21282129         move.l     $2129(a0), -(a0)
007FF2: 212a212b         move.l     $212b(a2), -(a0)
007FF6: 2000             move.l     d0, d0
007FF8: 2000             move.l     d0, d0
007FFA: 212c212d         move.l     $212d(a4), -(a0)
007FFE: 212e2000         move.l     $2000(a6), -(a0)
008002: 212f2130         move.l     $2130(a7), -(a0)
008006: 21312132213321342135 move.l     ([$21332134, a1, d2.w], $2135), -(a0)
008010: 2136213721382139213a213b move.l     ([$21382139, a6], d2.w, $213a213b), -(a0)
00801C: 213c213d213e     move.l     #$213d213e, -(a0)

; ---- ДАННЫЕ $008022..$008028 (6 байт) ----


; ==== sub_008028 ТАБЛИЦА зовут=0 ====
008028: 2000             move.l     d0, d0
00802A: 2000             move.l     d0, d0
00802C: 2000             move.l     d0, d0
00802E: 2000             move.l     d0, d0
008030: 2000             move.l     d0, d0
008032: 2000             move.l     d0, d0
008034: 2000             move.l     d0, d0
008036: 2000             move.l     d0, d0
008038: 21412142         move.l     d1, $2142(a0)
00803C: 21432144         move.l     d3, $2144(a0)
008040: 21452146         move.l     d5, $2146(a0)
008044: 21472148         move.l     d7, $2148(a0)
008048: 2149214a         move.l     a1, $214a(a0)
00804C: 214b214c         move.l     a3, $214c(a0)
008050: 2000             move.l     d0, d0
008052: 214d214e         move.l     a5, $214e(a0)
008056: 214f2000         move.l     a7, $2000(a0)

; ---- ДАННЫЕ $00805A..$008058 (-2 байт) ----


; ==== sub_008058 ТАБЛИЦА зовут=0 ====
008058: 2000             move.l     d0, d0
00805A: 2000             move.l     d0, d0
00805C: 2000             move.l     d0, d0
00805E: 2000             move.l     d0, d0
008060: 2000             move.l     d0, d0
008062: 2000             move.l     d0, d0
008064: 2000             move.l     d0, d0
008066: 2000             move.l     d0, d0
008068: 21502151         move.l     (a0), $2151(a0)
00806C: 21522153         move.l     (a2), $2153(a0)
008070: 21542155         move.l     (a4), $2155(a0)
008074: 21562157         move.l     (a6), $2157(a0)
008078: 21582159         move.l     (a0)+, $2159(a0)
00807C: 215a215b         move.l     (a2)+, $215b(a0)
008080: 215c215d         move.l     (a4)+, $215d(a0)
008084: 215e2000         move.l     (a6)+, $2000(a0)
008088: 2000             move.l     d0, d0
00808A: 2000             move.l     d0, d0
00808C: 2000             move.l     d0, d0
00808E: 2000             move.l     d0, d0
008090: 2000             move.l     d0, d0
008092: 2000             move.l     d0, d0
008094: 2000             move.l     d0, d0
008096: 2000             move.l     d0, d0
008098: 2000             move.l     d0, d0
00809A: 2000             move.l     d0, d0
00809C: 2000             move.l     d0, d0
00809E: 2000             move.l     d0, d0
0080A0: 215f2160         move.l     (a7)+, $2160(a0)
0080A4: 21612162         move.l     -(a1), $2162(a0)
0080A8: 21632164         move.l     -(a3), $2164(a0)
0080AC: 21652166         move.l     -(a5), $2166(a0)
0080B0: 21672168         move.l     -(a7), $2168(a0)
0080B4: 2169216a0180     move.l     $216a(a1), $180(a0)

; ---- ДАННЫЕ $0080BA..$008162 (168 байт) ----


; ==== sub_008162 зовут=5 ====
008162: 523900ff0409     addq.b     #$1, $ff0409.l
008168: 0839000000ff0409 btst.b     #$0, $ff0409.l
008170: 67000008         beq.w      $817a
008174: 4eb90000fb4e     jsr        $fb4e.l
00817A: 4e75             rts        

; ---- ДАННЫЕ $00817C..$00883C (1728 байт) ----


; ==== sub_00883C зовут=2 ====
00883C: 207900ff1020     movea.l    $ff1020.l, a0
008842: 41e800f8         lea.l      $f8(a0), a0
008846: 7e00             moveq      #$0, d7
008848: 1e3900ff10d8     move.b     $ff10d8.l, d7
00884E: 67000006         beq.w      $8856
008852: 6100001e         bsr.w      $8872
008856: 207900ff1420     movea.l    $ff1420.l, a0
00885C: 41e800f8         lea.l      $f8(a0), a0
008860: 7e00             moveq      #$0, d7
008862: 1e3900ff14d8     move.b     $ff14d8.l, d7
008868: 67000006         beq.w      $8870
00886C: 61000004         bsr.w      $8872
008870: 4e75             rts        

; ==== sub_008872 зовут=2 ====
008872: 30bc208e         move.w     #$208e, (a0)
008876: 317c208f0002     move.w     #$208f, $2(a0)
00887C: 317c209e0080     move.w     #$209e, $80(a0)
008882: 317c209f0082     move.w     #$209f, $82(a0)
008888: 5347             subq.w     #$1, d7
00888A: 67000058         beq.w      $88e4
00888E: 317c208e0004     move.w     #$208e, $4(a0)
008894: 317c208f0006     move.w     #$208f, $6(a0)
00889A: 317c209e0084     move.w     #$209e, $84(a0)
0088A0: 317c209f0086     move.w     #$209f, $86(a0)
0088A6: 5347             subq.w     #$1, d7
0088A8: 6700003a         beq.w      $88e4
0088AC: 41e80100         lea.l      $100(a0), a0
0088B0: 30bc208e         move.w     #$208e, (a0)
0088B4: 317c208f0002     move.w     #$208f, $2(a0)
0088BA: 317c209e0080     move.w     #$209e, $80(a0)
0088C0: 317c209f0082     move.w     #$209f, $82(a0)
0088C6: 5347             subq.w     #$1, d7
0088C8: 6700001a         beq.w      $88e4
0088CC: 317c208e0004     move.w     #$208e, $4(a0)
0088D2: 317c208f0006     move.w     #$208f, $6(a0)
0088D8: 317c209e0084     move.w     #$209e, $84(a0)
0088DE: 317c209f0086     move.w     #$209f, $86(a0)
0088E4: 4e75             rts        

; ==== sub_0088E6 зовут=1 ====
0088E6: 007c0700         ori.w      #$700, sr
0088EA: 4eb90000064c     jsr        $64c.l
0088F0: 4eb9000004a2     jsr        $4a2.l
0088F6: 4eb900003952     jsr        $3952.l
0088FC: 41f900069f06     lea.l      $69f06.l, a0
008902: 43f900ffa000     lea.l      $ffa000.l, a1
008908: 4eb9000047aa     jsr        $47aa.l
00890E: 203c40000000     move.l     #$40000000, d0
008914: 223c94029300     move.l     #$94029300, d1
00891A: 243c96d09500     move.l     #$96d09500, d2
008920: 363c977f         move.w     #$977f, d3
008924: 4eb900003980     jsr        $3980.l
00892A: 41f900ff8000     lea.l      $ff8000.l, a0
008930: 303c03ff         move.w     #$3ff, d0
008934: 4298             clr.l      (a0)+
008936: 51c8fffc         dbra       d0, $8934
00893A: 41fa0076         lea.l      $89b2(pc), a0
00893E: 43f900ff8596     lea.l      $ff8596.l, a1
008944: 7e10             moveq      #$10, d7
008946: 7c01             moveq      #$1, d6
008948: 4240             clr.w      d0
00894A: 4eb900010fc2     jsr        $10fc2.l
008950: 4dfa003e         lea.l      $8990(pc), a6
008954: 4eb90000067a     jsr        $67a.l
00895A: 4eb900000642     jsr        $642.l
008960: 4eb90000392e     jsr        $392e.l
008966: 1e3c0099         move.b     #$99, d7
00896A: 4eb900003d7a     jsr        $3d7a.l
008970: 33fc01a400ff0500 move.w     #$1a4, $ff0500.l
008978: 537900ff0500     subq.w     #$1, $ff0500.l
00897E: 6700000a         beq.w      $898a
008982: 4eb900000ee2     jsr        $ee2.l
008988: 60ee             bra.b      $8978
00898A: 4ef900003940     jmp        $3940.l

; ---- ДАННЫЕ $008990..$0089D4 (68 байт) ----


; ==== sub_0089D4 зовут=1 ====
0089D4: 4eb900003952     jsr        $3952.l
0089DA: 4eb900004480     jsr        $4480.l
0089E0: 41face34         lea.l      $5816(pc), a0
0089E4: 303900ff0418     move.w     $ff0418.l, d0
0089EA: e540             asl.w      #$2, d0
0089EC: 20700000         movea.l    (a0, d0.w), a0
0089F0: 43f900ffa000     lea.l      $ffa000.l, a1
0089F6: 4eb9000047aa     jsr        $47aa.l
0089FC: 6100ee78         bsr.w      $7876
008A00: 1e3c0086         move.b     #$86, d7
008A04: 4eb900003d7a     jsr        $3d7a.l
008A0A: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
008A12: 660000e0         bne.w      $8af4
008A16: 41f900009150     lea.l      $9150.l, a0
008A1C: 43f900ff0000     lea.l      $ff0000.l, a1
008A22: 4df900ff1000     lea.l      $ff1000.l, a6
008A28: 3e3900ff0422     move.w     $ff0422.l, d7
008A2E: 5347             subq.w     #$1, d7
008A30: 32d8             move.w     (a0)+, (a1)+
008A32: 12bc0005         move.b     #$5, (a1)
008A36: 5449             addq.w     #$2, a1
008A38: 7000             moveq      #$0, d0
008A3A: 102e00dd         move.b     $dd(a6), d0
008A3E: e540             asl.w      #$2, d0
008A40: 06404030         addi.w     #$4030, d0
008A44: 32c0             move.w     d0, (a1)+
008A46: 32d8             move.w     (a0)+, (a1)+
008A48: 32d8             move.w     (a0)+, (a1)+
008A4A: 12bc0005         move.b     #$5, (a1)
008A4E: 5449             addq.w     #$2, a1
008A50: 7000             moveq      #$0, d0
008A52: 102e00dd         move.b     $dd(a6), d0
008A56: 49fa0032         lea.l      $8a8a(pc), a4
008A5A: 10340000         move.b     (a4, d0.w), d0
008A5E: 00404000         ori.w      #$4000, d0
008A62: 32c0             move.w     d0, (a1)+
008A64: 32d8             move.w     (a0)+, (a1)+
008A66: 32d8             move.w     (a0)+, (a1)+
008A68: 12bc0005         move.b     #$5, (a1)
008A6C: 5449             addq.w     #$2, a1
008A6E: 7000             moveq      #$0, d0
008A70: 102e00d8         move.b     $d8(a6), d0
008A74: 81fc000a         divs.w     #$a, d0
008A78: 4a40             tst.w      d0
008A7A: 67000014         beq.w      $8a90
008A7E: e540             asl.w      #$2, d0
008A80: 06404030         addi.w     #$4030, d0
008A84: 32c0             move.w     d0, (a1)+
008A86: 6000000a         bra.w      $8a92

; ---- ДАННЫЕ $008A8A..$008A90 (6 байт) ----

008A90: 4259             clr.w      (a1)+
008A92: 32d8             move.w     (a0)+, (a1)+
008A94: 32d8             move.w     (a0)+, (a1)+
008A96: 12bc0005         move.b     #$5, (a1)
008A9A: 5449             addq.w     #$2, a1
008A9C: 4840             swap       d0
008A9E: e540             asl.w      #$2, d0
008AA0: 06404030         addi.w     #$4030, d0
008AA4: 32c0             move.w     d0, (a1)+
008AA6: 32d8             move.w     (a0)+, (a1)+
008AA8: 32d8             move.w     (a0)+, (a1)+
008AAA: 12bc0008         move.b     #$8, (a1)
008AAE: 5449             addq.w     #$2, a1
008AB0: 32fc007a         move.w     #$7a, (a1)+
008AB4: 32d8             move.w     (a0)+, (a1)+
008AB6: 4dee0400         lea.l      $400(a6), a6
008ABA: 51cfff74         dbra       d7, $8a30
008ABE: 3e3c0034         move.w     #$34, d7
008AC2: 3f07             move.w     d7, -(a7)
008AC4: 6100000c         bsr.w      $8ad2
008AC8: 3e1f             move.w     (a7)+, d7
008ACA: 51cffff6         dbra       d7, $8ac2
008ACE: 600000ca         bra.w      $8b9a

; ==== sub_008AD2 зовут=1 ====
008AD2: 7e0e             moveq      #$e, d7
008AD4: 41f900ff0000     lea.l      $ff0000.l, a0
008ADA: 5950             subq.w     #$4, (a0)
008ADC: 41e80008         lea.l      $8(a0), a0
008AE0: 51cffff8         dbra       d7, $8ada
008AE4: 13fc000100ff040d move.b     #$1, $ff040d.l
008AEC: 4eb900000ee2     jsr        $ee2.l
008AF2: 4e75             rts        
008AF4: 4eb90001042e     jsr        $1042e.l
008AFA: 41f90000918c     lea.l      $918c.l, a0
008B00: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
008B08: 67000008         beq.w      $8b12
008B0C: 41f9000091cc     lea.l      $91cc.l, a0
008B12: 43f900ff0000     lea.l      $ff0000.l, a1
008B18: 4df900ff1000     lea.l      $ff1000.l, a6
008B1E: 3e3900ff0422     move.w     $ff0422.l, d7
008B24: 5347             subq.w     #$1, d7
008B26: 32d8             move.w     (a0)+, (a1)+
008B28: 12bc0005         move.b     #$5, (a1)
008B2C: 5449             addq.w     #$2, a1
008B2E: 7000             moveq      #$0, d0
008B30: 102e00dd         move.b     $dd(a6), d0
008B34: e540             asl.w      #$2, d0
008B36: 06404030         addi.w     #$4030, d0
008B3A: 32c0             move.w     d0, (a1)+
008B3C: 32d8             move.w     (a0)+, (a1)+
008B3E: 32d8             move.w     (a0)+, (a1)+
008B40: 12bc0005         move.b     #$5, (a1)
008B44: 5449             addq.w     #$2, a1
008B46: 7000             moveq      #$0, d0
008B48: 102e00dd         move.b     $dd(a6), d0
008B4C: 49faff3c         lea.l      $8a8a(pc), a4
008B50: 10340000         move.b     (a4, d0.w), d0
008B54: 00404000         ori.w      #$4000, d0
008B58: 32c0             move.w     d0, (a1)+
008B5A: 32d8             move.w     (a0)+, (a1)+
008B5C: 32d8             move.w     (a0)+, (a1)+
008B5E: 12bc0005         move.b     #$5, (a1)
008B62: 5449             addq.w     #$2, a1
008B64: 302e0000         move.w     $0(a6), d0
008B68: e540             asl.w      #$2, d0
008B6A: 06404030         addi.w     #$4030, d0
008B6E: 32c0             move.w     d0, (a1)+
008B70: 32d8             move.w     (a0)+, (a1)+
008B72: 32d8             move.w     (a0)+, (a1)+
008B74: 12bc0005         move.b     #$5, (a1)
008B78: 5449             addq.w     #$2, a1
008B7A: 7000             moveq      #$0, d0
008B7C: 32fc406c         move.w     #$406c, (a1)+
008B80: 32d8             move.w     (a0)+, (a1)+
008B82: 4dee0400         lea.l      $400(a6), a6
008B86: 51cfff9e         dbra       d7, $8b26
008B8A: 3e3c0030         move.w     #$30, d7
008B8E: 3f07             move.w     d7, -(a7)
008B90: 610001ea         bsr.w      $8d7c
008B94: 3e1f             move.w     (a7)+, d7
008B96: 51cffff6         dbra       d7, $8b8e
008B9A: 41fa030a         lea.l      $8ea6(pc), a0
008B9E: 7e0a             moveq      #$a, d7
008BA0: 007c0700         ori.w      #$700, sr
008BA4: 3f07             move.w     d7, -(a7)
008BA6: 2018             move.l     (a0)+, d0
008BA8: 2218             move.l     (a0)+, d1
008BAA: 2418             move.l     (a0)+, d2
008BAC: 7600             moveq      #$0, d3
008BAE: 3618             move.w     (a0)+, d3
008BB0: 2f08             move.l     a0, -(a7)
008BB2: 4eb900003980     jsr        $3980.l
008BB8: 205f             movea.l    (a7)+, a0
008BBA: 3e1f             move.w     (a7)+, d7
008BBC: 51cfffe6         dbra       d7, $8ba4
008BC0: 027cf8ff         andi.w     #$f8ff, sr
008BC4: 3e3900ff0422     move.w     $ff0422.l, d7
008BCA: 5347             subq.w     #$1, d7
008BCC: 4df900ff1000     lea.l      $ff1000.l, a6
008BD2: 3f07             move.w     d7, -(a7)
008BD4: 41fa036a         lea.l      $8f40(pc), a0
008BD8: 226e000a         movea.l    $a(a6), a1
008BDC: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
008BE4: 6700000a         beq.w      $8bf0
008BE8: 43e90382         lea.l      $382(a1), a1
008BEC: 60000006         bra.w      $8bf4
008BF0: 43e90a06         lea.l      $a06(a1), a1
008BF4: 2d490006         move.l     a1, $6(a6)
008BF8: 4dee0400         lea.l      $400(a6), a6
008BFC: 3e1f             move.w     (a7)+, d7
008BFE: 51cfffd2         dbra       d7, $8bd2
008C02: 427900ff050a     clr.w      $ff050a.l
008C08: 13fc00ff00ff10b8 move.b     #$ff, $ff10b8.l
008C10: 13fc00ff00ff14b8 move.b     #$ff, $ff14b8.l
008C18: 13fc00ff00ff18b8 move.b     #$ff, $ff18b8.l
008C20: 13fc00ff00ff1cb8 move.b     #$ff, $ff1cb8.l
008C28: 13fc00ff00ff20b8 move.b     #$ff, $ff20b8.l
008C30: 3e3900ff0422     move.w     $ff0422.l, d7
008C36: 5347             subq.w     #$1, d7
008C38: 7c00             moveq      #$0, d6
008C3A: 4df900ff1000     lea.l      $ff1000.l, a6
008C40: 0c2e000100dd     cmpi.b     #$1, $dd(a6)
008C46: 66000008         bne.w      $8c50
008C4A: 422e00b8         clr.b      $b8(a6)
008C4E: 5246             addq.w     #$1, d6
008C50: 4dee0400         lea.l      $400(a6), a6
008C54: 51cfffea         dbra       d7, $8c40
008C58: 33fc000100ff050c move.w     #$1, $ff050c.l
008C60: bc7900ff0422     cmp.w      $ff0422.l, d6
008C66: 67000084         beq.w      $8cec
008C6A: 427900ff050c     clr.w      $ff050c.l
008C70: 3e3900ff0422     move.w     $ff0422.l, d7
008C76: 5347             subq.w     #$1, d7
008C78: 4df900ff1000     lea.l      $ff1000.l, a6
008C7E: 7000             moveq      #$0, d0
008C80: b02e00dd         cmp.b      $dd(a6), d0
008C84: 6c000006         bge.w      $8c8c
008C88: 102e00dd         move.b     $dd(a6), d0
008C8C: 4dee0400         lea.l      $400(a6), a6
008C90: 51cfffee         dbra       d7, $8c80
008C94: 3e3900ff0422     move.w     $ff0422.l, d7
008C9A: 5347             subq.w     #$1, d7
008C9C: 4df900ff1000     lea.l      $ff1000.l, a6
008CA2: b02e00dd         cmp.b      $dd(a6), d0
008CA6: 6600000c         bne.w      $8cb4
008CAA: 1d7c000200b8     move.b     #$2, $b8(a6)
008CB0: 60000018         bra.w      $8cca
008CB4: 4a2e00b8         tst.b      $b8(a6)
008CB8: 6a000010         bpl.w      $8cca
008CBC: 1d7c000100b8     move.b     #$1, $b8(a6)
008CC2: 33fc000100ff050a move.w     #$1, $ff050a.l
008CCA: 4dee0400         lea.l      $400(a6), a6
008CCE: 51cfffd2         dbra       d7, $8ca2
008CD2: 427900ff0508     clr.w      $ff0508.l
008CD8: 610000d8         bsr.w      $8db2
008CDC: 7e1e             moveq      #$1e, d7
008CDE: 3f07             move.w     d7, -(a7)
008CE0: 4eb900000ee2     jsr        $ee2.l
008CE6: 3e1f             move.w     (a7)+, d7
008CE8: 51cffff4         dbra       d7, $8cde
008CEC: 427900ff0508     clr.w      $ff0508.l
008CF2: 610000be         bsr.w      $8db2
008CF6: 527900ff0508     addq.w     #$1, $ff0508.l
008CFC: 0c79000800ff0508 cmpi.w     #$8, $ff0508.l
008D04: 66000016         bne.w      $8d1c
008D08: 4a7900ff050a     tst.w      $ff050a.l
008D0E: 6700000c         beq.w      $8d1c
008D12: 1e3c00c7         move.b     #$c7, d7
008D16: 4eb900003d7a     jsr        $3d7a.l
008D1C: 0c79000c00ff0508 cmpi.w     #$c, $ff0508.l
008D24: 66000016         bne.w      $8d3c
008D28: 4a7900ff050c     tst.w      $ff050c.l
008D2E: 6600000c         bne.w      $8d3c
008D32: 1e3c00ba         move.b     #$ba, d7
008D36: 4eb900003d7a     jsr        $3d7a.l
008D3C: 0c79000d00ff0508 cmpi.w     #$d, $ff0508.l
008D44: 66ac             bne.b      $8cf2
008D46: 4eb9000099d0     jsr        $99d0.l
008D4C: 103900ff1041     move.b     $ff1041.l, d0
008D52: 803900ff1441     or.b       $ff1441.l, d0
008D58: 803900ff1841     or.b       $ff1841.l, d0
008D5E: 803900ff1c41     or.b       $ff1c41.l, d0
008D64: 803900ff2041     or.b       $ff2041.l, d0
008D6A: 020000e0         andi.b     #$e0, d0
008D6E: 6600000a         bne.w      $8d7a
008D72: 4eb900000ee2     jsr        $ee2.l
008D78: 60cc             bra.b      $8d46
008D7A: 4e75             rts        

; ==== sub_008D7C зовут=1 ====
008D7C: 3e3900ff0422     move.w     $ff0422.l, d7
008D82: e547             asl.w      #$2, d7
008D84: 5347             subq.w     #$1, d7
008D86: 41f900ff0000     lea.l      $ff0000.l, a0
008D8C: 5550             subq.w     #$2, (a0)
008D8E: 0c5001e8         cmpi.w     #$1e8, (a0)
008D92: 66000006         bne.w      $8d9a
008D96: 30bc0130         move.w     #$130, (a0)
008D9A: 41e80008         lea.l      $8(a0), a0
008D9E: 51cfffec         dbra       d7, $8d8c
008DA2: 13fc000100ff040d move.b     #$1, $ff040d.l
008DAA: 4eb900000ee2     jsr        $ee2.l
008DB0: 4e75             rts        

; ==== sub_008DB2 зовут=2 ====
008DB2: 3c3900ff0422     move.w     $ff0422.l, d6
008DB8: 5346             subq.w     #$1, d6
008DBA: 4df900ff1000     lea.l      $ff1000.l, a6
008DC0: 3f06             move.w     d6, -(a7)
008DC2: 41fa0052         lea.l      $8e16(pc), a0
008DC6: 4a2e00b8         tst.b      $b8(a6)
008DCA: 67000014         beq.w      $8de0
008DCE: 41fa006e         lea.l      $8e3e(pc), a0
008DD2: 0c2e000100b8     cmpi.b     #$1, $b8(a6)
008DD8: 67000006         beq.w      $8de0
008DDC: 41fa0094         lea.l      $8e72(pc), a0
008DE0: 303900ff0508     move.w     $ff0508.l, d0
008DE6: e540             asl.w      #$2, d0
008DE8: 20700000         movea.l    (a0, d0.w), a0
008DEC: 226e0006         movea.l    $6(a6), a1
008DF0: 7e03             moveq      #$3, d7
008DF2: 7c05             moveq      #$5, d6
008DF4: 4eb900010fdc     jsr        $10fdc.l
008DFA: 3c1f             move.w     (a7)+, d6
008DFC: 4dee0400         lea.l      $400(a6), a6
008E00: 51ceffbe         dbra       d6, $8dc0
008E04: 7e10             moveq      #$10, d7
008E06: 3f07             move.w     d7, -(a7)
008E08: 4eb900000ee2     jsr        $ee2.l
008E0E: 3e1f             move.w     (a7)+, d7
008E10: 51cffff4         dbra       d7, $8e06
008E14: 4e75             rts        

; ---- ДАННЫЕ $008E16..$00921C (1030 байт) ----


; ==== sub_00921C зовут=1 ====
00921C: 427900ff1040     clr.w      $ff1040.l
009222: 427900ff1440     clr.w      $ff1440.l
009228: 427900ff1840     clr.w      $ff1840.l
00922E: 427900ff1c40     clr.w      $ff1c40.l
009234: 427900ff2040     clr.w      $ff2040.l
00923A: 243c00ff00ff     move.l     #$ff00ff, d2
009240: 23c200ff0df0     move.l     d2, $ff0df0.l
009246: 23c200ff0df4     move.l     d2, $ff0df4.l
00924C: 23c200ff0df8     move.l     d2, $ff0df8.l
009252: 23c200ff0dfc     move.l     d2, $ff0dfc.l
009258: 303900ff0418     move.w     $ff0418.l, d0
00925E: e540             asl.w      #$2, d0
009260: 41fa0254         lea.l      $94b6(pc), a0
009264: 20700000         movea.l    (a0, d0.w), a0
009268: 23f900ffef9000ff0508 move.l     $ffef90.l, $ff0508.l
009272: 23f900ffef9000ff0450 move.l     $ffef90.l, $ff0450.l
00927C: 3018             move.w     (a0)+, d0
00927E: 6a0000d6         bpl.w      $9356
009282: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00928A: 6700000e         beq.w      $929a
00928E: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
009296: 660000bc         bne.w      $9354
00929A: 41f900ff4030     lea.l      $ff4030.l, a0
0092A0: 43f900ffa000     lea.l      $ffa000.l, a1
0092A6: 45f900ff1000     lea.l      $ff1000.l, a2
0092AC: 7e03             moveq      #$3, d7
0092AE: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
0092B6: 67000004         beq.w      $92bc
0092BA: 7e04             moveq      #$4, d7
0092BC: 7000             moveq      #$0, d0
0092BE: 1018             move.b     (a0)+, d0
0092C0: 5340             subq.w     #$1, d0
0092C2: e540             asl.w      #$2, d0
0092C4: 222a00d8         move.l     $d8(a2), d1
0092C8: 23810000         move.l     d1, (a1, d0.w)
0092CC: 45ea0400         lea.l      $400(a2), a2
0092D0: 51cfffea         dbra       d7, $92bc
0092D4: 41f900ff4010     lea.l      $ff4010.l, a0
0092DA: 43f900ff1000     lea.l      $ff1000.l, a1
0092E0: 45f900ffa000     lea.l      $ffa000.l, a2
0092E6: 7e03             moveq      #$3, d7
0092E8: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
0092F0: 67000004         beq.w      $92f6
0092F4: 7e04             moveq      #$4, d7
0092F6: 7000             moveq      #$0, d0
0092F8: 1018             move.b     (a0)+, d0
0092FA: 5340             subq.w     #$1, d0
0092FC: e540             asl.w      #$2, d0
0092FE: 22320000         move.l     (a2, d0.w), d1
009302: 234100d8         move.l     d1, $d8(a1)
009306: 43e90400         lea.l      $400(a1), a1
00930A: 51cfffea         dbra       d7, $92f6
00930E: 13f900ff401000ff1001 move.b     $ff4010.l, $ff1001.l
009318: 13f900ff401100ff1401 move.b     $ff4011.l, $ff1401.l
009322: 13f900ff401200ff1801 move.b     $ff4012.l, $ff1801.l
00932C: 13f900ff401300ff1c01 move.b     $ff4013.l, $ff1c01.l
009336: 13f900ff401400ff2001 move.b     $ff4014.l, $ff2001.l
009340: 23f900ff401000ff4030 move.l     $ff4010.l, $ff4030.l
00934A: 13f900ff401400ff4034 move.b     $ff4014.l, $ff4034.l
009354: 4e75             rts        
009356: 2c58             movea.l    (a0)+, a6
009358: 242e00d8         move.l     $d8(a6), d2
00935C: 2f02             move.l     d2, -(a7)
00935E: 2f0e             move.l     a6, -(a7)
009360: 323c00ff         move.w     #$ff, d1
009364: 429e             clr.l      (a6)+
009366: 51c9fffc         dbra       d1, $9364
00936A: 2c5f             movea.l    (a7)+, a6
00936C: 241f             move.l     (a7)+, d2
00936E: 2d4200d8         move.l     d2, $d8(a6)
009372: 7200             moveq      #$0, d1
009374: 3d981000         move.w     (a0)+, (a6, d1.w)
009378: 5441             addq.w     #$2, d1
00937A: 51c8fff8         dbra       d0, $9374
00937E: 7203             moveq      #$3, d1
009380: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
009388: 67000010         beq.w      $939a
00938C: 7204             moveq      #$4, d1
00938E: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
009396: 66000024         bne.w      $93bc
00939A: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00939E: 41f900ff4010     lea.l      $ff4010.l, a0
0093A4: 4df900ff1000     lea.l      $ff1000.l, a6
0093AA: 7000             moveq      #$0, d0
0093AC: 1018             move.b     (a0)+, d0
0093AE: 3c80             move.w     d0, (a6)
0093B0: 4dee0400         lea.l      $400(a6), a6
0093B4: 51c9fff4         dbra       d1, $93aa
0093B8: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
0093BC: 4bee0330         lea.l      $330(a6), a5
0093C0: 363c0033         move.w     #$33, d3
0093C4: 243c00ff00ff     move.l     #$ff00ff, d2
0093CA: 2ac2             move.l     d2, (a5)+
0093CC: 51cbfffc         dbra       d3, $93ca
0093D0: 322e0004         move.w     $4(a6), d1
0093D4: 5241             addq.w     #$1, d1
0093D6: e341             asl.w      #$1, d1
0093D8: 343c001f         move.w     #$1f, d2
0093DC: 43ee0200         lea.l      $200(a6), a1
0093E0: 263c00ff00ff     move.l     #$ff00ff, d3
0093E6: 23831000         move.l     d3, (a1, d1.w)
0093EA: 06410010         addi.w     #$10, d1
0093EE: 51cafff6         dbra       d2, $93e6
0093F2: 23ce00ff0428     move.l     a6, $ff0428.l
0093F8: 2d7900ff05080056 move.l     $ff0508.l, $56(a6)
009400: 3d7c001e0054     move.w     #$1e, $54(a6)
009406: 4eb90000d162     jsr        $d162.l
00940C: 3d7c00060102     move.w     #$6, $102(a6)
009412: 3d7c00080122     move.w     #$8, $122(a6)
009418: 3d7c000a0142     move.w     #$a, $142(a6)
00941E: 3d6e00ce0060     move.w     $ce(a6), $60(a6)
009424: 3d6e00d00062     move.w     $d0(a6), $62(a6)
00942A: 3d6e00d20064     move.w     $d2(a6), $64(a6)
009430: 3d7c001e0054     move.w     #$1e, $54(a6)
009436: 426e004c         clr.w      $4c(a6)
00943A: 2d7c000008000044 move.l     #$800, $44(a6)
009442: 3d7c000c0066     move.w     #$c, $66(a6)
009448: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00944C: 41f900ff0460     lea.l      $ff0460.l, a0
009452: 302e0000         move.w     $0(a6), d0
009456: 5340             subq.w     #$1, d0
009458: 7200             moveq      #$0, d1
00945A: 12300000         move.b     (a0, d0.w), d1
00945E: 3d41007e         move.w     d1, $7e(a6)
009462: e941             asl.w      #$4, d1
009464: d3ae0006         add.l      d1, $6(a6)
009468: 2d6e00060084     move.l     $6(a6), $84(a6)
00946E: 7200             moveq      #$0, d1
009470: 12300005         move.b     $5(a0, d0.w), d1
009474: 5941             subq.w     #$4, d1
009476: 1d4100b0         move.b     d1, $b0(a6)
00947A: 1230000a         move.b     $a(a0, d0.w), d1
00947E: e541             asl.w      #$2, d1
009480: 43fa0028         lea.l      $94aa(pc), a1
009484: 1d71100000ad     move.b     (a1, d1.w), $ad(a6)
00948A: 1d71100100ae     move.b     $1(a1, d1.w), $ae(a6)
009490: 1d71100200af     move.b     $2(a1, d1.w), $af(a6)
009496: 08ee000000a7     bset.b     #$0, $a7(a6)
00949C: 4eb90000bb28     jsr        $bb28.l
0094A2: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
0094A6: 6000fdd4         bra.w      $927c

; ---- ДАННЫЕ $0094AA..$0099D0 (1318 байт) ----


; ==== sub_0099D0 зовут=8 ====
0099D0: 4a3900ff4100     tst.b      $ff4100.l
0099D6: 67000004         beq.w      $99dc
0099DA: 4e75             rts        
0099DC: 303900ff0418     move.w     $ff0418.l, d0
0099E2: e540             asl.w      #$2, d0
0099E4: 41fa0008         lea.l      $99ee(pc), a0
0099E8: 20700000         movea.l    (a0, d0.w), a0
0099EC: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $0099EE..$009A0E (32 байт) ----


; ==== sub_009A0E ТАБЛИЦА зовут=0 ====
009A0E: 207900ff0470     movea.l    $ff0470.l, a0
009A14: 13d000ff1040     move.b     (a0), $ff1040.l
009A1A: 13e8000100ff1041 move.b     $1(a0), $ff1041.l
009A22: 423900ff1440     clr.b      $ff1440.l
009A28: 423900ff1441     clr.b      $ff1441.l
009A2E: 4e75             rts        

; ==== sub_009A30 ТАБЛИЦА зовут=0 ====
009A30: 207900ff0470     movea.l    $ff0470.l, a0
009A36: 13d000ff1040     move.b     (a0), $ff1040.l
009A3C: 13e8000100ff1041 move.b     $1(a0), $ff1041.l
009A44: 207900ff0474     movea.l    $ff0474.l, a0
009A4A: 13d000ff1440     move.b     (a0), $ff1440.l
009A50: 13e8000100ff1441 move.b     $1(a0), $ff1441.l
009A58: 4e75             rts        

; ==== sub_009A5A ТАБЛИЦА зовут=0 ====
009A5A: 207900ff0470     movea.l    $ff0470.l, a0
009A60: 13d000ff1040     move.b     (a0), $ff1040.l
009A66: 13e8000100ff1041 move.b     $1(a0), $ff1041.l
009A6E: 207900ff0474     movea.l    $ff0474.l, a0
009A74: 13d000ff1440     move.b     (a0), $ff1440.l
009A7A: 13e8000100ff1441 move.b     $1(a0), $ff1441.l
009A82: 207900ff0478     movea.l    $ff0478.l, a0
009A88: 13d000ff1840     move.b     (a0), $ff1840.l
009A8E: 13e8000100ff1841 move.b     $1(a0), $ff1841.l
009A96: 4e75             rts        

; ==== sub_009A98 ТАБЛИЦА зовут=0 ====
009A98: 207900ff0470     movea.l    $ff0470.l, a0
009A9E: 13d000ff1040     move.b     (a0), $ff1040.l
009AA4: 13e8000100ff1041 move.b     $1(a0), $ff1041.l
009AAC: 207900ff0474     movea.l    $ff0474.l, a0
009AB2: 13d000ff1440     move.b     (a0), $ff1440.l
009AB8: 13e8000100ff1441 move.b     $1(a0), $ff1441.l
009AC0: 207900ff0478     movea.l    $ff0478.l, a0
009AC6: 13d000ff1840     move.b     (a0), $ff1840.l
009ACC: 13e8000100ff1841 move.b     $1(a0), $ff1841.l
009AD4: 207900ff047c     movea.l    $ff047c.l, a0
009ADA: 13d000ff1c40     move.b     (a0), $ff1c40.l
009AE0: 13e8000100ff1c41 move.b     $1(a0), $ff1c41.l
009AE8: 4e75             rts        

; ==== sub_009AEA ТАБЛИЦА зовут=0 ====
009AEA: 207900ff0470     movea.l    $ff0470.l, a0
009AF0: 13d000ff1040     move.b     (a0), $ff1040.l
009AF6: 13e8000100ff1041 move.b     $1(a0), $ff1041.l
009AFE: 207900ff0474     movea.l    $ff0474.l, a0
009B04: 13d000ff1440     move.b     (a0), $ff1440.l
009B0A: 13e8000100ff1441 move.b     $1(a0), $ff1441.l
009B12: 207900ff0478     movea.l    $ff0478.l, a0
009B18: 13d000ff1840     move.b     (a0), $ff1840.l
009B1E: 13e8000100ff1841 move.b     $1(a0), $ff1841.l
009B26: 207900ff047c     movea.l    $ff047c.l, a0
009B2C: 13d000ff1c40     move.b     (a0), $ff1c40.l
009B32: 13e8000100ff1c41 move.b     $1(a0), $ff1c41.l
009B3A: 207900ff0480     movea.l    $ff0480.l, a0
009B40: 13d000ff2040     move.b     (a0), $ff2040.l
009B46: 13e8000100ff2041 move.b     $1(a0), $ff2041.l
009B4E: 4e75             rts        

; ==== sub_009B50 зовут=1 ====
009B50: 4a6e0076         tst.w      $76(a6)
009B54: 6600007a         bne.w      $9bd0
009B58: 0c6e0003006c     cmpi.w     #$3, $6c(a6)
009B5E: 6c00000c         bge.w      $9b6c
009B62: 0c6e0004009e     cmpi.w     #$4, $9e(a6)
009B68: 6d000066         blt.w      $9bd0
009B6C: 4a6e0094         tst.w      $94(a6)
009B70: 6600005e         bne.w      $9bd0
009B74: 4a2e0091         tst.b      $91(a6)
009B78: 66000056         bne.w      $9bd0
009B7C: 1e3c00b1         move.b     #$b1, d7
009B80: 4eb900003d7a     jsr        $3d7a.l
009B86: 1d7c00010091     move.b     #$1, $91(a6)
009B8C: 103c0001         move.b     #$1, d0
009B90: 4eb90001064e     jsr        $1064e.l
009B96: 302e009e         move.w     $9e(a6), d0
009B9A: 5340             subq.w     #$1, d0
009B9C: b06e006c         cmp.w      $6c(a6), d0
009BA0: 6c000006         bge.w      $9ba8
009BA4: 302e006c         move.w     $6c(a6), d0
009BA8: 5740             subq.w     #$3, d0
009BAA: 0c400008         cmpi.w     #$8, d0
009BAE: 6d000004         blt.w      $9bb4
009BB2: 7007             moveq      #$7, d0
009BB4: e340             asl.w      #$1, d0
009BB6: 41fa001a         lea.l      $9bd2(pc), a0
009BBA: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
009BC2: 6f000006         ble.w      $9bca
009BC6: 41e80010         lea.l      $10(a0), a0
009BCA: 3d70000000a0     move.w     (a0, d0.w), $a0(a6)
009BD0: 4e75             rts        

; ---- ДАННЫЕ $009BD2..$009BF2 (32 байт) ----


; ==== sub_009BF2 зовут=1 ====
009BF2: 4a6e0094         tst.w      $94(a6)
009BF6: 6700003a         beq.w      $9c32
009BFA: 536e0094         subq.w     #$1, $94(a6)
009BFE: 66000032         bne.w      $9c32
009C02: 7000             moveq      #$0, d0
009C04: 302e0096         move.w     $96(a6), d0
009C08: e340             asl.w      #$1, d0
009C0A: 206e0006         movea.l    $6(a6), a0
009C0E: d1c0             adda.l     d0, a0
009C10: 08100006         btst.b     #$6, (a0)
009C14: 66000008         bne.w      $9c1e
009C18: d0fc0010         adda.w     #$10, a0
009C1C: 60f2             bra.b      $9c10
009C1E: 021000bf         andi.b     #$bf, (a0)
009C22: 08ee000000a7     bset.b     #$0, $a7(a6)
009C28: 1e3c00b2         move.b     #$b2, d7
009C2C: 4eb900003d7a     jsr        $3d7a.l
009C32: 4e75             rts        

; ==== sub_009C34 зовут=1 ====
009C34: 0839000000ff0427 btst.b     #$0, $ff0427.l
009C3C: 67000116         beq.w      $9d54
009C40: 7000             moveq      #$0, d0
009C42: 303900ff0418     move.w     $ff0418.l, d0
009C48: 41fa010c         lea.l      $9d56(pc), a0
009C4C: 10300000         move.b     (a0, d0.w), d0
009C50: 67000102         beq.w      $9d54
009C54: 3e3900ff0422     move.w     $ff0422.l, d7
009C5A: 5347             subq.w     #$1, d7
009C5C: 4df900ff1000     lea.l      $ff1000.l, a6
009C62: 6100000c         bsr.w      $9c70
009C66: 4dee0400         lea.l      $400(a6), a6
009C6A: 51cffff6         dbra       d7, $9c62
009C6E: 4e75             rts        

; ==== sub_009C70 зовут=1 ====
009C70: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
009C78: 66000016         bne.w      $9c90
009C7C: bdfc00ff1000     cmpa.l     #$ff1000, a6
009C82: 670000d0         beq.w      $9d54
009C86: bdfc00ff1800     cmpa.l     #$ff1800, a6
009C8C: 670000c6         beq.w      $9d54
009C90: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
009C96: 6c0000bc         bge.w      $9d54
009C9A: 6100005e         bsr.w      $9cfa
009C9E: 206e0024         movea.l    $24(a6), a0
009CA2: 0c680018004c     cmpi.w     #$18, $4c(a0)
009CA8: 6d0000aa         blt.w      $9d54
009CAC: 3c3900ff0422     move.w     $ff0422.l, d6
009CB2: 5346             subq.w     #$1, d6
009CB4: b1fc00ff1000     cmpa.l     #$ff1000, a0
009CBA: 6600000c         bne.w      $9cc8
009CBE: 207900ff0428     movea.l    $ff0428.l, a0
009CC4: 60000006         bra.w      $9ccc
009CC8: 41e8fc00         lea.l      -$400(a0), a0
009CCC: 0c680018004c     cmpi.w     #$18, $4c(a0)
009CD2: 6d000010         blt.w      $9ce4
009CD6: 51ceffdc         dbra       d6, $9cb4
009CDA: 2d7c00ff24000024 move.l     #$ff2400, $24(a6)
009CE2: 4e75             rts        
009CE4: bdc8             cmpa.l     a0, a6
009CE6: 6600000c         bne.w      $9cf4
009CEA: 2d7c00ff24000024 move.l     #$ff2400, $24(a6)
009CF2: 4e75             rts        
009CF4: 2d480024         move.l     a0, $24(a6)
009CF8: 4e75             rts        

; ==== sub_009CFA зовут=1 ====
009CFA: 206e0028         movea.l    $28(a6), a0
009CFE: 0c680018004c     cmpi.w     #$18, $4c(a0)
009D04: 6d00004e         blt.w      $9d54
009D08: 3c3900ff0422     move.w     $ff0422.l, d6
009D0E: 5346             subq.w     #$1, d6
009D10: b1f900ff0428     cmpa.l     $ff0428.l, a0
009D16: 6600000c         bne.w      $9d24
009D1A: 41f900ff1000     lea.l      $ff1000.l, a0
009D20: 60000006         bra.w      $9d28
009D24: 41e80400         lea.l      $400(a0), a0
009D28: 0c680018004c     cmpi.w     #$18, $4c(a0)
009D2E: 6d000010         blt.w      $9d40
009D32: 51ceffdc         dbra       d6, $9d10
009D36: 2d7c00ff24000028 move.l     #$ff2400, $28(a6)
009D3E: 4e75             rts        
009D40: bdc8             cmpa.l     a0, a6
009D42: 6600000c         bne.w      $9d50
009D46: 2d7c00ff24000028 move.l     #$ff2400, $28(a6)
009D4E: 4e75             rts        
009D50: 2d480028         move.l     a0, $28(a6)
009D54: 4e75             rts        

; ---- ДАННЫЕ $009D56..$009D5E (8 байт) ----


; ==== sub_009D5E зовут=1 ====
009D5E: 4a3900ff4100     tst.b      $ff4100.l
009D64: 660000a6         bne.w      $9e0c
009D68: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
009D70: 6600009a         bne.w      $9e0c
009D74: 0c79000400ffe180 cmpi.w     #$4, $ffe180.l
009D7C: 6600008e         bne.w      $9e0c
009D80: 41f900ff0000     lea.l      $ff0000.l, a0
009D86: 383c00d8         move.w     #$d8, d4
009D8A: 0c6e00010000     cmpi.w     #$1, $0(a6)
009D90: 6700000c         beq.w      $9d9e
009D94: 41f900ff0008     lea.l      $ff0008.l, a0
009D9A: 383c0148         move.w     #$148, d4
009D9E: 4a2e00b1         tst.b      $b1(a6)
009DA2: 6700006a         beq.w      $9e0e
009DA6: 532e00b2         subq.b     #$1, $b2(a6)
009DAA: 6600001c         bne.w      $9dc8
009DAE: 1d7c000600b2     move.b     #$6, $b2(a6)
009DB4: 522e00b3         addq.b     #$1, $b3(a6)
009DB8: 0c2e000500b3     cmpi.b     #$5, $b3(a6)
009DBE: 66000008         bne.w      $9dc8
009DC2: 422e00b1         clr.b      $b1(a6)
009DC6: 4e75             rts        
009DC8: 7000             moveq      #$0, d0
009DCA: 102e00b3         move.b     $b3(a6), d0
009DCE: e940             asl.w      #$4, d0
009DD0: 064001e0         addi.w     #$1e0, d0
009DD4: 4a6e00f6         tst.w      $f6(a6)
009DD8: 67000006         beq.w      $9de0
009DDC: 00401800         ori.w      #$1800, d0
009DE0: 322e007e         move.w     $7e(a6), d1
009DE4: e941             asl.w      #$4, d1
009DE6: 4a6e00f6         tst.w      $f6(a6)
009DEA: 6700000a         beq.w      $9df6
009DEE: 06430088         addi.w     #$88, d3
009DF2: 60000008         bra.w      $9dfc
009DF6: 363c0138         move.w     #$138, d3
009DFA: 9641             sub.w      d1, d3
009DFC: 3083             move.w     d3, (a0)
009DFE: 00680f000002     ori.w      #$f00, $2(a0)
009E04: 31400004         move.w     d0, $4(a0)
009E08: 31440006         move.w     d4, $6(a0)
009E0C: 4e75             rts        
009E0E: 4250             clr.w      (a0)
009E10: 4e75             rts        

; ==== sub_009E12 зовут=3 ====
009E12: 4a7900ff0418     tst.w      $ff0418.l
009E18: 67000004         beq.w      $9e1e
009E1C: 4e75             rts        
009E1E: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
009E26: 6cf4             bge.b      $9e1c
009E28: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
009E30: 6cea             bge.b      $9e1c
009E32: 523900ff0445     addq.b     #$1, $ff0445.l
009E38: 0c39003c00ff0445 cmpi.b     #$3c, $ff0445.l
009E40: 6600001a         bne.w      $9e5c
009E44: 423900ff0445     clr.b      $ff0445.l
009E4A: 0c79025700ff0446 cmpi.w     #$257, $ff0446.l
009E52: 67000008         beq.w      $9e5c
009E56: 527900ff0446     addq.w     #$1, $ff0446.l
009E5C: 41f900ff86a4     lea.l      $ff86a4.l, a0
009E62: 7000             moveq      #$0, d0
009E64: 303900ff0446     move.w     $ff0446.l, d0
009E6A: 81fc003c         divs.w     #$3c, d0
009E6E: 3200             move.w     d0, d1
009E70: d241             add.w      d1, d1
009E72: 06410010         addi.w     #$10, d1
009E76: 3081             move.w     d1, (a0)
009E78: 5241             addq.w     #$1, d1
009E7A: 31410080         move.w     d1, $80(a0)
009E7E: 4840             swap       d0
009E80: 02800000ffff     andi.l     #$ffff, d0
009E86: 81fc000a         divs.w     #$a, d0
009E8A: 3200             move.w     d0, d1
009E8C: d241             add.w      d1, d1
009E8E: 06410010         addi.w     #$10, d1
009E92: 31410004         move.w     d1, $4(a0)
009E96: 5241             addq.w     #$1, d1
009E98: 31410084         move.w     d1, $84(a0)
009E9C: 4840             swap       d0
009E9E: d040             add.w      d0, d0
009EA0: 06400010         addi.w     #$10, d0
009EA4: 31400006         move.w     d0, $6(a0)
009EA8: 5240             addq.w     #$1, d0
009EAA: 31400086         move.w     d0, $86(a0)
009EAE: 317c00240002     move.w     #$24, $2(a0)
009EB4: 317c00250082     move.w     #$25, $82(a0)
009EBA: 4e75             rts        

; ==== sub_009EBC ТАБЛИЦА зовут=0 ====
009EBC: 4a7900ff0418     tst.w      $ff0418.l
009EC2: 66000304         bne.w      $a1c8
009EC6: 41f900ff86a4     lea.l      $ff86a4.l, a0
009ECC: 4290             clr.l      (a0)
009ECE: 42a80004         clr.l      $4(a0)
009ED2: 42a80080         clr.l      $80(a0)
009ED6: 42a80084         clr.l      $84(a0)
009EDA: 41f900ff4002     lea.l      $ff4002.l, a0
009EE0: 7000             moveq      #$0, d0
009EE2: 7204             moveq      #$4, d1
009EE4: 4a280001         tst.b      $1(a0)
009EE8: 67000004         beq.w      $9eee
009EEC: 5240             addq.w     #$1, d0
009EEE: 41e80002         lea.l      $2(a0), a0
009EF2: 51c9fff0         dbra       d1, $9ee4
009EF6: 4a40             tst.w      d0
009EF8: 66000050         bne.w      $9f4a
009EFC: 4a3900ff4001     tst.b      $ff4001.l
009F02: 670002c4         beq.w      $a1c8
009F06: 45f900ff4000     lea.l      $ff4000.l, a2
009F0C: 47fa01da         lea.l      $a0e8(pc), a3
009F10: 7e05             moveq      #$5, d7
009F12: 6100019e         bsr.w      $a0b2
009F16: 45ea0002         lea.l      $2(a2), a2
009F1A: 51cffff6         dbra       d7, $9f12
009F1E: 41fa0446         lea.l      $a366(pc), a0
009F22: 43fa0462         lea.l      $a386(pc), a1
009F26: 45f900ff0320     lea.l      $ff0320.l, a2
009F2C: 47f900ff0360     lea.l      $ff0360.l, a3
009F32: 303c000f         move.w     #$f, d0
009F36: 34d8             move.w     (a0)+, (a2)+
009F38: 36d9             move.w     (a1)+, (a3)+
009F3A: 51c8fffa         dbra       d0, $9f36
009F3E: 13fc000100ff0400 move.b     #$1, $ff0400.l
009F46: 60000280         bra.w      $a1c8
009F4A: 5240             addq.w     #$1, d0
009F4C: 33c000ff400c     move.w     d0, $ff400c.l
009F52: 41f900044842     lea.l      $44842.l, a0
009F58: 43f900ffa000     lea.l      $ffa000.l, a1
009F5E: 4eb9000047aa     jsr        $47aa.l
009F64: 33fc004000ff0406 move.w     #$40, $ff0406.l
009F6C: 41f900ffa000     lea.l      $ffa000.l, a0
009F72: 43f900ff8104     lea.l      $ff8104.l, a1
009F78: 303c0300         move.w     #$300, d0
009F7C: 7e16             moveq      #$16, d7
009F7E: 7c0d             moveq      #$d, d6
009F80: 4eb900010fc2     jsr        $10fc2.l
009F86: 45f900ff4000     lea.l      $ff4000.l, a2
009F8C: 47fa015a         lea.l      $a0e8(pc), a3
009F90: 7e05             moveq      #$5, d7
009F92: 6100011e         bsr.w      $a0b2
009F96: 45ea0002         lea.l      $2(a2), a2
009F9A: 51cffff6         dbra       d7, $9f92
009F9E: 41fa0102         lea.l      $a0a2(pc), a0
009FA2: 47f900ff818a     lea.l      $ff818a.l, a3
009FA8: 43eb0006         lea.l      $6(a3), a1
009FAC: 7e07             moveq      #$7, d7
009FAE: 7c01             moveq      #$1, d6
009FB0: 303c2300         move.w     #$2300, d0
009FB4: 4eb900010fc2     jsr        $10fc2.l
009FBA: 3e3900ff400c     move.w     $ff400c.l, d7
009FC0: 5347             subq.w     #$1, d7
009FC2: 45f900ff4002     lea.l      $ff4002.l, a2
009FC8: 47f900ff828a     lea.l      $ff828a.l, a3
009FCE: 7000             moveq      #$0, d0
009FD0: 1012             move.b     (a2), d0
009FD2: 6700006c         beq.w      $a040
009FD6: 41fa012c         lea.l      $a104(pc), a0
009FDA: e740             asl.w      #$3, d0
009FDC: d1c0             adda.l     d0, a0
009FDE: 224b             movea.l    a3, a1
009FE0: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
009FE4: 7e01             moveq      #$1, d7
009FE6: 7c01             moveq      #$1, d6
009FE8: 4eb900010fdc     jsr        $10fdc.l
009FEE: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
009FF2: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
009FF6: 43eb0006         lea.l      $6(a3), a1
009FFA: 7000             moveq      #$0, d0
009FFC: 1012             move.b     (a2), d0
009FFE: 5540             subq.w     #$2, d0
00A000: e540             asl.w      #$2, d0
00A002: 3200             move.w     d0, d1
00A004: e740             asl.w      #$3, d0
00A006: 9041             sub.w      d1, d0
00A008: 41fa0132         lea.l      $a13c(pc), a0
00A00C: d1c0             adda.l     d0, a0
00A00E: 303c0000         move.w     #$0, d0
00A012: 3e3c000d         move.w     #$d, d7
00A016: 3c3c0001         move.w     #$1, d6
00A01A: 4eb900010fc2     jsr        $10fc2.l
00A020: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00A024: 43eb0024         lea.l      $24(a3), a1
00A028: 7000             moveq      #$0, d0
00A02A: 102a0001         move.b     $1(a2), d0
00A02E: d040             add.w      d0, d0
00A030: 06402010         addi.w     #$2010, d0
00A034: 3280             move.w     d0, (a1)
00A036: 5240             addq.w     #$1, d0
00A038: 33400080         move.w     d0, $80(a1)
00A03C: 47eb0100         lea.l      $100(a3), a3
00A040: 45ea0002         lea.l      $2(a2), a2
00A044: 51cfff88         dbra       d7, $9fce
00A048: 41fa031c         lea.l      $a366(pc), a0
00A04C: 43fa0338         lea.l      $a386(pc), a1
00A050: 45f900ff0320     lea.l      $ff0320.l, a2
00A056: 47f900ff0360     lea.l      $ff0360.l, a3
00A05C: 303c000f         move.w     #$f, d0
00A060: 34d8             move.w     (a0)+, (a2)+
00A062: 36d9             move.w     (a1)+, (a3)+
00A064: 51c8fffa         dbra       d0, $a060
00A068: 41f900ff0000     lea.l      $ff0000.l, a0
00A06E: 30bc009f         move.w     #$9f, (a0)
00A072: 317c00010002     move.w     #$1, $2(a0)
00A078: 317c000d0004     move.w     #$d, $4(a0)
00A07E: 317c009c0006     move.w     #$9c, $6(a0)
00A084: 13fc000100ff040d move.b     #$1, $ff040d.l
00A08C: 13fc000100ff0400 move.b     #$1, $ff0400.l
00A094: 427900ff0500     clr.w      $ff0500.l
00A09A: 423900ff0502     clr.b      $ff0502.l
00A0A0: 4e75             rts        

; ---- ДАННЫЕ $00A0A2..$00A0B2 (16 байт) ----


; ==== sub_00A0B2 зовут=2 ====
00A0B2: 3012             move.w     (a2), d0
00A0B4: 66000004         bne.w      $a0ba
00A0B8: 4e75             rts        
00A0BA: 7000             moveq      #$0, d0
00A0BC: 7200             moveq      #$0, d1
00A0BE: 122a0001         move.b     $1(a2), d1
00A0C2: 5341             subq.w     #$1, d1
00A0C4: 1012             move.b     (a2), d0
00A0C6: 41fa003c         lea.l      $a104(pc), a0
00A0CA: e740             asl.w      #$3, d0
00A0CC: d1c0             adda.l     d0, a0
00A0CE: 225b             movea.l    (a3)+, a1
00A0D0: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00A0D4: 7e01             moveq      #$1, d7
00A0D6: 7c01             moveq      #$1, d6
00A0D8: 4eb900010fdc     jsr        $10fdc.l
00A0DE: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00A0E2: 51c9ffe0         dbra       d1, $a0c4
00A0E6: 4e75             rts        

; ---- ДАННЫЕ $00A0E8..$00A1C8 (224 байт) ----

00A1C8: 4eb900003da4     jsr        $3da4.l
00A1CE: 6100f800         bsr.w      $99d0
00A1D2: 2c7900ff044c     movea.l    $ff044c.l, a6
00A1D8: 082e00070041     btst.b     #$7, $41(a6)
00A1DE: 66000026         bne.w      $a206
00A1E2: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00A1EA: 66000018         bne.w      $a204
00A1EE: 4df900ff1000     lea.l      $ff1000.l, a6
00A1F4: 4eb9000106b2     jsr        $106b2.l
00A1FA: 4dee0400         lea.l      $400(a6), a6
00A1FE: 4eb9000106b2     jsr        $106b2.l
00A204: 4e75             rts        
00A206: 33fc002000ff0406 move.w     #$20, $ff0406.l
00A20E: 4a7900ff0418     tst.w      $ff0418.l
00A214: 6700002c         beq.w      $a242
00A218: 40e7             move.w     sr, -(a7)
00A21A: 007c0700         ori.w      #$700, sr
00A21E: 33fc010000a11100 move.w     #$100, $a11100.l
00A226: 0839000000a11100 btst.b     #$0, $a11100.l
00A22E: 66f6             bne.b      $a226
00A230: 13fc008000a01c10 move.b     #$80, $a01c10.l
00A238: 33fc000000a11100 move.w     #$0, $a11100.l
00A240: 46df             move.w     (a7)+, sr
00A242: 41f900ff2800     lea.l      $ff2800.l, a0
00A248: 43f900ff0000     lea.l      $ff0000.l, a1
00A24E: 303c00bf         move.w     #$bf, d0
00A252: 22d8             move.l     (a0)+, (a1)+
00A254: 51c8fffc         dbra       d0, $a252
00A258: 43f900ff0300     lea.l      $ff0300.l, a1
00A25E: 41f900ff0380     lea.l      $ff0380.l, a0
00A264: 303c001f         move.w     #$1f, d0
00A268: 22d8             move.l     (a0)+, (a1)+
00A26A: 51c8fffc         dbra       d0, $a268
00A26E: 43f900ff8000     lea.l      $ff8000.l, a1
00A274: 41f900ff9000     lea.l      $ff9000.l, a0
00A27A: 303c03ff         move.w     #$3ff, d0
00A27E: 22d8             move.l     (a0)+, (a1)+
00A280: 51c8fffc         dbra       d0, $a27e
00A284: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00A28C: 66000026         bne.w      $a2b4
00A290: 4df900ff1000     lea.l      $ff1000.l, a6
00A296: 1d6e00d700b8     move.b     $d7(a6), $b8(a6)
00A29C: 4eb90001068c     jsr        $1068c.l
00A2A2: 4df900ff1400     lea.l      $ff1400.l, a6
00A2A8: 1d6e00d700b8     move.b     $d7(a6), $b8(a6)
00A2AE: 4eb90001068c     jsr        $1068c.l
00A2B4: 13fc000100ff0400 move.b     #$1, $ff0400.l
00A2BC: 13fc000100ff040d move.b     #$1, $ff040d.l
00A2C4: 4e75             rts        

; ==== sub_00A2C6 ТАБЛИЦА зовут=0 ====
00A2C6: 61000280         bsr.w      $a548
00A2CA: 6100024e         bsr.w      $a51a
00A2CE: 13fc000100ff040d move.b     #$1, $ff040d.l
00A2D6: 103900ffe00d     move.b     $ffe00d.l, d0
00A2DC: 02000080         andi.b     #$80, d0
00A2E0: 6600ff24         bne.w      $a206
00A2E4: 103900ffe00d     move.b     $ffe00d.l, d0
00A2EA: 02000060         andi.b     #$60, d0
00A2EE: 66000004         bne.w      $a2f4
00A2F2: 4e75             rts        
00A2F4: 4a7900ff0500     tst.w      $ff0500.l
00A2FA: 6700ff0a         beq.w      $a206
00A2FE: 537900ff0500     subq.w     #$1, $ff0500.l
00A304: 303900ff0500     move.w     $ff0500.l, d0
00A30A: d040             add.w      d0, d0
00A30C: 41f900ff4002     lea.l      $ff4002.l, a0
00A312: 7800             moveq      #$0, d4
00A314: 18300000         move.b     (a0, d0.w), d4
00A318: 53300001         subq.b     #$1, $1(a0, d0.w)
00A31C: 66000022         bne.w      $a340
00A320: 42700000         clr.w      (a0, d0.w)
00A324: 3200             move.w     d0, d1
00A326: 5441             addq.w     #$2, d1
00A328: 0c41000a         cmpi.w     #$a, d1
00A32C: 67000012         beq.w      $a340
00A330: 34301000         move.w     (a0, d1.w), d2
00A334: 42701000         clr.w      (a0, d1.w)
00A338: 31820000         move.w     d2, (a0, d0.w)
00A33C: 5440             addq.w     #$2, d0
00A33E: 60e6             bra.b      $a326
00A340: 41fa0010         lea.l      $a352(pc), a0
00A344: 5544             subq.w     #$2, d4
00A346: e544             asl.w      #$2, d4
00A348: 20704000         movea.l    (a0, d4.w), a0
00A34C: 4e90             jsr        (a0)
00A34E: 6000feb6         bra.w      $a206

; ---- ДАННЫЕ $00A352..$00A3A6 (84 байт) ----


; ==== sub_00A3A6 зовут=5 ====
00A3A6: 3e3c0028         move.w     #$28, d7
00A3AA: 3f07             move.w     d7, -(a7)
00A3AC: 4eb900000ee2     jsr        $ee2.l
00A3B2: 3e1f             move.w     (a7)+, d7
00A3B4: 51cffff4         dbra       d7, $a3aa
00A3B8: 4e75             rts        

; ==== sub_00A3BA ТАБЛИЦА зовут=0 ====
00A3BA: 1e3c00b4         move.b     #$b4, d7
00A3BE: 4eb900003d7a     jsr        $3d7a.l
00A3C4: 4eb90000a3a6     jsr        $a3a6.l
00A3CA: 33fc000100ff108e move.w     #$1, $ff108e.l
00A3D2: 33fcfff300ff1078 move.w     #$fff3, $ff1078.l
00A3DA: 4e75             rts        

; ==== sub_00A3DC ТАБЛИЦА зовут=0 ====
00A3DC: 1e3c00b4         move.b     #$b4, d7
00A3E0: 4eb900003d7a     jsr        $3d7a.l
00A3E6: 4eb90000a3a6     jsr        $a3a6.l
00A3EC: 4df900ff1000     lea.l      $ff1000.l, a6
00A3F2: 4a6e004c         tst.w      $4c(a6)
00A3F6: 67000038         beq.w      $a430
00A3FA: 0c6e0004004c     cmpi.w     #$4, $4c(a6)
00A400: 67000014         beq.w      $a416
00A404: 0c6e0008004c     cmpi.w     #$8, $4c(a6)
00A40A: 6700000a         beq.w      $a416
00A40E: 1d7c000100cc     move.b     #$1, $cc(a6)
00A414: 4e75             rts        
00A416: 206e000e         movea.l    $e(a6), a0
00A41A: 2f08             move.l     a0, -(a7)
00A41C: 2d7c00ff2800000e move.l     #$ff2800, $e(a6)
00A424: 4eb90000dd8a     jsr        $dd8a.l
00A42A: 205f             movea.l    (a7)+, a0
00A42C: 2d48000e         move.l     a0, $e(a6)
00A430: 43ee0260         lea.l      $260(a6), a1
00A434: 7067             moveq      #$67, d0
00A436: 7200             moveq      #$0, d1
00A438: 14290001         move.b     $1(a1), d2
00A43C: 6b00000c         bmi.w      $a44a
00A440: 67000008         beq.w      $a44a
00A444: 08d10007         bset.b     #$7, (a1)
00A448: 5241             addq.w     #$1, d1
00A44A: 5449             addq.w     #$2, a1
00A44C: 51c8ffea         dbra       d0, $a438
00A450: 4a41             tst.w      d1
00A452: 66000008         bne.w      $a45c
00A456: 426e004c         clr.w      $4c(a6)
00A45A: 4e75             rts        
00A45C: 3d7c00010076     move.w     #$1, $76(a6)
00A462: 426e006a         clr.w      $6a(a6)
00A466: 426e006c         clr.w      $6c(a6)
00A46A: 3d7c0010004c     move.w     #$10, $4c(a6)
00A470: 1d7c00010098     move.b     #$1, $98(a6)
00A476: 1d7c000200cc     move.b     #$2, $cc(a6)
00A47C: 4e75             rts        

; ==== sub_00A47E ТАБЛИЦА зовут=0 ====
00A47E: 1e3c00b4         move.b     #$b4, d7
00A482: 4eb900003d7a     jsr        $3d7a.l
00A488: 4eb90000a3a6     jsr        $a3a6.l
00A48E: 1e3c00c4         move.b     #$c4, d7
00A492: 4eb900003d7a     jsr        $3d7a.l
00A498: 33fc070800ff10ca move.w     #$708, $ff10ca.l
00A4A0: 4e75             rts        

; ==== sub_00A4A2 ТАБЛИЦА зовут=0 ====
00A4A2: 1e3c00b4         move.b     #$b4, d7
00A4A6: 4eb900003d7a     jsr        $3d7a.l
00A4AC: 4eb90000a3a6     jsr        $a3a6.l
00A4B2: 13fc000100ff10c9 move.b     #$1, $ff10c9.l
00A4BA: 4e75             rts        

; ==== sub_00A4BC ТАБЛИЦА зовут=0 ====
00A4BC: 1e3c00b4         move.b     #$b4, d7
00A4C0: 4eb900003d7a     jsr        $3d7a.l
00A4C6: 4eb90000a3a6     jsr        $a3a6.l
00A4CC: 1e3c00c5         move.b     #$c5, d7
00A4D0: 4eb900003d7a     jsr        $3d7a.l
00A4D6: 427900ff10f0     clr.w      $ff10f0.l
00A4DC: 427900ff10f2     clr.w      $ff10f2.l
00A4E2: 427900ff10f4     clr.w      $ff10f4.l
00A4E8: 4a7900ff10f8     tst.w      $ff10f8.l
00A4EE: 67000010         beq.w      $a500
00A4F2: 427900ff10f8     clr.w      $ff10f8.l
00A4F8: 08f9000000ff10a7 bset.b     #$0, $ff10a7.l
00A500: 4a7900ff10f6     tst.w      $ff10f6.l
00A506: 67000010         beq.w      $a518
00A50A: 427900ff10f6     clr.w      $ff10f6.l
00A510: 13fc000300ff10a7 move.b     #$3, $ff10a7.l
00A518: 4e75             rts        

; ==== sub_00A51A зовут=1 ====
00A51A: 523900ff0502     addq.b     #$1, $ff0502.l
00A520: 0839000300ff0502 btst.b     #$3, $ff0502.l
00A528: 6700000a         beq.w      $a534
00A52C: 427900ff0000     clr.w      $ff0000.l
00A532: 4e75             rts        
00A534: 303900ff0500     move.w     $ff0500.l, d0
00A53A: e940             asl.w      #$4, d0
00A53C: 0640009f         addi.w     #$9f, d0
00A540: 33c000ff0000     move.w     d0, $ff0000.l
00A546: 4e75             rts        

; ==== sub_00A548 зовут=1 ====
00A548: 103900ffe00d     move.b     $ffe00d.l, d0
00A54E: 02000003         andi.b     #$3, d0
00A552: 6700000c         beq.w      $a560
00A556: 1e3c00b3         move.b     #$b3, d7
00A55A: 4eb900003d7a     jsr        $3d7a.l
00A560: 0839000000ffe00d btst.b     #$0, $ffe00d.l
00A568: 6700001c         beq.w      $a586
00A56C: 537900ff0500     subq.w     #$1, $ff0500.l
00A572: 6a00003a         bpl.w      $a5ae
00A576: 303900ff400c     move.w     $ff400c.l, d0
00A57C: 5340             subq.w     #$1, d0
00A57E: 33c000ff0500     move.w     d0, $ff0500.l
00A584: 4e75             rts        
00A586: 0839000100ffe00d btst.b     #$1, $ffe00d.l
00A58E: 6700001e         beq.w      $a5ae
00A592: 527900ff0500     addq.w     #$1, $ff0500.l
00A598: 303900ff0500     move.w     $ff0500.l, d0
00A59E: b07900ff400c     cmp.w      $ff400c.l, d0
00A5A4: 66000008         bne.w      $a5ae
00A5A8: 427900ff0500     clr.w      $ff0500.l
00A5AE: 4e75             rts        

; ==== sub_00A5B0 ТАБЛИЦА зовут=0 ====
00A5B0: 4eb900000ee2     jsr        $ee2.l
00A5B6: 007c0700         ori.w      #$700, sr
00A5BA: 4eb90000064c     jsr        $64c.l
00A5C0: 4eb9000004a2     jsr        $4a2.l
00A5C6: 4eb900003952     jsr        $3952.l
00A5CC: 13fc000100ff040d move.b     #$1, $ff040d.l
00A5D4: 42b900ff0380     clr.l      $ff0380.l
00A5DA: 41f900ff0384     lea.l      $ff0384.l, a0
00A5E0: 703d             moveq      #$3d, d0
00A5E2: 30fc0eee         move.w     #$eee, (a0)+
00A5E6: 51c8fffa         dbra       d0, $a5e2
00A5EA: 41f900ffa000     lea.l      $ffa000.l, a0
00A5F0: 701f             moveq      #$1f, d0
00A5F2: 4298             clr.l      (a0)+
00A5F4: 51c8fffc         dbra       d0, $a5f2
00A5F8: 203c40000000     move.l     #$40000000, d0
00A5FE: 223c94009340     move.l     #$94009340, d1
00A604: 243c96d09500     move.l     #$96d09500, d2
00A60A: 363c977f         move.w     #$977f, d3
00A60E: 4eb900003980     jsr        $3980.l
00A614: 41f90006a8ec     lea.l      $6a8ec.l, a0
00A61A: 43f900ffa000     lea.l      $ffa000.l, a1
00A620: 4eb9000047aa     jsr        $47aa.l
00A626: 7002             moveq      #$2, d0
00A628: 3e3c16a0         move.w     #$16a0, d7
00A62C: 4eb900003d3e     jsr        $3d3e.l
00A632: 203c40000000     move.l     #$40000000, d0
00A638: 223c940b9350     move.l     #$940b9350, d1
00A63E: 243c96d09500     move.l     #$96d09500, d2
00A644: 363c977f         move.w     #$977f, d3
00A648: 4eb900003980     jsr        $3980.l
00A64E: 41f90003ac6a     lea.l      $3ac6a.l, a0
00A654: 43f900ffa000     lea.l      $ffa000.l, a1
00A65A: 4eb9000047aa     jsr        $47aa.l
00A660: 203c60000001     move.l     #$60000001, d0
00A666: 223c941d9360     move.l     #$941d9360, d1
00A66C: 243c96d09500     move.l     #$96d09500, d2
00A672: 363c977f         move.w     #$977f, d3
00A676: 4eb900003980     jsr        $3980.l
00A67C: 41f90003d6f4     lea.l      $3d6f4.l, a0
00A682: 43f900ffa000     lea.l      $ffa000.l, a1
00A688: 4eb9000047aa     jsr        $47aa.l
00A68E: 7e27             moveq      #$27, d7
00A690: 7c1b             moveq      #$1b, d6
00A692: 2a3c60000003     move.l     #$60000003, d5
00A698: 4df900ffa000     lea.l      $ffa000.l, a6
00A69E: 4eb900000622     jsr        $622.l
00A6A4: 41f900ff8000     lea.l      $ff8000.l, a0
00A6AA: 303c03ff         move.w     #$3ff, d0
00A6AE: 20fc03000300     move.l     #$3000300, (a0)+
00A6B4: 51c8fff8         dbra       d0, $a6ae
00A6B8: 41f90003da96     lea.l      $3da96.l, a0
00A6BE: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A6C6: 67000008         beq.w      $a6d0
00A6CA: 41f90003dd3a     lea.l      $3dd3a.l, a0
00A6D0: 43f900ffa000     lea.l      $ffa000.l, a1
00A6D6: 4eb9000047aa     jsr        $47aa.l
00A6DC: 33fc004800ff0406 move.w     #$48, $ff0406.l
00A6E4: 427900ff0500     clr.w      $ff0500.l
00A6EA: 13fc003c00ff0502 move.b     #$3c, $ff0502.l
00A6F2: 4eb900000642     jsr        $642.l
00A6F8: 4eb900000ee2     jsr        $ee2.l
00A6FE: 4ef90000392e     jmp        $392e.l

; ---- ДАННЫЕ $00A704..$00A76A (102 байт) ----


; ==== sub_00A76A ТАБЛИЦА зовут=0 ====
00A76A: 13fc000100ff0400 move.b     #$1, $ff0400.l
00A772: 303900ff0500     move.w     $ff0500.l, d0
00A778: 41fa0008         lea.l      $a782(pc), a0
00A77C: 20700000         movea.l    (a0, d0.w), a0
00A780: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $00A782..$00A79A (24 байт) ----


; ==== sub_00A79A ТАБЛИЦА зовут=0 ====
00A79A: 533900ff0502     subq.b     #$1, $ff0502.l
00A7A0: 67000004         beq.w      $a7a6
00A7A4: 4e75             rts        
00A7A6: 33fc000400ff0500 move.w     #$4, $ff0500.l
00A7AE: 13fc000600ff0502 move.b     #$6, $ff0502.l
00A7B6: 13fc000e00ff0503 move.b     #$e, $ff0503.l
00A7BE: 23fc00ff812600ff0504 move.l     #$ff8126, $ff0504.l
00A7C8: 23fc00ff812800ff0508 move.l     #$ff8128, $ff0508.l
00A7D2: 423900ff050c     clr.b      $ff050c.l
00A7D8: 13fc000400ff050d move.b     #$4, $ff050d.l
00A7E0: 423900ff050e     clr.b      $ff050e.l
00A7E6: 13fc000200ff050f move.b     #$2, $ff050f.l
00A7EE: 4e75             rts        

; ==== sub_00A7F0 ТАБЛИЦА зовут=0 ====
00A7F0: 533900ff0502     subq.b     #$1, $ff0502.l
00A7F6: 67000004         beq.w      $a7fc
00A7FA: 4e75             rts        
00A7FC: 13fc000600ff0502 move.b     #$6, $ff0502.l
00A804: 41f90000a9b6     lea.l      $a9b6.l, a0
00A80A: 227900ff0504     movea.l    $ff0504.l, a1
00A810: 7e00             moveq      #$0, d7
00A812: 7c13             moveq      #$13, d6
00A814: 303c0000         move.w     #$0, d0
00A818: 4eb900010fc2     jsr        $10fc2.l
00A81E: 41f90000a9b6     lea.l      $a9b6.l, a0
00A824: 227900ff0508     movea.l    $ff0508.l, a1
00A82A: 7e00             moveq      #$0, d7
00A82C: 7c13             moveq      #$13, d6
00A82E: 303c0000         move.w     #$0, d0
00A832: 4eb900010fc2     jsr        $10fc2.l
00A838: 55b900ff0504     subq.l     #$2, $ff0504.l
00A83E: 54b900ff0508     addq.l     #$2, $ff0508.l
00A844: 533900ff0503     subq.b     #$1, $ff0503.l
00A84A: 67000004         beq.w      $a850
00A84E: 4e75             rts        
00A850: 33fc000800ff0500 move.w     #$8, $ff0500.l
00A858: 43f900ff8510     lea.l      $ff8510.l, a1
00A85E: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A866: 67000008         beq.w      $a870
00A86A: 43f900ff8590     lea.l      $ff8590.l, a1
00A870: 41f900ffa000     lea.l      $ffa000.l, a0
00A876: 7e17             moveq      #$17, d7
00A878: 7c09             moveq      #$9, d6
00A87A: 4eb900010fdc     jsr        $10fdc.l
00A880: 41f90000a936     lea.l      $a936.l, a0
00A886: 43f900ff0380     lea.l      $ff0380.l, a1
00A88C: 701f             moveq      #$1f, d0
00A88E: 22d8             move.l     (a0)+, (a1)+
00A890: 51c8fffc         dbra       d0, $a88e
00A894: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A89C: 67000016         beq.w      $a8b4
00A8A0: 41f90000b006     lea.l      $b006.l, a0
00A8A6: 43f900ff03e0     lea.l      $ff03e0.l, a1
00A8AC: 7007             moveq      #$7, d0
00A8AE: 22d8             move.l     (a0)+, (a1)+
00A8B0: 51c8fffc         dbra       d0, $a8ae
00A8B4: 4eb900003864     jsr        $3864.l
00A8BA: 1e3c009b         move.b     #$9b, d7
00A8BE: 0c39000200ff0448 cmpi.b     #$2, $ff0448.l
00A8C6: 67000006         beq.w      $a8ce
00A8CA: 1e3c009e         move.b     #$9e, d7
00A8CE: 4eb900003d7a     jsr        $3d7a.l
00A8D4: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A8DC: 6700001a         beq.w      $a8f8
00A8E0: 41fa0018         lea.l      $a8fa(pc), a0
00A8E4: 43f900ff8b8a     lea.l      $ff8b8a.l, a1
00A8EA: 7e1d             moveq      #$1d, d7
00A8EC: 7c01             moveq      #$1, d6
00A8EE: 303c6400         move.w     #$6400, d0
00A8F2: 4eb900010fc2     jsr        $10fc2.l
00A8F8: 4e75             rts        

; ---- ДАННЫЕ $00A8FA..$00A9CA (208 байт) ----


; ==== sub_00A9CA ТАБЛИЦА зовут=0 ====
00A9CA: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A9D2: 66000012         bne.w      $a9e6
00A9D6: 7064             moveq      #$64, d0
00A9D8: 6100008c         bsr.w      $aa66
00A9DC: 33fc001000ff0500 move.w     #$10, $ff0500.l
00A9E4: 4e75             rts        
00A9E6: 703c             moveq      #$3c, d0
00A9E8: 6100007c         bsr.w      $aa66
00A9EC: 33fc000c00ff0500 move.w     #$c, $ff0500.l
00A9F4: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00A9FC: 67000046         beq.w      $aa44
00AA00: 41fa0044         lea.l      $aa46(pc), a0
00AA04: 43f900ff0000     lea.l      $ff0000.l, a1
00AA0A: 7e0f             moveq      #$f, d7
00AA0C: 7000             moveq      #$0, d0
00AA0E: 1018             move.b     (a0)+, d0
00AA10: 06400080         addi.w     #$80, d0
00AA14: 32c0             move.w     d0, (a1)+
00AA16: 43e90002         lea.l      $2(a1), a1
00AA1A: 32fc4410         move.w     #$4410, (a1)+
00AA1E: 7000             moveq      #$0, d0
00AA20: 1018             move.b     (a0)+, d0
00AA22: 06400080         addi.w     #$80, d0
00AA26: 32c0             move.w     d0, (a1)+
00AA28: 51cfffe2         dbra       d7, $aa0c
00AA2C: 41f900ffc000     lea.l      $ffc000.l, a0
00AA32: 700f             moveq      #$f, d0
00AA34: 10bc0004         move.b     #$4, (a0)
00AA38: 41e80003         lea.l      $3(a0), a0
00AA3C: 51c8fff6         dbra       d0, $aa34
00AA40: 3e3c03c0         move.w     #$3c0, d7
00AA44: 4e75             rts        

; ---- ДАННЫЕ $00AA46..$00AA66 (32 байт) ----


; ==== sub_00AA66 зовут=3 ====
00AA66: 3f00             move.w     d0, -(a7)
00AA68: 4eb900000ee2     jsr        $ee2.l
00AA6E: 6100000a         bsr.w      $aa7a
00AA72: 301f             move.w     (a7)+, d0
00AA74: 51c8fff0         dbra       d0, $aa66
00AA78: 4e75             rts        

; ==== sub_00AA7A зовут=2 ====
00AA7A: 13fc000100ff0400 move.b     #$1, $ff0400.l
00AA82: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00AA8A: 67000130         beq.w      $abbc
00AA8E: 533900ff050f     subq.b     #$1, $ff050f.l
00AA94: 66000018         bne.w      $aaae
00AA98: 13fc000200ff050f move.b     #$2, $ff050f.l
00AAA0: 523900ff050e     addq.b     #$1, $ff050e.l
00AAA6: 0239000f00ff050e andi.b     #$f, $ff050e.l
00AAAE: 7000             moveq      #$0, d0
00AAB0: 103900ff050e     move.b     $ff050e.l, d0
00AAB6: eb40             asl.w      #$5, d0
00AAB8: 41fa054c         lea.l      $b006(pc), a0
00AABC: d1c0             adda.l     d0, a0
00AABE: 43f900ff0360     lea.l      $ff0360.l, a1
00AAC4: 7007             moveq      #$7, d0
00AAC6: 22d8             move.l     (a0)+, (a1)+
00AAC8: 51c8fffc         dbra       d0, $aac6
00AACC: 533900ff050d     subq.b     #$1, $ff050d.l
00AAD2: 6600002a         bne.w      $aafe
00AAD6: 13fc000600ff050d move.b     #$6, $ff050d.l
00AADE: 523900ff050c     addq.b     #$1, $ff050c.l
00AAE4: 0c39000600ff050c cmpi.b     #$6, $ff050c.l
00AAEC: 66000010         bne.w      $aafe
00AAF0: 423900ff050c     clr.b      $ff050c.l
00AAF6: 13fc002800ff050d move.b     #$28, $ff050d.l
00AAFE: 7000             moveq      #$0, d0
00AB00: 103900ff050c     move.b     $ff050c.l, d0
00AB06: ed40             asl.w      #$6, d0
00AB08: 41fa00c4         lea.l      $abce(pc), a0
00AB0C: d1c0             adda.l     d0, a0
00AB0E: 43f900ff0320     lea.l      $ff0320.l, a1
00AB14: 700f             moveq      #$f, d0
00AB16: 22d8             move.l     (a0)+, (a1)+
00AB18: 51c8fffc         dbra       d0, $ab16
00AB1C: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
00AB24: 67000096         beq.w      $abbc
00AB28: 41f900ffc000     lea.l      $ffc000.l, a0
00AB2E: 43f900ff0000     lea.l      $ff0000.l, a1
00AB34: 7e0f             moveq      #$f, d7
00AB36: 0c100004         cmpi.b     #$4, (a0)
00AB3A: 67000048         beq.w      $ab84
00AB3E: 4a280002         tst.b      $2(a0)
00AB42: 67000010         beq.w      $ab54
00AB46: 53280002         subq.b     #$1, $2(a0)
00AB4A: 337c44100004     move.w     #$4410, $4(a1)
00AB50: 60000056         bra.w      $aba8
00AB54: 53280001         subq.b     #$1, $1(a0)
00AB58: 6600000a         bne.w      $ab64
00AB5C: 117c00040001     move.b     #$4, $1(a0)
00AB62: 5210             addq.b     #$1, (a0)
00AB64: 7000             moveq      #$0, d0
00AB66: 1010             move.b     (a0), d0
00AB68: d040             add.w      d0, d0
00AB6A: 45fa000e         lea.l      $ab7a(pc), a2
00AB6E: 30320000         move.w     (a2, d0.w), d0
00AB72: 33400004         move.w     d0, $4(a1)
00AB76: 60000030         bra.w      $aba8

; ---- ДАННЫЕ $00AB7A..$00AB84 (10 байт) ----

00AB84: 4eb900000368     jsr        $368.l
00AB8A: 303900ffef90     move.w     $ffef90.l, d0
00AB90: 0240000f         andi.w     #$f, d0
00AB94: 45fa0028         lea.l      $abbe(pc), a2
00AB98: 10320000         move.b     (a2, d0.w), d0
00AB9C: 11400002         move.b     d0, $2(a0)
00ABA0: 4210             clr.b      (a0)
00ABA2: 117c00040001     move.b     #$4, $1(a0)
00ABA8: 41e80003         lea.l      $3(a0), a0
00ABAC: 43e90008         lea.l      $8(a1), a1
00ABB0: 51cfff84         dbra       d7, $ab36
00ABB4: 13fc000100ff040d move.b     #$1, $ff040d.l
00ABBC: 4e75             rts        

; ---- ДАННЫЕ $00ABBE..$00AD4E (400 байт) ----


; ==== sub_00AD4E ТАБЛИЦА зовут=0 ====
00AD4E: 3f07             move.w     d7, -(a7)
00AD50: 6100fd28         bsr.w      $aa7a
00AD54: 4eb900000ee2     jsr        $ee2.l
00AD5A: 3e1f             move.w     (a7)+, d7
00AD5C: 5347             subq.w     #$1, d7
00AD5E: 66ee             bne.b      $ad4e
00AD60: 4eb90000079e     jsr        $79e.l
00AD66: 4eb900003940     jsr        $3940.l
00AD6C: 33fc005000ff0406 move.w     #$50, $ff0406.l
00AD74: 4e75             rts        

; ==== sub_00AD76 ТАБЛИЦА зовут=0 ====
00AD76: 41f90000ae18     lea.l      $ae18.l, a0
00AD7C: 43f900ff8a86     lea.l      $ff8a86.l, a1
00AD82: 61000072         bsr.w      $adf6
00AD86: 33fc0eee00ff039e move.w     #$eee, $ff039e.l
00AD8E: 4eb900003864     jsr        $3864.l
00AD94: 33fc00ff00ff0508 move.w     #$ff, $ff0508.l
00AD9C: 4eb900000ee2     jsr        $ee2.l
00ADA2: 537900ff0508     subq.w     #$1, $ff0508.l
00ADA8: 66f2             bne.b      $ad9c
00ADAA: 33fc000000ff039e move.w     #$0, $ff039e.l
00ADB2: 4eb900003864     jsr        $3864.l
00ADB8: 41f90000aeea     lea.l      $aeea.l, a0
00ADBE: 43f900ff8a86     lea.l      $ff8a86.l, a1
00ADC4: 61000030         bsr.w      $adf6
00ADC8: 33fc0eee00ff039e move.w     #$eee, $ff039e.l
00ADD0: 4eb900003864     jsr        $3864.l
00ADD6: 33fc00ff00ff0508 move.w     #$ff, $ff0508.l
00ADDE: 4eb900000ee2     jsr        $ee2.l
00ADE4: 537900ff0508     subq.w     #$1, $ff0508.l
00ADEA: 66f2             bne.b      $adde
00ADEC: 33fc001400ff0500 move.w     #$14, $ff0500.l
00ADF4: 4e75             rts        

; ==== sub_00ADF6 зовут=2 ====
00ADF6: 7c02             moveq      #$2, d6
00ADF8: 7e22             moveq      #$22, d7
00ADFA: 3018             move.w     (a0)+, d0
00ADFC: 3280             move.w     d0, (a1)
00ADFE: 06400010         addi.w     #$10, d0
00AE02: 33400080         move.w     d0, $80(a1)
00AE06: 43e90002         lea.l      $2(a1), a1
00AE0A: 51cfffee         dbra       d7, $adfa
00AE0E: 43e900ba         lea.l      $ba(a1), a1
00AE12: 51ceffe4         dbra       d6, $adf8
00AE16: 4e75             rts        

; ---- ДАННЫЕ $00AE18..$00AFBC (420 байт) ----


; ==== sub_00AFBC ТАБЛИЦА зовут=0 ====
00AFBC: 41f900ffa1e0     lea.l      $ffa1e0.l, a0
00AFC2: 43f900ff8510     lea.l      $ff8510.l, a1
00AFC8: 7e17             moveq      #$17, d7
00AFCA: 7c09             moveq      #$9, d6
00AFCC: 4eb900010fdc     jsr        $10fdc.l
00AFD2: 1e3c00c1         move.b     #$c1, d7
00AFD6: 4eb900003d7a     jsr        $3d7a.l
00AFDC: 7010             moveq      #$10, d0
00AFDE: 6100fa86         bsr.w      $aa66
00AFE2: 41f900ffa3c0     lea.l      $ffa3c0.l, a0
00AFE8: 43f900ff8510     lea.l      $ff8510.l, a1
00AFEE: 7e17             moveq      #$17, d7
00AFF0: 7c09             moveq      #$9, d6
00AFF2: 4eb900010fdc     jsr        $10fdc.l
00AFF8: 33fc000c00ff0500 move.w     #$c, $ff0500.l
00B000: 3e3c012c         move.w     #$12c, d7
00B004: 4e75             rts        

; ---- ДАННЫЕ $00B006..$00B206 (512 байт) ----


; ==== sub_00B206 зовут=2 ====
00B206: 3e3900ff0422     move.w     $ff0422.l, d7
00B20C: 5347             subq.w     #$1, d7
00B20E: 4df900ff1000     lea.l      $ff1000.l, a6
00B214: 61000618         bsr.w      $b82e
00B218: 4dee0400         lea.l      $400(a6), a6
00B21C: 51cffff6         dbra       d7, $b214
00B220: 4a3900ff4038     tst.b      $ff4038.l
00B226: 6600002c         bne.w      $b254
00B22A: 41f900061f80     lea.l      $61f80.l, a0
00B230: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00B238: 67000008         beq.w      $b242
00B23C: 41f9000622e4     lea.l      $622e4.l, a0
00B242: 43f900ffa000     lea.l      $ffa000.l, a1
00B248: 4eb9000047aa     jsr        $47aa.l
00B24E: 4eb900007876     jsr        $7876.l
00B254: 3e3900ff0422     move.w     $ff0422.l, d7
00B25A: 5347             subq.w     #$1, d7
00B25C: 4df900ff1000     lea.l      $ff1000.l, a6
00B262: 3f07             move.w     d7, -(a7)
00B264: 4a3900ff4038     tst.b      $ff4038.l
00B26A: 6600001c         bne.w      $b288
00B26E: 41fa0312         lea.l      $b582(pc), a0
00B272: 226e000a         movea.l    $a(a6), a1
00B276: 43e90080         lea.l      $80(a1), a1
00B27A: 7e05             moveq      #$5, d7
00B27C: 7c01             moveq      #$1, d6
00B27E: 303c0400         move.w     #$400, d0
00B282: 4eb900010fc2     jsr        $10fc2.l
00B288: 41fa0304         lea.l      $b58e(pc), a0
00B28C: 226e000a         movea.l    $a(a6), a1
00B290: 43e90206         lea.l      $206(a1), a1
00B294: 7e01             moveq      #$1, d7
00B296: 7c01             moveq      #$1, d6
00B298: 303c4000         move.w     #$4000, d0
00B29C: 4eb900010fc2     jsr        $10fc2.l
00B2A2: 4dee0400         lea.l      $400(a6), a6
00B2A6: 3e1f             move.w     (a7)+, d7
00B2A8: 51cfffb8         dbra       d7, $b262
00B2AC: 6100059a         bsr.w      $b848
00B2B0: 4a3900ff4038     tst.b      $ff4038.l
00B2B6: 66000064         bne.w      $b31c
00B2BA: 33fc002800ff0500 move.w     #$28, $ff0500.l
00B2C2: 4eb900000ee2     jsr        $ee2.l
00B2C8: 537900ff0500     subq.w     #$1, $ff0500.l
00B2CE: 66f2             bne.b      $b2c2
00B2D0: 33fc000100ff0500 move.w     #$1, $ff0500.l
00B2D8: 427900ff0502     clr.w      $ff0502.l
00B2DE: 423900ff0508     clr.b      $ff0508.l
00B2E4: 610005d4         bsr.w      $b8ba
00B2E8: 6100055e         bsr.w      $b848
00B2EC: 4eb900000ee2     jsr        $ee2.l
00B2F2: 0c79002000ff0502 cmpi.w     #$20, $ff0502.l
00B2FA: 66e8             bne.b      $b2e4
00B2FC: 1e3c00b1         move.b     #$b1, d7
00B300: 4eb900003d7a     jsr        $3d7a.l
00B306: 33fc003c00ff0508 move.w     #$3c, $ff0508.l
00B30E: 4eb900000ee2     jsr        $ee2.l
00B314: 537900ff0508     subq.w     #$1, $ff0508.l
00B31A: 66f2             bne.b      $b30e
00B31C: 3e3900ff0422     move.w     $ff0422.l, d7
00B322: 5347             subq.w     #$1, d7
00B324: 4df900ff1000     lea.l      $ff1000.l, a6
00B32A: 41fa024a         lea.l      $b576(pc), a0
00B32E: 226e000a         movea.l    $a(a6), a1
00B332: 43e90080         lea.l      $80(a1), a1
00B336: 3f07             move.w     d7, -(a7)
00B338: 7e05             moveq      #$5, d7
00B33A: 7c01             moveq      #$1, d6
00B33C: 303c0400         move.w     #$400, d0
00B340: 4eb900010fc2     jsr        $10fc2.l
00B346: 4dee0400         lea.l      $400(a6), a6
00B34A: 3e1f             move.w     (a7)+, d7
00B34C: 51cfffdc         dbra       d7, $b32a
00B350: 41f900ff4018     lea.l      $ff4018.l, a0
00B356: 43f900ffa000     lea.l      $ffa000.l, a1
00B35C: 22d8             move.l     (a0)+, (a1)+
00B35E: 22d8             move.l     (a0)+, (a1)+
00B360: 22d8             move.l     (a0)+, (a1)+
00B362: 22d8             move.l     (a0)+, (a1)+
00B364: 22d8             move.l     (a0)+, (a1)+
00B366: 41f900ff4010     lea.l      $ff4010.l, a0
00B36C: 43f900ff0470     lea.l      $ff0470.l, a1
00B372: 45f900ffa000     lea.l      $ffa000.l, a2
00B378: 3e3900ff0422     move.w     $ff0422.l, d7
00B37E: 5347             subq.w     #$1, d7
00B380: 7000             moveq      #$0, d0
00B382: 1018             move.b     (a0)+, d0
00B384: 5340             subq.w     #$1, d0
00B386: e540             asl.w      #$2, d0
00B388: 22320000         move.l     (a2, d0.w), d1
00B38C: 22c1             move.l     d1, (a1)+
00B38E: 51cffff0         dbra       d7, $b380
00B392: 41f900ff0460     lea.l      $ff0460.l, a0
00B398: 45f900ff4010     lea.l      $ff4010.l, a2
00B39E: 4df900ff1000     lea.l      $ff1000.l, a6
00B3A4: 3e3900ff0422     move.w     $ff0422.l, d7
00B3AA: 5347             subq.w     #$1, d7
00B3AC: 7000             moveq      #$0, d0
00B3AE: 101a             move.b     (a2)+, d0
00B3B0: 5340             subq.w     #$1, d0
00B3B2: 10300000         move.b     (a0, d0.w), d0
00B3B6: 3d40007e         move.w     d0, $7e(a6)
00B3BA: e940             asl.w      #$4, d0
00B3BC: 47ee0260         lea.l      $260(a6), a3
00B3C0: d7c0             adda.l     d0, a3
00B3C2: 2d4b0006         move.l     a3, $6(a6)
00B3C6: 2d4b0084         move.l     a3, $84(a6)
00B3CA: 4dee0400         lea.l      $400(a6), a6
00B3CE: 51cfffdc         dbra       d7, $b3ac
00B3D2: 41fa03ce         lea.l      $b7a2(pc), a0
00B3D6: 7e09             moveq      #$9, d7
00B3D8: 007c0700         ori.w      #$700, sr
00B3DC: 3f07             move.w     d7, -(a7)
00B3DE: 2018             move.l     (a0)+, d0
00B3E0: 2218             move.l     (a0)+, d1
00B3E2: 2418             move.l     (a0)+, d2
00B3E4: 7600             moveq      #$0, d3
00B3E6: 3618             move.w     (a0)+, d3
00B3E8: 2f08             move.l     a0, -(a7)
00B3EA: 4eb900003980     jsr        $3980.l
00B3F0: 205f             movea.l    (a7)+, a0
00B3F2: 3e1f             move.w     (a7)+, d7
00B3F4: 51cfffe6         dbra       d7, $b3dc
00B3F8: 027cf8ff         andi.w     #$f8ff, sr
00B3FC: 3e3900ff0422     move.w     $ff0422.l, d7
00B402: 5347             subq.w     #$1, d7
00B404: 4df900ff1000     lea.l      $ff1000.l, a6
00B40A: 41fa0186         lea.l      $b592(pc), a0
00B40E: 2d4800b4         move.l     a0, $b4(a6)
00B412: 422e00b8         clr.b      $b8(a6)
00B416: 422e00b9         clr.b      $b9(a6)
00B41A: 1d7c000c00ba     move.b     #$c, $ba(a6)
00B420: 6100012c         bsr.w      $b54e
00B424: 4dee0400         lea.l      $400(a6), a6
00B428: 51cfffe0         dbra       d7, $b40a
00B42C: 4eb900000ee2     jsr        $ee2.l
00B432: 4eb9000099d0     jsr        $99d0.l
00B438: 3e3900ff0422     move.w     $ff0422.l, d7
00B43E: 5347             subq.w     #$1, d7
00B440: 4df900ff1000     lea.l      $ff1000.l, a6
00B446: 6100003e         bsr.w      $b486
00B44A: 4dee0400         lea.l      $400(a6), a6
00B44E: 51cffff6         dbra       d7, $b446
00B452: 4eb900000ee2     jsr        $ee2.l
00B458: 3e3900ff0422     move.w     $ff0422.l, d7
00B45E: 5347             subq.w     #$1, d7
00B460: 7000             moveq      #$0, d0
00B462: 4df900ff1000     lea.l      $ff1000.l, a6
00B468: 0c2e000400b8     cmpi.b     #$4, $b8(a6)
00B46E: 66000004         bne.w      $b474
00B472: 5240             addq.w     #$1, d0
00B474: 4dee0400         lea.l      $400(a6), a6
00B478: 51cfffee         dbra       d7, $b468
00B47C: b07900ff0422     cmp.w      $ff0422.l, d0
00B482: 66ae             bne.b      $b432
00B484: 4e75             rts        

; ==== sub_00B486 зовут=1 ====
00B486: 0c2e000400b8     cmpi.b     #$4, $b8(a6)
00B48C: 66000004         bne.w      $b492
00B490: 4e75             rts        
00B492: 082e00070041     btst.b     #$7, $41(a6)
00B498: 6700001e         beq.w      $b4b8
00B49C: 1d7c000400b8     move.b     #$4, $b8(a6)
00B4A2: 08ee000000a7     bset.b     #$0, $a7(a6)
00B4A8: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00B4AC: 4eb90000bb28     jsr        $bb28.l
00B4B2: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00B4B6: 4e75             rts        
00B4B8: 4a2e00b8         tst.b      $b8(a6)
00B4BC: 66000064         bne.w      $b522
00B4C0: 082e00060041     btst.b     #$6, $41(a6)
00B4C6: 67000018         beq.w      $b4e0
00B4CA: 1d7c000100b8     move.b     #$1, $b8(a6)
00B4D0: 422e00b9         clr.b      $b9(a6)
00B4D4: 41fa00c8         lea.l      $b59e(pc), a0
00B4D8: 2d4800b4         move.l     a0, $b4(a6)
00B4DC: 60000070         bra.w      $b54e
00B4E0: 082e00040041     btst.b     #$4, $41(a6)
00B4E6: 67000018         beq.w      $b500
00B4EA: 1d7c000200b8     move.b     #$2, $b8(a6)
00B4F0: 422e00b9         clr.b      $b9(a6)
00B4F4: 41fa00b4         lea.l      $b5aa(pc), a0
00B4F8: 2d4800b4         move.l     a0, $b4(a6)
00B4FC: 60000050         bra.w      $b54e
00B500: 082e00050041     btst.b     #$5, $41(a6)
00B506: 67000018         beq.w      $b520
00B50A: 1d7c000200b8     move.b     #$2, $b8(a6)
00B510: 422e00b9         clr.b      $b9(a6)
00B514: 41fa00a0         lea.l      $b5b6(pc), a0
00B518: 2d4800b4         move.l     a0, $b4(a6)
00B51C: 60000030         bra.w      $b54e
00B520: 4e75             rts        
00B522: 532e00ba         subq.b     #$1, $ba(a6)
00B526: 66000026         bne.w      $b54e
00B52A: 1d7c000c00ba     move.b     #$c, $ba(a6)
00B530: 522e00b9         addq.b     #$1, $b9(a6)
00B534: 0c2e000300b9     cmpi.b     #$3, $b9(a6)
00B53A: 66000012         bne.w      $b54e
00B53E: 422e00b8         clr.b      $b8(a6)
00B542: 422e00b9         clr.b      $b9(a6)
00B546: 41fa004a         lea.l      $b592(pc), a0
00B54A: 2d4800b4         move.l     a0, $b4(a6)

; ==== sub_00B54E зовут=1 ====
00B54E: 206e00b4         movea.l    $b4(a6), a0
00B552: 7000             moveq      #$0, d0
00B554: 102e00b9         move.b     $b9(a6), d0
00B558: e540             asl.w      #$2, d0
00B55A: 20700000         movea.l    (a0, d0.w), a0
00B55E: 226e000a         movea.l    $a(a6), a1
00B562: 43e90382         lea.l      $382(a1), a1
00B566: 3f07             move.w     d7, -(a7)
00B568: 7e03             moveq      #$3, d7
00B56A: 7c05             moveq      #$5, d6
00B56C: 4eb900010fdc     jsr        $10fdc.l
00B572: 3e1f             move.w     (a7)+, d7
00B574: 4e75             rts        

; ---- ДАННЫЕ $00B576..$00B82E (696 байт) ----


; ==== sub_00B82E зовут=1 ====
00B82E: 206e000a         movea.l    $a(a6), a0
00B832: 700c             moveq      #$c, d0
00B834: 4290             clr.l      (a0)
00B836: 42a80004         clr.l      $4(a0)
00B83A: 42a80008         clr.l      $8(a0)
00B83E: 41e80080         lea.l      $80(a0), a0
00B842: 51c8fff0         dbra       d0, $b834
00B846: 4e75             rts        

; ==== sub_00B848 зовут=2 ====
00B848: 41f900ff4010     lea.l      $ff4010.l, a0
00B84E: 43f900ff868c     lea.l      $ff868c.l, a1
00B854: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00B85C: 67000008         beq.w      $b866
00B860: 43f900ff8688     lea.l      $ff8688.l, a1
00B866: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
00B870: 2f08             move.l     a0, -(a7)
00B872: 2f09             move.l     a1, -(a7)
00B874: 7000             moveq      #$0, d0
00B876: 1010             move.b     (a0), d0
00B878: e540             asl.w      #$2, d0
00B87A: 06400030         addi.w     #$30, d0
00B87E: 00404000         ori.w      #$4000, d0
00B882: 3280             move.w     d0, (a1)
00B884: 5240             addq.w     #$1, d0
00B886: 33400080         move.w     d0, $80(a1)
00B88A: 5240             addq.w     #$1, d0
00B88C: 33400002         move.w     d0, $2(a1)
00B890: 5240             addq.w     #$1, d0
00B892: 33400082         move.w     d0, $82(a1)
00B896: 225f             movea.l    (a7)+, a1
00B898: 205f             movea.l    (a7)+, a0
00B89A: 5248             addq.w     #$1, a0
00B89C: 43e90010         lea.l      $10(a1), a1
00B8A0: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00B8A8: 67000006         beq.w      $b8b0
00B8AC: 43e9fffe         lea.l      -$2(a1), a1
00B8B0: 537900ff0424     subq.w     #$1, $ff0424.l
00B8B6: 66b8             bne.b      $b870
00B8B8: 4e75             rts        

; ==== sub_00B8BA зовут=1 ====
00B8BA: 537900ff0500     subq.w     #$1, $ff0500.l
00B8C0: 67000004         beq.w      $b8c6
00B8C4: 4e75             rts        
00B8C6: 1e3c00b3         move.b     #$b3, d7
00B8CA: 4eb900003d7a     jsr        $3d7a.l
00B8D0: 527900ff0502     addq.w     #$1, $ff0502.l
00B8D6: 7000             moveq      #$0, d0
00B8D8: 303900ff0502     move.w     $ff0502.l, d0
00B8DE: 41fa00cc         lea.l      $b9ac(pc), a0
00B8E2: 10300000         move.b     (a0, d0.w), d0
00B8E6: 33c000ff0500     move.w     d0, $ff0500.l
00B8EC: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00B8F4: 670000d8         beq.w      $b9ce
00B8F8: 4eb900000368     jsr        $368.l
00B8FE: 303900ffef90     move.w     $ffef90.l, d0
00B904: 028000000007     andi.l     #$7, d0
00B90A: b03900ff0508     cmp.b      $ff0508.l, d0
00B910: 66000008         bne.w      $b91a
00B914: 5240             addq.w     #$1, d0
00B916: 02400007         andi.w     #$7, d0
00B91A: 13c000ff0508     move.b     d0, $ff0508.l
00B920: 41fa006a         lea.l      $b98c(pc), a0
00B924: 10300000         move.b     (a0, d0.w), d0
00B928: 41fa006a         lea.l      $b994(pc), a0
00B92C: d1c0             adda.l     d0, a0
00B92E: 4eb900000368     jsr        $368.l
00B934: 303900ffef90     move.w     $ffef90.l, d0
00B93A: 02400003         andi.w     #$3, d0
00B93E: 43f900ff4010     lea.l      $ff4010.l, a1
00B944: 7203             moveq      #$3, d1
00B946: 14300000         move.b     (a0, d0.w), d2
00B94A: 12c2             move.b     d2, (a1)+
00B94C: 5240             addq.w     #$1, d0
00B94E: 02400003         andi.w     #$3, d0
00B952: 51c9fff2         dbra       d1, $b946
00B956: 0c79002000ff0502 cmpi.w     #$20, $ff0502.l
00B95E: 6600002a         bne.w      $b98a
00B962: 203900ff4010     move.l     $ff4010.l, d0
00B968: b0b900ff4030     cmp.l      $ff4030.l, d0
00B96E: 6600001a         bne.w      $b98a
00B972: 103900ff4010     move.b     $ff4010.l, d0
00B978: 123900ff4012     move.b     $ff4012.l, d1
00B97E: 13c100ff4010     move.b     d1, $ff4010.l
00B984: 13c000ff4012     move.b     d0, $ff4012.l
00B98A: 4e75             rts        

; ---- ДАННЫЕ $00B98C..$00B9CE (66 байт) ----

00B9CE: 4eb900000368     jsr        $368.l
00B9D4: 303900ffef90     move.w     $ffef90.l, d0
00B9DA: 02400003         andi.w     #$3, d0
00B9DE: 67000016         beq.w      $b9f6
00B9E2: 0c400001         cmpi.w     #$1, d0
00B9E6: 6700004e         beq.w      $ba36
00B9EA: 0c400002         cmpi.w     #$2, d0
00B9EE: 67000086         beq.w      $ba76
00B9F2: 600000c2         bra.w      $bab6
00B9F6: 103900ff4010     move.b     $ff4010.l, d0
00B9FC: 123900ff4011     move.b     $ff4011.l, d1
00BA02: 13c100ff4010     move.b     d1, $ff4010.l
00BA08: 13c000ff4011     move.b     d0, $ff4011.l
00BA0E: 103900ff4012     move.b     $ff4012.l, d0
00BA14: 123900ff4013     move.b     $ff4013.l, d1
00BA1A: 143900ff4014     move.b     $ff4014.l, d2
00BA20: 13c200ff4012     move.b     d2, $ff4012.l
00BA26: 13c000ff4013     move.b     d0, $ff4013.l
00BA2C: 13c100ff4014     move.b     d1, $ff4014.l
00BA32: 600000be         bra.w      $baf2
00BA36: 103900ff4011     move.b     $ff4011.l, d0
00BA3C: 123900ff4013     move.b     $ff4013.l, d1
00BA42: 13c100ff4011     move.b     d1, $ff4011.l
00BA48: 13c000ff4013     move.b     d0, $ff4013.l
00BA4E: 103900ff4010     move.b     $ff4010.l, d0
00BA54: 123900ff4012     move.b     $ff4012.l, d1
00BA5A: 143900ff4014     move.b     $ff4014.l, d2
00BA60: 13c200ff4010     move.b     d2, $ff4010.l
00BA66: 13c000ff4012     move.b     d0, $ff4012.l
00BA6C: 13c100ff4014     move.b     d1, $ff4014.l
00BA72: 6000007e         bra.w      $baf2
00BA76: 103900ff4013     move.b     $ff4013.l, d0
00BA7C: 123900ff4014     move.b     $ff4014.l, d1
00BA82: 13c100ff4013     move.b     d1, $ff4013.l
00BA88: 13c000ff4014     move.b     d0, $ff4014.l
00BA8E: 103900ff4010     move.b     $ff4010.l, d0
00BA94: 123900ff4011     move.b     $ff4011.l, d1
00BA9A: 143900ff4012     move.b     $ff4012.l, d2
00BAA0: 13c200ff4010     move.b     d2, $ff4010.l
00BAA6: 13c000ff4011     move.b     d0, $ff4011.l
00BAAC: 13c100ff4012     move.b     d1, $ff4012.l
00BAB2: 6000003e         bra.w      $baf2
00BAB6: 103900ff4010     move.b     $ff4010.l, d0
00BABC: 123900ff4014     move.b     $ff4014.l, d1
00BAC2: 13c100ff4010     move.b     d1, $ff4010.l
00BAC8: 13c000ff4014     move.b     d0, $ff4014.l
00BACE: 103900ff4011     move.b     $ff4011.l, d0
00BAD4: 123900ff4012     move.b     $ff4012.l, d1
00BADA: 143900ff4013     move.b     $ff4013.l, d2
00BAE0: 13c200ff4011     move.b     d2, $ff4011.l
00BAE6: 13c000ff4012     move.b     d0, $ff4012.l
00BAEC: 13c100ff4013     move.b     d1, $ff4013.l
00BAF2: 0c79002000ff0502 cmpi.w     #$20, $ff0502.l
00BAFA: 6600002a         bne.w      $bb26
00BAFE: 203900ff4010     move.l     $ff4010.l, d0
00BB04: b0b900ff4030     cmp.l      $ff4030.l, d0
00BB0A: 6600001a         bne.w      $bb26
00BB0E: 103900ff4011     move.b     $ff4011.l, d0
00BB14: 123900ff4013     move.b     $ff4013.l, d1
00BB1A: 13c100ff4011     move.b     d1, $ff4011.l
00BB20: 13c000ff4013     move.b     d0, $ff4013.l
00BB26: 4e75             rts        

; ==== sub_00BB28 зовут=4 ====
00BB28: 426e009a         clr.w      $9a(a6)
00BB2C: 422e00e0         clr.b      $e0(a6)
00BB30: 0a2e00010099     eori.b     #$1, $99(a6)
00BB36: 4a6e0002         tst.w      $2(a6)
00BB3A: 67000008         beq.w      $bb44
00BB3E: 4ef90000c360     jmp        $c360.l
00BB44: 08ae000100a7     bclr.b     #$1, $a7(a6)
00BB4A: 67000010         beq.w      $bb5c
00BB4E: 1d7c00010098     move.b     #$1, $98(a6)
00BB54: 61000064         bsr.w      $bbba
00BB58: 60000430         bra.w      $bf8a
00BB5C: 4a6e00f6         tst.w      $f6(a6)
00BB60: 6600045e         bne.w      $bfc0
00BB64: 08ae000000a7     bclr.b     #$0, $a7(a6)
00BB6A: 6700000c         beq.w      $bb78
00BB6E: 1d7c00010098     move.b     #$1, $98(a6)
00BB74: 60000044         bra.w      $bbba
00BB78: 0c6e0010004c     cmpi.w     #$10, $4c(a6)
00BB7E: 67000006         beq.w      $bb86
00BB82: 60000036         bra.w      $bbba
00BB86: 1d7c000100e0     move.b     #$1, $e0(a6)
00BB8C: 082e00000099     btst.b     #$0, $99(a6)
00BB92: 67000010         beq.w      $bba4
00BB96: 206e0006         movea.l    $6(a6), a0
00BB9A: 226e000a         movea.l    $a(a6), a1
00BB9E: 7c05             moveq      #$5, d6
00BBA0: 6000002c         bra.w      $bbce
00BBA4: 206e0006         movea.l    $6(a6), a0
00BBA8: 41e80060         lea.l      $60(a0), a0
00BBAC: 226e000a         movea.l    $a(a6), a1
00BBB0: 43e90600         lea.l      $600(a1), a1
00BBB4: 7c06             moveq      #$6, d6
00BBB6: 60000016         bra.w      $bbce

; ==== sub_00BBBA зовут=1 ====
00BBBA: 206e0006         movea.l    $6(a6), a0
00BBBE: 226e000a         movea.l    $a(a6), a1
00BBC2: 4a2e0098         tst.b      $98(a6)
00BBC6: 67000244         beq.w      $be0c
00BBCA: 7c0c             moveq      #$c, d6
00BBCC: 7a00             moveq      #$0, d5
00BBCE: 3e2e0004         move.w     $4(a6), d7
00BBD2: 48e700c0         movem.l    a0-a1, -(a7)
00BBD6: 10280001         move.b     $1(a0), d0
00BBDA: 6a000044         bpl.w      $bc20
00BBDE: 082e000000e0     btst.b     #$0, $e0(a6)
00BBE4: 66000046         bne.w      $bc2c
00BBE8: 45fa0054         lea.l      $bc3e(pc), a2
00BBEC: 4a7900ff0418     tst.w      $ff0418.l
00BBF2: 66000006         bne.w      $bbfa
00BBF6: 45fa00a6         lea.l      $bc9e(pc), a2
00BBFA: 47ea0018         lea.l      $18(a2), a3
00BBFE: 0a6e0001009a     eori.w     #$1, $9a(a6)
00BC04: 6600000a         bne.w      $bc10
00BC08: 45ea0030         lea.l      $30(a2), a2
00BC0C: 47eb0030         lea.l      $30(a3), a3
00BC10: 49e90080         lea.l      $80(a1), a4
00BC14: 22da             move.l     (a2)+, (a1)+
00BC16: 28db             move.l     (a3)+, (a4)+
00BC18: 51cffffa         dbra       d7, $bc14
00BC1C: 6000000e         bra.w      $bc2c
00BC20: 610000dc         bsr.w      $bcfe
00BC24: 5448             addq.w     #$2, a0
00BC26: 5849             addq.w     #$4, a1
00BC28: 51cfffac         dbra       d7, $bbd6
00BC2C: 4cdf0300         movem.l    (a7)+, a0-a1
00BC30: 41e80010         lea.l      $10(a0), a0
00BC34: 43e90100         lea.l      $100(a1), a1
00BC38: 51ceff94         dbra       d6, $bbce
00BC3C: 4e75             rts        

; ---- ДАННЫЕ $00BC3E..$00BCFE (192 байт) ----


; ==== sub_00BCFE зовут=1 ====
00BCFE: 0c79002400ff0406 cmpi.w     #$24, $ff0406.l
00BD06: 66000014         bne.w      $bd1c
00BD0A: 237c000400040000 move.l     #$40004, $0(a1)
00BD12: 237c000400040080 move.l     #$40004, $80(a1)
00BD1A: 4e75             rts        
00BD1C: 08900000         bclr.b     #$0, (a0)
00BD20: 67000014         beq.w      $bd36
00BD24: 48e70040         movem.l    a1, -(a7)
00BD28: 92fc0080         suba.w     #$80, a1
00BD2C: 61000008         bsr.w      $bd36
00BD30: 4cdf0200         movem.l    (a7)+, a1
00BD34: 4e75             rts        

; ==== sub_00BD36 зовут=1 ====
00BD36: 7000             moveq      #$0, d0
00BD38: 10280001         move.b     $1(a0), d0
00BD3C: 6600000a         bne.w      $bd48
00BD40: 4291             clr.l      (a1)
00BD42: 42a90080         clr.l      $80(a1)
00BD46: 4e75             rts        
00BD48: 363c2000         move.w     #$2000, d3
00BD4C: 0c000007         cmpi.b     #$7, d0
00BD50: 6d00000c         blt.w      $bd5e
00BD54: 0c6e0020006a     cmpi.w     #$20, $6a(a6)
00BD5A: 6d000012         blt.w      $bd6e
00BD5E: 363c6000         move.w     #$6000, d3
00BD62: 4a6e00f8         tst.w      $f8(a6)
00BD66: 66000006         bne.w      $bd6e
00BD6A: 363c4000         move.w     #$4000, d3
00BD6E: e940             asl.w      #$4, d0
00BD70: 45f90000c914     lea.l      $c914.l, a2
00BD76: d5c0             adda.l     d0, a2
00BD78: 08100007         btst.b     #$7, (a0)
00BD7C: 6600003c         bne.w      $bdba
00BD80: 08100006         btst.b     #$6, (a0)
00BD84: 6600000e         bne.w      $bd94
00BD88: 08100005         btst.b     #$5, (a0)
00BD8C: 67000010         beq.w      $bd9e
00BD90: 45ea0090         lea.l      $90(a2), a2
00BD94: 7200             moveq      #$0, d1
00BD96: 122e0092         move.b     $92(a6), d1
00BD9A: e341             asl.w      #$1, d1
00BD9C: d5c1             adda.l     d1, a2
00BD9E: 3012             move.w     (a2), d0
00BDA0: 8043             or.w       d3, d0
00BDA2: 33400000         move.w     d0, $0(a1)
00BDA6: 5440             addq.w     #$2, d0
00BDA8: 33400002         move.w     d0, $2(a1)
00BDAC: 5340             subq.w     #$1, d0
00BDAE: 33400080         move.w     d0, $80(a1)
00BDB2: 5440             addq.w     #$2, d0
00BDB4: 33400082         move.w     d0, $82(a1)
00BDB8: 4e75             rts        
00BDBA: 7400             moveq      #$0, d2
00BDBC: 342e006a         move.w     $6a(a6), d2
00BDC0: 47fa0190         lea.l      $bf52(pc), a3
00BDC4: 14332000         move.b     (a3, d2.w), d2
00BDC8: 6700ff76         beq.w      $bd40
00BDCC: 6a00000c         bpl.w      $bdda
00BDD0: 4250             clr.w      (a0)
00BDD2: 4291             clr.l      (a1)
00BDD4: 42a90080         clr.l      $80(a1)
00BDD8: 4e75             rts        
00BDDA: 0c020001         cmpi.b     #$1, d2
00BDDE: 67be             beq.b      $bd9e
00BDE0: 47fa0128         lea.l      $bf0a(pc), a3
00BDE4: 5542             subq.w     #$2, d2
00BDE6: e742             asl.w      #$3, d2
00BDE8: d7c2             adda.l     d2, a3
00BDEA: 321b             move.w     (a3)+, d1
00BDEC: 8243             or.w       d3, d1
00BDEE: 33410000         move.w     d1, $0(a1)
00BDF2: 321b             move.w     (a3)+, d1
00BDF4: 8243             or.w       d3, d1
00BDF6: 33410002         move.w     d1, $2(a1)
00BDFA: 321b             move.w     (a3)+, d1
00BDFC: 8243             or.w       d3, d1
00BDFE: 33410080         move.w     d1, $80(a1)
00BE02: 321b             move.w     (a3)+, d1
00BE04: 8243             or.w       d3, d1
00BE06: 33410082         move.w     d1, $82(a1)
00BE0A: 4e75             rts        
00BE0C: 6100007a         bsr.w      $be88
00BE10: 7000             moveq      #$0, d0
00BE12: 206e0006         movea.l    $6(a6), a0
00BE16: 226e000a         movea.l    $a(a6), a1
00BE1A: 302e0096         move.w     $96(a6), d0
00BE1E: e340             asl.w      #$1, d0
00BE20: d1c0             adda.l     d0, a0
00BE22: e340             asl.w      #$1, d0
00BE24: d3c0             adda.l     d0, a1
00BE26: 3010             move.w     (a0), d0
00BE28: 0c0000ff         cmpi.b     #$ff, d0
00BE2C: 67000058         beq.w      $be86
00BE30: 0800000e         btst.b     #$e, d0
00BE34: 6600000c         bne.w      $be42
00BE38: 41e80010         lea.l      $10(a0), a0
00BE3C: 43e90100         lea.l      $100(a1), a1
00BE40: 60e4             bra.b      $be26
00BE42: 363c6000         move.w     #$6000, d3
00BE46: 4a6e00f8         tst.w      $f8(a6)
00BE4A: 66000006         bne.w      $be52
00BE4E: 363c4000         move.w     #$4000, d3
00BE52: 0280000000ff     andi.l     #$ff, d0
00BE58: e940             asl.w      #$4, d0
00BE5A: 45f90000c914     lea.l      $c914.l, a2
00BE60: 7200             moveq      #$0, d1
00BE62: 122e0092         move.b     $92(a6), d1
00BE66: e341             asl.w      #$1, d1
00BE68: d041             add.w      d1, d0
00BE6A: d5c0             adda.l     d0, a2
00BE6C: 3012             move.w     (a2), d0
00BE6E: 8043             or.w       d3, d0
00BE70: 33400000         move.w     d0, $0(a1)
00BE74: 5440             addq.w     #$2, d0
00BE76: 33400002         move.w     d0, $2(a1)
00BE7A: 5340             subq.w     #$1, d0
00BE7C: 33400080         move.w     d0, $80(a1)
00BE80: 5440             addq.w     #$2, d0
00BE82: 33400082         move.w     d0, $82(a1)
00BE86: 4e75             rts        

; ==== sub_00BE88 зовут=1 ====
00BE88: 0c2e000200a6     cmpi.b     #$2, $a6(a6)
00BE8E: 66000078         bne.w      $bf08
00BE92: 7000             moveq      #$0, d0
00BE94: 206e0006         movea.l    $6(a6), a0
00BE98: 226e000a         movea.l    $a(a6), a1
00BE9C: 302e00a4         move.w     $a4(a6), d0
00BEA0: e340             asl.w      #$1, d0
00BEA2: d1c0             adda.l     d0, a0
00BEA4: e340             asl.w      #$1, d0
00BEA6: d3c0             adda.l     d0, a1
00BEA8: 3010             move.w     (a0), d0
00BEAA: 0c0000ff         cmpi.b     #$ff, d0
00BEAE: 67000058         beq.w      $bf08
00BEB2: 0800000d         btst.b     #$d, d0
00BEB6: 6600000c         bne.w      $bec4
00BEBA: 41e80010         lea.l      $10(a0), a0
00BEBE: 43e90100         lea.l      $100(a1), a1
00BEC2: 60e4             bra.b      $bea8
00BEC4: 363c6000         move.w     #$6000, d3
00BEC8: 4a6e00f8         tst.w      $f8(a6)
00BECC: 66000006         bne.w      $bed4
00BED0: 363c4000         move.w     #$4000, d3
00BED4: 0280000000ff     andi.l     #$ff, d0
00BEDA: e940             asl.w      #$4, d0
00BEDC: 45f90000c9a4     lea.l      $c9a4.l, a2
00BEE2: 7200             moveq      #$0, d1
00BEE4: 122e0092         move.b     $92(a6), d1
00BEE8: e341             asl.w      #$1, d1
00BEEA: d041             add.w      d1, d0
00BEEC: d5c0             adda.l     d0, a2
00BEEE: 3012             move.w     (a2), d0
00BEF0: 8043             or.w       d3, d0
00BEF2: 33400000         move.w     d0, $0(a1)
00BEF6: 5440             addq.w     #$2, d0
00BEF8: 33400002         move.w     d0, $2(a1)
00BEFC: 5340             subq.w     #$1, d0
00BEFE: 33400080         move.w     d0, $80(a1)
00BF02: 5440             addq.w     #$2, d0
00BF04: 33400082         move.w     d0, $82(a1)
00BF08: 4e75             rts        

; ---- ДАННЫЕ $00BF0A..$00BF8A (128 байт) ----

00BF8A: 206e000a         movea.l    $a(a6), a0
00BF8E: 2248             movea.l    a0, a1
00BF90: 43e90080         lea.l      $80(a1), a1
00BF94: 203cc004c004     move.l     #$c004c004, d0
00BF9A: 323c000c         move.w     #$c, d1
00BF9E: 342e0004         move.w     $4(a6), d2
00BFA2: 2448             movea.l    a0, a2
00BFA4: 2649             movea.l    a1, a3
00BFA6: 20c0             move.l     d0, (a0)+
00BFA8: 22c0             move.l     d0, (a1)+
00BFAA: 51cafffa         dbra       d2, $bfa6
00BFAE: 204a             movea.l    a2, a0
00BFB0: 224b             movea.l    a3, a1
00BFB2: 41e80100         lea.l      $100(a0), a0
00BFB6: 43e90100         lea.l      $100(a1), a1
00BFBA: 51c9ffe2         dbra       d1, $bf9e
00BFBE: 4e75             rts        
00BFC0: 08ae000000a7     bclr.b     #$0, $a7(a6)
00BFC6: 6700000c         beq.w      $bfd4
00BFCA: 1d7c00010098     move.b     #$1, $98(a6)
00BFD0: 60000048         bra.w      $c01a
00BFD4: 0c6e0010004c     cmpi.w     #$10, $4c(a6)
00BFDA: 67000006         beq.w      $bfe2
00BFDE: 6000003a         bra.w      $c01a
00BFE2: 1d7c000100e0     move.b     #$1, $e0(a6)
00BFE8: 082e00000099     btst.b     #$0, $99(a6)
00BFEE: 67000014         beq.w      $c004
00BFF2: 206e0006         movea.l    $6(a6), a0
00BFF6: 226e000a         movea.l    $a(a6), a1
00BFFA: 43e90c80         lea.l      $c80(a1), a1
00BFFE: 7c05             moveq      #$5, d6
00C000: 60000030         bra.w      $c032
00C004: 206e0006         movea.l    $6(a6), a0
00C008: 41e80060         lea.l      $60(a0), a0
00C00C: 226e000a         movea.l    $a(a6), a1
00C010: 43e90680         lea.l      $680(a1), a1
00C014: 7c06             moveq      #$6, d6
00C016: 6000001a         bra.w      $c032
00C01A: 206e0006         movea.l    $6(a6), a0
00C01E: 226e000a         movea.l    $a(a6), a1
00C022: 43e90c80         lea.l      $c80(a1), a1
00C026: 4a2e0098         tst.b      $98(a6)
00C02A: 6700022a         beq.w      $c256
00C02E: 7c0c             moveq      #$c, d6
00C030: 7a00             moveq      #$0, d5
00C032: 3e2e0004         move.w     $4(a6), d7
00C036: 48e700c0         movem.l    a0-a1, -(a7)
00C03A: 10280001         move.b     $1(a0), d0
00C03E: 6a000044         bpl.w      $c084
00C042: 082e000000e0     btst.b     #$0, $e0(a6)
00C048: 66000046         bne.w      $c090
00C04C: 45fa0054         lea.l      $c0a2(pc), a2
00C050: 4a7900ff0418     tst.w      $ff0418.l
00C056: 66000006         bne.w      $c05e
00C05A: 45fa00a6         lea.l      $c102(pc), a2
00C05E: 47ea0018         lea.l      $18(a2), a3
00C062: 0a6e0001009a     eori.w     #$1, $9a(a6)
00C068: 6600000a         bne.w      $c074
00C06C: 45ea0030         lea.l      $30(a2), a2
00C070: 47eb0030         lea.l      $30(a3), a3
00C074: 49e9ff80         lea.l      -$80(a1), a4
00C078: 22da             move.l     (a2)+, (a1)+
00C07A: 28db             move.l     (a3)+, (a4)+
00C07C: 51cffffa         dbra       d7, $c078
00C080: 6000000e         bra.w      $c090
00C084: 610000dc         bsr.w      $c162
00C088: 5448             addq.w     #$2, a0
00C08A: 5849             addq.w     #$4, a1
00C08C: 51cfffac         dbra       d7, $c03a
00C090: 4cdf0300         movem.l    (a7)+, a0-a1
00C094: 41e80010         lea.l      $10(a0), a0
00C098: 43e9ff00         lea.l      -$100(a1), a1
00C09C: 51ceff94         dbra       d6, $c032
00C0A0: 4e75             rts        

; ---- ДАННЫЕ $00C0A2..$00C162 (192 байт) ----


; ==== sub_00C162 зовут=1 ====
00C162: 08900000         bclr.b     #$0, (a0)
00C166: 67000014         beq.w      $c17c
00C16A: 48e70040         movem.l    a1, -(a7)
00C16E: d2fc0080         adda.w     #$80, a1
00C172: 61000008         bsr.w      $c17c
00C176: 4cdf0200         movem.l    (a7)+, a1
00C17A: 4e75             rts        

; ==== sub_00C17C зовут=1 ====
00C17C: 7000             moveq      #$0, d0
00C17E: 10280001         move.b     $1(a0), d0
00C182: 6600000a         bne.w      $c18e
00C186: 4291             clr.l      (a1)
00C188: 42a9ff80         clr.l      -$80(a1)
00C18C: 4e75             rts        
00C18E: 363c2000         move.w     #$2000, d3
00C192: 0c000007         cmpi.b     #$7, d0
00C196: 6d00000c         blt.w      $c1a4
00C19A: 0c6e0020006a     cmpi.w     #$20, $6a(a6)
00C1A0: 6d000012         blt.w      $c1b4
00C1A4: 363c6000         move.w     #$6000, d3
00C1A8: 4a6e00f8         tst.w      $f8(a6)
00C1AC: 66000006         bne.w      $c1b4
00C1B0: 363c4000         move.w     #$4000, d3
00C1B4: e940             asl.w      #$4, d0
00C1B6: 45f90000c914     lea.l      $c914.l, a2
00C1BC: d5c0             adda.l     d0, a2
00C1BE: 08100007         btst.b     #$7, (a0)
00C1C2: 6600003e         bne.w      $c202
00C1C6: 08100006         btst.b     #$6, (a0)
00C1CA: 6600000e         bne.w      $c1da
00C1CE: 08100005         btst.b     #$5, (a0)
00C1D2: 67000010         beq.w      $c1e4
00C1D6: 45ea0090         lea.l      $90(a2), a2
00C1DA: 7200             moveq      #$0, d1
00C1DC: 122e0092         move.b     $92(a6), d1
00C1E0: e341             asl.w      #$1, d1
00C1E2: d5c1             adda.l     d1, a2
00C1E4: 3012             move.w     (a2), d0
00C1E6: 00431000         ori.w      #$1000, d3
00C1EA: 8043             or.w       d3, d0
00C1EC: 3280             move.w     d0, (a1)
00C1EE: 5440             addq.w     #$2, d0
00C1F0: 33400002         move.w     d0, $2(a1)
00C1F4: 5340             subq.w     #$1, d0
00C1F6: 3340ff80         move.w     d0, -$80(a1)
00C1FA: 5440             addq.w     #$2, d0
00C1FC: 3340ff82         move.w     d0, -$7e(a1)
00C200: 4e75             rts        
00C202: 7400             moveq      #$0, d2
00C204: 342e006a         move.w     $6a(a6), d2
00C208: 47fafd48         lea.l      $bf52(pc), a3
00C20C: 14332000         move.b     (a3, d2.w), d2
00C210: 6700ff74         beq.w      $c186
00C214: 6a00000c         bpl.w      $c222
00C218: 4250             clr.w      (a0)
00C21A: 4291             clr.l      (a1)
00C21C: 42a9ff80         clr.l      -$80(a1)
00C220: 4e75             rts        
00C222: 0c020001         cmpi.b     #$1, d2
00C226: 67bc             beq.b      $c1e4
00C228: 00431000         ori.w      #$1000, d3
00C22C: 47fafcdc         lea.l      $bf0a(pc), a3
00C230: 5542             subq.w     #$2, d2
00C232: e742             asl.w      #$3, d2
00C234: d7c2             adda.l     d2, a3
00C236: 321b             move.w     (a3)+, d1
00C238: 8243             or.w       d3, d1
00C23A: 3281             move.w     d1, (a1)
00C23C: 321b             move.w     (a3)+, d1
00C23E: 8243             or.w       d3, d1
00C240: 33410002         move.w     d1, $2(a1)
00C244: 321b             move.w     (a3)+, d1
00C246: 8243             or.w       d3, d1
00C248: 3341ff80         move.w     d1, -$80(a1)
00C24C: 321b             move.w     (a3)+, d1
00C24E: 8243             or.w       d3, d1
00C250: 3341ff82         move.w     d1, -$7e(a1)
00C254: 4e75             rts        
00C256: 61000080         bsr.w      $c2d8
00C25A: 7000             moveq      #$0, d0
00C25C: 206e0006         movea.l    $6(a6), a0
00C260: 226e000a         movea.l    $a(a6), a1
00C264: 43e90c80         lea.l      $c80(a1), a1
00C268: 302e0096         move.w     $96(a6), d0
00C26C: e340             asl.w      #$1, d0
00C26E: d1c0             adda.l     d0, a0
00C270: e340             asl.w      #$1, d0
00C272: d3c0             adda.l     d0, a1
00C274: 3010             move.w     (a0), d0
00C276: 0c0000ff         cmpi.b     #$ff, d0
00C27A: 6700005a         beq.w      $c2d6
00C27E: 0800000e         btst.b     #$e, d0
00C282: 6600000c         bne.w      $c290
00C286: 41e80010         lea.l      $10(a0), a0
00C28A: 43e9ff00         lea.l      -$100(a1), a1
00C28E: 60e4             bra.b      $c274
00C290: 363c6000         move.w     #$6000, d3
00C294: 4a6e00f8         tst.w      $f8(a6)
00C298: 66000006         bne.w      $c2a0
00C29C: 363c4000         move.w     #$4000, d3
00C2A0: 0280000000ff     andi.l     #$ff, d0
00C2A6: e940             asl.w      #$4, d0
00C2A8: 45f90000c914     lea.l      $c914.l, a2
00C2AE: 7200             moveq      #$0, d1
00C2B0: 122e0092         move.b     $92(a6), d1
00C2B4: e341             asl.w      #$1, d1
00C2B6: d041             add.w      d1, d0
00C2B8: d5c0             adda.l     d0, a2
00C2BA: 3012             move.w     (a2), d0
00C2BC: 00431000         ori.w      #$1000, d3
00C2C0: 8043             or.w       d3, d0
00C2C2: 3280             move.w     d0, (a1)
00C2C4: 5440             addq.w     #$2, d0
00C2C6: 33400002         move.w     d0, $2(a1)
00C2CA: 5340             subq.w     #$1, d0
00C2CC: 3340ff80         move.w     d0, -$80(a1)
00C2D0: 5440             addq.w     #$2, d0
00C2D2: 3340ff82         move.w     d0, -$7e(a1)
00C2D6: 4e75             rts        

; ==== sub_00C2D8 зовут=1 ====
00C2D8: 0c2e000200a6     cmpi.b     #$2, $a6(a6)
00C2DE: 6600007e         bne.w      $c35e
00C2E2: 7000             moveq      #$0, d0
00C2E4: 206e0006         movea.l    $6(a6), a0
00C2E8: 226e000a         movea.l    $a(a6), a1
00C2EC: 43e90c80         lea.l      $c80(a1), a1
00C2F0: 302e00a4         move.w     $a4(a6), d0
00C2F4: e340             asl.w      #$1, d0
00C2F6: d1c0             adda.l     d0, a0
00C2F8: e340             asl.w      #$1, d0
00C2FA: d3c0             adda.l     d0, a1
00C2FC: 3010             move.w     (a0), d0
00C2FE: 0c0000ff         cmpi.b     #$ff, d0
00C302: 6700005a         beq.w      $c35e
00C306: 0800000d         btst.b     #$d, d0
00C30A: 6600000c         bne.w      $c318
00C30E: 41e80010         lea.l      $10(a0), a0
00C312: 43e9ff00         lea.l      -$100(a1), a1
00C316: 60e4             bra.b      $c2fc
00C318: 363c6000         move.w     #$6000, d3
00C31C: 4a6e00f8         tst.w      $f8(a6)
00C320: 66000006         bne.w      $c328
00C324: 363c4000         move.w     #$4000, d3
00C328: 0280000000ff     andi.l     #$ff, d0
00C32E: e940             asl.w      #$4, d0
00C330: 45f90000c9a4     lea.l      $c9a4.l, a2
00C336: 7200             moveq      #$0, d1
00C338: 122e0092         move.b     $92(a6), d1
00C33C: e341             asl.w      #$1, d1
00C33E: d041             add.w      d1, d0
00C340: d5c0             adda.l     d0, a2
00C342: 3012             move.w     (a2), d0
00C344: 00431000         ori.w      #$1000, d3
00C348: 8043             or.w       d3, d0
00C34A: 3280             move.w     d0, (a1)
00C34C: 5440             addq.w     #$2, d0
00C34E: 33400002         move.w     d0, $2(a1)
00C352: 5340             subq.w     #$1, d0
00C354: 3340ff80         move.w     d0, -$80(a1)
00C358: 5440             addq.w     #$2, d0
00C35A: 3340ff82         move.w     d0, -$7e(a1)
00C35E: 4e75             rts        
00C360: 08ae000100a7     bclr.b     #$1, $a7(a6)
00C366: 67000010         beq.w      $c378
00C36A: 1d7c00010098     move.b     #$1, $98(a6)
00C370: 6100006e         bsr.w      $c3e0
00C374: 6000024e         bra.w      $c5c4
00C378: 4a6e00f6         tst.w      $f6(a6)
00C37C: 6600026c         bne.w      $c5ea
00C380: 08ae000000a7     bclr.b     #$0, $a7(a6)
00C386: 6700000c         beq.w      $c394
00C38A: 1d7c00010098     move.b     #$1, $98(a6)
00C390: 6000004e         bra.w      $c3e0
00C394: 0c6e0010004c     cmpi.w     #$10, $4c(a6)
00C39A: 67000010         beq.w      $c3ac
00C39E: 0c6e0014004c     cmpi.w     #$14, $4c(a6)
00C3A4: 67000006         beq.w      $c3ac
00C3A8: 60000036         bra.w      $c3e0
00C3AC: 1d7c000100e0     move.b     #$1, $e0(a6)
00C3B2: 082e00000099     btst.b     #$0, $99(a6)
00C3B8: 67000010         beq.w      $c3ca
00C3BC: 206e0006         movea.l    $6(a6), a0
00C3C0: 226e000a         movea.l    $a(a6), a1
00C3C4: 7c05             moveq      #$5, d6
00C3C6: 6000002a         bra.w      $c3f2
00C3CA: 206e0006         movea.l    $6(a6), a0
00C3CE: 41e80060         lea.l      $60(a0), a0
00C3D2: 226e000a         movea.l    $a(a6), a1
00C3D6: 43e90300         lea.l      $300(a1), a1
00C3DA: 7c06             moveq      #$6, d6
00C3DC: 60000014         bra.w      $c3f2

; ==== sub_00C3E0 зовут=1 ====
00C3E0: 206e0006         movea.l    $6(a6), a0
00C3E4: 226e000a         movea.l    $a(a6), a1
00C3E8: 4a2e0098         tst.b      $98(a6)
00C3EC: 67000108         beq.w      $c4f6
00C3F0: 7c0c             moveq      #$c, d6
00C3F2: 3e2e0004         move.w     $4(a6), d7
00C3F6: 48e700c0         movem.l    a0-a1, -(a7)
00C3FA: 10280001         move.b     $1(a0), d0
00C3FE: 6a000036         bpl.w      $c436
00C402: 082e000000e0     btst.b     #$0, $e0(a6)
00C408: 66000038         bne.w      $c442
00C40C: 302e009a         move.w     $9a(a6), d0
00C410: 546e009a         addq.w     #$2, $9a(a6)
00C414: 45fa0194         lea.l      $c5aa(pc), a2
00C418: 30320000         move.w     (a2, d0.w), d0
00C41C: 32c0             move.w     d0, (a1)+
00C41E: 5240             addq.w     #$1, d0
00C420: 32c0             move.w     d0, (a1)+
00C422: 5240             addq.w     #$1, d0
00C424: 32c0             move.w     d0, (a1)+
00C426: 5240             addq.w     #$1, d0
00C428: 32c0             move.w     d0, (a1)+
00C42A: 5240             addq.w     #$1, d0
00C42C: 32c0             move.w     d0, (a1)+
00C42E: 5240             addq.w     #$1, d0
00C430: 32c0             move.w     d0, (a1)+
00C432: 6000000e         bra.w      $c442
00C436: 6100001c         bsr.w      $c454
00C43A: 5448             addq.w     #$2, a0
00C43C: 5449             addq.w     #$2, a1
00C43E: 51cfffba         dbra       d7, $c3fa
00C442: 4cdf0300         movem.l    (a7)+, a0-a1
00C446: 41e80010         lea.l      $10(a0), a0
00C44A: 43e90080         lea.l      $80(a1), a1
00C44E: 51ceffa2         dbra       d6, $c3f2
00C452: 4e75             rts        

; ==== sub_00C454 зовут=1 ====
00C454: 0c79002400ff0406 cmpi.w     #$24, $ff0406.l
00C45C: 6600000a         bne.w      $c468
00C460: 337c00040000     move.w     #$4, $0(a1)
00C466: 4e75             rts        
00C468: 7000             moveq      #$0, d0
00C46A: 10280001         move.b     $1(a0), d0
00C46E: 66000006         bne.w      $c476
00C472: 4251             clr.w      (a1)
00C474: 4e75             rts        
00C476: 363c4000         move.w     #$4000, d3
00C47A: 0c000007         cmpi.b     #$7, d0
00C47E: 6d000010         blt.w      $c490
00C482: 0c6e0020006a     cmpi.w     #$20, $6a(a6)
00C488: 6c000006         bge.w      $c490
00C48C: 363c2000         move.w     #$2000, d3
00C490: e940             asl.w      #$4, d0
00C492: 45f90000ca34     lea.l      $ca34.l, a2
00C498: d5c0             adda.l     d0, a2
00C49A: 08100007         btst.b     #$7, (a0)
00C49E: 6600002a         bne.w      $c4ca
00C4A2: 08100006         btst.b     #$6, (a0)
00C4A6: 6600000e         bne.w      $c4b6
00C4AA: 08100005         btst.b     #$5, (a0)
00C4AE: 67000010         beq.w      $c4c0
00C4B2: 45ea0090         lea.l      $90(a2), a2
00C4B6: 7200             moveq      #$0, d1
00C4B8: 122e0092         move.b     $92(a6), d1
00C4BC: e341             asl.w      #$1, d1
00C4BE: d5c1             adda.l     d1, a2
00C4C0: 3012             move.w     (a2), d0
00C4C2: 8043             or.w       d3, d0
00C4C4: 33400000         move.w     d0, $0(a1)
00C4C8: 4e75             rts        
00C4CA: 7400             moveq      #$0, d2
00C4CC: 342e006a         move.w     $6a(a6), d2
00C4D0: 47fafa80         lea.l      $bf52(pc), a3
00C4D4: 14332000         move.b     (a3, d2.w), d2
00C4D8: 6798             beq.b      $c472
00C4DA: 6a000008         bpl.w      $c4e4
00C4DE: 4250             clr.w      (a0)
00C4E0: 4251             clr.w      (a1)
00C4E2: 4e75             rts        
00C4E4: 0c020001         cmpi.b     #$1, d2
00C4E8: 67d6             beq.b      $c4c0
00C4EA: 0642012b         addi.w     #$12b, d2
00C4EE: 8443             or.w       d3, d2
00C4F0: 33420000         move.w     d2, $0(a1)
00C4F4: 4e75             rts        
00C4F6: 6100005a         bsr.w      $c552
00C4FA: 7000             moveq      #$0, d0
00C4FC: 206e0006         movea.l    $6(a6), a0
00C500: 226e000a         movea.l    $a(a6), a1
00C504: 302e0096         move.w     $96(a6), d0
00C508: e340             asl.w      #$1, d0
00C50A: d1c0             adda.l     d0, a0
00C50C: d3c0             adda.l     d0, a1
00C50E: 3010             move.w     (a0), d0
00C510: 0c0000ff         cmpi.b     #$ff, d0
00C514: 6700003a         beq.w      $c550
00C518: 0800000e         btst.b     #$e, d0
00C51C: 6600000c         bne.w      $c52a
00C520: 41e80010         lea.l      $10(a0), a0
00C524: 43e90080         lea.l      $80(a1), a1
00C528: 60e4             bra.b      $c50e
00C52A: 363c4000         move.w     #$4000, d3
00C52E: 0280000000ff     andi.l     #$ff, d0
00C534: e940             asl.w      #$4, d0
00C536: 45f90000ca34     lea.l      $ca34.l, a2
00C53C: 7200             moveq      #$0, d1
00C53E: 122e0092         move.b     $92(a6), d1
00C542: e341             asl.w      #$1, d1
00C544: d041             add.w      d1, d0
00C546: d5c0             adda.l     d0, a2
00C548: 3012             move.w     (a2), d0
00C54A: 8043             or.w       d3, d0
00C54C: 33400000         move.w     d0, $0(a1)
00C550: 4e75             rts        

; ==== sub_00C552 зовут=1 ====
00C552: 7000             moveq      #$0, d0
00C554: 206e0006         movea.l    $6(a6), a0
00C558: 226e000a         movea.l    $a(a6), a1
00C55C: 302e00a4         move.w     $a4(a6), d0
00C560: e340             asl.w      #$1, d0
00C562: d1c0             adda.l     d0, a0
00C564: d3c0             adda.l     d0, a1
00C566: 3010             move.w     (a0), d0
00C568: 0c0000ff         cmpi.b     #$ff, d0
00C56C: 6700003a         beq.w      $c5a8
00C570: 0800000d         btst.b     #$d, d0
00C574: 6600000c         bne.w      $c582
00C578: 41e80010         lea.l      $10(a0), a0
00C57C: 43e90080         lea.l      $80(a1), a1
00C580: 60e4             bra.b      $c566
00C582: 363c4000         move.w     #$4000, d3
00C586: 0280000000ff     andi.l     #$ff, d0
00C58C: e940             asl.w      #$4, d0
00C58E: 45f90000cac4     lea.l      $cac4.l, a2
00C594: 7200             moveq      #$0, d1
00C596: 122e0092         move.b     $92(a6), d1
00C59A: e341             asl.w      #$1, d1
00C59C: d041             add.w      d1, d0
00C59E: d5c0             adda.l     d0, a2
00C5A0: 3012             move.w     (a2), d0
00C5A2: 8043             or.w       d3, d0
00C5A4: 33400000         move.w     d0, $0(a1)
00C5A8: 4e75             rts        

; ---- ДАННЫЕ $00C5AA..$00C5C4 (26 байт) ----

00C5C4: 206e000a         movea.l    $a(a6), a0
00C5C8: 203cc004c004     move.l     #$c004c004, d0
00C5CE: 323c000c         move.w     #$c, d1
00C5D2: 343c0002         move.w     #$2, d2
00C5D6: 2448             movea.l    a0, a2
00C5D8: 20c0             move.l     d0, (a0)+
00C5DA: 51cafffc         dbra       d2, $c5d8
00C5DE: 204a             movea.l    a2, a0
00C5E0: 41e80080         lea.l      $80(a0), a0
00C5E4: 51c9ffec         dbra       d1, $c5d2
00C5E8: 4e75             rts        
00C5EA: 08ae000000a7     bclr.b     #$0, $a7(a6)
00C5F0: 6700000c         beq.w      $c5fe
00C5F4: 1d7c00010098     move.b     #$1, $98(a6)
00C5FA: 60000052         bra.w      $c64e
00C5FE: 0c6e0010004c     cmpi.w     #$10, $4c(a6)
00C604: 67000010         beq.w      $c616
00C608: 0c6e0014004c     cmpi.w     #$14, $4c(a6)
00C60E: 67000006         beq.w      $c616
00C612: 6000003a         bra.w      $c64e
00C616: 1d7c000100e0     move.b     #$1, $e0(a6)
00C61C: 082e00000099     btst.b     #$0, $99(a6)
00C622: 67000014         beq.w      $c638
00C626: 206e0006         movea.l    $6(a6), a0
00C62A: 226e000a         movea.l    $a(a6), a1
00C62E: 43e90600         lea.l      $600(a1), a1
00C632: 7c05             moveq      #$5, d6
00C634: 6000002e         bra.w      $c664
00C638: 206e0006         movea.l    $6(a6), a0
00C63C: 41e80060         lea.l      $60(a0), a0
00C640: 226e000a         movea.l    $a(a6), a1
00C644: 43e90300         lea.l      $300(a1), a1
00C648: 7c06             moveq      #$6, d6
00C64A: 60000018         bra.w      $c664
00C64E: 206e0006         movea.l    $6(a6), a0
00C652: 226e000a         movea.l    $a(a6), a1
00C656: 43e90600         lea.l      $600(a1), a1
00C65A: 4a2e0098         tst.b      $98(a6)
00C65E: 6700010c         beq.w      $c76c
00C662: 7c0c             moveq      #$c, d6
00C664: 3e2e0004         move.w     $4(a6), d7
00C668: 48e700c0         movem.l    a0-a1, -(a7)
00C66C: 10280001         move.b     $1(a0), d0
00C670: 6a000036         bpl.w      $c6a8
00C674: 082e000000e0     btst.b     #$0, $e0(a6)
00C67A: 66000038         bne.w      $c6b4
00C67E: 302e009a         move.w     $9a(a6), d0
00C682: 546e009a         addq.w     #$2, $9a(a6)
00C686: 45fa01a8         lea.l      $c830(pc), a2
00C68A: 30320000         move.w     (a2, d0.w), d0
00C68E: 32c0             move.w     d0, (a1)+
00C690: 5240             addq.w     #$1, d0
00C692: 32c0             move.w     d0, (a1)+
00C694: 5240             addq.w     #$1, d0
00C696: 32c0             move.w     d0, (a1)+
00C698: 5240             addq.w     #$1, d0
00C69A: 32c0             move.w     d0, (a1)+
00C69C: 5240             addq.w     #$1, d0
00C69E: 32c0             move.w     d0, (a1)+
00C6A0: 5240             addq.w     #$1, d0
00C6A2: 3280             move.w     d0, (a1)
00C6A4: 6000000e         bra.w      $c6b4
00C6A8: 6100001c         bsr.w      $c6c6
00C6AC: 5448             addq.w     #$2, a0
00C6AE: 5449             addq.w     #$2, a1
00C6B0: 51cfffba         dbra       d7, $c66c
00C6B4: 4cdf0300         movem.l    (a7)+, a0-a1
00C6B8: 41e80010         lea.l      $10(a0), a0
00C6BC: 43e9ff80         lea.l      -$80(a1), a1
00C6C0: 51ceffa2         dbra       d6, $c664
00C6C4: 4e75             rts        

; ==== sub_00C6C6 зовут=1 ====
00C6C6: 0c79002400ff0406 cmpi.w     #$24, $ff0406.l
00C6CE: 6600000a         bne.w      $c6da
00C6D2: 337c00040000     move.w     #$4, $0(a1)
00C6D8: 4e75             rts        
00C6DA: 7000             moveq      #$0, d0
00C6DC: 10280001         move.b     $1(a0), d0
00C6E0: 66000006         bne.w      $c6e8
00C6E4: 4251             clr.w      (a1)
00C6E6: 4e75             rts        
00C6E8: 363c4000         move.w     #$4000, d3
00C6EC: 0c000007         cmpi.b     #$7, d0
00C6F0: 6d000010         blt.w      $c702
00C6F4: 0c6e0020006a     cmpi.w     #$20, $6a(a6)
00C6FA: 6c000006         bge.w      $c702
00C6FE: 363c2000         move.w     #$2000, d3

; ---- ДАННЫЕ $00C702..$00C700 (-2 байт) ----


; ==== sub_00C700 ТАБЛИЦА зовут=0 ====
00C700: 2000             move.l     d0, d0
00C702: 00431000         ori.w      #$1000, d3
00C706: e940             asl.w      #$4, d0
00C708: 45f90000ca34     lea.l      $ca34.l, a2
00C70E: d5c0             adda.l     d0, a2
00C710: 08100007         btst.b     #$7, (a0)
00C714: 6600002a         bne.w      $c740
00C718: 08100006         btst.b     #$6, (a0)
00C71C: 6600000e         bne.w      $c72c
00C720: 08100005         btst.b     #$5, (a0)
00C724: 67000010         beq.w      $c736
00C728: 45ea0090         lea.l      $90(a2), a2
00C72C: 7200             moveq      #$0, d1
00C72E: 122e0092         move.b     $92(a6), d1
00C732: e341             asl.w      #$1, d1
00C734: d5c1             adda.l     d1, a2
00C736: 3012             move.w     (a2), d0
00C738: 8043             or.w       d3, d0
00C73A: 33400000         move.w     d0, $0(a1)
00C73E: 4e75             rts        
00C740: 7400             moveq      #$0, d2
00C742: 342e006a         move.w     $6a(a6), d2
00C746: 47faf80a         lea.l      $bf52(pc), a3
00C74A: 14332000         move.b     (a3, d2.w), d2
00C74E: 6794             beq.b      $c6e4
00C750: 6a000008         bpl.w      $c75a
00C754: 4250             clr.w      (a0)
00C756: 4251             clr.w      (a1)
00C758: 4e75             rts        
00C75A: 0c020001         cmpi.b     #$1, d2
00C75E: 67d6             beq.b      $c736
00C760: 0642012b         addi.w     #$12b, d2
00C764: 8443             or.w       d3, d2
00C766: 33420000         move.w     d2, $0(a1)
00C76A: 4e75             rts        
00C76C: 61000062         bsr.w      $c7d0
00C770: 7000             moveq      #$0, d0
00C772: 206e0006         movea.l    $6(a6), a0
00C776: 226e000a         movea.l    $a(a6), a1
00C77A: 43e90600         lea.l      $600(a1), a1
00C77E: 302e0096         move.w     $96(a6), d0
00C782: e340             asl.w      #$1, d0
00C784: d1c0             adda.l     d0, a0
00C786: d3c0             adda.l     d0, a1
00C788: 3010             move.w     (a0), d0
00C78A: 0c0000ff         cmpi.b     #$ff, d0
00C78E: 6700003e         beq.w      $c7ce
00C792: 0800000e         btst.b     #$e, d0
00C796: 6600000c         bne.w      $c7a4
00C79A: 41e80010         lea.l      $10(a0), a0
00C79E: 43e9ff80         lea.l      -$80(a1), a1
00C7A2: 60e4             bra.b      $c788
00C7A4: 363c4000         move.w     #$4000, d3
00C7A8: 00431000         ori.w      #$1000, d3
00C7AC: 0280000000ff     andi.l     #$ff, d0
00C7B2: e940             asl.w      #$4, d0
00C7B4: 45f90000ca34     lea.l      $ca34.l, a2
00C7BA: 7200             moveq      #$0, d1
00C7BC: 122e0092         move.b     $92(a6), d1
00C7C0: e341             asl.w      #$1, d1
00C7C2: d041             add.w      d1, d0
00C7C4: d5c0             adda.l     d0, a2
00C7C6: 3012             move.w     (a2), d0
00C7C8: 8043             or.w       d3, d0
00C7CA: 33400000         move.w     d0, $0(a1)
00C7CE: 4e75             rts        

; ==== sub_00C7D0 зовут=1 ====
00C7D0: 7000             moveq      #$0, d0
00C7D2: 206e0006         movea.l    $6(a6), a0
00C7D6: 226e000a         movea.l    $a(a6), a1
00C7DA: 43e90600         lea.l      $600(a1), a1
00C7DE: 302e00a4         move.w     $a4(a6), d0
00C7E2: e340             asl.w      #$1, d0
00C7E4: d1c0             adda.l     d0, a0
00C7E6: d3c0             adda.l     d0, a1
00C7E8: 3010             move.w     (a0), d0
00C7EA: 0c0000ff         cmpi.b     #$ff, d0
00C7EE: 6700003e         beq.w      $c82e
00C7F2: 0800000d         btst.b     #$d, d0
00C7F6: 6600000c         bne.w      $c804
00C7FA: 41e80010         lea.l      $10(a0), a0
00C7FE: 43e9ff80         lea.l      -$80(a1), a1
00C802: 60e4             bra.b      $c7e8
00C804: 363c4000         move.w     #$4000, d3
00C808: 00431000         ori.w      #$1000, d3
00C80C: 0280000000ff     andi.l     #$ff, d0
00C812: e940             asl.w      #$4, d0
00C814: 45f90000cac4     lea.l      $cac4.l, a2
00C81A: 7200             moveq      #$0, d1
00C81C: 122e0092         move.b     $92(a6), d1
00C820: e341             asl.w      #$1, d1
00C822: d041             add.w      d1, d0
00C824: d5c0             adda.l     d0, a2
00C826: 3012             move.w     (a2), d0
00C828: 8043             or.w       d3, d0
00C82A: 33400000         move.w     d0, $0(a1)
00C82E: 4e75             rts        

; ---- ДАННЫЕ $00C830..$00C84A (26 байт) ----


; ==== sub_00C84A зовут=1 ====
00C84A: 4a6e0002         tst.w      $2(a6)
00C84E: 67000026         beq.w      $c876
00C852: 4bee0100         lea.l      $100(a6), a5
00C856: 206e000e         movea.l    $e(a6), a0
00C85A: 43fa04e2         lea.l      $cd3e(pc), a1
00C85E: 4a6e00f6         tst.w      $f6(a6)
00C862: 67000006         beq.w      $c86a
00C866: 43fa0562         lea.l      $cdca(pc), a1
00C86A: 45fa01c8         lea.l      $ca34(pc), a2
00C86E: 266e0012         movea.l    $12(a6), a3
00C872: 60000022         bra.w      $c896
00C876: 4bee0100         lea.l      $100(a6), a5
00C87A: 206e000e         movea.l    $e(a6), a0
00C87E: 43fa03be         lea.l      $cc3e(pc), a1
00C882: 4a6e00f6         tst.w      $f6(a6)
00C886: 67000006         beq.w      $c88e
00C88A: 43fa0432         lea.l      $ccbe(pc), a1
00C88E: 45fa0084         lea.l      $c914(pc), a2
00C892: 266e0012         movea.l    $12(a6), a3
00C896: 610a             bsr.b      $c8a2
00C898: 4bed0020         lea.l      $20(a5), a5
00C89C: 6104             bsr.b      $c8a2
00C89E: 4bed0020         lea.l      $20(a5), a5

; ==== sub_00C8A2 зовут=2 ====
00C8A2: 7000             moveq      #$0, d0
00C8A4: 102d0001         move.b     $1(a5), d0
00C8A8: 6606             bne.b      $c8b0
00C8AA: 4250             clr.w      (a0)
00C8AC: 5048             addq.w     #$8, a0
00C8AE: 4e75             rts        
00C8B0: 343c2000         move.w     #$2000, d2
00C8B4: 0c000007         cmpi.b     #$7, d0
00C8B8: 6c000012         bge.w      $c8cc
00C8BC: 343c6000         move.w     #$6000, d2
00C8C0: 4a6e00f8         tst.w      $f8(a6)
00C8C4: 66000006         bne.w      $c8cc
00C8C8: 343c4000         move.w     #$4000, d2
00C8CC: 4a6e00f6         tst.w      $f6(a6)
00C8D0: 67000006         beq.w      $c8d8
00C8D4: 00421000         ori.w      #$1000, d2
00C8D8: 322d0002         move.w     $2(a5), d1
00C8DC: e341             asl.w      #$1, d1
00C8DE: 32311000         move.w     (a1, d1.w), d1
00C8E2: 30c1             move.w     d1, (a0)+
00C8E4: 3210             move.w     (a0), d1
00C8E6: 024100ff         andi.w     #$ff, d1
00C8EA: 4a6e0002         tst.w      $2(a6)
00C8EE: 66000006         bne.w      $c8f6
00C8F2: 00410500         ori.w      #$500, d1
00C8F6: 30c1             move.w     d1, (a0)+
00C8F8: e940             asl.w      #$4, d0
00C8FA: 082d00060000     btst.b     #$6, $0(a5)
00C900: 6700000c         beq.w      $c90e
00C904: 7600             moveq      #$0, d3
00C906: 162e0092         move.b     $92(a6), d3
00C90A: e343             asl.w      #$1, d3
00C90C: d043             add.w      d3, d0
00C90E: 30320000         move.w     (a2, d0.w), d0
00C912: 8042             or.w       d2, d0
00C914: 30c0             move.w     d0, (a0)+
00C916: 302e0042         move.w     $42(a6), d0
00C91A: e340             asl.w      #$1, d0
00C91C: 30330000         move.w     (a3, d0.w), d0
00C920: 30c0             move.w     d0, (a0)+
00C922: 4e75             rts        

; ---- ДАННЫЕ $00C924..$00CE52 (1326 байт) ----


; ==== sub_00CE52 зовут=1 ====
00CE52: 206e000e         movea.l    $e(a6), a0
00CE56: 42680060         clr.w      $60(a0)
00CE5A: 42680068         clr.w      $68(a0)
00CE5E: 42680070         clr.w      $70(a0)
00CE62: 41e80018         lea.l      $18(a0), a0
00CE66: 4a6e006e         tst.w      $6e(a6)
00CE6A: 6600001a         bne.w      $ce86
00CE6E: 4250             clr.w      (a0)
00CE70: 42680008         clr.w      $8(a0)
00CE74: 42680010         clr.w      $10(a0)
00CE78: 42680018         clr.w      $18(a0)
00CE7C: 42680020         clr.w      $20(a0)
00CE80: 42680028         clr.w      $28(a0)
00CE84: 4e75             rts        
00CE86: 3028fff8         move.w     -$8(a0), d0
00CE8A: 3228fffe         move.w     -$2(a0), d1
00CE8E: 4a6e00f6         tst.w      $f6(a6)
00CE92: 6700000a         beq.w      $ce9e
00CE96: 3028ffe8         move.w     -$18(a0), d0
00CE9A: 3228ffee         move.w     -$12(a0), d1
00CE9E: 43fa00ea         lea.l      $cf8a(pc), a1
00CEA2: 4a6e0002         tst.w      $2(a6)
00CEA6: 67000006         beq.w      $ceae
00CEAA: 43fa0110         lea.l      $cfbc(pc), a1
00CEAE: 3419             move.w     (a1)+, d2
00CEB0: 0c42ffff         cmpi.w     #$ffff, d2
00CEB4: 6700001c         beq.w      $ced2
00CEB8: d440             add.w      d0, d2
00CEBA: 30c2             move.w     d2, (a0)+
00CEBC: 3610             move.w     (a0), d3
00CEBE: 024300ff         andi.w     #$ff, d3
00CEC2: 8659             or.w       (a1)+, d3
00CEC4: 30c3             move.w     d3, (a0)+
00CEC6: 3419             move.w     (a1)+, d2
00CEC8: 30c2             move.w     d2, (a0)+
00CECA: 3419             move.w     (a1)+, d2
00CECC: d441             add.w      d1, d2
00CECE: 30c2             move.w     d2, (a0)+
00CED0: 60dc             bra.b      $ceae
00CED2: 08ae0000009c     bclr.b     #$0, $9c(a6)
00CED8: 670000ae         beq.w      $cf88
00CEDC: 4a6e00f6         tst.w      $f6(a6)
00CEE0: 67000056         beq.w      $cf38
00CEE4: 206e000e         movea.l    $e(a6), a0
00CEE8: 50680008         addq.w     #$8, $8(a0)
00CEEC: 50680010         addq.w     #$8, $10(a0)
00CEF0: 3010             move.w     (a0), d0
00CEF2: 5040             addq.w     #$8, d0
00CEF4: 31400060         move.w     d0, $60(a0)
00CEF8: 31400068         move.w     d0, $68(a0)
00CEFC: 04400028         subi.w     #$28, d0
00CF00: 3080             move.w     d0, (a0)
00CF02: 31400070         move.w     d0, $70(a0)
00CF06: 026800ff0002     andi.w     #$ff, $2(a0)
00CF0C: 3010             move.w     (a0), d0
00CF0E: 32280004         move.w     $4(a0), d1
00CF12: 5241             addq.w     #$1, d1
00CF14: 31410064         move.w     d1, $64(a0)
00CF18: 5241             addq.w     #$1, d1
00CF1A: 31410074         move.w     d1, $74(a0)
00CF1E: 5241             addq.w     #$1, d1
00CF20: 3141006c         move.w     d1, $6c(a0)
00CF24: 34280006         move.w     $6(a0), d2
00CF28: 31420066         move.w     d2, $66(a0)
00CF2C: 5042             addq.w     #$8, d2
00CF2E: 3142006e         move.w     d2, $6e(a0)
00CF32: 31420076         move.w     d2, $76(a0)
00CF36: 4e75             rts        
00CF38: 206e000e         movea.l    $e(a6), a0
00CF3C: 51680008         subq.w     #$8, $8(a0)
00CF40: 51680010         subq.w     #$8, $10(a0)
00CF44: 3010             move.w     (a0), d0
00CF46: 31400060         move.w     d0, $60(a0)
00CF4A: 31400068         move.w     d0, $68(a0)
00CF4E: 06400028         addi.w     #$28, d0
00CF52: 3080             move.w     d0, (a0)
00CF54: 31400070         move.w     d0, $70(a0)
00CF58: 026800ff0002     andi.w     #$ff, $2(a0)
00CF5E: 3010             move.w     (a0), d0
00CF60: 32280004         move.w     $4(a0), d1
00CF64: 34280006         move.w     $6(a0), d2
00CF68: 5241             addq.w     #$1, d1
00CF6A: 31410064         move.w     d1, $64(a0)
00CF6E: 5241             addq.w     #$1, d1
00CF70: 31410074         move.w     d1, $74(a0)
00CF74: 5241             addq.w     #$1, d1
00CF76: 3141006c         move.w     d1, $6c(a0)
00CF7A: 31420066         move.w     d2, $66(a0)
00CF7E: 5042             addq.w     #$8, d2
00CF80: 3142006e         move.w     d2, $6e(a0)
00CF84: 31420076         move.w     d2, $76(a0)
00CF88: 4e75             rts        

; ---- ДАННЫЕ $00CF8A..$00CFEE (100 байт) ----


; ==== sub_00CFEE зовут=3 ====
00CFEE: 206e000e         movea.l    $e(a6), a0
00CFF2: 41e80048         lea.l      $48(a0), a0
00CFF6: 4a6e0074         tst.w      $74(a6)
00CFFA: 6600000e         bne.w      $d00a
00CFFE: 4250             clr.w      (a0)
00D000: 42680008         clr.w      $8(a0)
00D004: 42680010         clr.w      $10(a0)
00D008: 4e75             rts        
00D00A: 7e00             moveq      #$0, d7
00D00C: 4bee0100         lea.l      $100(a6), a5
00D010: 61000020         bsr.w      $d032
00D014: 4bed0020         lea.l      $20(a5), a5
00D018: 61000018         bsr.w      $d032
00D01C: 4bed0020         lea.l      $20(a5), a5
00D020: 61000010         bsr.w      $d032
00D024: 0c470003         cmpi.w     #$3, d7
00D028: 66000006         bne.w      $d030
00D02C: 426e0074         clr.w      $74(a6)
00D030: 4e75             rts        

; ==== sub_00D032 зовут=3 ====
00D032: 4a2e008a         tst.b      $8a(a6)
00D036: 66000070         bne.w      $d0a8
00D03A: 223c00001800     move.l     #$1800, d1
00D040: 202d0012         move.l     $12(a5), d0
00D044: 6b000008         bmi.w      $d04e
00D048: 223c00014000     move.l     #$14000, d1
00D04E: d081             add.l      d1, d0
00D050: 2b400012         move.l     d0, $12(a5)
00D054: d1ad000a         add.l      d0, $a(a5)
00D058: 302d000a         move.w     $a(a5), d0
00D05C: 3080             move.w     d0, (a0)
00D05E: 0c400180         cmpi.w     #$180, d0
00D062: 6d000004         blt.w      $d068
00D066: 5247             addq.w     #$1, d7
00D068: 202d000e         move.l     $e(a5), d0
00D06C: d1ad0006         add.l      d0, $6(a5)
00D070: 302d0006         move.w     $6(a5), d0
00D074: 31400006         move.w     d0, $6(a0)
00D078: 10280004         move.b     $4(a0), d0
00D07C: 02000060         andi.b     #$60, d0
00D080: 0c000020         cmpi.b     #$20, d0
00D084: 6700001c         beq.w      $d0a2
00D088: 103c0040         move.b     #$40, d0
00D08C: 4a6e00f8         tst.w      $f8(a6)
00D090: 67000006         beq.w      $d098
00D094: 103c0060         move.b     #$60, d0
00D098: 0228001f0004     andi.b     #$1f, $4(a0)
00D09E: 81280004         or.b       d0, $4(a0)
00D0A2: 41e80008         lea.l      $8(a0), a0
00D0A6: 4e75             rts        
00D0A8: 223c00001800     move.l     #$1800, d1
00D0AE: 202d0012         move.l     $12(a5), d0
00D0B2: 6b000008         bmi.w      $d0bc
00D0B6: 223c00014000     move.l     #$14000, d1
00D0BC: d081             add.l      d1, d0
00D0BE: 2b400012         move.l     d0, $12(a5)
00D0C2: 91ad000a         sub.l      d0, $a(a5)
00D0C6: 302d000a         move.w     $a(a5), d0
00D0CA: 3080             move.w     d0, (a0)
00D0CC: 0c400080         cmpi.w     #$80, d0
00D0D0: 6e000004         bgt.w      $d0d6
00D0D4: 5247             addq.w     #$1, d7
00D0D6: 202d000e         move.l     $e(a5), d0
00D0DA: d1ad0006         add.l      d0, $6(a5)
00D0DE: 302d0006         move.w     $6(a5), d0
00D0E2: 31400006         move.w     d0, $6(a0)
00D0E6: 10280004         move.b     $4(a0), d0
00D0EA: 02000060         andi.b     #$60, d0
00D0EE: 0c000020         cmpi.b     #$20, d0
00D0F2: 6700001c         beq.w      $d110
00D0F6: 103c0040         move.b     #$40, d0
00D0FA: 4a6e00f8         tst.w      $f8(a6)
00D0FE: 67000006         beq.w      $d106
00D102: 103c0060         move.b     #$60, d0
00D106: 0228001f0004     andi.b     #$1f, $4(a0)
00D10C: 81280004         or.b       d0, $4(a0)
00D110: 41e80008         lea.l      $8(a0), a0
00D114: 4e75             rts        

; ==== sub_00D116 зовут=1 ====
00D116: 41fa002a         lea.l      $d142(pc), a0
00D11A: 302e004c         move.w     $4c(a6), d0
00D11E: 20700000         movea.l    (a0, d0.w), a0
00D122: 4e90             jsr        (a0)
00D124: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
00D12A: 6c000014         bge.w      $d140
00D12E: 082e00070041     btst.b     #$7, $41(a6)
00D134: 66000004         bne.w      $d13a
00D138: 4e75             rts        
00D13A: 1d7c000100dc     move.b     #$1, $dc(a6)
00D140: 4e75             rts        

; ---- ДАННЫЕ $00D142..$00D162 (32 байт) ----


; ==== sub_00D162 зовут=1 ====
00D162: 0c6e000d007e     cmpi.w     #$d, $7e(a6)
00D168: 670003b6         beq.w      $d520
00D16C: 08ae000000cc     bclr.b     #$0, $cc(a6)
00D172: 67000008         beq.w      $d17c
00D176: 4ef90000a430     jmp        $a430.l
00D17C: 4a6e0054         tst.w      $54(a6)
00D180: 67000070         beq.w      $d1f2
00D184: 536e0054         subq.w     #$1, $54(a6)
00D188: 0c6e001d0054     cmpi.w     #$1d, $54(a6)
00D18E: 670000e6         beq.w      $d276
00D192: 4a2e00ab         tst.b      $ab(a6)
00D196: 67000058         beq.w      $d1f0
00D19A: 522e00ab         addq.b     #$1, $ab(a6)
00D19E: 0c2e000a00ab     cmpi.b     #$a, $ab(a6)
00D1A4: 6600004a         bne.w      $d1f0
00D1A8: 3f07             move.w     d7, -(a7)
00D1AA: 1e3c00b2         move.b     #$b2, d7
00D1AE: 4eb900003d7a     jsr        $3d7a.l
00D1B4: 3e1f             move.w     (a7)+, d7
00D1B6: 422e00ab         clr.b      $ab(a6)
00D1BA: 610000f2         bsr.w      $d2ae
00D1BE: 3d6e00ce0060     move.w     $ce(a6), $60(a6)
00D1C4: 3d6e00d00062     move.w     $d0(a6), $62(a6)
00D1CA: 3d6e00d20064     move.w     $d2(a6), $64(a6)
00D1D0: 610000dc         bsr.w      $d2ae
00D1D4: 3d6e00ce0060     move.w     $ce(a6), $60(a6)
00D1DA: 3d6e00d00062     move.w     $d0(a6), $62(a6)
00D1E0: 3d6e00d20064     move.w     $d2(a6), $64(a6)
00D1E6: 08ae00060062     bclr.b     #$6, $62(a6)
00D1EC: 600000c0         bra.w      $d2ae
00D1F0: 4e75             rts        
00D1F2: 4a7900ff0418     tst.w      $ff0418.l
00D1F8: 6600001c         bne.w      $d216
00D1FC: bdfc00ff1400     cmpa.l     #$ff1400, a6
00D202: 66000012         bne.w      $d216
00D206: 33fc000400ff3222 move.w     #$4, $ff3222.l
00D20E: 422e0040         clr.b      $40(a6)
00D212: 422e0041         clr.b      $41(a6)
00D216: 3d7c00020042     move.w     #$2, $42(a6)
00D21C: 4bee0100         lea.l      $100(a6), a5
00D220: 2b7c000700000002 move.l     #$70000, $2(a5)
00D228: 2b7c000900000022 move.l     #$90000, $22(a5)
00D230: 2b7c000b00000042 move.l     #$b0000, $42(a5)
00D238: 3d6e00ce0060     move.w     $ce(a6), $60(a6)
00D23E: 3d6e00d00062     move.w     $d0(a6), $62(a6)
00D244: 3d6e00d20064     move.w     $d2(a6), $64(a6)
00D24A: 426e004a         clr.w      $4a(a6)
00D24E: 3d7c0004004c     move.w     #$4, $4c(a6)
00D254: 3d7c001e0054     move.w     #$1e, $54(a6)
00D25A: 3d7c0001006e     move.w     #$1, $6e(a6)
00D260: 4eb90000dbea     jsr        $dbea.l
00D266: 206e0006         movea.l    $6(a6), a0
00D26A: 4a680004         tst.w      $4(a0)
00D26E: 660002b0         bne.w      $d520
00D272: 60000438         bra.w      $d6ac
00D276: bdfc00ff1400     cmpa.l     #$ff1400, a6
00D27C: 66000008         bne.w      $d286
00D280: 427900ff3210     clr.w      $ff3210.l
00D286: 4a2e008b         tst.b      $8b(a6)
00D28A: 67000014         beq.w      $d2a0
00D28E: 0c6e00070060     cmpi.w     #$7, $60(a6)
00D294: 6600000a         bne.w      $d2a0
00D298: 1d7c000100ab     move.b     #$1, $ab(a6)
00D29E: 4e75             rts        
00D2A0: 3d7c00020042     move.w     #$2, $42(a6)
00D2A6: 526e0070         addq.w     #$1, $70(a6)
00D2AA: 526e00a2         addq.w     #$1, $a2(a6)

; ==== sub_00D2AE зовут=2 ====
00D2AE: 4bee0100         lea.l      $100(a6), a5
00D2B2: 342e0060         move.w     $60(a6), d2
00D2B6: 3b420000         move.w     d2, $0(a5)
00D2BA: 342e0062         move.w     $62(a6), d2
00D2BE: 3b420020         move.w     d2, $20(a5)
00D2C2: 082d00060020     btst.b     #$6, $20(a5)
00D2C8: 67000008         beq.w      $d2d2
00D2CC: 3d7cffff0094     move.w     #$ffff, $94(a6)
00D2D2: 342e0064         move.w     $64(a6), d2
00D2D6: 3b420040         move.w     d2, $40(a5)
00D2DA: 3d7c00020042     move.w     #$2, $42(a6)
00D2E0: 4a2e008b         tst.b      $8b(a6)
00D2E4: 67000024         beq.w      $d30a
00D2E8: 08ad00060020     bclr.b     #$6, $20(a5)
00D2EE: 6700001a         beq.w      $d30a
00D2F2: 08ae00060062     bclr.b     #$6, $62(a6)
00D2F8: 426e0094         clr.w      $94(a6)
00D2FC: 3f07             move.w     d7, -(a7)
00D2FE: 1e3c00b2         move.b     #$b2, d7
00D302: 4eb900003d7a     jsr        $3d7a.l
00D308: 3e1f             move.w     (a7)+, d7
00D30A: 08ae000000c9     bclr.b     #$0, $c9(a6)
00D310: 66000032         bne.w      $d344
00D314: 0c6e0014008c     cmpi.w     #$14, $8c(a6)
00D31A: 6c00000c         bge.w      $d328
00D31E: 0c6e00230070     cmpi.w     #$23, $70(a6)
00D324: 6d00003e         blt.w      $d364
00D328: 426e008c         clr.w      $8c(a6)
00D32C: 426e0070         clr.w      $70(a6)
00D330: 0cae000080000044 cmpi.l     #$8000, $44(a6)
00D338: 6c00000a         bge.w      $d344
00D33C: 06ae000008000044 addi.l     #$800, $44(a6)
00D344: 3d7c000700ce     move.w     #$7, $ce(a6)
00D34A: 3d7c000800d0     move.w     #$8, $d0(a6)
00D350: 3d7c000900d2     move.w     #$9, $d2(a6)
00D356: 1e3c00a8         move.b     #$a8, d7
00D35A: 4eb900003d7a     jsr        $3d7a.l
00D360: 600001aa         bra.w      $d50c
00D364: 4a3900ff4100     tst.b      $ff4100.l
00D36A: 670000d6         beq.w      $d442
00D36E: 2f08             move.l     a0, -(a7)
00D370: 7200             moveq      #$0, d1
00D372: 41fa0046         lea.l      $d3ba(pc), a0
00D376: 0c6e00010000     cmpi.w     #$1, $0(a6)
00D37C: 67000006         beq.w      $d384
00D380: 41fa007a         lea.l      $d3fc(pc), a0
00D384: 302e00de         move.w     $de(a6), d0
00D388: 12300000         move.b     (a0, d0.w), d1
00D38C: 3d4100ce         move.w     d1, $ce(a6)
00D390: 12300001         move.b     $1(a0, d0.w), d1
00D394: 3d4100d0         move.w     d1, $d0(a6)
00D398: 12300002         move.b     $2(a0, d0.w), d1
00D39C: 3d4100d2         move.w     d1, $d2(a6)
00D3A0: 08ae00000091     bclr.b     #$0, $91(a6)
00D3A6: 67000008         beq.w      $d3b0
00D3AA: 006e400000d0     ori.w      #$4000, $d0(a6)
00D3B0: 566e00de         addq.w     #$3, $de(a6)
00D3B4: 205f             movea.l    (a7)+, a0
00D3B6: 60000154         bra.w      $d50c

; ---- ДАННЫЕ $00D3BA..$00D442 (136 байт) ----

00D442: 4a7900ff0418     tst.w      $ff0418.l
00D448: 6600001e         bne.w      $d468
00D44C: 4a3900ff0448     tst.b      $ff0448.l
00D452: 66000014         bne.w      $d468
00D456: 43f90000d62c     lea.l      $d62c.l, a1
00D45C: 7400             moveq      #$0, d2
00D45E: 143900ff410d     move.b     $ff410d.l, d2
00D464: 6000000e         bra.w      $d474
00D468: 43f90000d5cc     lea.l      $d5cc.l, a1
00D46E: 7400             moveq      #$0, d2
00D470: 142e00b0         move.b     $b0(a6), d2
00D474: eb42             asl.w      #$5, d2
00D476: d3c2             adda.l     d2, a1
00D478: 4eb90000dc80     jsr        $dc80.l
00D47E: 0242001f         andi.w     #$1f, d2
00D482: 14312000         move.b     (a1, d2.w), d2
00D486: 3d4200ce         move.w     d2, $ce(a6)
00D48A: 4eb90000dc80     jsr        $dc80.l
00D490: 0242001f         andi.w     #$1f, d2
00D494: 14312000         move.b     (a1, d2.w), d2
00D498: 3d4200d0         move.w     d2, $d0(a6)
00D49C: 4eb90000dc80     jsr        $dc80.l
00D4A2: 0242001f         andi.w     #$1f, d2
00D4A6: 14312000         move.b     (a1, d2.w), d2
00D4AA: 3d4200d2         move.w     d2, $d2(a6)
00D4AE: 08ae00000091     bclr.b     #$0, $91(a6)
00D4B4: 6700000e         beq.w      $d4c4
00D4B8: 006e400000d0     ori.w      #$4000, $d0(a6)
00D4BE: 3d7cffff0094     move.w     #$ffff, $94(a6)
00D4C4: 4a3900ff4100     tst.b      $ff4100.l
00D4CA: 66000040         bne.w      $d50c
00D4CE: 0c6e000f00a2     cmpi.w     #$f, $a2(a6)
00D4D4: 6d000036         blt.w      $d50c
00D4D8: 3d7c000f00a2     move.w     #$f, $a2(a6)
00D4DE: 4eb900000368     jsr        $368.l
00D4E4: 303900ffef90     move.w     $ffef90.l, d0
00D4EA: 4a2e00e1         tst.b      $e1(a6)
00D4EE: 6700000e         beq.w      $d4fe
00D4F2: 02400007         andi.w     #$7, d0
00D4F6: 66000014         bne.w      $d50c
00D4FA: 6000000a         bra.w      $d506
00D4FE: 0240001f         andi.w     #$1f, d0
00D502: 66000008         bne.w      $d50c
00D506: 006e100000ce     ori.w      #$1000, $ce(a6)
00D50C: 1d7c003c00ac     move.b     #$3c, $ac(a6)
00D512: 4e75             rts        

; ==== sub_00D514 зовут=1 ====
00D514: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
00D51A: 6d00001a         blt.w      $d536
00D51E: 4e75             rts        
00D520: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
00D526: 6d000004         blt.w      $d52c
00D52A: 4e75             rts        
00D52C: 1e3c00b9         move.b     #$b9, d7
00D530: 4eb900003d7a     jsr        $3d7a.l
00D536: 4a7900ff0418     tst.w      $ff0418.l
00D53C: 66000018         bne.w      $d556
00D540: bdfc00ff1400     cmpa.l     #$ff1400, a6
00D546: 6600000e         bne.w      $d556
00D54A: 427900ff3222     clr.w      $ff3222.l
00D550: 427900ff3210     clr.w      $ff3210.l
00D556: 426e0060         clr.w      $60(a6)
00D55A: 426e0062         clr.w      $62(a6)
00D55E: 426e0064         clr.w      $64(a6)
00D562: 422e00ab         clr.b      $ab(a6)
00D566: 3d7c001e005e     move.w     #$1e, $5e(a6)
00D56C: 3d7c0018004c     move.w     #$18, $4c(a6)
00D572: 1d7c000100aa     move.b     #$1, $aa(a6)
00D578: 33fc000100ff0420 move.w     #$1, $ff0420.l
00D580: 13fc000100ff0427 move.b     #$1, $ff0427.l
00D588: 426e00f0         clr.w      $f0(a6)
00D58C: 426e00f2         clr.w      $f2(a6)
00D590: 426e00f4         clr.w      $f4(a6)
00D594: 426e00f8         clr.w      $f8(a6)
00D598: 426e00ca         clr.w      $ca(a6)
00D59C: 41f900ff0300     lea.l      $ff0300.l, a0
00D5A2: 7000             moveq      #$0, d0
00D5A4: 102e0034         move.b     $34(a6), d0
00D5A8: 31bc04440000     move.w     #$444, (a0, d0.w)
00D5AE: 08ee000000a7     bset.b     #$0, $a7(a6)
00D5B4: 4a6e00f6         tst.w      $f6(a6)
00D5B8: 67000010         beq.w      $d5ca
00D5BC: 426e009a         clr.w      $9a(a6)
00D5C0: 426e00f6         clr.w      $f6(a6)
00D5C4: 1d7c000300a7     move.b     #$3, $a7(a6)
00D5CA: 4e75             rts        

; ---- ДАННЫЕ $00D5CC..$00D6AC (224 байт) ----

00D6AC: 0c6e000d007e     cmpi.w     #$d, $7e(a6)
00D6B2: 6700fe6c         beq.w      $d520
00D6B6: 4eb90000dad2     jsr        $dad2.l
00D6BC: 4eb90000da6c     jsr        $da6c.l
00D6C2: 4eb90000db0e     jsr        $db0e.l
00D6C8: 4ef90000dc16     jmp        $dc16.l

; ==== sub_00D6CE ТАБЛИЦА зовут=0 ====
00D6CE: 0c6e000d007e     cmpi.w     #$d, $7e(a6)
00D6D4: 6700fe4a         beq.w      $d520
00D6D8: 536e0052         subq.w     #$1, $52(a6)
00D6DC: 66000148         bne.w      $d826
00D6E0: 286e004e         movea.l    $4e(a6), a4
00D6E4: 4a6c0010         tst.w      $10(a4)
00D6E8: 67000152         beq.w      $d83c
00D6EC: 286e004e         movea.l    $4e(a6), a4
00D6F0: 302d0000         move.w     $0(a5), d0
00D6F4: 3940ffe0         move.w     d0, -$20(a4)
00D6F8: 3b7c00060002     move.w     #$6, $2(a5)
00D6FE: 302d0020         move.w     $20(a5), d0
00D702: 3940fff0         move.w     d0, -$10(a4)
00D706: 3b7c00080022     move.w     #$8, $22(a5)
00D70C: 302d0040         move.w     $40(a5), d0
00D710: 3880             move.w     d0, (a4)
00D712: 3b7c000a0042     move.w     #$a, $42(a5)
00D718: 426e006e         clr.w      $6e(a6)
00D71C: 426e006c         clr.w      $6c(a6)
00D720: 426e009e         clr.w      $9e(a6)
00D724: 0c000007         cmpi.b     #$7, d0
00D728: 6d0000b8         blt.w      $d7e2
00D72C: 006c8000ffe0     ori.w      #$8000, -$20(a4)
00D732: 006c8000fff0     ori.w      #$8000, -$10(a4)
00D738: 00548000         ori.w      #$8000, (a4)
00D73C: 0c400007         cmpi.w     #$7, d0
00D740: 6700004e         beq.w      $d790
00D744: 0c400009         cmpi.w     #$9, d0
00D748: 6700007a         beq.w      $d7c4
00D74C: 122c0011         move.b     $11(a4), d1
00D750: 6b00007e         bmi.w      $d7d0
00D754: 41ee0260         lea.l      $260(a6), a0
00D758: 3e3c0067         move.w     #$67, d7
00D75C: b2280001         cmp.b      $1(a0), d1
00D760: 66000016         bne.w      $d778
00D764: 08100006         btst.b     #$6, (a0)
00D768: 6600000e         bne.w      $d778
00D76C: 08100005         btst.b     #$5, (a0)
00D770: 66000006         bne.w      $d778
00D774: 08d00007         bset.b     #$7, (a0)
00D778: 5448             addq.w     #$2, a0
00D77A: 51cfffe0         dbra       d7, $d75c
00D77E: 3d7c00010076     move.w     #$1, $76(a6)
00D784: 426e006c         clr.w      $6c(a6)
00D788: 426e009e         clr.w      $9e(a6)
00D78C: 60000042         bra.w      $d7d0
00D790: 286e0028         movea.l    $28(a6), a4
00D794: 4a6c00ca         tst.w      $ca(a4)
00D798: 66000008         bne.w      $d7a2
00D79C: 08ec00000090     bset.b     #$0, $90(a4)
00D7A2: 302e002a         move.w     $2a(a6), d0
00D7A6: b06e0026         cmp.w      $26(a6), d0
00D7AA: 67000014         beq.w      $d7c0
00D7AE: 286e0024         movea.l    $24(a6), a4
00D7B2: 4a6c00ca         tst.w      $ca(a4)
00D7B6: 66000008         bne.w      $d7c0
00D7BA: 08ec00000090     bset.b     #$0, $90(a4)
00D7C0: 6000000e         bra.w      $d7d0
00D7C4: 3d7c0001008e     move.w     #$1, $8e(a6)
00D7CA: 066efffd0078     addi.w     #$fffd, $78(a6)
00D7D0: 426e006a         clr.w      $6a(a6)
00D7D4: 3d7c0010004c     move.w     #$10, $4c(a6)
00D7DA: 1d7c00010098     move.b     #$1, $98(a6)
00D7E0: 4e75             rts        
00D7E2: 082c0006ffe0     btst.b     #$6, -$20(a4)
00D7E8: 6600002e         bne.w      $d818
00D7EC: 082c0006fff0     btst.b     #$6, -$10(a4)
00D7F2: 66000024         bne.w      $d818
00D7F6: 08140006         btst.b     #$6, (a4)
00D7FA: 6600001c         bne.w      $d818
00D7FE: 426e006e         clr.w      $6e(a6)
00D802: 426e006c         clr.w      $6c(a6)
00D806: 426e009e         clr.w      $9e(a6)
00D80A: 3d7c000c004c     move.w     #$c, $4c(a6)
00D810: 1d7c00010098     move.b     #$1, $98(a6)
00D816: 4e75             rts        
00D818: 3d7c03840094     move.w     #$384, $94(a6)
00D81E: 3d6e00420096     move.w     $42(a6), $96(a6)
00D824: 60d8             bra.b      $d7fe
00D826: 082e00010040     btst.b     #$1, $40(a6)
00D82C: 67000026         beq.w      $d854
00D830: 286e004e         movea.l    $4e(a6), a4
00D834: 4a6c0010         tst.w      $10(a4)
00D838: 6600feb2         bne.w      $d6ec
00D83C: 526d0002         addq.w     #$1, $2(a5)
00D840: 526d0022         addq.w     #$1, $22(a5)
00D844: 526d0042         addq.w     #$1, $42(a5)
00D848: 3d7c0004004c     move.w     #$4, $4c(a6)
00D84E: 4ef90000dbea     jmp        $dbea.l
00D854: 4eb90000dad2     jsr        $dad2.l
00D85A: 4eb90000db0e     jsr        $db0e.l
00D860: 286e004e         movea.l    $4e(a6), a4
00D864: 4a6c0010         tst.w      $10(a4)
00D868: 66000012         bne.w      $d87c
00D86C: 382d0002         move.w     $2(a5), d4
00D870: 4eb90000da6c     jsr        $da6c.l
00D876: b86d0002         cmp.w      $2(a5), d4
00D87A: 66cc             bne.b      $d848
00D87C: 4e75             rts        

; ==== sub_00D87E ТАБЛИЦА зовут=0 ====
00D87E: 4eb90000decc     jsr        $decc.l
00D884: 0c6e0010004c     cmpi.w     #$10, $4c(a6)
00D88A: 6600000c         bne.w      $d898
00D88E: 426e006a         clr.w      $6a(a6)
00D892: 526e006c         addq.w     #$1, $6c(a6)
00D896: 4e75             rts        
00D898: 4eb900009b50     jsr        $9b50.l
00D89E: 426e0076         clr.w      $76(a6)
00D8A2: 4eb90000dd44     jsr        $dd44.l
00D8A8: 4a47             tst.w      d7
00D8AA: 6600fc74         bne.w      $d520
00D8AE: 0c2e000100a6     cmpi.b     #$1, $a6(a6)
00D8B4: 660000b0         bne.w      $d966
00D8B8: 422e00a6         clr.b      $a6(a6)
00D8BC: 4eb900000368     jsr        $368.l
00D8C2: 303900ffef90     move.w     $ffef90.l, d0
00D8C8: 0240000f         andi.w     #$f, d0
00D8CC: b06e0004         cmp.w      $4(a6), d0
00D8D0: 6f00000c         ble.w      $d8de
00D8D4: 906e0004         sub.w      $4(a6), d0
00D8D8: 64fa             bcc.b      $d8d4
00D8DA: d06e0004         add.w      $4(a6), d0
00D8DE: 3400             move.w     d0, d2
00D8E0: e340             asl.w      #$1, d0
00D8E2: 322e0004         move.w     $4(a6), d1
00D8E6: e341             asl.w      #$1, d1
00D8E8: 41ee02e0         lea.l      $2e0(a6), a0
00D8EC: 362e0004         move.w     $4(a6), d3
00D8F0: 4a300001         tst.b      $1(a0, d0.w)
00D8F4: 6700005e         beq.w      $d954
00D8F8: 7200             moveq      #$0, d1
00D8FA: 323c0030         move.w     #$30, d1
00D8FE: 3800             move.w     d0, d4
00D900: 4eb900000368     jsr        $368.l
00D906: 363900ffef90     move.w     $ffef90.l, d3
00D90C: 02430001         andi.w     #$1, d3
00D910: 66000006         bne.w      $d918
00D914: 323c0040         move.w     #$40, d1
00D918: 3004             move.w     d4, d0
00D91A: d1c1             adda.l     d1, a0
00D91C: 083000060000     btst.b     #$6, (a0, d0.w)
00D922: 67000016         beq.w      $d93a
00D926: 0c410030         cmpi.w     #$30, d1
00D92A: 6600000a         bne.w      $d936
00D92E: 41e80010         lea.l      $10(a0), a0
00D932: 60000006         bra.w      $d93a
00D936: 41e8fff0         lea.l      -$10(a0), a0
00D93A: 11bc00200000     move.b     #$20, (a0, d0.w)
00D940: 3d4200a4         move.w     d2, $a4(a6)
00D944: 1d7c000200a6     move.b     #$2, $a6(a6)
00D94A: 1e3c00b1         move.b     #$b1, d7
00D94E: 4ef900003d7a     jmp        $3d7a.l
00D954: 5242             addq.w     #$1, d2
00D956: 5440             addq.w     #$2, d0
00D958: b041             cmp.w      d1, d0
00D95A: 6f000006         ble.w      $d962
00D95E: 7000             moveq      #$0, d0
00D960: 7400             moveq      #$0, d2
00D962: 51cbff8c         dbra       d3, $d8f0
00D966: 426e004c         clr.w      $4c(a6)
00D96A: 4e75             rts        

; ==== sub_00D96C ТАБЛИЦА зовут=0 ====
00D96C: 1d7c00010098     move.b     #$1, $98(a6)
00D972: 526e006a         addq.w     #$1, $6a(a6)
00D976: 0c6e0020006a     cmpi.w     #$20, $6a(a6)
00D97C: 66000038         bne.w      $d9b6
00D980: 3e2e006c         move.w     $6c(a6), d7
00D984: 67000010         beq.w      $d996
00D988: 5347             subq.w     #$1, d7
00D98A: 0c470006         cmpi.w     #$6, d7
00D98E: 6d000006         blt.w      $d996
00D992: 3e3c0005         move.w     #$5, d7
00D996: de3900ff053a     add.b      $ff053a.l, d7
00D99C: 08ae000100cc     bclr.b     #$1, $cc(a6)
00D9A2: 67000006         beq.w      $d9aa
00D9A6: 1e3c00a1         move.b     #$a1, d7
00D9AA: 4eb900003d7a     jsr        $3d7a.l
00D9B0: 4ef90000dfae     jmp        $dfae.l
00D9B6: 0c6e0037006a     cmpi.w     #$37, $6a(a6)
00D9BC: 6600000c         bne.w      $d9ca
00D9C0: 3d7c0014004c     move.w     #$14, $4c(a6)
00D9C6: 422e009d         clr.b      $9d(a6)
00D9CA: 4e75             rts        

; ==== sub_00D9CC ТАБЛИЦА зовут=0 ====
00D9CC: 1d7c00010098     move.b     #$1, $98(a6)
00D9D2: 4a2e009d         tst.b      $9d(a6)
00D9D6: 67000008         beq.w      $d9e0
00D9DA: 422e009d         clr.b      $9d(a6)
00D9DE: 4e75             rts        
00D9E0: 4eb90000dc98     jsr        $dc98.l
00D9E6: 4a47             tst.w      d7
00D9E8: 66000008         bne.w      $d9f2
00D9EC: 3d7c000c004c     move.w     #$c, $4c(a6)
00D9F2: 4e75             rts        

; ==== sub_00D9F4 ТАБЛИЦА зовут=0 ====
00D9F4: 0c6e000d007e     cmpi.w     #$d, $7e(a6)
00D9FA: 66000020         bne.w      $da1c
00D9FE: 3d7c001c004c     move.w     #$1c, $4c(a6)
00DA04: 3d7c00060102     move.w     #$6, $102(a6)
00DA0A: 3d7c00080122     move.w     #$8, $122(a6)
00DA10: 3d7c000a0142     move.w     #$a, $142(a6)
00DA16: 426e006e         clr.w      $6e(a6)
00DA1A: 4e75             rts        
00DA1C: 536e005e         subq.w     #$1, $5e(a6)
00DA20: 67000004         beq.w      $da26
00DA24: 4e75             rts        
00DA26: 3d7c00060102     move.w     #$6, $102(a6)
00DA2C: 3d7c00080122     move.w     #$8, $122(a6)
00DA32: 3d7c000a0142     move.w     #$a, $142(a6)
00DA38: 426e006e         clr.w      $6e(a6)
00DA3C: 3d7c0004005e     move.w     #$4, $5e(a6)
00DA42: 526e007e         addq.w     #$1, $7e(a6)
00DA46: 06ae000000100084 addi.l     #$10, $84(a6)
00DA4E: 06ae000000100006 addi.l     #$10, $6(a6)
00DA56: 1d7c00010098     move.b     #$1, $98(a6)
00DA5C: 1e3900ff053b     move.b     $ff053b.l, d7
00DA62: 4eb900003d7a     jsr        $3d7a.l
00DA68: 4e75             rts        

; ---- ДАННЫЕ $00DA6A..$00DA6C (2 байт) ----


; ==== sub_00DA6C зовут=2 ====
00DA6C: 222e0044         move.l     $44(a6), d1
00DA70: 4a7900ff0418     tst.w      $ff0418.l
00DA76: 66000012         bne.w      $da8a
00DA7A: bdfc00ff1400     cmpa.l     #$ff1400, a6
00DA80: 66000008         bne.w      $da8a
00DA84: 223c00000800     move.l     #$800, d1
00DA8A: 102e0040         move.b     $40(a6), d0
00DA8E: 0200000c         andi.b     #$c, d0
00DA92: 6600002c         bne.w      $dac0
00DA96: 082e00010040     btst.b     #$1, $40(a6)
00DA9C: 67000022         beq.w      $dac0
00DAA0: 223c00010000     move.l     #$10000, d1
00DAA6: 4a7900ff0418     tst.w      $ff0418.l
00DAAC: 66000012         bne.w      $dac0
00DAB0: bdfc00ff1400     cmpa.l     #$ff1400, a6
00DAB6: 66000008         bne.w      $dac0
00DABA: 223900ff3224     move.l     $ff3224.l, d1
00DAC0: d3ad0002         add.l      d1, $2(a5)
00DAC4: d3ad0022         add.l      d1, $22(a5)
00DAC8: d3ad0042         add.l      d1, $42(a5)
00DACC: 4ef90000dbea     jmp        $dbea.l

; ==== sub_00DAD2 зовут=2 ====
00DAD2: 102e00ad         move.b     $ad(a6), d0
00DAD6: 012e0041         btst.l     d0, $41(a6)
00DADA: 67000030         beq.w      $db0c
00DADE: 1e3900ff0538     move.b     $ff0538.l, d7
00DAE4: 4eb900003d7a     jsr        $3d7a.l
00DAEA: 302d0040         move.w     $40(a5), d0
00DAEE: 3b6d00200040     move.w     $20(a5), $40(a5)
00DAF4: 3b6d00000020     move.w     $0(a5), $20(a5)
00DAFA: 3b400000         move.w     d0, $0(a5)
00DAFE: 4a6e0002         tst.w      $2(a6)
00DB02: 66000008         bne.w      $db0c
00DB06: 1d7c0001009c     move.b     #$1, $9c(a6)
00DB0C: 4e75             rts        

; ==== sub_00DB0E зовут=2 ====
00DB0E: 302e004a         move.w     $4a(a6), d0
00DB12: 41fa0008         lea.l      $db1c(pc), a0
00DB16: 20700000         movea.l    (a0, d0.w), a0
00DB1A: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $00DB1C..$00DB28 (12 байт) ----


; ==== sub_00DB28 ТАБЛИЦА зовут=0 ====
00DB28: 082e00020040     btst.b     #$2, $40(a6)
00DB2E: 67000012         beq.w      $db42
00DB32: 3d7c0004004a     move.w     #$4, $4a(a6)
00DB38: 3d7c00080048     move.w     #$8, $48(a6)
00DB3E: 60000066         bra.w      $dba6
00DB42: 082e00030040     btst.b     #$3, $40(a6)
00DB48: 67000012         beq.w      $db5c
00DB4C: 3d7c0008004a     move.w     #$8, $4a(a6)
00DB52: 3d7c00080048     move.w     #$8, $48(a6)
00DB58: 6000006c         bra.w      $dbc6
00DB5C: 4e75             rts        

; ==== sub_00DB5E ТАБЛИЦА зовут=0 ====
00DB5E: 082e00020040     btst.b     #$2, $40(a6)
00DB64: 66000008         bne.w      $db6e
00DB68: 426e004a         clr.w      $4a(a6)
00DB6C: 60ba             bra.b      $db28
00DB6E: 536e0048         subq.w     #$1, $48(a6)
00DB72: 6600000c         bne.w      $db80
00DB76: 3d7c00020048     move.w     #$2, $48(a6)
00DB7C: 60000028         bra.w      $dba6
00DB80: 4e75             rts        

; ==== sub_00DB82 ТАБЛИЦА зовут=0 ====
00DB82: 082e00030040     btst.b     #$3, $40(a6)
00DB88: 66000008         bne.w      $db92
00DB8C: 426e004a         clr.w      $4a(a6)
00DB90: 6096             bra.b      $db28
00DB92: 536e0048         subq.w     #$1, $48(a6)
00DB96: 6600000c         bne.w      $dba4
00DB9A: 3d7c00020048     move.w     #$2, $48(a6)
00DBA0: 60000024         bra.w      $dbc6
00DBA4: 4e75             rts        
00DBA6: 4a6e0042         tst.w      $42(a6)
00DBAA: 67000018         beq.w      $dbc4
00DBAE: 206e004e         movea.l    $4e(a6), a0
00DBB2: 4a68fffe         tst.w      -$2(a0)
00DBB6: 6600000c         bne.w      $dbc4
00DBBA: 536e0042         subq.w     #$1, $42(a6)
00DBBE: 4ef90000dbea     jmp        $dbea.l
00DBC4: 4e75             rts        
00DBC6: 302e0004         move.w     $4(a6), d0
00DBCA: b06e0042         cmp.w      $42(a6), d0
00DBCE: 67000018         beq.w      $dbe8
00DBD2: 206e004e         movea.l    $4e(a6), a0
00DBD6: 4a680002         tst.w      $2(a0)
00DBDA: 6600000c         bne.w      $dbe8
00DBDE: 526e0042         addq.w     #$1, $42(a6)
00DBE2: 4ef90000dbea     jmp        $dbea.l
00DBE8: 4e75             rts        

; ==== sub_00DBEA зовут=2 ====
00DBEA: 7000             moveq      #$0, d0
00DBEC: 322d0042         move.w     $42(a5), d1
00DBF0: 5241             addq.w     #$1, d1
00DBF2: 08810000         bclr.b     #$0, d1
00DBF6: 302e0042         move.w     $42(a6), d0
00DBFA: d040             add.w      d0, d0
00DBFC: e741             asl.w      #$3, d1
00DBFE: d041             add.w      d1, d0
00DC00: 49ee0200         lea.l      $200(a6), a4
00DC04: d08c             add.l      a4, d0
00DC06: 7200             moveq      #$0, d1
00DC08: 322e007e         move.w     $7e(a6), d1
00DC0C: e941             asl.w      #$4, d1
00DC0E: d081             add.l      d1, d0
00DC10: 2d40004e         move.l     d0, $4e(a6)
00DC14: 4e75             rts        
00DC16: 286e004e         movea.l    $4e(a6), a4
00DC1A: 4a54             tst.w      (a4)
00DC1C: 6600f902         bne.w      $d520
00DC20: 082d00000043     btst.b     #$0, $43(a5)
00DC26: 67000004         beq.w      $dc2c
00DC2A: 4e75             rts        
00DC2C: 4a6c0010         tst.w      $10(a4)
00DC30: 66000004         bne.w      $dc36
00DC34: 4e75             rts        
00DC36: 3d7c00280052     move.w     #$28, $52(a6)
00DC3C: 3d7c0008004c     move.w     #$8, $4c(a6)
00DC42: 4a7900ff0418     tst.w      $ff0418.l
00DC48: 6600002a         bne.w      $dc74
00DC4C: bdfc00ff1400     cmpa.l     #$ff1400, a6
00DC52: 66000020         bne.w      $dc74
00DC56: 4eb9000138d2     jsr        $138d2.l
00DC5C: 0c400002         cmpi.w     #$2, d0
00DC60: 66000012         bne.w      $dc74
00DC64: 13fc000800ff322b move.b     #$8, $ff322b.l
00DC6C: 33fc001000ff3222 move.w     #$10, $ff3222.l
00DC74: 1e3900ff0539     move.b     $ff0539.l, d7
00DC7A: 4ef900003d7a     jmp        $3d7a.l

; ==== sub_00DC80 зовут=3 ====
00DC80: 242e0056         move.l     $56(a6), d2
00DC84: e582             asl.l      #$2, d2
00DC86: d4ae0056         add.l      $56(a6), d2
00DC8A: 068275317531     addi.l     #$75317531, d2
00DC90: 2d420056         move.l     d2, $56(a6)
00DC94: 4842             swap       d2
00DC96: 4e75             rts        

; ==== sub_00DC98 зовут=1 ====
00DC98: 4a6e0002         tst.w      $2(a6)
00DC9C: 6600005c         bne.w      $dcfa
00DCA0: 1d7c0001009d     move.b     #$1, $9d(a6)
00DCA6: 7e00             moveq      #$0, d7
00DCA8: 41ee0320         lea.l      $320(a6), a0
00DCAC: 342e0004         move.w     $4(a6), d2
00DCB0: 322e001a         move.w     $1a(a6), d1
00DCB4: 5641             addq.w     #$3, d1
00DCB6: 2248             movea.l    a0, a1
00DCB8: 6100000c         bsr.w      $dcc6
00DCBC: 2049             movea.l    a1, a0
00DCBE: 5448             addq.w     #$2, a0
00DCC0: 51caffee         dbra       d2, $dcb0
00DCC4: 4e75             rts        

; ==== sub_00DCC6 зовут=1 ====
00DCC6: 4a680010         tst.w      $10(a0)
00DCCA: 66000024         bne.w      $dcf0
00DCCE: 08900000         bclr.b     #$0, (a0)
00DCD2: 4a50             tst.w      (a0)
00DCD4: 6700001a         beq.w      $dcf0
00DCD8: 7e01             moveq      #$1, d7
00DCDA: 31500010         move.w     (a0), $10(a0)
00DCDE: 4250             clr.w      (a0)
00DCE0: 006801000010     ori.w      #$100, $10(a0)
00DCE6: 90fc0010         suba.w     #$10, a0
00DCEA: 51c9ffe2         dbra       d1, $dcce
00DCEE: 4e75             rts        
00DCF0: 90fc0010         suba.w     #$10, a0
00DCF4: 51c9ffd0         dbra       d1, $dcc6
00DCF8: 4e75             rts        
00DCFA: 7e00             moveq      #$0, d7
00DCFC: 41ee0320         lea.l      $320(a6), a0
00DD00: 342e0004         move.w     $4(a6), d2
00DD04: 322e001a         move.w     $1a(a6), d1
00DD08: 5641             addq.w     #$3, d1
00DD0A: 2248             movea.l    a0, a1
00DD0C: 6100000c         bsr.w      $dd1a
00DD10: 2049             movea.l    a1, a0
00DD12: 5448             addq.w     #$2, a0
00DD14: 51caffee         dbra       d2, $dd04
00DD18: 4e75             rts        

; ==== sub_00DD1A зовут=1 ====
00DD1A: 4a680010         tst.w      $10(a0)
00DD1E: 6600001a         bne.w      $dd3a
00DD22: 4a50             tst.w      (a0)
00DD24: 67000014         beq.w      $dd3a
00DD28: 7e01             moveq      #$1, d7
00DD2A: 31500010         move.w     (a0), $10(a0)
00DD2E: 4250             clr.w      (a0)
00DD30: 90fc0010         suba.w     #$10, a0
00DD34: 51c9ffec         dbra       d1, $dd22
00DD38: 4e75             rts        
00DD3A: 90fc0010         suba.w     #$10, a0
00DD3E: 51c9ffda         dbra       d1, $dd1a
00DD42: 4e75             rts        

; ==== sub_00DD44 зовут=2 ====
00DD44: 286e0006         movea.l    $6(a6), a4
00DD48: 49ecfff0         lea.l      -$10(a4), a4
00DD4C: 302e0004         move.w     $4(a6), d0
00DD50: 7e00             moveq      #$0, d7
00DD52: 8e5c             or.w       (a4)+, d7
00DD54: 51c8fffc         dbra       d0, $dd52
00DD58: 4a47             tst.w      d7
00DD5A: 67000028         beq.w      $dd84
00DD5E: 286e0006         movea.l    $6(a6), a4
00DD62: 7205             moveq      #$5, d1
00DD64: 0c2c00070001     cmpi.b     #$7, $1(a4)
00DD6A: 6c00000c         bge.w      $dd78
00DD6E: 49ec0002         lea.l      $2(a4), a4
00DD72: 51c9fff0         dbra       d1, $dd64
00DD76: 4e75             rts        
00DD78: 0c2c00090001     cmpi.b     #$9, $1(a4)
00DD7E: 6e000004         bgt.w      $dd84
00DD82: 7e00             moveq      #$0, d7
00DD84: 4e75             rts        

; ==== sub_00DD86 зовут=1 ====
00DD86: 426e004c         clr.w      $4c(a6)

; ==== sub_00DD8A зовут=2 ====
00DD8A: 3d7c00010074     move.w     #$1, $74(a6)
00DD90: 1e3c00c0         move.b     #$c0, d7
00DD94: 4eb900003d7a     jsr        $3d7a.l
00DD9A: 4a7900ff0418     tst.w      $ff0418.l
00DDA0: 66000012         bne.w      $ddb4
00DDA4: bdfc00ff1400     cmpa.l     #$ff1400, a6
00DDAA: 66000008         bne.w      $ddb4
00DDAE: 427900ff3222     clr.w      $ff3222.l
00DDB4: 422e008a         clr.b      $8a(a6)
00DDB8: 4a6e00f6         tst.w      $f6(a6)
00DDBC: 67000008         beq.w      $ddc6
00DDC0: 1d7c0001008a     move.b     #$1, $8a(a6)
00DDC6: 206e000e         movea.l    $e(a6), a0
00DDCA: 43e80048         lea.l      $48(a0), a1
00DDCE: 4bee0100         lea.l      $100(a6), a5
00DDD2: 4a6e0002         tst.w      $2(a6)
00DDD6: 6600000c         bne.w      $dde4
00DDDA: 006805000002     ori.w      #$500, $2(a0)
00DDE0: 422e009c         clr.b      $9c(a6)
00DDE4: 7402             moveq      #$2, d2
00DDE6: 7000             moveq      #$0, d0
00DDE8: 3018             move.w     (a0)+, d0
00DDEA: 32c0             move.w     d0, (a1)+
00DDEC: 4840             swap       d0
00DDEE: 2b40000a         move.l     d0, $a(a5)
00DDF2: 3018             move.w     (a0)+, d0
00DDF4: 0240ff00         andi.w     #$ff00, d0
00DDF8: 3211             move.w     (a1), d1
00DDFA: 024100ff         andi.w     #$ff, d1
00DDFE: 8240             or.w       d0, d1
00DE00: 32c1             move.w     d1, (a1)+
00DE02: 32d8             move.w     (a0)+, (a1)+
00DE04: 7000             moveq      #$0, d0
00DE06: 3018             move.w     (a0)+, d0
00DE08: 32c0             move.w     d0, (a1)+
00DE0A: 4840             swap       d0
00DE0C: 2b400006         move.l     d0, $6(a5)
00DE10: 4bed0020         lea.l      $20(a5), a5
00DE14: 51caffd0         dbra       d2, $dde6
00DE18: 4bee0100         lea.l      $100(a6), a5
00DE1C: 2b7c00000000000e move.l     #$0, $e(a5)
00DE24: 2b7cffff2000002e move.l     #$ffff2000, $2e(a5)
00DE2C: 2b7c0000e000004e move.l     #$e000, $4e(a5)
00DE34: 4a6e0002         tst.w      $2(a6)
00DE38: 67000012         beq.w      $de4c
00DE3C: 2b7cffff9000002e move.l     #$ffff9000, $2e(a5)
00DE44: 2b7c00007000004e move.l     #$7000, $4e(a5)
00DE4C: 2b7cfffdc0000012 move.l     #$fffdc000, $12(a5)
00DE54: 2b7cfffdc0000032 move.l     #$fffdc000, $32(a5)
00DE5C: 2b7cfffdc0000052 move.l     #$fffdc000, $52(a5)
00DE64: 3b7c00060002     move.w     #$6, $2(a5)
00DE6A: 3b7c00080022     move.w     #$8, $22(a5)
00DE70: 3b7c000a0042     move.w     #$a, $42(a5)
00DE76: 08ad00060000     bclr.b     #$6, $0(a5)
00DE7C: 6700000a         beq.w      $de88
00DE80: 426e0094         clr.w      $94(a6)
00DE84: 60000022         bra.w      $dea8
00DE88: 08ad00060020     bclr.b     #$6, $20(a5)
00DE8E: 6700000a         beq.w      $de9a
00DE92: 426e0094         clr.w      $94(a6)
00DE96: 60000010         bra.w      $dea8
00DE9A: 08ad00060040     bclr.b     #$6, $40(a5)
00DEA0: 67000006         beq.w      $dea8
00DEA4: 426e0094         clr.w      $94(a6)
00DEA8: 426e006e         clr.w      $6e(a6)
00DEAC: 4a7900ff0418     tst.w      $ff0418.l
00DEB2: 66000016         bne.w      $deca
00DEB6: bdfc00ff1400     cmpa.l     #$ff1400, a6
00DEBC: 6600000c         bne.w      $deca
00DEC0: 33f900ff302a00ff3040 move.w     $ff302a.l, $ff3040.l
00DECA: 4e75             rts        

; ==== sub_00DECC зовут=1 ====
00DECC: 41ee0260         lea.l      $260(a6), a0
00DED0: 43f900ff0e00     lea.l      $ff0e00.l, a1
00DED6: 303c000d         move.w     #$d, d0
00DEDA: 22d8             move.l     (a0)+, (a1)+
00DEDC: 22d8             move.l     (a0)+, (a1)+
00DEDE: 22d8             move.l     (a0)+, (a1)+
00DEE0: 22d8             move.l     (a0)+, (a1)+
00DEE2: 51c8fff6         dbra       d0, $deda
00DEE6: 4a6e007e         tst.w      $7e(a6)
00DEEA: 6700001a         beq.w      $df06
00DEEE: 41f900ff0e00     lea.l      $ff0e00.l, a0
00DEF4: 3e2e007e         move.w     $7e(a6), d7
00DEF8: 5347             subq.w     #$1, d7
00DEFA: 4298             clr.l      (a0)+
00DEFC: 4298             clr.l      (a0)+
00DEFE: 4298             clr.l      (a0)+
00DF00: 2018             move.l     (a0)+, d0
00DF02: 51cffff6         dbra       d7, $defa
00DF06: 302e005c         move.w     $5c(a6), d0
00DF0A: 3f00             move.w     d0, -(a7)
00DF0C: 4eb90000e14e     jsr        $e14e.l
00DF12: 4eb90000e2ce     jsr        $e2ce.l
00DF18: 4eb90000e380     jsr        $e380.l
00DF1E: 4eb90000e4ee     jsr        $e4ee.l
00DF24: 301f             move.w     (a7)+, d0
00DF26: 322e005c         move.w     $5c(a6), d1
00DF2A: 9240             sub.w      d0, d1
00DF2C: 0c410004         cmpi.w     #$4, d1
00DF30: 6d000006         blt.w      $df38
00DF34: 3d41009e         move.w     d1, $9e(a6)
00DF38: 4a2e00a8         tst.b      $a8(a6)
00DF3C: 6700001e         beq.w      $df5c
00DF40: 206e0028         movea.l    $28(a6), a0
00DF44: 4eb90000ef2c     jsr        $ef2c.l
00DF4A: b1ee0024         cmpa.l     $24(a6), a0
00DF4E: 6700000c         beq.w      $df5c
00DF52: 206e0024         movea.l    $24(a6), a0
00DF56: 4eb90000ef2c     jsr        $ef2c.l
00DF5C: 422e00a8         clr.b      $a8(a6)
00DF60: 4e75             rts        

; ==== sub_00DF62 зовут=1 ====
00DF62: 4a6e0076         tst.w      $76(a6)
00DF66: 67000004         beq.w      $df6c
00DF6A: 4e75             rts        
00DF6C: 4a6e006c         tst.w      $6c(a6)
00DF70: 6700000e         beq.w      $df80
00DF74: 3f02             move.w     d2, -(a7)
00DF76: 342e006c         move.w     $6c(a6), d2
00DF7A: e542             asl.w      #$2, d2
00DF7C: d242             add.w      d2, d1
00DF7E: 341f             move.w     (a7)+, d2
00DF80: d36e005a         add.w      d1, $5a(a6)
00DF84: 0c6e001e005a     cmpi.w     #$1e, $5a(a6)
00DF8A: 6f000008         ble.w      $df94
00DF8E: 3d7c001e005a     move.w     #$1e, $5a(a6)
00DF94: d56e005c         add.w      d2, $5c(a6)
00DF98: d56e008c         add.w      d2, $8c(a6)
00DF9C: 0c6e270f005c     cmpi.w     #$270f, $5c(a6)
00DFA2: 6f000008         ble.w      $dfac
00DFA6: 3d7c270f005c     move.w     #$270f, $5c(a6)
00DFAC: 4e75             rts        

; ==== sub_00DFAE зовут=8 ====
00DFAE: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
00DFB6: 670000be         beq.w      $e076
00DFBA: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
00DFC2: 670000b2         beq.w      $e076
00DFC6: 0c79003c00ff0406 cmpi.w     #$3c, $ff0406.l
00DFCE: 66000022         bne.w      $dff2
00DFD2: 206e0016         movea.l    $16(a6), a0
00DFD6: 4290             clr.l      (a0)
00DFD8: 42a80080         clr.l      $80(a0)
00DFDC: 4a3900ff0426     tst.b      $ff0426.l
00DFE2: 67000004         beq.w      $dfe8
00DFE6: 4e75             rts        
00DFE8: 206e0020         movea.l    $20(a6), a0
00DFEC: 42a0             clr.l      -(a0)
00DFEE: 42a0             clr.l      -(a0)
00DFF0: 4e75             rts        
00DFF2: 7000             moveq      #$0, d0
00DFF4: 302e005a         move.w     $5a(a6), d0
00DFF8: 206e0016         movea.l    $16(a6), a0
00DFFC: 81fc000a         divs.w     #$a, d0
00E000: 4a40             tst.w      d0
00E002: 6600000e         bne.w      $e012
00E006: 7200             moveq      #$0, d1
00E008: 3081             move.w     d1, (a0)
00E00A: 31410080         move.w     d1, $80(a0)
00E00E: 60000010         bra.w      $e020
00E012: e340             asl.w      #$1, d0
00E014: 06400010         addi.w     #$10, d0
00E018: 3080             move.w     d0, (a0)
00E01A: 5240             addq.w     #$1, d0
00E01C: 31400080         move.w     d0, $80(a0)
00E020: 4840             swap       d0
00E022: e340             asl.w      #$1, d0
00E024: 06400010         addi.w     #$10, d0
00E028: 31400002         move.w     d0, $2(a0)
00E02C: 5240             addq.w     #$1, d0
00E02E: 31400082         move.w     d0, $82(a0)
00E032: 4a3900ff0426     tst.b      $ff0426.l
00E038: 67000004         beq.w      $e03e
00E03C: 4e75             rts        
00E03E: 206e0020         movea.l    $20(a6), a0
00E042: 4268fffe         clr.w      -$2(a0)
00E046: 4268fffc         clr.w      -$4(a0)
00E04A: 4268fffa         clr.w      -$6(a0)
00E04E: 4268fff8         clr.w      -$8(a0)
00E052: 7000             moveq      #$0, d0
00E054: 302e005c         move.w     $5c(a6), d0
00E058: 81fc000a         divs.w     #$a, d0
00E05C: 4840             swap       d0
00E05E: 06400026         addi.w     #$26, d0
00E062: 3100             move.w     d0, -(a0)
00E064: 4840             swap       d0
00E066: 4a40             tst.w      d0
00E068: 66000004         bne.w      $e06e
00E06C: 4e75             rts        
00E06E: 02800000ffff     andi.l     #$ffff, d0
00E074: 60e2             bra.b      $e058
00E076: 7e00             moveq      #$0, d7
00E078: 2c2e0030         move.l     $30(a6), d6
00E07C: 67000006         beq.w      $e084
00E080: 2246             movea.l    d6, a1
00E082: 7e01             moveq      #$1, d7
00E084: 7000             moveq      #$0, d0
00E086: 302e005a         move.w     $5a(a6), d0
00E08A: 206e0016         movea.l    $16(a6), a0
00E08E: 81fc000a         divs.w     #$a, d0
00E092: 4a40             tst.w      d0
00E094: 66000012         bne.w      $e0a8
00E098: 7200             moveq      #$0, d1
00E09A: 3081             move.w     d1, (a0)
00E09C: 4a47             tst.w      d7
00E09E: 67000024         beq.w      $e0c4
00E0A2: 3281             move.w     d1, (a1)
00E0A4: 6000001e         bra.w      $e0c4
00E0A8: 4a47             tst.w      d7
00E0AA: 6600000e         bne.w      $e0ba
00E0AE: e340             asl.w      #$1, d0
00E0B0: 06400010         addi.w     #$10, d0
00E0B4: 3080             move.w     d0, (a0)
00E0B6: 6000000c         bra.w      $e0c4
00E0BA: e340             asl.w      #$1, d0
00E0BC: 06400010         addi.w     #$10, d0
00E0C0: 3080             move.w     d0, (a0)
00E0C2: 3280             move.w     d0, (a1)
00E0C4: 4a47             tst.w      d7
00E0C6: 66000010         bne.w      $e0d8
00E0CA: 4840             swap       d0
00E0CC: e340             asl.w      #$1, d0
00E0CE: 06400010         addi.w     #$10, d0
00E0D2: 31400008         move.w     d0, $8(a0)
00E0D6: 4e75             rts        
00E0D8: 4840             swap       d0
00E0DA: e340             asl.w      #$1, d0
00E0DC: 06400010         addi.w     #$10, d0
00E0E0: 31400008         move.w     d0, $8(a0)
00E0E4: 33400008         move.w     d0, $8(a1)
00E0E8: 4e75             rts        

; ==== sub_00E0EA зовут=11 ====
00E0EA: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00E0EE: 4a2e00a6         tst.b      $a6(a6)
00E0F2: 6600002a         bne.w      $e11e
00E0F6: 08070004         btst.b     #$4, d7
00E0FA: 67000022         beq.w      $e11e
00E0FE: 4a7900ff0418     tst.w      $ff0418.l
00E104: 67000042         beq.w      $e148
00E108: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
00E110: 67000036         beq.w      $e148
00E114: 1d7c000100a6     move.b     #$1, $a6(a6)
00E11A: 6000002c         bra.w      $e148
00E11E: 08070006         btst.b     #$6, d7
00E122: 67000010         beq.w      $e134
00E126: 426e0094         clr.w      $94(a6)
00E12A: 08ee000000a8     bset.b     #$0, $a8(a6)
00E130: 60000016         bra.w      $e148
00E134: 08070005         btst.b     #$5, d7
00E138: 6700000e         beq.w      $e148
00E13C: 08ee000100a8     bset.b     #$1, $a8(a6)
00E142: 1d7c000300a6     move.b     #$3, $a6(a6)
00E148: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00E14C: 4e75             rts        

; ==== sub_00E14E зовут=1 ====
00E14E: 41ee0200         lea.l      $200(a6), a0
00E152: 41e80060         lea.l      $60(a0), a0
00E156: 43f900ff0e00     lea.l      $ff0e00.l, a1
00E15C: 48e700c0         movem.l    a0-a1, -(a7)
00E160: 4eb90000e17a     jsr        $e17a.l
00E166: 4cdf0300         movem.l    (a7)+, a0-a1
00E16A: 41e80010         lea.l      $10(a0), a0
00E16E: 43e90010         lea.l      $10(a1), a1
00E172: 10280001         move.b     $1(a0), d0
00E176: 6ae4             bpl.b      $e15c
00E178: 4e75             rts        

; ==== sub_00E17A зовут=1 ====
00E17A: 10290001         move.b     $1(a1), d0
00E17E: 670000ca         beq.w      $e24a
00E182: b0290003         cmp.b      $3(a1), d0
00E186: 660000c2         bne.w      $e24a
00E18A: b0290005         cmp.b      $5(a1), d0
00E18E: 660000ba         bne.w      $e24a
00E192: b0290007         cmp.b      $7(a1), d0
00E196: 67000014         beq.w      $e1ac
00E19A: 7203             moveq      #$3, d1
00E19C: 7401             moveq      #$1, d2
00E19E: 4eb90000e204     jsr        $e204.l
00E1A4: 5848             addq.w     #$4, a0
00E1A6: 5849             addq.w     #$4, a1
00E1A8: 600000fc         bra.w      $e2a6
00E1AC: 7206             moveq      #$6, d1
00E1AE: 7402             moveq      #$2, d2
00E1B0: b0290009         cmp.b      $9(a1), d0
00E1B4: 6600003a         bne.w      $e1f0
00E1B8: 7209             moveq      #$9, d1
00E1BA: 7403             moveq      #$3, d2
00E1BC: b029000b         cmp.b      $b(a1), d0
00E1C0: 6600001a         bne.w      $e1dc
00E1C4: 720c             moveq      #$c, d1
00E1C6: 7404             moveq      #$4, d2
00E1C8: 3f07             move.w     d7, -(a7)
00E1CA: 1e28000a         move.b     $a(a0), d7
00E1CE: 4eb90000e0ea     jsr        $e0ea.l
00E1D4: 3e1f             move.w     (a7)+, d7
00E1D6: 08e80007000a     bset.b     #$7, $a(a0)
00E1DC: 3f07             move.w     d7, -(a7)
00E1DE: 1e280008         move.b     $8(a0), d7
00E1E2: 4eb90000e0ea     jsr        $e0ea.l
00E1E8: 3e1f             move.w     (a7)+, d7
00E1EA: 08e800070008     bset.b     #$7, $8(a0)
00E1F0: 3f07             move.w     d7, -(a7)
00E1F2: 1e280006         move.b     $6(a0), d7
00E1F6: 4eb90000e0ea     jsr        $e0ea.l
00E1FC: 3e1f             move.w     (a7)+, d7
00E1FE: 08e800070006     bset.b     #$7, $6(a0)

; ==== sub_00E204 зовут=1 ====
00E204: 3f07             move.w     d7, -(a7)
00E206: 1e280004         move.b     $4(a0), d7
00E20A: 4eb90000e0ea     jsr        $e0ea.l
00E210: 3e1f             move.w     (a7)+, d7
00E212: 08e800070004     bset.b     #$7, $4(a0)
00E218: 3f07             move.w     d7, -(a7)
00E21A: 1e280002         move.b     $2(a0), d7
00E21E: 4eb90000e0ea     jsr        $e0ea.l
00E224: 3e1f             move.w     (a7)+, d7
00E226: 08e800070002     bset.b     #$7, $2(a0)
00E22C: 3f07             move.w     d7, -(a7)
00E22E: 1e10             move.b     (a0), d7
00E230: 4eb90000e0ea     jsr        $e0ea.l
00E236: 3e1f             move.w     (a7)+, d7
00E238: 08e800070000     bset.b     #$7, $0(a0)
00E23E: 3d7c0010004c     move.w     #$10, $4c(a6)
00E244: 4ef90000df62     jmp        $df62.l
00E24A: 5448             addq.w     #$2, a0
00E24C: 5449             addq.w     #$2, a1
00E24E: 10290001         move.b     $1(a1), d0
00E252: 67000024         beq.w      $e278
00E256: b0290003         cmp.b      $3(a1), d0
00E25A: 6600001c         bne.w      $e278
00E25E: b0290005         cmp.b      $5(a1), d0
00E262: 66000014         bne.w      $e278
00E266: b0290007         cmp.b      $7(a1), d0
00E26A: 6700ff40         beq.w      $e1ac
00E26E: 7203             moveq      #$3, d1
00E270: 7401             moveq      #$1, d2
00E272: 4ef90000e204     jmp        $e204.l
00E278: 5448             addq.w     #$2, a0
00E27A: 5449             addq.w     #$2, a1
00E27C: 10290001         move.b     $1(a1), d0
00E280: 67000024         beq.w      $e2a6
00E284: b0290003         cmp.b      $3(a1), d0
00E288: 6600001c         bne.w      $e2a6
00E28C: b0290005         cmp.b      $5(a1), d0
00E290: 66000014         bne.w      $e2a6
00E294: b0290007         cmp.b      $7(a1), d0
00E298: 6700ff12         beq.w      $e1ac
00E29C: 7203             moveq      #$3, d1
00E29E: 7401             moveq      #$1, d2
00E2A0: 4ef90000e204     jmp        $e204.l
00E2A6: 5448             addq.w     #$2, a0
00E2A8: 5449             addq.w     #$2, a1
00E2AA: 10290001         move.b     $1(a1), d0
00E2AE: 6700001c         beq.w      $e2cc
00E2B2: b0290003         cmp.b      $3(a1), d0
00E2B6: 66000014         bne.w      $e2cc
00E2BA: b0290005         cmp.b      $5(a1), d0
00E2BE: 6600000c         bne.w      $e2cc
00E2C2: 7203             moveq      #$3, d1
00E2C4: 7401             moveq      #$1, d2
00E2C6: 4ef90000e204     jmp        $e204.l
00E2CC: 4e75             rts        

; ==== sub_00E2CE зовут=1 ====
00E2CE: 41ee0260         lea.l      $260(a6), a0
00E2D2: 43f900ff0e00     lea.l      $ff0e00.l, a1
00E2D8: 3e2e0004         move.w     $4(a6), d7
00E2DC: 6100000c         bsr.w      $e2ea
00E2E0: 5448             addq.w     #$2, a0
00E2E2: 5449             addq.w     #$2, a1
00E2E4: 51cffff6         dbra       d7, $e2dc
00E2E8: 4e75             rts        

; ==== sub_00E2EA зовут=1 ====
00E2EA: 7000             moveq      #$0, d0
00E2EC: 7210             moveq      #$10, d1
00E2EE: 7c01             moveq      #$1, d6
00E2F0: 14310001         move.b     $1(a1, d0.w), d2
00E2F4: 67000018         beq.w      $e30e
00E2F8: 6a000004         bpl.w      $e2fe
00E2FC: 4e75             rts        
00E2FE: b4311001         cmp.b      $1(a1, d1.w), d2
00E302: 6600000a         bne.w      $e30e
00E306: 5246             addq.w     #$1, d6
00E308: 06410010         addi.w     #$10, d1
00E30C: 60e2             bra.b      $e2f0
00E30E: 0c060003         cmpi.b     #$3, d6
00E312: 6d000046         blt.w      $e35a
00E316: 48e74000         movem.l    d1, -(a7)
00E31A: 7200             moveq      #$0, d1
00E31C: 7400             moveq      #$0, d2
00E31E: 45fa0044         lea.l      $e364(pc), a2
00E322: 12326000         move.b     (a2, d6.w), d1
00E326: 45fa004a         lea.l      $e372(pc), a2
00E32A: 14326000         move.b     (a2, d6.w), d2
00E32E: 4eb90000df62     jsr        $df62.l
00E334: 4cdf0002         movem.l    (a7)+, d1
00E338: 3d7c0010004c     move.w     #$10, $4c(a6)
00E33E: 3f07             move.w     d7, -(a7)
00E340: 1e300000         move.b     (a0, d0.w), d7
00E344: 4eb90000e0ea     jsr        $e0ea.l
00E34A: 3e1f             move.w     (a7)+, d7
00E34C: 08f000070000     bset.b     #$7, (a0, d0.w)
00E352: 06400010         addi.w     #$10, d0
00E356: 5346             subq.w     #$1, d6
00E358: 66e4             bne.b      $e33e
00E35A: 3001             move.w     d1, d0
00E35C: 06410010         addi.w     #$10, d1
00E360: 608c             bra.b      $e2ee

; ---- ДАННЫЕ $00E362..$00E380 (30 байт) ----


; ==== sub_00E380 зовут=1 ====
00E380: 0c6e00050004     cmpi.w     #$5, $4(a6)
00E386: 67000016         beq.w      $e39e
00E38A: 0c6e00040004     cmpi.w     #$4, $4(a6)
00E390: 67000028         beq.w      $e3ba
00E394: 0c6e00030004     cmpi.w     #$3, $4(a6)
00E39A: 6700003a         beq.w      $e3d6
00E39E: 41ee0200         lea.l      $200(a6), a0
00E3A2: 41e80060         lea.l      $60(a0), a0
00E3A6: 5c48             addq.w     #$6, a0
00E3A8: 43f900ff0e06     lea.l      $ff0e06.l, a1
00E3AE: 45f900ff0e18     lea.l      $ff0e18.l, a2
00E3B4: 4eb90000e42c     jsr        $e42c.l
00E3BA: 41ee0200         lea.l      $200(a6), a0
00E3BE: 41e80060         lea.l      $60(a0), a0
00E3C2: 5848             addq.w     #$4, a0
00E3C4: 43f900ff0e04     lea.l      $ff0e04.l, a1
00E3CA: 45f900ff0e16     lea.l      $ff0e16.l, a2
00E3D0: 4eb90000e42c     jsr        $e42c.l
00E3D6: 41ee0200         lea.l      $200(a6), a0
00E3DA: 41e80060         lea.l      $60(a0), a0
00E3DE: 5448             addq.w     #$2, a0
00E3E0: 43f900ff0e02     lea.l      $ff0e02.l, a1
00E3E6: 45f900ff0e14     lea.l      $ff0e14.l, a2
00E3EC: 4eb90000e42c     jsr        $e42c.l
00E3F2: 3e2e001a         move.w     $1a(a6), d7
00E3F6: 5547             subq.w     #$2, d7
00E3F8: 41ee0200         lea.l      $200(a6), a0
00E3FC: 41e80060         lea.l      $60(a0), a0
00E400: 43f900ff0e00     lea.l      $ff0e00.l, a1
00E406: 45f900ff0e12     lea.l      $ff0e12.l, a2
00E40C: 48e700e0         movem.l    a0-a2, -(a7)
00E410: 4eb90000e42c     jsr        $e42c.l
00E416: 4cdf0700         movem.l    (a7)+, a0-a2
00E41A: d0fc0010         adda.w     #$10, a0
00E41E: d2fc0010         adda.w     #$10, a1
00E422: d4fc0010         adda.w     #$10, a2
00E426: 51cfffe4         dbra       d7, $e40c
00E42A: 4e75             rts        

; ==== sub_00E42C зовут=4 ====
00E42C: 7c01             moveq      #$1, d6
00E42E: 10290001         move.b     $1(a1), d0
00E432: 6700005c         beq.w      $e490
00E436: 6b000058         bmi.w      $e490
00E43A: b02a0001         cmp.b      $1(a2), d0
00E43E: 66000012         bne.w      $e452
00E442: 5246             addq.w     #$1, d6
00E444: d4fc0012         adda.w     #$12, a2
00E448: 122a0001         move.b     $1(a2), d1
00E44C: 6b000072         bmi.w      $e4c0
00E450: 60e8             bra.b      $e43a
00E452: 0c460003         cmpi.w     #$3, d6
00E456: 6d000038         blt.w      $e490
00E45A: 4eb90000e4a6     jsr        $e4a6.l
00E460: 3a06             move.w     d6, d5
00E462: 7200             moveq      #$0, d1
00E464: 3f07             move.w     d7, -(a7)
00E466: 1e301000         move.b     (a0, d1.w), d7
00E46A: 4eb90000e0ea     jsr        $e0ea.l
00E470: 3e1f             move.w     (a7)+, d7
00E472: 08f000071000     bset.b     #$7, (a0, d1.w)
00E478: 06410012         addi.w     #$12, d1
00E47C: 5345             subq.w     #$1, d5
00E47E: 66e4             bne.b      $e464
00E480: 3d7c0010004c     move.w     #$10, $4c(a6)
00E486: 0c460003         cmpi.w     #$3, d6
00E48A: 67000004         beq.w      $e490
00E48E: 4e75             rts        
00E490: 323c0012         move.w     #$12, d1
00E494: d0c1             adda.w     d1, a0
00E496: 5346             subq.w     #$1, d6
00E498: 66fa             bne.b      $e494
00E49A: 224a             movea.l    a2, a1
00E49C: d4c1             adda.w     d1, a2
00E49E: 122a0001         move.b     $1(a2), d1
00E4A2: 6a88             bpl.b      $e42c
00E4A4: 4e75             rts        

; ==== sub_00E4A6 зовут=4 ====
00E4A6: 7200             moveq      #$0, d1
00E4A8: 7400             moveq      #$0, d2
00E4AA: 47fafeb8         lea.l      $e364(pc), a3
00E4AE: 12336000         move.b     (a3, d6.w), d1
00E4B2: 47fafebe         lea.l      $e372(pc), a3
00E4B6: 14336000         move.b     (a3, d6.w), d2
00E4BA: 4ef90000df62     jmp        $df62.l
00E4C0: 0c460003         cmpi.w     #$3, d6
00E4C4: 6d000026         blt.w      $e4ec
00E4C8: 4eb90000e4a6     jsr        $e4a6.l
00E4CE: 3f07             move.w     d7, -(a7)
00E4D0: 1e10             move.b     (a0), d7
00E4D2: 4eb90000e0ea     jsr        $e0ea.l
00E4D8: 3e1f             move.w     (a7)+, d7
00E4DA: 08d00007         bset.b     #$7, (a0)
00E4DE: d0fc0012         adda.w     #$12, a0
00E4E2: 5346             subq.w     #$1, d6
00E4E4: 66e8             bne.b      $e4ce
00E4E6: 3d7c0010004c     move.w     #$10, $4c(a6)
00E4EC: 4e75             rts        

; ==== sub_00E4EE зовут=1 ====
00E4EE: 0c6e00050004     cmpi.w     #$5, $4(a6)
00E4F4: 67000016         beq.w      $e50c
00E4F8: 0c6e00040004     cmpi.w     #$4, $4(a6)
00E4FE: 67000022         beq.w      $e522
00E502: 0c6e00030004     cmpi.w     #$3, $4(a6)
00E508: 6700002e         beq.w      $e538
00E50C: 41ee0326         lea.l      $326(a6), a0
00E510: 43f900ff0ec6     lea.l      $ff0ec6.l, a1
00E516: 45f900ff0eb8     lea.l      $ff0eb8.l, a2
00E51C: 4eb90000e584     jsr        $e584.l
00E522: 41ee0324         lea.l      $324(a6), a0
00E526: 43f900ff0ec4     lea.l      $ff0ec4.l, a1
00E52C: 45f900ff0eb6     lea.l      $ff0eb6.l, a2
00E532: 4eb90000e584     jsr        $e584.l
00E538: 41ee0322         lea.l      $322(a6), a0
00E53C: 43f900ff0ec2     lea.l      $ff0ec2.l, a1
00E542: 45f900ff0eb4     lea.l      $ff0eb4.l, a2
00E548: 4eb90000e584     jsr        $e584.l
00E54E: 3e2e001a         move.w     $1a(a6), d7
00E552: 5547             subq.w     #$2, d7
00E554: 41ee0320         lea.l      $320(a6), a0
00E558: 43f900ff0ec0     lea.l      $ff0ec0.l, a1
00E55E: 45f900ff0eb2     lea.l      $ff0eb2.l, a2
00E564: 48e700e0         movem.l    a0-a2, -(a7)
00E568: 4eb90000e584     jsr        $e584.l
00E56E: 4cdf0700         movem.l    (a7)+, a0-a2
00E572: 90fc0010         suba.w     #$10, a0
00E576: 92fc0010         suba.w     #$10, a1
00E57A: 94fc0010         suba.w     #$10, a2
00E57E: 51cfffe4         dbra       d7, $e564
00E582: 4e75             rts        

; ==== sub_00E584 зовут=4 ====
00E584: 7c01             moveq      #$1, d6
00E586: 10290001         move.b     $1(a1), d0
00E58A: 6700005c         beq.w      $e5e8
00E58E: 6b000058         bmi.w      $e5e8
00E592: b02a0001         cmp.b      $1(a2), d0
00E596: 66000012         bne.w      $e5aa
00E59A: 5246             addq.w     #$1, d6
00E59C: 94fc000e         suba.w     #$e, a2
00E5A0: 122a0001         move.b     $1(a2), d1
00E5A4: 6b000058         bmi.w      $e5fe
00E5A8: 60e8             bra.b      $e592
00E5AA: 0c460003         cmpi.w     #$3, d6
00E5AE: 6d000038         blt.w      $e5e8
00E5B2: 4eb90000e4a6     jsr        $e4a6.l
00E5B8: 3a06             move.w     d6, d5
00E5BA: 7200             moveq      #$0, d1
00E5BC: 3f07             move.w     d7, -(a7)
00E5BE: 1e301000         move.b     (a0, d1.w), d7
00E5C2: 4eb90000e0ea     jsr        $e0ea.l
00E5C8: 3e1f             move.w     (a7)+, d7
00E5CA: 08f000071000     bset.b     #$7, (a0, d1.w)
00E5D0: 0441000e         subi.w     #$e, d1
00E5D4: 5345             subq.w     #$1, d5
00E5D6: 66e4             bne.b      $e5bc
00E5D8: 3d7c0010004c     move.w     #$10, $4c(a6)
00E5DE: 0c460003         cmpi.w     #$3, d6
00E5E2: 67000004         beq.w      $e5e8
00E5E6: 4e75             rts        
00E5E8: 323c000e         move.w     #$e, d1
00E5EC: 90c1             suba.w     d1, a0
00E5EE: 5346             subq.w     #$1, d6
00E5F0: 66fa             bne.b      $e5ec
00E5F2: 224a             movea.l    a2, a1
00E5F4: 94c1             suba.w     d1, a2
00E5F6: 122a0001         move.b     $1(a2), d1
00E5FA: 6a88             bpl.b      $e584
00E5FC: 4e75             rts        
00E5FE: 0c460003         cmpi.w     #$3, d6
00E602: 6d000026         blt.w      $e62a
00E606: 4eb90000e4a6     jsr        $e4a6.l
00E60C: 3f07             move.w     d7, -(a7)
00E60E: 1e10             move.b     (a0), d7
00E610: 4eb90000e0ea     jsr        $e0ea.l
00E616: 3e1f             move.w     (a7)+, d7
00E618: 08d00007         bset.b     #$7, (a0)
00E61C: 90fc000e         suba.w     #$e, a0
00E620: 5346             subq.w     #$1, d6
00E622: 66e8             bne.b      $e60c
00E624: 3d7c0010004c     move.w     #$10, $4c(a6)
00E62A: 4e75             rts        

; ==== sub_00E62C зовут=5 ====
00E62C: 4a2e008b         tst.b      $8b(a6)
00E630: 67000002         beq.w      $e634
00E634: 4a6e0002         tst.w      $2(a6)
00E638: 660002ca         bne.w      $e904
00E63C: 7000             moveq      #$0, d0
00E63E: 7200             moveq      #$0, d1
00E640: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
00E648: 67000116         beq.w      $e760
00E64C: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
00E654: 6700010a         beq.w      $e760
00E658: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00E660: 6600000e         bne.w      $e670
00E664: 0c79000300ffe180 cmpi.w     #$3, $ffe180.l
00E66C: 6c00002a         bge.w      $e698
00E670: 302e0066         move.w     $66(a6), d0
00E674: 6700000a         beq.w      $e680
00E678: 536e0066         subq.w     #$1, $66(a6)
00E67C: 6000001a         bra.w      $e698
00E680: 3d7c000c0066     move.w     #$c, $66(a6)
00E686: 526e0068         addq.w     #$1, $68(a6)
00E68A: 0c6e00060068     cmpi.w     #$6, $68(a6)
00E690: 66000006         bne.w      $e698
00E694: 426e0068         clr.w      $68(a6)
00E698: 322e0068         move.w     $68(a6), d1
00E69C: e341             asl.w      #$1, d1
00E69E: 286e001c         movea.l    $1c(a6), a4
00E6A2: 302e0060         move.w     $60(a6), d0
00E6A6: 61000016         bsr.w      $e6be
00E6AA: d8fc0100         adda.w     #$100, a4
00E6AE: 302e0062         move.w     $62(a6), d0
00E6B2: 6100000a         bsr.w      $e6be
00E6B6: d8fc0100         adda.w     #$100, a4
00E6BA: 302e0064         move.w     $64(a6), d0

; ==== sub_00E6BE зовут=2 ====
00E6BE: 4a6e00f4         tst.w      $f4(a6)
00E6C2: 66000024         bne.w      $e6e8
00E6C6: 363c2000         move.w     #$2000, d3
00E6CA: 0c000007         cmpi.b     #$7, d0
00E6CE: 6c000020         bge.w      $e6f0
00E6D2: 363c6000         move.w     #$6000, d3
00E6D6: 4a6e00f8         tst.w      $f8(a6)
00E6DA: 66000014         bne.w      $e6f0
00E6DE: 363c4000         move.w     #$4000, d3
00E6E2: 4a00             tst.b      d0
00E6E4: 6600000a         bne.w      $e6f0
00E6E8: 4294             clr.l      (a4)
00E6EA: 42ac0080         clr.l      $80(a4)
00E6EE: 4e75             rts        
00E6F0: 4a2e00ab         tst.b      $ab(a6)
00E6F4: 67000026         beq.w      $e71c
00E6F8: 7000             moveq      #$0, d0
00E6FA: 102e00ab         move.b     $ab(a6), d0
00E6FE: e740             asl.w      #$3, d0
00E700: 41f90000bf02     lea.l      $bf02.l, a0
00E706: d1c0             adda.l     d0, a0
00E708: 363c6000         move.w     #$6000, d3
00E70C: 4a6e00f8         tst.w      $f8(a6)
00E710: 66000034         bne.w      $e746
00E714: 363c4000         move.w     #$4000, d3
00E718: 6000002c         bra.w      $e746
00E71C: 0800000e         btst.b     #$e, d0
00E720: 6700001a         beq.w      $e73c
00E724: e940             asl.w      #$4, d0
00E726: 41f90000c914     lea.l      $c914.l, a0
00E72C: d1c0             adda.l     d0, a0
00E72E: 7000             moveq      #$0, d0
00E730: 102e0092         move.b     $92(a6), d0
00E734: e340             asl.w      #$1, d0
00E736: d1c0             adda.l     d0, a0
00E738: 6000000c         bra.w      $e746
00E73C: e940             asl.w      #$4, d0
00E73E: 41fa0124         lea.l      $e864(pc), a0
00E742: d1c0             adda.l     d0, a0
00E744: d1c1             adda.l     d1, a0
00E746: 3410             move.w     (a0), d2
00E748: 8443             or.w       d3, d2
00E74A: 3882             move.w     d2, (a4)
00E74C: 5442             addq.w     #$2, d2
00E74E: 39420002         move.w     d2, $2(a4)
00E752: 5342             subq.w     #$1, d2
00E754: 39420080         move.w     d2, $80(a4)
00E758: 5442             addq.w     #$2, d2
00E75A: 39420082         move.w     d2, $82(a4)
00E75E: 4e75             rts        
00E760: 7e00             moveq      #$0, d7
00E762: 202e002c         move.l     $2c(a6), d0
00E766: 67000006         beq.w      $e76e
00E76A: 2640             movea.l    d0, a3
00E76C: 7e01             moveq      #$1, d7
00E76E: 7000             moveq      #$0, d0
00E770: 7200             moveq      #$0, d1
00E772: 302e0066         move.w     $66(a6), d0
00E776: 6700000a         beq.w      $e782
00E77A: 536e0066         subq.w     #$1, $66(a6)
00E77E: 6000001a         bra.w      $e79a
00E782: 3d7c000c0066     move.w     #$c, $66(a6)
00E788: 526e0068         addq.w     #$1, $68(a6)
00E78C: 0c6e00060068     cmpi.w     #$6, $68(a6)
00E792: 66000006         bne.w      $e79a
00E796: 426e0068         clr.w      $68(a6)
00E79A: 322e0068         move.w     $68(a6), d1
00E79E: e341             asl.w      #$1, d1
00E7A0: 286e001c         movea.l    $1c(a6), a4
00E7A4: 302e0060         move.w     $60(a6), d0
00E7A8: 61000016         bsr.w      $e7c0
00E7AC: 504c             addq.w     #$8, a4
00E7AE: 504b             addq.w     #$8, a3
00E7B0: 302e0062         move.w     $62(a6), d0
00E7B4: 6100000a         bsr.w      $e7c0
00E7B8: 504c             addq.w     #$8, a4
00E7BA: 504b             addq.w     #$8, a3
00E7BC: 302e0064         move.w     $64(a6), d0

; ==== sub_00E7C0 зовут=2 ====
00E7C0: 4a6e00f4         tst.w      $f4(a6)
00E7C4: 66000024         bne.w      $e7ea
00E7C8: 363c2000         move.w     #$2000, d3
00E7CC: 0c000007         cmpi.b     #$7, d0
00E7D0: 6c000012         bge.w      $e7e4
00E7D4: 363c6000         move.w     #$6000, d3
00E7D8: 4a6e00f8         tst.w      $f8(a6)
00E7DC: 66000006         bne.w      $e7e4
00E7E0: 363c4000         move.w     #$4000, d3
00E7E4: 4a00             tst.b      d0
00E7E6: 6600000e         bne.w      $e7f6
00E7EA: 4254             clr.w      (a4)
00E7EC: 4a47             tst.w      d7
00E7EE: 67000004         beq.w      $e7f4
00E7F2: 4253             clr.w      (a3)
00E7F4: 4e75             rts        
00E7F6: 4a2e00ab         tst.b      $ab(a6)
00E7FA: 67000026         beq.w      $e822
00E7FE: 7000             moveq      #$0, d0
00E800: 102e00ab         move.b     $ab(a6), d0
00E804: e340             asl.w      #$1, d0
00E806: 41f90000e860     lea.l      $e860.l, a0
00E80C: d1c0             adda.l     d0, a0
00E80E: 363c6000         move.w     #$6000, d3
00E812: 4a6e00f8         tst.w      $f8(a6)
00E816: 66000034         bne.w      $e84c
00E81A: 363c4000         move.w     #$4000, d3
00E81E: 6000002c         bra.w      $e84c
00E822: 0800000e         btst.b     #$e, d0
00E826: 6700001a         beq.w      $e842
00E82A: e940             asl.w      #$4, d0
00E82C: 41f90000c914     lea.l      $c914.l, a0
00E832: d1c0             adda.l     d0, a0
00E834: 7000             moveq      #$0, d0
00E836: 102e0092         move.b     $92(a6), d0
00E83A: e340             asl.w      #$1, d0
00E83C: d1c0             adda.l     d0, a0
00E83E: 6000000c         bra.w      $e84c
00E842: e940             asl.w      #$4, d0
00E844: 41fa001e         lea.l      $e864(pc), a0
00E848: d1c0             adda.l     d0, a0
00E84A: d1c1             adda.l     d1, a0
00E84C: 3410             move.w     (a0), d2
00E84E: 4a47             tst.w      d7
00E850: 66000008         bne.w      $e85a
00E854: 8443             or.w       d3, d2
00E856: 3882             move.w     d2, (a4)
00E858: 4e75             rts        
00E85A: 8443             or.w       d3, d2
00E85C: 3882             move.w     d2, (a4)
00E85E: 3682             move.w     d2, (a3)
00E860: 4e75             rts        

; ---- ДАННЫЕ $00E862..$00E904 (162 байт) ----

00E904: 7000             moveq      #$0, d0
00E906: 286e001c         movea.l    $1c(a6), a4
00E90A: 302e0060         move.w     $60(a6), d0
00E90E: 61000016         bsr.w      $e926
00E912: d8fc0080         adda.w     #$80, a4
00E916: 302e0062         move.w     $62(a6), d0
00E91A: 6100000a         bsr.w      $e926
00E91E: d8fc0080         adda.w     #$80, a4
00E922: 302e0064         move.w     $64(a6), d0

; ==== sub_00E926 зовут=2 ====
00E926: 4a6e00f4         tst.w      $f4(a6)
00E92A: 66000018         bne.w      $e944
00E92E: 363c4000         move.w     #$4000, d3
00E932: 0c000007         cmpi.b     #$7, d0
00E936: 6d000006         blt.w      $e93e
00E93A: 363c2000         move.w     #$2000, d3
00E93E: 4a00             tst.b      d0
00E940: 66000006         bne.w      $e948
00E944: 4254             clr.w      (a4)
00E946: 4e75             rts        
00E948: 4a2e00ab         tst.b      $ab(a6)
00E94C: 67000026         beq.w      $e974
00E950: 7000             moveq      #$0, d0
00E952: 102e00ab         move.b     $ab(a6), d0
00E956: e340             asl.w      #$1, d0
00E958: 41f90000e9a4     lea.l      $e9a4.l, a0
00E95E: d1c0             adda.l     d0, a0
00E960: 363c6000         move.w     #$6000, d3
00E964: 4a6e00f8         tst.w      $f8(a6)
00E968: 66000034         bne.w      $e99e
00E96C: 363c4000         move.w     #$4000, d3
00E970: 6000002c         bra.w      $e99e
00E974: 0800000e         btst.b     #$e, d0
00E978: 6700001a         beq.w      $e994
00E97C: e940             asl.w      #$4, d0
00E97E: 41f90000ca34     lea.l      $ca34.l, a0
00E984: d1c0             adda.l     d0, a0
00E986: 7000             moveq      #$0, d0
00E988: 102e0092         move.b     $92(a6), d0
00E98C: e340             asl.w      #$1, d0
00E98E: d1c0             adda.l     d0, a0
00E990: 6000000c         bra.w      $e99e
00E994: e940             asl.w      #$4, d0
00E996: 41f90000ca34     lea.l      $ca34.l, a0
00E99C: d1c0             adda.l     d0, a0
00E99E: 3410             move.w     (a0), d2
00E9A0: 8443             or.w       d3, d2
00E9A2: 3882             move.w     d2, (a4)
00E9A4: 4e75             rts        

; ---- ДАННЫЕ $00E9A6..$00E9B8 (18 байт) ----


; ==== sub_00E9B8 зовут=1 ====
00E9B8: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00E9BE: 6d000004         blt.w      $e9c4
00E9C2: 4e75             rts        
00E9C4: 61000090         bsr.w      $ea56
00E9C8: 286e0024         movea.l    $24(a6), a4
00E9CC: 102e00ae         move.b     $ae(a6), d0
00E9D0: 012e0041         btst.l     d0, $41(a6)
00E9D4: 6600001c         bne.w      $e9f2
00E9D8: 286e0028         movea.l    $28(a6), a4
00E9DC: 102e00af         move.b     $af(a6), d0
00E9E0: 012e0041         btst.l     d0, $41(a6)
00E9E4: 6600000c         bne.w      $e9f2
00E9E8: 4a6e0080         tst.w      $80(a6)
00E9EC: 6600000e         bne.w      $e9fc
00E9F0: 4e75             rts        
00E9F2: 2d4c007a         move.l     a4, $7a(a6)
00E9F6: 3d7c00010080     move.w     #$1, $80(a6)
00E9FC: 0c6e0008004c     cmpi.w     #$8, $4c(a6)
00EA02: 6f000004         ble.w      $ea08
00EA06: 4e75             rts        
00EA08: 286e007a         movea.l    $7a(a6), a4
00EA0C: 426e0080         clr.w      $80(a6)
00EA10: 302e005a         move.w     $5a(a6), d0
00EA14: 0c40000a         cmpi.w     #$a, d0
00EA18: 6d00003a         blt.w      $ea54
00EA1C: 7200             moveq      #$0, d1
00EA1E: 0440000a         subi.w     #$a, d0
00EA22: 65000006         bcs.w      $ea2a
00EA26: 5241             addq.w     #$1, d1
00EA28: 60f4             bra.b      $ea1e
00EA2A: 0640000a         addi.w     #$a, d0
00EA2E: 3d40005a         move.w     d0, $5a(a6)
00EA32: 3d7c00010082     move.w     #$1, $82(a6)
00EA38: 936e0078         sub.w      d1, $78(a6)
00EA3C: 4a6c00ca         tst.w      $ca(a4)
00EA40: 66000012         bne.w      $ea54
00EA44: 397c00010082     move.w     #$1, $82(a4)
00EA4A: d36c0078         add.w      d1, $78(a4)
00EA4E: 397c00010072     move.w     #$1, $72(a4)
00EA54: 4e75             rts        

; ==== sub_00EA56 зовут=1 ====
00EA56: 08ae00000090     bclr.b     #$0, $90(a6)
00EA5C: 66000022         bne.w      $ea80
00EA60: 08ae00010090     bclr.b     #$1, $90(a6)
00EA66: 6600002a         bne.w      $ea92
00EA6A: 08ae00020090     bclr.b     #$2, $90(a6)
00EA70: 66000032         bne.w      $eaa4
00EA74: 08ae00030090     bclr.b     #$3, $90(a6)
00EA7A: 6600003a         bne.w      $eab6
00EA7E: 4e75             rts        
00EA80: 3d7c00010082     move.w     #$1, $82(a6)
00EA86: 546e0078         addq.w     #$2, $78(a6)
00EA8A: 3d7c00010072     move.w     #$1, $72(a6)
00EA90: 4e75             rts        
00EA92: 3d7c00010082     move.w     #$1, $82(a6)
00EA98: 5a6e0078         addq.w     #$5, $78(a6)
00EA9C: 3d7c00010072     move.w     #$1, $72(a6)
00EAA2: 4e75             rts        
00EAA4: 3d7c00010082     move.w     #$1, $82(a6)
00EAAA: 526e0078         addq.w     #$1, $78(a6)
00EAAE: 3d7c00010072     move.w     #$1, $72(a6)
00EAB4: 4e75             rts        
00EAB6: 3d7c00010082     move.w     #$1, $82(a6)
00EABC: 566e0078         addq.w     #$3, $78(a6)
00EAC0: 3d7c00010072     move.w     #$1, $72(a6)
00EAC6: 4e75             rts        

; ==== sub_00EAC8 зовут=1 ====
00EAC8: 4a6e008e         tst.w      $8e(a6)
00EACC: 66000014         bne.w      $eae2
00EAD0: 4a6e0082         tst.w      $82(a6)
00EAD4: 670000b4         beq.w      $eb8a
00EAD8: 0c6e0008004c     cmpi.w     #$8, $4c(a6)
00EADE: 6e0000aa         bgt.w      $eb8a
00EAE2: 08ee000000a7     bset.b     #$0, $a7(a6)
00EAE8: 302e0078         move.w     $78(a6), d0
00EAEC: 1e3900ff053b     move.b     $ff053b.l, d7
00EAF2: 0c400003         cmpi.w     #$3, d0
00EAF6: 6d000014         blt.w      $eb0c
00EAFA: 1e3c00aa         move.b     #$aa, d7
00EAFE: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
00EB06: 66000004         bne.w      $eb0c
00EB0A: 4207             clr.b      d7
00EB0C: 4eb900003d7a     jsr        $3d7a.l
00EB12: 426e0082         clr.w      $82(a6)
00EB16: 426e0078         clr.w      $78(a6)
00EB1A: d16e007e         add.w      d0, $7e(a6)
00EB1E: 6a000006         bpl.w      $eb26
00EB22: 426e007e         clr.w      $7e(a6)
00EB26: 0c6e000d007e     cmpi.w     #$d, $7e(a6)
00EB2C: 6f000008         ble.w      $eb36
00EB30: 3d7c000d007e     move.w     #$d, $7e(a6)
00EB36: 7000             moveq      #$0, d0
00EB38: 302e007e         move.w     $7e(a6), d0
00EB3C: e340             asl.w      #$1, d0
00EB3E: 41fa004c         lea.l      $eb8c(pc), a0
00EB42: 30300000         move.w     (a0, d0.w), d0
00EB46: 204e             movea.l    a6, a0
00EB48: d1c0             adda.l     d0, a0
00EB4A: 2d480084         move.l     a0, $84(a6)
00EB4E: 4eb90000dbea     jsr        $dbea.l
00EB54: 4a6e008e         tst.w      $8e(a6)
00EB58: 67000008         beq.w      $eb62
00EB5C: 426e008e         clr.w      $8e(a6)
00EB60: 4e75             rts        
00EB62: 4eb90000dfae     jsr        $dfae.l
00EB68: 08ae00000073     bclr.b     #$0, $73(a6)
00EB6E: 6700001a         beq.w      $eb8a
00EB72: 0c6e0008004c     cmpi.w     #$8, $4c(a6)
00EB78: 6e000010         bgt.w      $eb8a
00EB7C: 4a6e004c         tst.w      $4c(a6)
00EB80: 67000008         beq.w      $eb8a
00EB84: 4eb90000dd86     jsr        $dd86.l
00EB8A: 4e75             rts        

; ---- ДАННЫЕ $00EB8C..$00EBA8 (28 байт) ----


; ==== sub_00EBA8 зовут=1 ====
00EBA8: 302e0086         move.w     $86(a6), d0
00EBAC: b06e0008         cmp.w      $8(a6), d0
00EBB0: 66000004         bne.w      $ebb6
00EBB4: 4e75             rts        
00EBB6: 6200000c         bhi.w      $ebc4
00EBBA: 046e00100008     subi.w     #$10, $8(a6)
00EBC0: 60000042         bra.w      $ec04
00EBC4: 066e00100008     addi.w     #$10, $8(a6)
00EBCA: 302e0086         move.w     $86(a6), d0
00EBCE: b06e0008         cmp.w      $8(a6), d0
00EBD2: 66000030         bne.w      $ec04
00EBD6: 1d7c001e00cd     move.b     #$1e, $cd(a6)
00EBDC: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00EBE4: 6600001e         bne.w      $ec04
00EBE8: 0c79000400ffe180 cmpi.w     #$4, $ffe180.l
00EBF0: 66000012         bne.w      $ec04
00EBF4: 1d7c000100b1     move.b     #$1, $b1(a6)
00EBFA: 1d7c000600b2     move.b     #$6, $b2(a6)
00EC00: 422e00b3         clr.b      $b3(a6)
00EC04: 1d7c00010098     move.b     #$1, $98(a6)
00EC0A: 4eb90000dd44     jsr        $dd44.l
00EC10: 4a47             tst.w      d7
00EC12: 67000008         beq.w      $ec1c
00EC16: 4ef90000d520     jmp        $d520.l
00EC1C: 4e75             rts        

; ==== sub_00EC1E зовут=1 ====
00EC1E: 4a7900ff0420     tst.w      $ff0420.l
00EC24: 66000004         bne.w      $ec2a
00EC28: 4e75             rts        
00EC2A: 4a3900ff4109     tst.b      $ff4109.l
00EC30: 66000040         bne.w      $ec72
00EC34: 3e3900ff0422     move.w     $ff0422.l, d7
00EC3A: 5347             subq.w     #$1, d7
00EC3C: 4df900ff1000     lea.l      $ff1000.l, a6
00EC42: 7000             moveq      #$0, d0
00EC44: 0c6e0018004c     cmpi.w     #$18, $4c(a6)
00EC4A: 6d000004         blt.w      $ec50
00EC4E: 5240             addq.w     #$1, d0
00EC50: 4dee0400         lea.l      $400(a6), a6
00EC54: 51cfffee         dbra       d7, $ec44
00EC58: b07900ff0422     cmp.w      $ff0422.l, d0
00EC5E: 66000012         bne.w      $ec72
00EC62: 13fc00b900ff0531 move.b     #$b9, $ff0531.l
00EC6A: 13fc000100ff4109 move.b     #$1, $ff4109.l
00EC72: 303900ff0418     move.w     $ff0418.l, d0
00EC78: e540             asl.w      #$2, d0
00EC7A: 41fa0008         lea.l      $ec84(pc), a0
00EC7E: 20700000         movea.l    (a0, d0.w), a0
00EC82: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $00EC84..$00ECA4 (32 байт) ----


; ==== sub_00ECA4 ТАБЛИЦА зовут=0 ====
00ECA4: 4eb90000ee06     jsr        $ee06.l
00ECAA: 4eb90000edaa     jsr        $edaa.l
00ECB0: 600000ac         bra.w      $ed5e

; ==== sub_00ECB4 ТАБЛИЦА зовут=0 ====
00ECB4: 4eb90000ee06     jsr        $ee06.l
00ECBA: 4df900ff1400     lea.l      $ff1400.l, a6
00ECC0: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00ECC6: 6d00002e         blt.w      $ecf6
00ECCA: 4df900ff1000     lea.l      $ff1000.l, a6
00ECD0: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00ECD6: 6c000006         bge.w      $ecde
00ECDA: 61000164         bsr.w      $ee40
00ECDE: 4df900ff1800     lea.l      $ff1800.l, a6
00ECE4: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00ECEA: 6c00003c         bge.w      $ed28
00ECEE: 61000150         bsr.w      $ee40
00ECF2: 60000034         bra.w      $ed28
00ECF6: 0c79001c00ff104c cmpi.w     #$1c, $ff104c.l
00ECFE: 6d000028         blt.w      $ed28
00ED02: 0c79001c00ff184c cmpi.w     #$1c, $ff184c.l
00ED0A: 6d00001c         blt.w      $ed28
00ED0E: 4df900ff1400     lea.l      $ff1400.l, a6
00ED14: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00ED1A: 6c00000c         bge.w      $ed28
00ED1E: 61000120         bsr.w      $ee40
00ED22: 60000004         bra.w      $ed28

; ---- ДАННЫЕ $00ED26..$00ED28 (2 байт) ----

00ED28: 61000034         bsr.w      $ed5e
00ED2C: 0c79002400ff0406 cmpi.w     #$24, $ff0406.l
00ED34: 66000026         bne.w      $ed5c
00ED38: 303900ff1088     move.w     $ff1088.l, d0
00ED3E: b07900ff1888     cmp.w      $ff1888.l, d0
00ED44: 6c000010         bge.w      $ed56
00ED48: 33f900ff188800ff1088 move.w     $ff1888.l, $ff1088.l
00ED52: 60000002         bra.w      $ed56
00ED56: 33c000ff1888     move.w     d0, $ff1888.l
00ED5C: 4e75             rts        

; ==== sub_00ED5E зовут=1 ====
00ED5E: 3e3900ff0422     move.w     $ff0422.l, d7
00ED64: 5347             subq.w     #$1, d7
00ED66: 7000             moveq      #$0, d0
00ED68: 4df900ff1000     lea.l      $ff1000.l, a6
00ED6E: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00ED74: 66000004         bne.w      $ed7a
00ED78: 5240             addq.w     #$1, d0
00ED7A: 4dee0400         lea.l      $400(a6), a6
00ED7E: 51cfffee         dbra       d7, $ed6e
00ED82: b07900ff0422     cmp.w      $ff0422.l, d0
00ED88: 6600001e         bne.w      $eda8
00ED8C: 33fc002400ff0406 move.w     #$24, $ff0406.l
00ED94: 33fc000200ff0408 move.w     #$2, $ff0408.l
00ED9C: 427900ff0432     clr.w      $ff0432.l
00EDA2: 427900ff041e     clr.w      $ff041e.l
00EDA8: 4e75             rts        

; ==== sub_00EDAA зовут=1 ====
00EDAA: 3e3900ff0422     move.w     $ff0422.l, d7
00EDB0: 5347             subq.w     #$1, d7
00EDB2: 7000             moveq      #$0, d0
00EDB4: 4df900ff1000     lea.l      $ff1000.l, a6
00EDBA: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00EDC0: 66000004         bne.w      $edc6
00EDC4: 5240             addq.w     #$1, d0
00EDC6: 4dee0400         lea.l      $400(a6), a6
00EDCA: 51cfffee         dbra       d7, $edba
00EDCE: 323900ff0422     move.w     $ff0422.l, d1
00EDD4: 5341             subq.w     #$1, d1
00EDD6: b041             cmp.w      d1, d0
00EDD8: 6600002a         bne.w      $ee04
00EDDC: 3e3900ff0422     move.w     $ff0422.l, d7
00EDE2: 5347             subq.w     #$1, d7
00EDE4: 7000             moveq      #$0, d0
00EDE6: 4df900ff1000     lea.l      $ff1000.l, a6
00EDEC: 0c6e001c004c     cmpi.w     #$1c, $4c(a6)
00EDF2: 6c000008         bge.w      $edfc
00EDF6: 61000048         bsr.w      $ee40
00EDFA: 4e75             rts        
00EDFC: 4dee0400         lea.l      $400(a6), a6
00EE00: 51cfffea         dbra       d7, $edec
00EE04: 4e75             rts        

; ==== sub_00EE06 зовут=2 ====
00EE06: 3e3900ff0422     move.w     $ff0422.l, d7
00EE0C: 5347             subq.w     #$1, d7
00EE0E: 41f900ff1000     lea.l      $ff1000.l, a0
00EE14: 7000             moveq      #$0, d0
00EE16: 08a8000000aa     bclr.b     #$0, $aa(a0)
00EE1C: 6700000c         beq.w      $ee2a
00EE20: 317900ff041e0088 move.w     $ff041e.l, $88(a0)
00EE28: 5240             addq.w     #$1, d0
00EE2A: 41e80400         lea.l      $400(a0), a0
00EE2E: 51cfffe6         dbra       d7, $ee16
00EE32: 4a40             tst.w      d0
00EE34: 67000008         beq.w      $ee3e
00EE38: 527900ff041e     addq.w     #$1, $ff041e.l
00EE3E: 4e75             rts        

; ==== sub_00EE40 зовут=4 ====
00EE40: 13fc000100ff4109 move.b     #$1, $ff4109.l
00EE48: 4a6e004c         tst.w      $4c(a6)
00EE4C: 67000028         beq.w      $ee76
00EE50: 0c6e000c004c     cmpi.w     #$c, $4c(a6)
00EE56: 6700001e         beq.w      $ee76
00EE5A: 0c6e0008004c     cmpi.w     #$8, $4c(a6)
00EE60: 6e00001a         bgt.w      $ee7c
00EE64: 4eb90000dd8a     jsr        $dd8a.l
00EE6A: 422e008a         clr.b      $8a(a6)
00EE6E: 13fc00c000ff0531 move.b     #$c0, $ff0531.l
00EE76: 4eb90000d514     jsr        $d514.l
00EE7C: 4e75             rts        

; ==== sub_00EE7E зовут=1 ====
00EE7E: 4a6e00ca         tst.w      $ca(a6)
00EE82: 67000006         beq.w      $ee8a
00EE86: 536e00ca         subq.w     #$1, $ca(a6)
00EE8A: 4a6e00f0         tst.w      $f0(a6)
00EE8E: 6700004a         beq.w      $eeda
00EE92: 536e00f0         subq.w     #$1, $f0(a6)
00EE96: 7000             moveq      #$0, d0
00EE98: 08ae00020040     bclr.b     #$2, $40(a6)
00EE9E: 67000006         beq.w      $eea6
00EEA2: 08c00003         bset.b     #$3, d0
00EEA6: 08ae00030040     bclr.b     #$3, $40(a6)
00EEAC: 67000006         beq.w      $eeb4
00EEB0: 08c00002         bset.b     #$2, d0
00EEB4: 812e0040         or.b       d0, $40(a6)
00EEB8: 7000             moveq      #$0, d0
00EEBA: 08ae00020041     bclr.b     #$2, $41(a6)
00EEC0: 67000006         beq.w      $eec8
00EEC4: 08c00003         bset.b     #$3, d0
00EEC8: 08ae00030041     bclr.b     #$3, $41(a6)
00EECE: 67000006         beq.w      $eed6
00EED2: 08c00002         bset.b     #$2, d0
00EED6: 812e0041         or.b       d0, $41(a6)
00EEDA: 4a6e00f2         tst.w      $f2(a6)
00EEDE: 6700000e         beq.w      $eeee
00EEE2: 536e00f2         subq.w     #$1, $f2(a6)
00EEE6: 102e00ad         move.b     $ad(a6), d0
00EEEA: 01ae0041         bclr.b     d0, $41(a6)
00EEEE: 4a6e00f4         tst.w      $f4(a6)
00EEF2: 6700000a         beq.w      $eefe
00EEF6: 536e00f4         subq.w     #$1, $f4(a6)
00EEFA: 60000002         bra.w      $eefe
00EEFE: 4a6e00f6         tst.w      $f6(a6)
00EF02: 67000010         beq.w      $ef14
00EF06: 536e00f6         subq.w     #$1, $f6(a6)
00EF0A: 66000008         bne.w      $ef14
00EF0E: 1d7c000300a7     move.b     #$3, $a7(a6)
00EF14: 4a6e00f8         tst.w      $f8(a6)
00EF18: 67000010         beq.w      $ef2a
00EF1C: 536e00f8         subq.w     #$1, $f8(a6)
00EF20: 66000008         bne.w      $ef2a
00EF24: 08ee000000a7     bset.b     #$0, $a7(a6)
00EF2A: 4e75             rts        

; ==== sub_00EF2C зовут=2 ====
00EF2C: 4a3900ff4100     tst.b      $ff4100.l
00EF32: 6700001c         beq.w      $ef50
00EF36: 33fc020000ff14f8 move.w     #$200, $ff14f8.l
00EF3E: 08f9000000ff14a7 bset.b     #$0, $ff14a7.l
00EF46: 1e3c00a7         move.b     #$a7, d7
00EF4A: 4ef900003d7a     jmp        $3d7a.l
00EF50: 0c680018004c     cmpi.w     #$18, $4c(a0)
00EF56: 6d000004         blt.w      $ef5c
00EF5A: 4e75             rts        
00EF5C: 4a6800ca         tst.w      $ca(a0)
00EF60: 67000004         beq.w      $ef66
00EF64: 4e75             rts        
00EF66: 082e000000a8     btst.b     #$0, $a8(a6)
00EF6C: 67000032         beq.w      $efa0
00EF70: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00EF78: 66000022         bne.w      $ef9c
00EF7C: 2f08             move.l     a0, -(a7)
00EF7E: 2f0e             move.l     a6, -(a7)
00EF80: 103c0005         move.b     #$5, d0
00EF84: 4eb90001064e     jsr        $1064e.l
00EF8A: 2c6e0024         movea.l    $24(a6), a6
00EF8E: 103c0006         move.b     #$6, d0
00EF92: 4eb90001064e     jsr        $1064e.l
00EF98: 2c5f             movea.l    (a7)+, a6
00EF9A: 205f             movea.l    (a7)+, a0
00EF9C: 6100000e         bsr.w      $efac
00EFA0: 082e000100a8     btst.b     #$1, $a8(a6)
00EFA6: 660000de         bne.w      $f086
00EFAA: 4e75             rts        

; ==== sub_00EFAC зовут=1 ====
00EFAC: 1e3c00a7         move.b     #$a7, d7
00EFB0: 4eb900003d7a     jsr        $3d7a.l
00EFB6: 43fa0086         lea.l      $f03e(pc), a1
00EFBA: 4a680002         tst.w      $2(a0)
00EFBE: 67000006         beq.w      $efc6
00EFC2: 43fa009e         lea.l      $f062(pc), a1
00EFC6: 3c19             move.w     (a1)+, d6
00EFC8: 3e19             move.w     (a1)+, d7
00EFCA: 4eb900000368     jsr        $368.l
00EFD0: 303900ffef90     move.w     $ffef90.l, d0
00EFD6: 0240000f         andi.w     #$f, d0
00EFDA: e340             asl.w      #$1, d0
00EFDC: 30310000         move.w     (a1, d0.w), d0
00EFE0: 3200             move.w     d0, d1
00EFE2: 5441             addq.w     #$2, d1
00EFE4: b247             cmp.w      d7, d1
00EFE6: 6f000004         ble.w      $efec
00EFEA: 7200             moveq      #$0, d1
00EFEC: 43e800f0         lea.l      $f0(a0), a1
00EFF0: 34310000         move.w     (a1, d0.w), d2
00EFF4: b4711000         cmp.w      (a1, d1.w), d2
00EFF8: 63000004         bls.w      $effe
00EFFC: 3001             move.w     d1, d0
00EFFE: 5441             addq.w     #$2, d1
00F000: b247             cmp.w      d7, d1
00F002: 6f000004         ble.w      $f008
00F006: 7200             moveq      #$0, d1
00F008: 51ceffe6         dbra       d6, $eff0
00F00C: 342e00a0         move.w     $a0(a6), d2
00F010: d5710000         add.w      d2, (a1, d0.w)
00F014: 117c004800e2     move.b     #$48, $e2(a0)
00F01A: 114000e3         move.b     d0, $e3(a0)
00F01E: 0c400006         cmpi.w     #$6, d0
00F022: 6600000a         bne.w      $f02e
00F026: 117c000300a7     move.b     #$3, $a7(a0)
00F02C: 4e75             rts        
00F02E: 0c400008         cmpi.w     #$8, d0
00F032: 66000008         bne.w      $f03c
00F036: 08e8000000a7     bset.b     #$0, $a7(a0)
00F03C: 4e75             rts        

; ---- ДАННЫЕ $00F03E..$00F086 (72 байт) ----

00F086: 1e3c00a7         move.b     #$a7, d7
00F08A: 4eb900003d7a     jsr        $3d7a.l
00F090: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00F098: 66000022         bne.w      $f0bc
00F09C: 2f08             move.l     a0, -(a7)
00F09E: 2f0e             move.l     a6, -(a7)
00F0A0: 103c0008         move.b     #$8, d0
00F0A4: 4eb90001064e     jsr        $1064e.l
00F0AA: 2c6e0024         movea.l    $24(a6), a6
00F0AE: 103c0006         move.b     #$6, d0
00F0B2: 4eb90001064e     jsr        $1064e.l
00F0B8: 2c5f             movea.l    (a7)+, a6
00F0BA: 205f             movea.l    (a7)+, a0
00F0BC: 4eb900000368     jsr        $368.l
00F0C2: 303900ffef90     move.w     $ffef90.l, d0
00F0C8: 02400007         andi.w     #$7, d0
00F0CC: e540             asl.w      #$2, d0
00F0CE: 43fa0068         lea.l      $f138(pc), a1
00F0D2: 22710000         movea.l    (a1, d0.w), a1
00F0D6: 4ed1             jmp        (a1)

; ==== sub_00F0D8 ТАБЛИЦА зовут=0 ====
00F0D8: 08ae000100a8     bclr.b     #$1, $a8(a6)
00F0DE: 43ee0260         lea.l      $260(a6), a1
00F0E2: 7067             moveq      #$67, d0
00F0E4: 4a290001         tst.b      $1(a1)
00F0E8: 67000006         beq.w      $f0f0
00F0EC: 08d10007         bset.b     #$7, (a1)
00F0F0: 5449             addq.w     #$2, a1
00F0F2: 51c8fff0         dbra       d0, $f0e4
00F0F6: 3d7c0001008e     move.w     #$1, $8e(a6)
00F0FC: 066efff30078     addi.w     #$fff3, $78(a6)
00F102: 3d7c00010076     move.w     #$1, $76(a6)
00F108: 426e006a         clr.w      $6a(a6)
00F10C: 426e006c         clr.w      $6c(a6)
00F110: 3d7c0010004c     move.w     #$10, $4c(a6)
00F116: 1d7c00010098     move.b     #$1, $98(a6)
00F11C: 4e75             rts        

; ==== sub_00F11E ТАБЛИЦА зовут=0 ====
00F11E: 08e800010090     bset.b     #$1, $90(a0)
00F124: 4e75             rts        

; ==== sub_00F126 ТАБЛИЦА зовут=0 ====
00F126: 217c000100000044 move.l     #$10000, $44(a0)
00F12E: 4e75             rts        

; ==== sub_00F130 ТАБЛИЦА зовут=0 ====
00F130: 08e80000008b     bset.b     #$0, $8b(a0)
00F136: 4e75             rts        

; ---- ДАННЫЕ $00F138..$00F158 (32 байт) ----


; ==== sub_00F158 ТАБЛИЦА зовут=0 ====
00F158: 303900ff0432     move.w     $ff0432.l, d0
00F15E: 41fa0008         lea.l      $f168(pc), a0
00F162: 20700000         movea.l    (a0, d0.w), a0
00F166: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $00F168..$00F174 (12 байт) ----


; ==== sub_00F174 ТАБЛИЦА зовут=0 ====
00F174: 4eb9000104de     jsr        $104de.l
00F17A: 103900ffe00d     move.b     $ffe00d.l, d0
00F180: 020000f0         andi.b     #$f0, d0
00F184: 660000b2         bne.w      $f238
00F188: 61000010         bsr.w      $f19a
00F18C: 61000068         bsr.w      $f1f6
00F190: 13fc000100ff040d move.b     #$1, $ff040d.l
00F198: 4e75             rts        

; ==== sub_00F19A зовут=1 ====
00F19A: 103900ffe00d     move.b     $ffe00d.l, d0
00F1A0: 02000003         andi.b     #$3, d0
00F1A4: 6700000c         beq.w      $f1b2
00F1A8: 1e3c00b3         move.b     #$b3, d7
00F1AC: 4eb900003d7a     jsr        $3d7a.l
00F1B2: 0839000100ffe00d btst.b     #$1, $ffe00d.l
00F1BA: 6700001a         beq.w      $f1d6
00F1BE: 527900ff0500     addq.w     #$1, $ff0500.l
00F1C4: 0c79000400ff0500 cmpi.w     #$4, $ff0500.l
00F1CC: 66000008         bne.w      $f1d6
00F1D0: 427900ff0500     clr.w      $ff0500.l
00F1D6: 0839000000ffe00d btst.b     #$0, $ffe00d.l
00F1DE: 67000014         beq.w      $f1f4
00F1E2: 537900ff0500     subq.w     #$1, $ff0500.l
00F1E8: 6a00000a         bpl.w      $f1f4
00F1EC: 33fc000300ff0500 move.w     #$3, $ff0500.l
00F1F4: 4e75             rts        

; ==== sub_00F1F6 зовут=1 ====
00F1F6: 7000             moveq      #$0, d0
00F1F8: 303900ff0500     move.w     $ff0500.l, d0
00F1FE: e340             asl.w      #$1, d0
00F200: 41fa002e         lea.l      $f230(pc), a0
00F204: d1c0             adda.l     d0, a0
00F206: 43f900ff0000     lea.l      $ff0000.l, a1
00F20C: 3290             move.w     (a0), (a1)
00F20E: 527900ff0408     addq.w     #$1, $ff0408.l
00F214: 323ca2ac         move.w     #$a2ac, d1
00F218: 303900ff0408     move.w     $ff0408.l, d0
00F21E: 02400010         andi.w     #$10, d0
00F222: 66000006         bne.w      $f22a
00F226: 323ca29c         move.w     #$a29c, d1
00F22A: 33410004         move.w     d1, $4(a1)
00F22E: 4e75             rts        

; ---- ДАННЫЕ $00F230..$00F238 (8 байт) ----

00F238: 0c79000400ff0500 cmpi.w     #$4, $ff0500.l
00F240: 6700017a         beq.w      $f3bc
00F244: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
00F24C: 6600012c         bne.w      $f37a
00F250: 4eb900003940     jsr        $3940.l
00F256: 4eb900003952     jsr        $3952.l
00F25C: 6100056e         bsr.w      $f7cc
00F260: 13fc000100ff040d move.b     #$1, $ff040d.l
00F268: 41f900064e4a     lea.l      $64e4a.l, a0
00F26E: 43f900ffa000     lea.l      $ffa000.l, a1
00F274: 4eb9000047aa     jsr        $47aa.l
00F27A: 203c60000000     move.l     #$60000000, d0
00F280: 223c940f9360     move.l     #$940f9360, d1
00F286: 243c96d09500     move.l     #$96d09500, d2
00F28C: 363c977f         move.w     #$977f, d3
00F290: 4eb900003980     jsr        $3980.l
00F296: 41f900065eb0     lea.l      $65eb0.l, a0
00F29C: 43f900ffa000     lea.l      $ffa000.l, a1
00F2A2: 4eb9000047aa     jsr        $47aa.l
00F2A8: 41f900ffa000     lea.l      $ffa000.l, a0
00F2AE: 43f900ff8000     lea.l      $ff8000.l, a1
00F2B4: 701b             moveq      #$1b, d0
00F2B6: 7213             moveq      #$13, d1
00F2B8: 22d8             move.l     (a0)+, (a1)+
00F2BA: 51c9fffc         dbra       d1, $f2b8
00F2BE: 43e90030         lea.l      $30(a1), a1
00F2C2: 51c8fff2         dbra       d0, $f2b6
00F2C6: 41f9000661f8     lea.l      $661f8.l, a0
00F2CC: 43f900ffa000     lea.l      $ffa000.l, a1
00F2D2: 4eb9000047aa     jsr        $47aa.l
00F2D8: 3e3900ff0422     move.w     $ff0422.l, d7
00F2DE: 41f900ff829a     lea.l      $ff829a.l, a0
00F2E4: 323ce15b         move.w     #$e15b, d1
00F2E8: 2f08             move.l     a0, -(a7)
00F2EA: 43f900ffa000     lea.l      $ffa000.l, a1
00F2F0: 700e             moveq      #$e, d0
00F2F2: 2099             move.l     (a1)+, (a0)
00F2F4: 21590004         move.l     (a1)+, $4(a0)
00F2F8: d1fc00000080     adda.l     #$80, a0
00F2FE: 51c8fff2         dbra       d0, $f2f2
00F302: 205f             movea.l    (a7)+, a0
00F304: 31410002         move.w     d1, $2(a0)
00F308: 5241             addq.w     #$1, d1
00F30A: d1fc0000000a     adda.l     #$a, a0
00F310: 5347             subq.w     #$1, d7
00F312: 66d4             bne.b      $f2e8
00F314: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00F31C: 6600000a         bne.w      $f328
00F320: 61000f22         bsr.w      $10244
00F324: 60000020         bra.w      $f346
00F328: 41f900ff8b06     lea.l      $ff8b06.l, a0
00F32E: 43f900ff8b86     lea.l      $ff8b86.l, a1
00F334: 7010             moveq      #$10, d0
00F336: 20fce110e110     move.l     #$e110e110, (a0)+
00F33C: 22fce110e110     move.l     #$e110e110, (a1)+
00F342: 51c8fff2         dbra       d0, $f336
00F346: 61000fca         bsr.w      $10312
00F34A: 33fc000800ff0432 move.w     #$8, $ff0432.l
00F352: 423900ff0500     clr.b      $ff0500.l
00F358: 423900ff0501     clr.b      $ff0501.l
00F35E: 61000aa0         bsr.w      $fe00
00F362: 4df90000584a     lea.l      $584a.l, a6
00F368: 4eb90000067a     jsr        $67a.l
00F36E: 427900ff0510     clr.w      $ff0510.l
00F374: 4ef90000392e     jmp        $392e.l
00F37A: 33f900ff050000ff041a move.w     $ff0500.l, $ff041a.l
00F384: 33fc000300ff041c move.w     #$3, $ff041c.l
00F38C: 4a7900ff0500     tst.w      $ff0500.l
00F392: 67000028         beq.w      $f3bc
00F396: 33fc000500ff041c move.w     #$5, $ff041c.l
00F39E: 0c79000100ff0500 cmpi.w     #$1, $ff0500.l
00F3A6: 67000014         beq.w      $f3bc
00F3AA: 33fc000700ff041c move.w     #$7, $ff041c.l
00F3B2: 4a3900ff0459     tst.b      $ff0459.l
00F3B8: 67000002         beq.w      $f3bc
00F3BC: 4eb900003952     jsr        $3952.l
00F3C2: 41f900ff9000     lea.l      $ff9000.l, a0
00F3C8: 43f900ff8000     lea.l      $ff8000.l, a1
00F3CE: 303c037f         move.w     #$37f, d0
00F3D2: 22d8             move.l     (a0)+, (a1)+
00F3D4: 51c8fffc         dbra       d0, $f3d2
00F3D8: 610003f2         bsr.w      $f7cc
00F3DC: 4a7900ff0418     tst.w      $ff0418.l
00F3E2: 67000008         beq.w      $f3ec
00F3E6: 4eb90000079e     jsr        $79e.l
00F3EC: 13fc000100ff040d move.b     #$1, $ff040d.l
00F3F4: 4eb900000ee2     jsr        $ee2.l
00F3FA: 4a3900ff4038     tst.b      $ff4038.l
00F400: 67000068         beq.w      $f46a
00F404: 4eb90000079e     jsr        $79e.l
00F40A: 41f900007a9e     lea.l      $7a9e.l, a0
00F410: 43f900ff0340     lea.l      $ff0340.l, a1
00F416: 7007             moveq      #$7, d0
00F418: 22d8             move.l     (a0)+, (a1)+
00F41A: 51c8fffc         dbra       d0, $f418
00F41E: 13fc000100ff0400 move.b     #$1, $ff0400.l
00F426: 4eb90000b206     jsr        $b206.l
00F42C: 423900ff4038     clr.b      $ff4038.l
00F432: 41f90000f44a     lea.l      $f44a.l, a0
00F438: 43f900ff0340     lea.l      $ff0340.l, a1
00F43E: 7007             moveq      #$7, d0
00F440: 22d8             move.l     (a0)+, (a1)+
00F442: 51c8fffc         dbra       d0, $f440
00F446: 60000022         bra.w      $f46a

; ---- ДАННЫЕ $00F44A..$00F46A (32 байт) ----

00F46A: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
00F474: 303900ff0418     move.w     $ff0418.l, d0
00F47A: e540             asl.w      #$2, d0
00F47C: 43fa02e4         lea.l      $f762(pc), a1
00F480: 24710000         movea.l    (a1, d0.w), a2
00F484: 4df900ff1000     lea.l      $ff1000.l, a6
00F48A: 3d5a0200         move.w     (a2)+, $200(a6)
00F48E: 4a7900ff1002     tst.w      $ff1002.l
00F494: 66000024         bne.w      $f4ba
00F498: 4a7900ff0418     tst.w      $ff0418.l
00F49E: 6600000c         bne.w      $f4ac
00F4A2: bdfc00ff1400     cmpa.l     #$ff1400, a6
00F4A8: 6700001a         beq.w      $f4c4
00F4AC: 41f900010410     lea.l      $10410.l, a0
00F4B2: 6100064e         bsr.w      $fb02
00F4B6: 6000000c         bra.w      $f4c4
00F4BA: 41f900010404     lea.l      $10404.l, a0
00F4C0: 6100061a         bsr.w      $fadc
00F4C4: 4dee0400         lea.l      $400(a6), a6
00F4C8: 537900ff0424     subq.w     #$1, $ff0424.l
00F4CE: 66ba             bne.b      $f48a
00F4D0: 423900ff0445     clr.b      $ff0445.l
00F4D6: 427900ff0446     clr.w      $ff0446.l
00F4DC: 4eb900009e12     jsr        $9e12.l
00F4E2: 41fa02c8         lea.l      $f7ac(pc), a0
00F4E6: 43f900ff0360     lea.l      $ff0360.l, a1
00F4EC: 7007             moveq      #$7, d0
00F4EE: 22d8             move.l     (a0)+, (a1)+
00F4F0: 51c8fffc         dbra       d0, $f4ee
00F4F4: 13fc000100ff0400 move.b     #$1, $ff0400.l
00F4FC: 41f90000f6c2     lea.l      $f6c2.l, a0
00F502: 0c79000200ff0418 cmpi.w     #$2, $ff0418.l
00F50A: 67000014         beq.w      $f520
00F50E: 41f90000f622     lea.l      $f622.l, a0
00F514: 0c79000300ff0418 cmpi.w     #$3, $ff0418.l
00F51C: 6600001a         bne.w      $f538
00F520: 43f900ff0180     lea.l      $ff0180.l, a1
00F526: 303c0013         move.w     #$13, d0
00F52A: 32d8             move.w     (a0)+, (a1)+
00F52C: 3218             move.w     (a0)+, d1
00F52E: 8359             or.w       d1, (a1)+
00F530: 32d8             move.w     (a0)+, (a1)+
00F532: 32d8             move.w     (a0)+, (a1)+
00F534: 51c8fff4         dbra       d0, $f52a
00F538: 4df900ff1000     lea.l      $ff1000.l, a6
00F53E: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
00F548: 4eb90000dfae     jsr        $dfae.l
00F54E: 4dee0400         lea.l      $400(a6), a6
00F552: 537900ff0424     subq.w     #$1, $ff0424.l
00F558: 66ee             bne.b      $f548
00F55A: 33fc000400ff0432 move.w     #$4, $ff0432.l
00F562: 423900ff0502     clr.b      $ff0502.l
00F568: 13fc000100ff040d move.b     #$1, $ff040d.l
00F570: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00F578: 67000044         beq.w      $f5be
00F57C: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00F584: 67000038         beq.w      $f5be
00F588: 41f900043f9c     lea.l      $43f9c.l, a0
00F58E: 43f900ffa000     lea.l      $ffa000.l, a1
00F594: 4eb9000047aa     jsr        $47aa.l
00F59A: 007c0700         ori.w      #$700, sr
00F59E: 203c4b000001     move.l     #$4b000001, d0
00F5A4: 223c940693f0     move.l     #$940693f0, d1
00F5AA: 243c96d09500     move.l     #$96d09500, d2
00F5B0: 363c977f         move.w     #$977f, d3
00F5B4: 4eb900003980     jsr        $3980.l
00F5BA: 027cf8ff         andi.w     #$f8ff, sr
00F5BE: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00F5C6: 67000010         beq.w      $f5d8
00F5CA: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00F5D2: 67000004         beq.w      $f5d8
00F5D6: 4e75             rts        
00F5D8: 1e3900ff053d     move.b     $ff053d.l, d7
00F5DE: 1e3900ff053d     move.b     $ff053d.l, d7
00F5E4: 7000             moveq      #$0, d0
00F5E6: 1007             move.b     d7, d0
00F5E8: 04400080         subi.w     #$80, d0
00F5EC: e340             asl.w      #$1, d0
00F5EE: 41f90001049e     lea.l      $1049e.l, a0
00F5F4: 33f0000000ff0542 move.w     (a0, d0.w), $ff0542.l
00F5FC: 4ef900003d7a     jmp        $3d7a.l

; ---- ДАННЫЕ $00F602..$00F7CC (458 байт) ----


; ==== sub_00F7CC зовут=3 ====
00F7CC: 2f0e             move.l     a6, -(a7)
00F7CE: 61000006         bsr.w      $f7d6
00F7D2: 2c5f             movea.l    (a7)+, a6
00F7D4: 4e75             rts        

; ==== sub_00F7D6 зовут=1 ====
00F7D6: 4a7900ff0418     tst.w      $ff0418.l
00F7DC: 66000008         bne.w      $f7e6
00F7E0: 4ef900013a04     jmp        $13a04.l
00F7E6: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00F7EE: 6600001a         bne.w      $f80a
00F7F2: 4df900ff1000     lea.l      $ff1000.l, a6
00F7F8: 4eb9000106fa     jsr        $106fa.l
00F7FE: 4df900ff1400     lea.l      $ff1400.l, a6
00F804: 4ef9000106fa     jmp        $106fa.l
00F80A: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
00F812: 6600001a         bne.w      $f82e
00F816: 4df900ff1800     lea.l      $ff1800.l, a6
00F81C: 4eb9000106fa     jsr        $106fa.l
00F822: 4df900ff1c00     lea.l      $ff1c00.l, a6
00F828: 4ef9000106fa     jmp        $106fa.l
00F82E: 4e75             rts        

; ==== sub_00F830 ТАБЛИЦА зовут=0 ====
00F830: 523900ff0502     addq.b     #$1, $ff0502.l
00F836: 0c39000200ff0502 cmpi.b     #$2, $ff0502.l
00F83E: 6600000c         bne.w      $f84c
00F842: 423900ff0502     clr.b      $ff0502.l
00F848: 61000304         bsr.w      $fb4e
00F84C: 4eb9000104de     jsr        $104de.l
00F852: 4eb9000099d0     jsr        $99d0.l
00F858: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00F860: 6700000e         beq.w      $f870
00F864: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00F86C: 66000076         bne.w      $f8e4
00F870: 537900ff0542     subq.w     #$1, $ff0542.l
00F876: 66000006         bne.w      $f87e
00F87A: 60000004         bra.w      $f880
00F87E: 4e75             rts        
00F880: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00F888: 66000026         bne.w      $f8b0
00F88C: 13fc004000ff1041 move.b     #$40, $ff1041.l
00F894: 13fc004000ff1441 move.b     #$40, $ff1441.l
00F89C: 13fc004000ff1841 move.b     #$40, $ff1841.l
00F8A4: 13fc004000ff1c41 move.b     #$40, $ff1c41.l
00F8AC: 60000036         bra.w      $f8e4
00F8B0: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00F8B8: 6600002a         bne.w      $f8e4
00F8BC: 13fc004000ff1041 move.b     #$40, $ff1041.l
00F8C4: 13fc004000ff1441 move.b     #$40, $ff1441.l
00F8CC: 13fc004000ff1841 move.b     #$40, $ff1841.l
00F8D4: 13fc004000ff1c41 move.b     #$40, $ff1c41.l
00F8DC: 13fc004000ff2041 move.b     #$40, $ff2041.l
00F8E4: 4a7900ff0418     tst.w      $ff0418.l
00F8EA: 6600000c         bne.w      $f8f8
00F8EE: 13f900ff104100ff1441 move.b     $ff1041.l, $ff1441.l
00F8F8: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
00F902: 4df900ff1000     lea.l      $ff1000.l, a6
00F908: 7e00             moveq      #$0, d7
00F90A: 6100016c         bsr.w      $fa78
00F90E: 4dee0400         lea.l      $400(a6), a6
00F912: 537900ff0424     subq.w     #$1, $ff0424.l
00F918: 66f0             bne.b      $f90a
00F91A: be7900ff0422     cmp.w      $ff0422.l, d7
00F920: 66000114         bne.w      $fa36
00F924: 41f900ff9000     lea.l      $ff9000.l, a0
00F92A: 43f900ff8000     lea.l      $ff8000.l, a1
00F930: 303c037f         move.w     #$37f, d0
00F934: 22d8             move.l     (a0)+, (a1)+
00F936: 51c8fffc         dbra       d0, $f934
00F93A: 6100fe90         bsr.w      $f7cc
00F93E: 4eb900009e12     jsr        $9e12.l
00F944: 4df900ff1000     lea.l      $ff1000.l, a6
00F94A: 33f900ff042200ff0424 move.w     $ff0422.l, $ff0424.l
00F954: 426e004c         clr.w      $4c(a6)
00F958: 426e0200         clr.w      $200(a6)
00F95C: 4eb90000dfae     jsr        $dfae.l
00F962: 4eb90000e62c     jsr        $e62c.l
00F968: 4dee0400         lea.l      $400(a6), a6
00F96C: 537900ff0424     subq.w     #$1, $ff0424.l
00F972: 66e0             bne.b      $f954
00F974: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00F97C: 67000040         beq.w      $f9be
00F980: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00F988: 67000034         beq.w      $f9be
00F98C: 1e3900ff053d     move.b     $ff053d.l, d7
00F992: 7000             moveq      #$0, d0
00F994: 1007             move.b     d7, d0
00F996: 04400080         subi.w     #$80, d0
00F99A: e340             asl.w      #$1, d0
00F99C: 41f90001049e     lea.l      $1049e.l, a0
00F9A2: 33f0000000ff0542 move.w     (a0, d0.w), $ff0542.l
00F9AA: 4eb900003d7a     jsr        $3d7a.l
00F9B0: 4eb900000ee2     jsr        $ee2.l
00F9B6: 537900ff0542     subq.w     #$1, $ff0542.l
00F9BC: 66f2             bne.b      $f9b0
00F9BE: 33fc002000ff0406 move.w     #$20, $ff0406.l
00F9C6: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00F9CE: 66000006         bne.w      $f9d6
00F9D2: 6100081e         bsr.w      $101f2
00F9D6: 4a7900ff0418     tst.w      $ff0418.l
00F9DC: 66000020         bne.w      $f9fe
00F9E0: 13fc008400ff053c move.b     #$84, $ff053c.l
00F9E8: 4eb9000138d2     jsr        $138d2.l
00F9EE: 0c400009         cmpi.w     #$9, d0
00F9F2: 6d00000a         blt.w      $f9fe
00F9F6: 13fc009f00ff053c move.b     #$9f, $ff053c.l
00F9FE: 7e00             moveq      #$0, d7
00FA00: 1e3900ff053c     move.b     $ff053c.l, d7
00FA06: 04070080         subi.b     #$80, d7
00FA0A: 41fa002c         lea.l      $fa38(pc), a0
00FA0E: 13f0700000ff4108 move.b     (a0, d7.w), $ff4108.l
00FA16: 1e3900ff053c     move.b     $ff053c.l, d7
00FA1C: 4eb900003d7a     jsr        $3d7a.l
00FA22: 41fa0034         lea.l      $fa58(pc), a0
00FA26: 43f900ff0360     lea.l      $ff0360.l, a1
00FA2C: 303c0007         move.w     #$7, d0
00FA30: 22d8             move.l     (a0)+, (a1)+
00FA32: 51c8fffc         dbra       d0, $fa30
00FA36: 4e75             rts        

; ---- ДАННЫЕ $00FA38..$00FA78 (64 байт) ----


; ==== sub_00FA78 зовут=1 ====
00FA78: 4a6e004c         tst.w      $4c(a6)
00FA7C: 6600005a         bne.w      $fad8
00FA80: 102e0041         move.b     $41(a6), d0
00FA84: 020000f0         andi.b     #$f0, d0
00FA88: 67000050         beq.w      $fada
00FA8C: 3d7c0001004c     move.w     #$1, $4c(a6)
00FA92: 41f900ffa000     lea.l      $ffa000.l, a0
00FA98: 703f             moveq      #$3f, d0
00FA9A: 4298             clr.l      (a0)+
00FA9C: 51c8fffc         dbra       d0, $fa9a
00FAA0: 41f900ffa000     lea.l      $ffa000.l, a0
00FAA6: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
00FAAE: 67000016         beq.w      $fac6
00FAB2: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
00FABA: 6700000a         beq.w      $fac6
00FABE: 61000068         bsr.w      $fb28
00FAC2: 60000006         bra.w      $faca
00FAC6: 61000014         bsr.w      $fadc
00FACA: 4eb90000e62c     jsr        $e62c.l
00FAD0: 13fc000100ff040d move.b     #$1, $ff040d.l
00FAD8: 5247             addq.w     #$1, d7
00FADA: 4e75             rts        

; ==== sub_00FADC зовут=2 ====
00FADC: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00FAE0: 7000             moveq      #$0, d0
00FAE2: 302e0200         move.w     $200(a6), d0
00FAE6: 43f900ff8000     lea.l      $ff8000.l, a1
00FAEC: d3c0             adda.l     d0, a1
00FAEE: 303c6000         move.w     #$6000, d0
00FAF2: 7e05             moveq      #$5, d7
00FAF4: 7c01             moveq      #$1, d6
00FAF6: 4eb900010fc2     jsr        $10fc2.l
00FAFC: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00FB00: 4e75             rts        

; ==== sub_00FB02 зовут=1 ====
00FB02: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00FB06: 7000             moveq      #$0, d0
00FB08: 302e0200         move.w     $200(a6), d0
00FB0C: 43f900ff8000     lea.l      $ff8000.l, a1
00FB12: d3c0             adda.l     d0, a1
00FB14: 303c6200         move.w     #$6200, d0
00FB18: 7e09             moveq      #$9, d7
00FB1A: 7c02             moveq      #$2, d6
00FB1C: 4eb900010fc2     jsr        $10fc2.l
00FB22: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00FB26: 4e75             rts        

; ==== sub_00FB28 зовут=1 ====
00FB28: 48e7fffe         movem.l    d0-d7/a0-a6, -(a7)
00FB2C: 7000             moveq      #$0, d0
00FB2E: 302e0200         move.w     $200(a6), d0
00FB32: 43f900ff8000     lea.l      $ff8000.l, a1
00FB38: d3c0             adda.l     d0, a1
00FB3A: 303c0000         move.w     #$0, d0
00FB3E: 7e09             moveq      #$9, d7
00FB40: 7c02             moveq      #$2, d6
00FB42: 4eb900010fc2     jsr        $10fc2.l
00FB48: 4cdf7fff         movem.l    (a7)+, d0-d7/a0-a6
00FB4C: 4e75             rts        

; ==== sub_00FB4E зовут=5 ====
00FB4E: 303900ff036e     move.w     $ff036e.l, d0
00FB54: 41f900ff036c     lea.l      $ff036c.l, a0
00FB5A: 7404             moveq      #$4, d2
00FB5C: 3210             move.w     (a0), d1
00FB5E: 31410002         move.w     d1, $2(a0)
00FB62: 41e8fffe         lea.l      -$2(a0), a0
00FB66: 51cafff4         dbra       d2, $fb5c
00FB6A: 31400002         move.w     d0, $2(a0)
00FB6E: 303900ff037a     move.w     $ff037a.l, d0
00FB74: 41f900ff0378     lea.l      $ff0378.l, a0
00FB7A: 7404             moveq      #$4, d2
00FB7C: 3210             move.w     (a0), d1
00FB7E: 31410002         move.w     d1, $2(a0)
00FB82: 41e8fffe         lea.l      -$2(a0), a0
00FB86: 51cafff4         dbra       d2, $fb7c
00FB8A: 31400002         move.w     d0, $2(a0)
00FB8E: 13fc000100ff0400 move.b     #$1, $ff0400.l
00FB96: 4e75             rts        

; ==== sub_00FB98 ТАБЛИЦА зовут=0 ====
00FB98: 4eb900003952     jsr        $3952.l
00FB9E: 0839000700ffe00d btst.b     #$7, $ffe00d.l
00FBA6: 6600004a         bne.w      $fbf2
00FBAA: 103900ffe00d     move.b     $ffe00d.l, d0
00FBB0: 02000070         andi.b     #$70, d0
00FBB4: 6700001c         beq.w      $fbd2
00FBB8: 0c39000400ff0501 cmpi.b     #$4, $ff0501.l
00FBC0: 67000044         beq.w      $fc06
00FBC4: 1e3c00a3         move.b     #$a3, d7
00FBC8: 4eb900003d7a     jsr        $3d7a.l
00FBCE: 610004e2         bsr.w      $100b2
00FBD2: 4eb90000fd5c     jsr        $fd5c.l
00FBD8: 6100066a         bsr.w      $10244
00FBDC: 61000734         bsr.w      $10312
00FBE0: 6100006c         bsr.w      $fc4e
00FBE4: 6100021a         bsr.w      $fe00
00FBE8: 13fc000100ff040d move.b     #$1, $ff040d.l
00FBF0: 4e75             rts        
00FBF2: 0c79003000ff0510 cmpi.w     #$30, $ff0510.l
00FBFA: 6600000a         bne.w      $fc06
00FBFE: 13fc000100ff0459 move.b     #$1, $ff0459.l
00FC06: 1e3c00a3         move.b     #$a3, d7
00FC0A: 4eb900003d7a     jsr        $3d7a.l
00FC10: 4eb900003940     jsr        $3940.l
00FC16: 41f900ff0460     lea.l      $ff0460.l, a0
00FC1C: 43f900ffe100     lea.l      $ffe100.l, a1
00FC22: 7000             moveq      #$0, d0
00FC24: 303900ff0418     move.w     $ff0418.l, d0
00FC2A: e940             asl.w      #$4, d0
00FC2C: d3c0             adda.l     d0, a1
00FC2E: 7e0e             moveq      #$e, d7
00FC30: 12d8             move.b     (a0)+, (a1)+
00FC32: 51cffffc         dbra       d7, $fc30
00FC36: 13fc000300ff0438 move.b     #$3, $ff0438.l
00FC3E: 33fc001800ff0406 move.w     #$18, $ff0406.l
00FC46: 427900ff0432     clr.w      $ff0432.l
00FC4C: 4e75             rts        

; ==== sub_00FC4E зовут=1 ====
00FC4E: 103900ffe00d     move.b     $ffe00d.l, d0
00FC54: 0200000f         andi.b     #$f, d0
00FC58: 6700000c         beq.w      $fc66
00FC5C: 1e3c00b3         move.b     #$b3, d7
00FC60: 4eb900003d7a     jsr        $3d7a.l
00FC66: 0839000200ffe00d btst.b     #$2, $ffe00d.l
00FC6E: 67000024         beq.w      $fc94
00FC72: 4a3900ff0500     tst.b      $ff0500.l
00FC78: 66000014         bne.w      $fc8e
00FC7C: 303900ff0422     move.w     $ff0422.l, d0
00FC82: 5340             subq.w     #$1, d0
00FC84: 13c000ff0500     move.b     d0, $ff0500.l
00FC8A: 60000008         bra.w      $fc94
00FC8E: 533900ff0500     subq.b     #$1, $ff0500.l
00FC94: 0839000300ffe00d btst.b     #$3, $ffe00d.l
00FC9C: 67000024         beq.w      $fcc2
00FCA0: 303900ff0422     move.w     $ff0422.l, d0
00FCA6: 5340             subq.w     #$1, d0
00FCA8: b03900ff0500     cmp.b      $ff0500.l, d0
00FCAE: 6600000c         bne.w      $fcbc
00FCB2: 423900ff0500     clr.b      $ff0500.l
00FCB8: 60000008         bra.w      $fcc2
00FCBC: 523900ff0500     addq.b     #$1, $ff0500.l
00FCC2: 0839000000ffe00d btst.b     #$0, $ffe00d.l
00FCCA: 67000042         beq.w      $fd0e
00FCCE: 4a3900ff0501     tst.b      $ff0501.l
00FCD4: 6600000e         bne.w      $fce4
00FCD8: 13fc000400ff0501 move.b     #$4, $ff0501.l
00FCE0: 6000002c         bra.w      $fd0e
00FCE4: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00FCEC: 6700001a         beq.w      $fd08
00FCF0: 0c39000400ff0501 cmpi.b     #$4, $ff0501.l
00FCF8: 6600000e         bne.w      $fd08
00FCFC: 13fc000200ff0501 move.b     #$2, $ff0501.l
00FD04: 60000008         bra.w      $fd0e
00FD08: 533900ff0501     subq.b     #$1, $ff0501.l
00FD0E: 0839000100ffe00d btst.b     #$1, $ffe00d.l
00FD16: 67000042         beq.w      $fd5a
00FD1A: 0c39000400ff0501 cmpi.b     #$4, $ff0501.l
00FD22: 6600000c         bne.w      $fd30
00FD26: 423900ff0501     clr.b      $ff0501.l
00FD2C: 6000002c         bra.w      $fd5a
00FD30: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00FD38: 6700001a         beq.w      $fd54
00FD3C: 0c39000200ff0501 cmpi.b     #$2, $ff0501.l
00FD44: 6600000e         bne.w      $fd54
00FD48: 13fc000400ff0501 move.b     #$4, $ff0501.l
00FD50: 60000008         bra.w      $fd5a
00FD54: 523900ff0501     addq.b     #$1, $ff0501.l
00FD5A: 4e75             rts        

; ==== sub_00FD5C зовут=1 ====
00FD5C: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
00FD64: 67000004         beq.w      $fd6a
00FD68: 4e75             rts        
00FD6A: 4a3900ff0459     tst.b      $ff0459.l
00FD70: 67000004         beq.w      $fd76
00FD74: 4e75             rts        
00FD76: 103900ffe00d     move.b     $ffe00d.l, d0
00FD7C: 02000050         andi.b     #$50, d0
00FD80: 66000068         bne.w      $fdea
00FD84: 0839000500ffe00d btst.b     #$5, $ffe00d.l
00FD8C: 67e6             beq.b      $fd74
00FD8E: 343900ff0510     move.w     $ff0510.l, d2
00FD94: 41fa000a         lea.l      $fda0(pc), a0
00FD98: 20702000         movea.l    (a0, d2.w), a0
00FD9C: 4e90             jsr        (a0)
00FD9E: 4e75             rts        

; ---- ДАННЫЕ $00FDA0..$00FDD8 (56 байт) ----


; ==== sub_00FDD8 ТАБЛИЦА зовут=0 ====
00FDD8: 4a3900ff0501     tst.b      $ff0501.l
00FDDE: 6600000a         bne.w      $fdea
00FDE2: 587900ff0510     addq.w     #$4, $ff0510.l
00FDE8: 4e75             rts        
00FDEA: 427900ff0510     clr.w      $ff0510.l
00FDF0: 4e75             rts        

; ==== sub_00FDF2 ТАБЛИЦА зовут=0 ====
00FDF2: 0c39000200ff0501 cmpi.b     #$2, $ff0501.l
00FDFA: 66ee             bne.b      $fdea
00FDFC: 60e4             bra.b      $fde2

; ---- ДАННЫЕ $00FDFE..$00FE00 (2 байт) ----


; ==== sub_00FE00 зовут=2 ====
00FE00: 7000             moveq      #$0, d0
00FE02: 7200             moveq      #$0, d1
00FE04: 123900ff0500     move.b     $ff0500.l, d1
00FE0A: e341             asl.w      #$1, d1
00FE0C: 103900ff0501     move.b     $ff0501.l, d0
00FE12: e940             asl.w      #$4, d0
00FE14: 41fa0034         lea.l      $fe4a(pc), a0
00FE18: d1c0             adda.l     d0, a0
00FE1A: 2258             movea.l    (a0)+, a1
00FE1C: 3818             move.w     (a0)+, d4
00FE1E: 06440080         addi.w     #$80, d4
00FE22: d1c1             adda.l     d1, a0
00FE24: 3a10             move.w     (a0), d5
00FE26: 06450080         addi.w     #$80, d5
00FE2A: 3e19             move.w     (a1)+, d7
00FE2C: 41f900ff0000     lea.l      $ff0000.l, a0
00FE32: 3019             move.w     (a1)+, d0
00FE34: d044             add.w      d4, d0
00FE36: 30c0             move.w     d0, (a0)+
00FE38: 3019             move.w     (a1)+, d0
00FE3A: 8158             or.w       d0, (a0)+
00FE3C: 30d9             move.w     (a1)+, (a0)+
00FE3E: 3019             move.w     (a1)+, d0
00FE40: d045             add.w      d5, d0
00FE42: 30c0             move.w     d0, (a0)+
00FE44: 51cfffec         dbra       d7, $fe32
00FE48: 4e75             rts        

; ---- ДАННЫЕ $00FE4A..$0100B2 (616 байт) ----


; ==== sub_0100B2 зовут=1 ====
0100B2: 0c39000300ff0501 cmpi.b     #$3, $ff0501.l
0100BA: 670000f0         beq.w      $101ac
0100BE: 0c39000000ff0501 cmpi.b     #$0, $ff0501.l
0100C6: 6700001c         beq.w      $100e4
0100CA: 0c39000100ff0501 cmpi.b     #$1, $ff0501.l
0100D2: 67000050         beq.w      $10124
0100D6: 0c39000200ff0501 cmpi.b     #$2, $ff0501.l
0100DE: 6700008c         beq.w      $1016c
0100E2: 4e75             rts        
0100E4: 41f900ff0460     lea.l      $ff0460.l, a0
0100EA: 7000             moveq      #$0, d0
0100EC: 103900ff0500     move.b     $ff0500.l, d0
0100F2: 0839000400ffe00d btst.b     #$4, $ffe00d.l
0100FA: 67000014         beq.w      $10110
0100FE: 53300000         subq.b     #$1, (a0, d0.w)
010102: 6a00001e         bpl.w      $10122
010106: 11bc00050000     move.b     #$5, (a0, d0.w)
01010C: 60000014         bra.w      $10122
010110: 52300000         addq.b     #$1, (a0, d0.w)
010114: 0c3000060000     cmpi.b     #$6, (a0, d0.w)
01011A: 66000006         bne.w      $10122
01011E: 42300000         clr.b      (a0, d0.w)
010122: 4e75             rts        
010124: 41f900ff0465     lea.l      $ff0465.l, a0
01012A: 7000             moveq      #$0, d0
01012C: 103900ff0500     move.b     $ff0500.l, d0
010132: 0839000400ffe00d btst.b     #$4, $ffe00d.l
01013A: 6700001a         beq.w      $10156
01013E: 53300000         subq.b     #$1, (a0, d0.w)
010142: 0c3000030000     cmpi.b     #$3, (a0, d0.w)
010148: 66000020         bne.w      $1016a
01014C: 11bc00060000     move.b     #$6, (a0, d0.w)
010152: 60000016         bra.w      $1016a
010156: 52300000         addq.b     #$1, (a0, d0.w)
01015A: 0c3000060000     cmpi.b     #$6, (a0, d0.w)
010160: 6f000008         ble.w      $1016a
010164: 11bc00040000     move.b     #$4, (a0, d0.w)
01016A: 4e75             rts        
01016C: 41f900ff046a     lea.l      $ff046a.l, a0
010172: 7000             moveq      #$0, d0
010174: 103900ff0500     move.b     $ff0500.l, d0
01017A: 0839000400ffe00d btst.b     #$4, $ffe00d.l
010182: 67000014         beq.w      $10198
010186: 53300000         subq.b     #$1, (a0, d0.w)
01018A: 6a00001e         bpl.w      $101aa
01018E: 11bc00020000     move.b     #$2, (a0, d0.w)
010194: 60000014         bra.w      $101aa
010198: 52300000         addq.b     #$1, (a0, d0.w)
01019C: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0101A2: 6f000006         ble.w      $101aa
0101A6: 42300000         clr.b      (a0, d0.w)
0101AA: 4e75             rts        
0101AC: 0839000400ffe00d btst.b     #$4, $ffe00d.l
0101B4: 67000018         beq.w      $101ce
0101B8: 537900ffe180     subq.w     #$1, $ffe180.l
0101BE: 6a000026         bpl.w      $101e6
0101C2: 33fc000400ffe180 move.w     #$4, $ffe180.l
0101CA: 6000001a         bra.w      $101e6
0101CE: 527900ffe180     addq.w     #$1, $ffe180.l
0101D4: 0c79000500ffe180 cmpi.w     #$5, $ffe180.l
0101DC: 66000008         bne.w      $101e6
0101E0: 427900ffe180     clr.w      $ffe180.l
0101E6: 6100000a         bsr.w      $101f2
0101EA: 423900ff0459     clr.b      $ff0459.l
0101F0: 4e75             rts        

; ==== sub_0101F2 зовут=3 ====
0101F2: 303900ffe180     move.w     $ffe180.l, d0
0101F8: e540             asl.w      #$2, d0
0101FA: 41fa0034         lea.l      $10230(pc), a0
0101FE: 43f900ff0538     lea.l      $ff0538.l, a1
010204: 22b00000         move.l     (a0, d0.w), (a1)
010208: 303900ffe180     move.w     $ffe180.l, d0
01020E: e340             asl.w      #$1, d0
010210: 41fa0014         lea.l      $10226(pc), a0
010214: 13f0000000ff053c move.b     (a0, d0.w), $ff053c.l
01021C: 13f0000100ff053d move.b     $1(a0, d0.w), $ff053d.l
010224: 4e75             rts        

; ---- ДАННЫЕ $010226..$010244 (30 байт) ----


; ==== sub_010244 зовут=2 ====
010244: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
01024C: 67000004         beq.w      $10252
010250: 4e75             rts        
010252: 7000             moveq      #$0, d0
010254: 303900ffe180     move.w     $ffe180.l, d0
01025A: eb40             asl.w      #$5, d0
01025C: 41fa0014         lea.l      $10272(pc), a0
010260: d1c0             adda.l     d0, a0
010262: 43f900ff8b1a     lea.l      $ff8b1a.l, a1
010268: 7e05             moveq      #$5, d7
01026A: 7c01             moveq      #$1, d6
01026C: 4ef900010fdc     jmp        $10fdc.l

; ---- ДАННЫЕ $010272..$010312 (160 байт) ----


; ==== sub_010312 зовут=2 ====
010312: 41f900ff0460     lea.l      $ff0460.l, a0
010318: 43f900ff839c     lea.l      $ff839c.l, a1
01031E: 61000052         bsr.w      $10372
010322: 41f900ff0465     lea.l      $ff0465.l, a0
010328: 43f900ff851c     lea.l      $ff851c.l, a1
01032E: 61000042         bsr.w      $10372
010332: 41f900ff046a     lea.l      $ff046a.l, a0
010338: 43f900ff881a     lea.l      $ff881a.l, a1
01033E: 3e3900ff0422     move.w     $ff0422.l, d7
010344: 5347             subq.w     #$1, d7
010346: 2f09             move.l     a1, -(a7)
010348: 7000             moveq      #$0, d0
01034A: 1018             move.b     (a0)+, d0
01034C: eb40             asl.w      #$5, d0
01034E: 45fa0054         lea.l      $103a4(pc), a2
010352: d5c0             adda.l     d0, a2
010354: 7403             moveq      #$3, d2
010356: 7203             moveq      #$3, d1
010358: 32da             move.w     (a2)+, (a1)+
01035A: 51c9fffc         dbra       d1, $10358
01035E: 43e90078         lea.l      $78(a1), a1
010362: 51cafff2         dbra       d2, $10356
010366: 225f             movea.l    (a7)+, a1
010368: 43e9000a         lea.l      $a(a1), a1
01036C: 51cfffd8         dbra       d7, $10346
010370: 4e75             rts        

; ==== sub_010372 зовут=2 ====
010372: 3e3900ff0422     move.w     $ff0422.l, d7
010378: 5347             subq.w     #$1, d7
01037A: 7000             moveq      #$0, d0
01037C: 1018             move.b     (a0)+, d0
01037E: d040             add.w      d0, d0
010380: 0640e162         addi.w     #$e162, d0
010384: 3280             move.w     d0, (a1)
010386: 5240             addq.w     #$1, d0
010388: 33400002         move.w     d0, $2(a1)
01038C: 0640000f         addi.w     #$f, d0
010390: 33400080         move.w     d0, $80(a1)
010394: 5240             addq.w     #$1, d0
010396: 33400082         move.w     d0, $82(a1)
01039A: 43e9000a         lea.l      $a(a1), a1
01039E: 51cfffda         dbra       d7, $1037a
0103A2: 4e75             rts        

; ---- ДАННЫЕ $0103A4..$01042E (138 байт) ----


; ==== sub_01042E зовут=3 ====
01042E: 7e03             moveq      #$3, d7
010430: 0c79000400ff0418 cmpi.w     #$4, $ff0418.l
010438: 67000012         beq.w      $1044c
01043C: 7e04             moveq      #$4, d7
01043E: 0c79000500ff0418 cmpi.w     #$5, $ff0418.l
010446: 67000004         beq.w      $1044c
01044A: 4e75             rts        
01044C: 4df900ff1000     lea.l      $ff1000.l, a6
010452: 206e000a         movea.l    $a(a6), a0
010456: 41e80802         lea.l      $802(a0), a0
01045A: 7000             moveq      #$0, d0
01045C: 102e00d8         move.b     $d8(a6), d0
010460: 81fc000a         divs.w     #$a, d0
010464: 6700000c         beq.w      $10472
010468: 06400070         addi.w     #$70, d0
01046C: 00408000         ori.w      #$8000, d0
010470: 3080             move.w     d0, (a0)
010472: 41e80002         lea.l      $2(a0), a0
010476: 4840             swap       d0
010478: 06400070         addi.w     #$70, d0
01047C: 00408000         ori.w      #$8000, d0
010480: 30c0             move.w     d0, (a0)+
010482: 303c807a         move.w     #$807a, d0
010486: 30c0             move.w     d0, (a0)+
010488: 303c807b         move.w     #$807b, d0
01048C: 30c0             move.w     d0, (a0)+
01048E: 303c807c         move.w     #$807c, d0
010492: 3080             move.w     d0, (a0)
010494: 4dee0400         lea.l      $400(a6), a6
010498: 51cfffb8         dbra       d7, $10452
01049C: 4e75             rts        

; ---- ДАННЫЕ $01049E..$0104DE (64 байт) ----


; ==== sub_0104DE зовут=3 ====
0104DE: 4a3900ff4100     tst.b      $ff4100.l
0104E4: 66000024         bne.w      $1050a
0104E8: 4a7900ff0418     tst.w      $ff0418.l
0104EE: 6700340c         beq.w      $138fc
0104F2: 0c79000600ff0418 cmpi.w     #$6, $ff0418.l
0104FA: 67000758         beq.w      $10c54
0104FE: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
010506: 67000004         beq.w      $1050c
01050A: 4e75             rts        
01050C: 4df900ff1000     lea.l      $ff1000.l, a6
010512: 4bee0400         lea.l      $400(a6), a5
010516: 61000016         bsr.w      $1052e
01051A: 61000196         bsr.w      $106b2
01051E: 4dee0400         lea.l      $400(a6), a6
010522: 4beefc00         lea.l      -$400(a6), a5
010526: 61000006         bsr.w      $1052e
01052A: 60000186         bra.w      $106b2

; ==== sub_01052E зовут=2 ====
01052E: 4a2e00d5         tst.b      $d5(a6)
010532: 67000006         beq.w      $1053a
010536: 532e00d5         subq.b     #$1, $d5(a6)
01053A: 4a2e00d4         tst.b      $d4(a6)
01053E: 6700003a         beq.w      $1057a
010542: 4a2e00d5         tst.b      $d5(a6)
010546: 67000022         beq.w      $1056a
01054A: 41fa012c         lea.l      $10678(pc), a0
01054E: 102e00d4         move.b     $d4(a6), d0
010552: 122e00b8         move.b     $b8(a6), d1
010556: 14300000         move.b     (a0, d0.w), d2
01055A: 16301000         move.b     (a0, d1.w), d3
01055E: b403             cmp.b      d3, d2
010560: 6e000008         bgt.w      $1056a
010564: 422e00d4         clr.b      $d4(a6)
010568: 4e75             rts        
01056A: 102e00d4         move.b     $d4(a6), d0
01056E: 1d4000b8         move.b     d0, $b8(a6)
010572: 422e00d4         clr.b      $d4(a6)
010576: 60000114         bra.w      $1068c
01057A: 4a2e00d5         tst.b      $d5(a6)
01057E: 67000004         beq.w      $10584
010582: 4e75             rts        
010584: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
01058C: 6d000004         blt.w      $10592
010590: 4e75             rts        
010592: 542e00d6         addq.b     #$2, $d6(a6)
010596: 0c2e000a00d6     cmpi.b     #$a, $d6(a6)
01059C: 66000006         bne.w      $105a4
0105A0: 422e00d6         clr.b      $d6(a6)
0105A4: 206e0006         movea.l    $6(a6), a0
0105A8: 41e80050         lea.l      $50(a0), a0
0105AC: 2018             move.l     (a0)+, d0
0105AE: 8098             or.l       (a0)+, d0
0105B0: 8090             or.l       (a0), d0
0105B2: 6600001c         bne.w      $105d0
0105B6: 206d0006         movea.l    $6(a5), a0
0105BA: 41e80020         lea.l      $20(a0), a0
0105BE: 2018             move.l     (a0)+, d0
0105C0: 8098             or.l       (a0)+, d0
0105C2: 8090             or.l       (a0), d0
0105C4: 6700000a         beq.w      $105d0
0105C8: 103c0004         move.b     #$4, d0
0105CC: 6000006e         bra.w      $1063c
0105D0: 206e0006         movea.l    $6(a6), a0
0105D4: 41e80020         lea.l      $20(a0), a0
0105D8: 2018             move.l     (a0)+, d0
0105DA: 8098             or.l       (a0)+, d0
0105DC: 8090             or.l       (a0), d0
0105DE: 6700000a         beq.w      $105ea
0105E2: 103c0007         move.b     #$7, d0
0105E6: 60000054         bra.w      $1063c
0105EA: 7000             moveq      #$0, d0
0105EC: 102e00d6         move.b     $d6(a6), d0
0105F0: 41ee00f0         lea.l      $f0(a6), a0
0105F4: 7e04             moveq      #$4, d7
0105F6: 4a700000         tst.w      (a0, d0.w)
0105FA: 66000016         bne.w      $10612
0105FE: 5440             addq.w     #$2, d0
010600: 0c40000a         cmpi.w     #$a, d0
010604: 66000004         bne.w      $1060a
010608: 7000             moveq      #$0, d0
01060A: 51cfffea         dbra       d7, $105f6
01060E: 6000001a         bra.w      $1062a
010612: 1d4000d6         move.b     d0, $d6(a6)
010616: e248             lsr.w      #$1, d0
010618: 41fa000a         lea.l      $10624(pc), a0
01061C: 10300000         move.b     (a0, d0.w), d0
010620: 6000001a         bra.w      $1063c

; ---- ДАННЫЕ $010624..$01062A (6 байт) ----

01062A: 0c6e001e005a     cmpi.w     #$1e, $5a(a6)
010630: 66000008         bne.w      $1063a
010634: 7002             moveq      #$2, d0
010636: 60000004         bra.w      $1063c
01063A: 7000             moveq      #$0, d0
01063C: b02e00b8         cmp.b      $b8(a6), d0
010640: 6700000a         beq.w      $1064c
010644: 1d4000b8         move.b     d0, $b8(a6)
010648: 60000042         bra.w      $1068c
01064C: 4e75             rts        

; ==== sub_01064E зовут=5 ====
01064E: 4a2e00d4         tst.b      $d4(a6)
010652: 66000008         bne.w      $1065c
010656: 1d4000d4         move.b     d0, $d4(a6)
01065A: 4e75             rts        
01065C: 41fa001a         lea.l      $10678(pc), a0
010660: 122e00d4         move.b     $d4(a6), d1
010664: 14300000         move.b     (a0, d0.w), d2
010668: 16301000         move.b     (a0, d1.w), d3
01066C: b602             cmp.b      d2, d3
01066E: 6e000006         bgt.w      $10676
010672: 1d4000d4         move.b     d0, $d4(a6)
010676: 4e75             rts        

; ---- ДАННЫЕ $010678..$01068C (20 байт) ----


; ==== sub_01068C зовут=37 ====
01068C: 7000             moveq      #$0, d0
01068E: 102e00b8         move.b     $b8(a6), d0
010692: e540             asl.w      #$2, d0
010694: 41fa017c         lea.l      $10812(pc), a0
010698: 2d70000000b4     move.l     (a0, d0.w), $b4(a6)
01069E: 422e00b9         clr.b      $b9(a6)
0106A2: 1d7c001800ba     move.b     #$18, $ba(a6)
0106A8: 1d7c007800d5     move.b     #$78, $d5(a6)
0106AE: 6000004a         bra.w      $106fa

; ==== sub_0106B2 зовут=8 ====
0106B2: 0c79000100ff0418 cmpi.w     #$1, $ff0418.l
0106BA: 6600002a         bne.w      $106e6
0106BE: 4a2e00e2         tst.b      $e2(a6)
0106C2: 67000022         beq.w      $106e6
0106C6: 532e00e2         subq.b     #$1, $e2(a6)
0106CA: 6600001a         bne.w      $106e6
0106CE: 1e3c00dd         move.b     #$dd, d7
0106D2: 0c2e000200e3     cmpi.b     #$2, $e3(a6)
0106D8: 66000006         bne.w      $106e0
0106DC: 1e3c00ab         move.b     #$ab, d7
0106E0: 4eb900003d7a     jsr        $3d7a.l
0106E6: 532e00ba         subq.b     #$1, $ba(a6)
0106EA: 67000004         beq.w      $106f0
0106EE: 4e75             rts        
0106F0: 1d7c001800ba     move.b     #$18, $ba(a6)
0106F6: 522e00b9         addq.b     #$1, $b9(a6)

; ==== sub_0106FA зовут=2 ====
0106FA: 7000             moveq      #$0, d0
0106FC: 102e00b9         move.b     $b9(a6), d0
010700: 206e00b4         movea.l    $b4(a6), a0
010704: 7200             moveq      #$0, d1
010706: 12300001         move.b     $1(a0, d0.w), d1
01070A: 6a000050         bpl.w      $1075c
01070E: 0c0100ff         cmpi.b     #$ff, d1
010712: 67000040         beq.w      $10754
010716: 0c0100fe         cmpi.b     #$fe, d1
01071A: 67000028         beq.w      $10744
01071E: 0c0100fd         cmpi.b     #$fd, d1
010722: 67000002         beq.w      $10726
010726: 3f07             move.w     d7, -(a7)
010728: 1e300002         move.b     $2(a0, d0.w), d7
01072C: 4eb900003d7a     jsr        $3d7a.l
010732: 3e1f             move.w     (a7)+, d7
010734: 542e00b9         addq.b     #$2, $b9(a6)
010738: 102e00b9         move.b     $b9(a6), d0
01073C: 12300001         move.b     $1(a0, d0.w), d1
010740: 6000001a         bra.w      $1075c
010744: 532e00b9         subq.b     #$1, $b9(a6)
010748: 102e00b9         move.b     $b9(a6), d0
01074C: 12300001         move.b     $1(a0, d0.w), d1
010750: 6000000a         bra.w      $1075c
010754: 12280001         move.b     $1(a0), d1
010758: 422e00b9         clr.b      $b9(a6)
01075C: 4bf900ff04a0     lea.l      $ff04a0.l, a5
010762: 3e2e00c0         move.w     $c0(a6), d7
010766: 7c00             moveq      #$0, d6
010768: 1c2e00bb         move.b     $bb(a6), d6
01076C: 67000020         beq.w      $1078e
010770: 4bf900ff04b0     lea.l      $ff04b0.l, a5
010776: 4a10             tst.b      (a0)
010778: 67000010         beq.w      $1078a
01077C: 286e00bc         movea.l    $bc(a6), a4
010780: 49ecfff8         lea.l      -$8(a4), a4
010784: 7c00             moveq      #$0, d6
010786: 6000000a         bra.w      $10792
01078A: 00470800         ori.w      #$800, d7
01078E: 286e00bc         movea.l    $bc(a6), a4
010792: 202e00c2         move.l     $c2(a6), d0
010796: 2a80             move.l     d0, (a5)
010798: d241             add.w      d1, d1
01079A: 3001             move.w     d1, d0
01079C: e740             asl.w      #$3, d0
01079E: 9041             sub.w      d1, d0
0107A0: c141             exg.l      d0, d1
0107A2: 45fa01a0         lea.l      $10944(pc), a2
0107A6: 20321000         move.l     (a2, d1.w), d0
0107AA: 2b400008         move.l     d0, $8(a5)
0107AE: 30321004         move.w     $4(a2, d1.w), d0
0107B2: 3b40000c         move.w     d0, $c(a5)
0107B6: 20721006         movea.l    $6(a2, d1.w), a0
0107BA: 4a46             tst.w      d6
0107BC: 66000028         bne.w      $107e6
0107C0: 7405             moveq      #$5, d2
0107C2: 7603             moveq      #$3, d3
0107C4: 7000             moveq      #$0, d0
0107C6: 1018             move.b     (a0)+, d0
0107C8: 6b00000a         bmi.w      $107d4
0107CC: d047             add.w      d7, d0
0107CE: 38c0             move.w     d0, (a4)+
0107D0: 60000004         bra.w      $107d6
0107D4: 425c             clr.w      (a4)+
0107D6: 51cbffec         dbra       d3, $107c4
0107DA: 49ec0078         lea.l      $78(a4), a4
0107DE: 51caffe2         dbra       d2, $107c2
0107E2: 60000024         bra.w      $10808
0107E6: 7405             moveq      #$5, d2
0107E8: 7603             moveq      #$3, d3
0107EA: 7000             moveq      #$0, d0
0107EC: 1018             move.b     (a0)+, d0
0107EE: 6b00000a         bmi.w      $107fa
0107F2: d047             add.w      d7, d0
0107F4: 3900             move.w     d0, -(a4)
0107F6: 60000004         bra.w      $107fc
0107FA: 4264             clr.w      -(a4)
0107FC: 51cbffec         dbra       d3, $107ea
010800: 49ec0088         lea.l      $88(a4), a4
010804: 51caffe2         dbra       d2, $107e8
010808: 2032100a         move.l     $a(a2, d1.w), d0
01080C: 2b400004         move.l     d0, $4(a5)
010810: 4e75             rts        

; ---- ДАННЫЕ $010812..$010C54 (1090 байт) ----

010C54: 0c79002400ff043c cmpi.w     #$24, $ff043c.l
010C5C: 670000ba         beq.w      $10d18
010C60: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
010C68: 6c00000e         bge.w      $10c78
010C6C: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
010C74: 6d0000a2         blt.w      $10d18
010C78: 33fc002400ff043c move.w     #$24, $ff043c.l
010C80: 13fc000400ff043e move.b     #$4, $ff043e.l
010C88: 61000316         bsr.w      $10fa0
010C8C: 7a01             moveq      #$1, d5
010C8E: 610003c6         bsr.w      $11056
010C92: 0c79001800ff104c cmpi.w     #$18, $ff104c.l
010C9A: 6d000034         blt.w      $10cd0
010C9E: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
010CA6: 6d00004e         blt.w      $10cf6
010CAA: 4df900ff1800     lea.l      $ff1800.l, a6
010CB0: 1d7c000a00b8     move.b     #$a, $b8(a6)
010CB6: 4eb90001068c     jsr        $1068c.l
010CBC: 4dee0400         lea.l      $400(a6), a6
010CC0: 1d7c000a00b8     move.b     #$a, $b8(a6)
010CC6: 4eb90001068c     jsr        $1068c.l
010CCC: 6000004a         bra.w      $10d18
010CD0: 4df900ff1800     lea.l      $ff1800.l, a6
010CD6: 1d7c000900b8     move.b     #$9, $b8(a6)
010CDC: 4eb90001068c     jsr        $1068c.l
010CE2: 4dee0400         lea.l      $400(a6), a6
010CE6: 1d7c000a00b8     move.b     #$a, $b8(a6)
010CEC: 4eb90001068c     jsr        $1068c.l
010CF2: 60000024         bra.w      $10d18
010CF6: 4df900ff1800     lea.l      $ff1800.l, a6
010CFC: 1d7c000a00b8     move.b     #$a, $b8(a6)
010D02: 4eb90001068c     jsr        $1068c.l
010D08: 4dee0400         lea.l      $400(a6), a6
010D0C: 1d7c000900b8     move.b     #$9, $b8(a6)
010D12: 4eb90001068c     jsr        $1068c.l
010D18: 303900ff043c     move.w     $ff043c.l, d0
010D1E: 41fa0076         lea.l      $10d96(pc), a0
010D22: 20700000         movea.l    (a0, d0.w), a0
010D26: 4e90             jsr        (a0)
010D28: 4df900ff1800     lea.l      $ff1800.l, a6
010D2E: 7000             moveq      #$0, d0
010D30: 61000008         bsr.w      $10d3a
010D34: 4dee0400         lea.l      $400(a6), a6
010D38: 7001             moveq      #$1, d0

; ==== sub_010D3A зовут=1 ====
010D3A: 3f00             move.w     d0, -(a7)
010D3C: 6100f974         bsr.w      $106b2
010D40: 301f             move.w     (a7)+, d0
010D42: 41f900ff0180     lea.l      $ff0180.l, a0
010D48: 4a40             tst.w      d0
010D4A: 67000006         beq.w      $10d52
010D4E: 41e80008         lea.l      $8(a0), a0
010D52: 0c2e001a00b8     cmpi.b     #$1a, $b8(a6)
010D58: 66000038         bne.w      $10d92
010D5C: 4a2e00b9         tst.b      $b9(a6)
010D60: 67000030         beq.w      $10d92
010D64: 4a40             tst.w      d0
010D66: 66000016         bne.w      $10d7e
010D6A: 30fc0130         move.w     #$130, (a0)+
010D6E: 303c0e00         move.w     #$e00, d0
010D72: 8158             or.w       d0, (a0)+
010D74: 30fca350         move.w     #$a350, (a0)+
010D78: 30bc0118         move.w     #$118, (a0)
010D7C: 4e75             rts        
010D7E: 30fc0130         move.w     #$130, (a0)+
010D82: 303c0e00         move.w     #$e00, d0
010D86: 8158             or.w       d0, (a0)+
010D88: 30fcab50         move.w     #$ab50, (a0)+
010D8C: 30bc0108         move.w     #$108, (a0)
010D90: 4e75             rts        
010D92: 4250             clr.w      (a0)
010D94: 4e75             rts        

; ---- ДАННЫЕ $010D96..$010DC2 (44 байт) ----


; ==== sub_010DC2 ТАБЛИЦА зовут=0 ====
010DC2: 0c79002000ff0406 cmpi.w     #$20, $ff0406.l
010DCA: 6600002c         bne.w      $10df8
010DCE: 33fc000400ff043c move.w     #$4, $ff043c.l
010DD6: 423900ff043f     clr.b      $ff043f.l
010DDC: 4eb900000368     jsr        $368.l
010DE2: 303900ffef90     move.w     $ffef90.l, d0
010DE8: 0240000f         andi.w     #$f, d0
010DEC: 41fa000c         lea.l      $10dfa(pc), a0
010DF0: 13f0000000ff043e move.b     (a0, d0.w), $ff043e.l
010DF8: 4e75             rts        

; ---- ДАННЫЕ $010DFA..$010E0A (16 байт) ----


; ==== sub_010E0A ТАБЛИЦА зовут=0 ====
010E0A: 0c79000400ff043a cmpi.w     #$4, $ff043a.l
010E12: 6c0000a8         bge.w      $10ebc
010E16: 0c79000200ff043a cmpi.w     #$2, $ff043a.l
010E1E: 6600004c         bne.w      $10e6c
010E22: 4eb9000037f0     jsr        $37f0.l
010E28: 0c79000300ff043a cmpi.w     #$3, $ff043a.l
010E30: 6d00008a         blt.w      $10ebc
010E34: 41f900ffe034     lea.l      $ffe034.l, a0
010E3A: 7e03             moveq      #$3, d7
010E3C: b1f900ff0474     cmpa.l     $ff0474.l, a0
010E42: 6700001c         beq.w      $10e60
010E46: 1228fffe         move.b     -$2(a0), d1
010E4A: 0241000f         andi.w     #$f, d1
010E4E: 0c01000f         cmpi.b     #$f, d1
010E52: 6700000c         beq.w      $10e60
010E56: 23c800ff0478     move.l     a0, $ff0478.l
010E5C: 6000000e         bra.w      $10e6c
010E60: 41e8000a         lea.l      $a(a0), a0
010E64: 51cfffd6         dbra       d7, $10e3c
010E68: 60000052         bra.w      $10ebc
010E6C: 4eb9000037f0     jsr        $37f0.l
010E72: 0c79000400ff043a cmpi.w     #$4, $ff043a.l
010E7A: 6d000040         blt.w      $10ebc
010E7E: 41f900ffe034     lea.l      $ffe034.l, a0
010E84: 7e03             moveq      #$3, d7
010E86: b1f900ff0474     cmpa.l     $ff0474.l, a0
010E8C: 67000026         beq.w      $10eb4
010E90: b1f900ff0478     cmpa.l     $ff0478.l, a0
010E96: 6700001c         beq.w      $10eb4
010E9A: 1228fffe         move.b     -$2(a0), d1
010E9E: 0241000f         andi.w     #$f, d1
010EA2: 0c01000f         cmpi.b     #$f, d1
010EA6: 6700000c         beq.w      $10eb4
010EAA: 23c800ff047c     move.l     a0, $ff047c.l
010EB0: 6000000a         bra.w      $10ebc
010EB4: 41e8000a         lea.l      $a(a0), a0
010EB8: 51cfffcc         dbra       d7, $10e86
010EBC: 4df900ff1800     lea.l      $ff1800.l, a6
010EC2: 610000a8         bsr.w      $10f6c
010EC6: 4dee0400         lea.l      $400(a6), a6
010ECA: 610000a0         bsr.w      $10f6c
010ECE: 61000184         bsr.w      $11054
010ED2: 610000b6         bsr.w      $10f8a
010ED6: 303900ff184c     move.w     $ff184c.l, d0
010EDC: d07900ff1c4c     add.w      $ff1c4c.l, d0
010EE2: 0c400002         cmpi.w     #$2, d0
010EE6: 67000004         beq.w      $10eec
010EEA: 4e75             rts        
010EEC: 33fc000800ff043c move.w     #$8, $ff043c.l
010EF4: 33fc003c00ff0440 move.w     #$3c, $ff0440.l
010EFC: 423900ff0443     clr.b      $ff0443.l
010F02: 4df900ff1800     lea.l      $ff1800.l, a6
010F08: 422e00c8         clr.b      $c8(a6)
010F0C: 422e00c7         clr.b      $c7(a6)
010F10: 422e00c6         clr.b      $c6(a6)
010F14: 1d7c001300b8     move.b     #$13, $b8(a6)
010F1A: 4eb90001068c     jsr        $1068c.l
010F20: 4dee0400         lea.l      $400(a6), a6
010F24: 422e00c8         clr.b      $c8(a6)
010F28: 422e00c7         clr.b      $c7(a6)
010F2C: 422e00c6         clr.b      $c6(a6)
010F30: 1d7c001300b8     move.b     #$13, $b8(a6)
010F36: 4eb90001068c     jsr        $1068c.l
010F3C: 7a01             moveq      #$1, d5
010F3E: 61000116         bsr.w      $11056
010F42: 6100005c         bsr.w      $10fa0
010F46: 41fa0014         lea.l      $10f5c(pc), a0
010F4A: 43f900ff8820     lea.l      $ff8820.l, a1
010F50: 303c2300         move.w     #$2300, d0
010F54: 7c01             moveq      #$1, d6
010F56: 7e07             moveq      #$7, d7
010F58: 60000068         bra.w      $10fc2

; ---- ДАННЫЕ $010F5C..$010F6C (16 байт) ----


; ==== sub_010F6C зовут=2 ====
010F6C: 082e00070041     btst.b     #$7, $41(a6)
010F72: 67000014         beq.w      $10f88
010F76: 3d7c0001004c     move.w     #$1, $4c(a6)
010F7C: 1d7c000b00b8     move.b     #$b, $b8(a6)
010F82: 4eb90001068c     jsr        $1068c.l
010F88: 4e75             rts        

; ==== sub_010F8A зовут=1 ====
010F8A: 41fa0068         lea.l      $10ff4(pc), a0
010F8E: 523900ff043f     addq.b     #$1, $ff043f.l
010F94: 0839000500ff043f btst.b     #$5, $ff043f.l
010F9C: 67000012         beq.w      $10fb0

; ==== sub_010FA0 зовут=2 ====
010FA0: 41fa0062         lea.l      $11004(pc), a0
010FA4: 7000             moveq      #$0, d0
010FA6: 103900ff043e     move.b     $ff043e.l, d0
010FAC: e940             asl.w      #$4, d0
010FAE: d1c0             adda.l     d0, a0
010FB0: 43f900ff8620     lea.l      $ff8620.l, a1
010FB6: 303c2300         move.w     #$2300, d0
010FBA: 7c01             moveq      #$1, d6
010FBC: 7e07             moveq      #$7, d7
010FBE: 60000002         bra.w      $10fc2

; ==== sub_010FC2 зовут=30 ====
010FC2: 3a07             move.w     d7, d5
010FC4: 2f09             move.l     a1, -(a7)
010FC6: 1018             move.b     (a0)+, d0
010FC8: 32c0             move.w     d0, (a1)+
010FCA: 51cffffa         dbra       d7, $10fc6
010FCE: 225f             movea.l    (a7)+, a1
010FD0: 3e05             move.w     d5, d7
010FD2: 43e90080         lea.l      $80(a1), a1
010FD6: 51ceffec         dbra       d6, $10fc4
010FDA: 4e75             rts        

; ==== sub_010FDC зовут=25 ====
010FDC: 3a07             move.w     d7, d5
010FDE: 2f09             move.l     a1, -(a7)
010FE0: 32d8             move.w     (a0)+, (a1)+
010FE2: 51cffffc         dbra       d7, $10fe0
010FE6: 225f             movea.l    (a7)+, a1
010FE8: 3e05             move.w     d5, d7
010FEA: 43e90080         lea.l      $80(a1), a1
010FEE: 51ceffee         dbra       d6, $10fde
010FF2: 4e75             rts        

; ---- ДАННЫЕ $010FF4..$011054 (96 байт) ----


; ==== sub_011054 зовут=1 ====
011054: 7a00             moveq      #$0, d5

; ==== sub_011056 зовут=2 ====
011056: 7000             moveq      #$0, d0
011058: 41fa004a         lea.l      $110a4(pc), a0
01105C: 43f900ff881e     lea.l      $ff881e.l, a1
011062: 7c04             moveq      #$4, d6
011064: 7e09             moveq      #$9, d7
011066: 1018             move.b     (a0)+, d0
011068: 4a45             tst.w      d5
01106A: 67000004         beq.w      $11070
01106E: 7000             moveq      #$0, d0
011070: 00400300         ori.w      #$300, d0
011074: 32c0             move.w     d0, (a1)+
011076: 51cfffee         dbra       d7, $11066
01107A: 43e9006c         lea.l      $6c(a1), a1
01107E: 51ceffe4         dbra       d6, $11064
011082: 4a7900ff184c     tst.w      $ff184c.l
011088: 67000008         beq.w      $11092
01108C: 42b900ff8a20     clr.l      $ff8a20.l
011092: 4a7900ff1c4c     tst.w      $ff1c4c.l
011098: 67000008         beq.w      $110a2
01109C: 42b900ff8a2c     clr.l      $ff8a2c.l
0110A2: 4e75             rts        

; ---- ДАННЫЕ $0110A4..$0110D6 (50 байт) ----


; ==== sub_0110D6 ТАБЛИЦА зовут=0 ====
0110D6: 537900ff0440     subq.w     #$1, $ff0440.l
0110DC: 67000004         beq.w      $110e2
0110E0: 4e75             rts        
0110E2: 33fc000c00ff043c move.w     #$c, $ff043c.l
0110EA: 4df900ff1800     lea.l      $ff1800.l, a6
0110F0: 1d7c001400b8     move.b     #$14, $b8(a6)
0110F6: 4eb90001068c     jsr        $1068c.l
0110FC: 4dee0400         lea.l      $400(a6), a6
011100: 1d7c001400b8     move.b     #$14, $b8(a6)
011106: 4eb90001068c     jsr        $1068c.l
01110C: 423900ff0442     clr.b      $ff0442.l
011112: 33fc003c00ff0440 move.w     #$3c, $ff0440.l
01111A: 1e3c00d0         move.b     #$d0, d7
01111E: 4eb900003d7a     jsr        $3d7a.l
011124: 60000004         bra.w      $1112a

; ---- ДАННЫЕ $011128..$01112A (2 байт) ----


; ==== sub_01112A зовут=2 ====
01112A: 7000             moveq      #$0, d0
01112C: 103900ff0442     move.b     $ff0442.l, d0
011132: e940             asl.w      #$4, d0
011134: 41fa0024         lea.l      $1115a(pc), a0
011138: 4a3900ff0443     tst.b      $ff0443.l
01113E: 67000006         beq.w      $11146
011142: 41fa0056         lea.l      $1119a(pc), a0
011146: d1c0             adda.l     d0, a0
011148: 43f900ff8820     lea.l      $ff8820.l, a1
01114E: 303c2300         move.w     #$2300, d0
011152: 7c01             moveq      #$1, d6
011154: 7e07             moveq      #$7, d7
011156: 6000fe6a         bra.w      $10fc2

; ---- ДАННЫЕ $01115A..$0111DA (128 байт) ----


; ==== sub_0111DA ТАБЛИЦА зовут=0 ====
0111DA: 6100011e         bsr.w      $112fa
0111DE: 537900ff0440     subq.w     #$1, $ff0440.l
0111E4: 660000f4         bne.w      $112da
0111E8: 1e3c00d0         move.b     #$d0, d7
0111EC: 4eb900003d7a     jsr        $3d7a.l
0111F2: 33fc003c00ff0440 move.w     #$3c, $ff0440.l
0111FA: 523900ff0442     addq.b     #$1, $ff0442.l
011200: 6100ff28         bsr.w      $1112a
011204: 0c39000100ff0442 cmpi.b     #$1, $ff0442.l
01120C: 66000024         bne.w      $11232
011210: 4df900ff1800     lea.l      $ff1800.l, a6
011216: 1d7c001500b8     move.b     #$15, $b8(a6)
01121C: 4eb90001068c     jsr        $1068c.l
011222: 4dee0400         lea.l      $400(a6), a6
011226: 1d7c001500b8     move.b     #$15, $b8(a6)
01122C: 4eb90001068c     jsr        $1068c.l
011232: 0c39000200ff0442 cmpi.b     #$2, $ff0442.l
01123A: 66000086         bne.w      $112c2
01123E: 103900ff18c6     move.b     $ff18c6.l, d0
011244: d03900ff1cc6     add.b      $ff1cc6.l, d0
01124A: 67000076         beq.w      $112c2
01124E: 4a3900ff18c6     tst.b      $ff18c6.l
011254: 67000010         beq.w      $11266
011258: 4a3900ff1cc6     tst.b      $ff1cc6.l
01125E: 6700001a         beq.w      $1127a
011262: 60000026         bra.w      $1128a
011266: 103900ff1cc6     move.b     $ff1cc6.l, d0
01126C: 6100006e         bsr.w      $112dc
011270: 13c100ff18c6     move.b     d1, $ff18c6.l
011276: 60000012         bra.w      $1128a
01127A: 103900ff18c6     move.b     $ff18c6.l, d0
011280: 6100005a         bsr.w      $112dc
011284: 13c100ff1cc6     move.b     d1, $ff1cc6.l
01128A: 4df900ff1800     lea.l      $ff1800.l, a6
011290: 102e00c6         move.b     $c6(a6), d0
011294: 06000015         addi.b     #$15, d0
011298: 1d4000b8         move.b     d0, $b8(a6)
01129C: 4eb90001068c     jsr        $1068c.l
0112A2: 4dee0400         lea.l      $400(a6), a6
0112A6: 102e00c6         move.b     $c6(a6), d0
0112AA: 06000015         addi.b     #$15, d0
0112AE: 1d4000b8         move.b     d0, $b8(a6)
0112B2: 4eb90001068c     jsr        $1068c.l
0112B8: 33fc001000ff043c move.w     #$10, $ff043c.l
0112C0: 4e75             rts        
0112C2: 0c39000300ff0442 cmpi.b     #$3, $ff0442.l
0112CA: 6600000e         bne.w      $112da
0112CE: 13fc000100ff0443 move.b     #$1, $ff0443.l
0112D6: 6000fe0a         bra.w      $110e2
0112DA: 4e75             rts        

; ==== sub_0112DC зовут=2 ====
0112DC: 123c0002         move.b     #$2, d1
0112E0: 0c000001         cmpi.b     #$1, d0
0112E4: 67000012         beq.w      $112f8
0112E8: 123c0003         move.b     #$3, d1
0112EC: 0c000002         cmpi.b     #$2, d0
0112F0: 67000006         beq.w      $112f8
0112F4: 123c0001         move.b     #$1, d1
0112F8: 4e75             rts        

; ==== sub_0112FA зовут=1 ====
0112FA: 4df900ff1800     lea.l      $ff1800.l, a6
011300: 61000008         bsr.w      $1130a
011304: 4df900ff1c00     lea.l      $ff1c00.l, a6

; ==== sub_01130A зовут=1 ====
01130A: 082e00060040     btst.b     #$6, $40(a6)
011310: 67000008         beq.w      $1131a
011314: 1d7c000100c6     move.b     #$1, $c6(a6)
01131A: 082e00040040     btst.b     #$4, $40(a6)
011320: 67000008         beq.w      $1132a
011324: 1d7c000200c6     move.b     #$2, $c6(a6)
01132A: 082e00050040     btst.b     #$5, $40(a6)
011330: 67000008         beq.w      $1133a
011334: 1d7c000300c6     move.b     #$3, $c6(a6)
01133A: 4e75             rts        

; ==== sub_01133C ТАБЛИЦА зовут=0 ====
01133C: 13fc000300ff0442 move.b     #$3, $ff0442.l
011344: 6100fde4         bsr.w      $1112a
011348: 103900ff18c6     move.b     $ff18c6.l, d0
01134E: b03900ff1cc6     cmp.b      $ff1cc6.l, d0
011354: 66000028         bne.w      $1137e
011358: 13fc000100ff0443 move.b     #$1, $ff0443.l
011360: 423900ff18c6     clr.b      $ff18c6.l
011366: 423900ff1cc6     clr.b      $ff1cc6.l
01136C: 33fc002800ff043c move.w     #$28, $ff043c.l
011374: 33fc003c00ff0440 move.w     #$3c, $ff0440.l
01137C: 4e75             rts        
01137E: 33fc001400ff043c move.w     #$14, $ff043c.l
011386: 33fc00b400ff0440 move.w     #$b4, $ff0440.l
01138E: 423900ff18c8     clr.b      $ff18c8.l
011394: 423900ff1cc8     clr.b      $ff1cc8.l
01139A: 4df900ff1800     lea.l      $ff1800.l, a6
0113A0: 43f900ff8820     lea.l      $ff8820.l, a1
0113A6: 61000012         bsr.w      $113ba
0113AA: 4dee0400         lea.l      $400(a6), a6
0113AE: 43f900ff882a     lea.l      $ff882a.l, a1
0113B4: 61000004         bsr.w      $113ba
0113B8: 4e75             rts        

; ==== sub_0113BA зовут=2 ====
0113BA: 7000             moveq      #$0, d0
0113BC: 102e00c6         move.b     $c6(a6), d0
0113C0: 41fa000d         lea.l      $113cf(pc), a0
0113C4: e740             asl.w      #$3, d0
0113C6: d02e00c6         add.b      $c6(a6), d0
0113CA: d1c0             adda.l     d0, a0
0113CC: 303c2300         move.w     #$2300, d0
0113D0: 7c02             moveq      #$2, d6
0113D2: 7e02             moveq      #$2, d7
0113D4: 6000fbec         bra.w      $10fc2

; ---- ДАННЫЕ $0113D8..$0113F4 (28 байт) ----


; ==== sub_0113F4 ТАБЛИЦА зовут=0 ====
0113F4: 537900ff0440     subq.w     #$1, $ff0440.l
0113FA: 67000090         beq.w      $1148c
0113FE: 61000152         bsr.w      $11552
011402: 4eb9000117e4     jsr        $117e4.l
011408: 0c2d001b00b8     cmpi.b     #$1b, $b8(a5)
01140E: 66000008         bne.w      $11418
011412: 1b7c000200c8     move.b     #$2, $c8(a5)
011418: 0c2e000100c8     cmpi.b     #$1, $c8(a6)
01141E: 6700006c         beq.w      $1148c
011422: 0c2e000200c8     cmpi.b     #$2, $c8(a6)
011428: 6600001a         bne.w      $11444
01142C: 0c2e001b00b8     cmpi.b     #$1b, $b8(a6)
011432: 67000010         beq.w      $11444
011436: 103c001b         move.b     #$1b, d0
01143A: 1d4000b8         move.b     d0, $b8(a6)
01143E: 4eb90001068c     jsr        $1068c.l
011444: cd4d             exg.l      a6, a5
011446: 0c2e000200c8     cmpi.b     #$2, $c8(a6)
01144C: 6600001a         bne.w      $11468
011450: 0c2e001b00b8     cmpi.b     #$1b, $b8(a6)
011456: 670000f8         beq.w      $11550
01145A: 103c001b         move.b     #$1b, d0
01145E: 1d4000b8         move.b     d0, $b8(a6)
011462: 4ef90001068c     jmp        $1068c.l
011468: 0c2e000100c8     cmpi.b     #$1, $c8(a6)
01146E: 6600001a         bne.w      $1148a
011472: 0c2e002000b8     cmpi.b     #$20, $b8(a6)
011478: 67000010         beq.w      $1148a
01147C: 103c0020         move.b     #$20, d0
011480: 1d4000b8         move.b     d0, $b8(a6)
011484: 4ef90001068c     jmp        $1068c.l
01148A: 4e75             rts        
01148C: 4df900ff1800     lea.l      $ff1800.l, a6
011492: 7000             moveq      #$0, d0
011494: 102e00c8         move.b     $c8(a6), d0
011498: 06000019         addi.b     #$19, d0
01149C: b02e00b8         cmp.b      $b8(a6), d0
0114A0: 6700000c         beq.w      $114ae
0114A4: 1d4000b8         move.b     d0, $b8(a6)
0114A8: 4eb90001068c     jsr        $1068c.l
0114AE: 4dee0400         lea.l      $400(a6), a6
0114B2: 7000             moveq      #$0, d0
0114B4: 102e00c8         move.b     $c8(a6), d0
0114B8: 06000019         addi.b     #$19, d0
0114BC: b02e00b8         cmp.b      $b8(a6), d0
0114C0: 6700000c         beq.w      $114ce
0114C4: 1d4000b8         move.b     d0, $b8(a6)
0114C8: 4eb90001068c     jsr        $1068c.l
0114CE: 61000314         bsr.w      $117e4
0114D2: 0c2d001a00b8     cmpi.b     #$1a, $b8(a5)
0114D8: 6600001c         bne.w      $114f6
0114DC: 0c2e001a00b8     cmpi.b     #$1a, $b8(a6)
0114E2: 67000012         beq.w      $114f6
0114E6: cd4d             exg.l      a6, a5
0114E8: 103c0020         move.b     #$20, d0
0114EC: 1d4000b8         move.b     d0, $b8(a6)
0114F0: 4eb90001068c     jsr        $1068c.l
0114F6: 423900ff1844     clr.b      $ff1844.l
0114FC: 0c39001a00ff18b8 cmpi.b     #$1a, $ff18b8.l
011504: 6600001a         bne.w      $11520
011508: 0c39001a00ff1cb8 cmpi.b     #$1a, $ff1cb8.l
011510: 6600000e         bne.w      $11520
011514: 13fc000100ff1844 move.b     #$1, $ff1844.l
01151C: 60000022         bra.w      $11540
011520: 0c39001a00ff18b8 cmpi.b     #$1a, $ff18b8.l
011528: 6700000e         beq.w      $11538
01152C: 0c39001a00ff1cb8 cmpi.b     #$1a, $ff1cb8.l
011534: 6600000a         bne.w      $11540
011538: 13fc000200ff1844 move.b     #$2, $ff1844.l
011540: 33fc001800ff043c move.w     #$18, $ff043c.l
011548: 33fc002f00ff0440 move.w     #$2f, $ff0440.l
011550: 4e75             rts        

; ==== sub_011552 зовут=1 ====
011552: 4df900ff1800     lea.l      $ff1800.l, a6
011558: 082e00030041     btst.b     #$3, $41(a6)
01155E: 67000008         beq.w      $11568
011562: 1d7c000100c8     move.b     #$1, $c8(a6)
011568: 082e00020041     btst.b     #$2, $41(a6)
01156E: 67000008         beq.w      $11578
011572: 1d7c000200c8     move.b     #$2, $c8(a6)
011578: 4df900ff1c00     lea.l      $ff1c00.l, a6
01157E: 082e00020041     btst.b     #$2, $41(a6)
011584: 67000008         beq.w      $1158e
011588: 1d7c000100c8     move.b     #$1, $c8(a6)
01158E: 082e00030041     btst.b     #$3, $41(a6)
011594: 67000008         beq.w      $1159e
011598: 1d7c000200c8     move.b     #$2, $c8(a6)
01159E: 4e75             rts        

; ==== sub_0115A0 ТАБЛИЦА зовут=0 ====
0115A0: 0c79001900ff0440 cmpi.w     #$19, $ff0440.l
0115A8: 6d000040         blt.w      $115ea
0115AC: 61000236         bsr.w      $117e4
0115B0: cd4d             exg.l      a6, a5
0115B2: 0c2e001900b8     cmpi.b     #$19, $b8(a6)
0115B8: 66000030         bne.w      $115ea
0115BC: 103c0004         move.b     #$4, d0
0115C0: bdfc00ff1800     cmpa.l     #$ff1800, a6
0115C6: 67000006         beq.w      $115ce
0115CA: 103c0008         move.b     #$8, d0
0115CE: c02e0041         and.b      $41(a6), d0
0115D2: 67000016         beq.w      $115ea
0115D6: 103c001b         move.b     #$1b, d0
0115DA: 1d4000b8         move.b     d0, $b8(a6)
0115DE: 4eb90001068c     jsr        $1068c.l
0115E4: 1d7c00ff00ba     move.b     #$ff, $ba(a6)
0115EA: 0c79001700ff0440 cmpi.w     #$17, $ff0440.l
0115F2: 66000078         bne.w      $1166c
0115F6: 0c39002000ff18b8 cmpi.b     #$20, $ff18b8.l
0115FE: 6700006c         beq.w      $1166c
011602: 0c39002000ff1cb8 cmpi.b     #$20, $ff1cb8.l
01160A: 67000060         beq.w      $1166c
01160E: 4a3900ff1844     tst.b      $ff1844.l
011614: 67000056         beq.w      $1166c
011618: 0c39000100ff1844 cmpi.b     #$1, $ff1844.l
011620: 66000010         bne.w      $11632
011624: 1e3c00be         move.b     #$be, d7
011628: 4eb900003d7a     jsr        $3d7a.l
01162E: 6000003c         bra.w      $1166c
011632: 1e3c00bd         move.b     #$bd, d7
011636: 103900ff18ba     move.b     $ff18ba.l, d0
01163C: 803900ff1cba     or.b       $ff1cba.l, d0
011642: 6b000022         bmi.w      $11666
011646: 1e3c00bc         move.b     #$bc, d7
01164A: 0c39001b00ff18b8 cmpi.b     #$1b, $ff18b8.l
011652: 67000012         beq.w      $11666
011656: 0c39001b00ff1cb8 cmpi.b     #$1b, $ff1cb8.l
01165E: 67000006         beq.w      $11666
011662: 1e3c00bd         move.b     #$bd, d7
011666: 4eb900003d7a     jsr        $3d7a.l
01166C: 537900ff0440     subq.w     #$1, $ff0440.l
011672: 66000032         bne.w      $116a6
011676: 4df900ff1800     lea.l      $ff1800.l, a6
01167C: 4bf900ff1c00     lea.l      $ff1c00.l, a5
011682: 61000024         bsr.w      $116a8
011686: 4df900ff1c00     lea.l      $ff1c00.l, a6
01168C: 4bf900ff1800     lea.l      $ff1800.l, a5
011692: 61000014         bsr.w      $116a8
011696: 33fc001c00ff043c move.w     #$1c, $ff043c.l
01169E: 33fc004800ff0440 move.w     #$48, $ff0440.l
0116A6: 4e75             rts        

; ==== sub_0116A8 зовут=2 ====
0116A8: 48e70006         movem.l    a5-a6, -(a7)
0116AC: 61000136         bsr.w      $117e4
0116B0: cd48             exg.l      a6, a0
0116B2: 4cdf6000         movem.l    (a7)+, a5-a6
0116B6: 43fa0040         lea.l      $116f8(pc), a1
0116BA: bdc8             cmpa.l     a0, a6
0116BC: 66000006         bne.w      $116c4
0116C0: 43fa0040         lea.l      $11702(pc), a1
0116C4: 7000             moveq      #$0, d0
0116C6: 102e00c8         move.b     $c8(a6), d0
0116CA: 3200             move.w     d0, d1
0116CC: d040             add.w      d0, d0
0116CE: d041             add.w      d1, d0
0116D0: d02d00c8         add.b      $c8(a5), d0
0116D4: 10310000         move.b     (a1, d0.w), d0
0116D8: 1d4000b8         move.b     d0, $b8(a6)
0116DC: 4eb90001068c     jsr        $1068c.l
0116E2: 0c2e000600b8     cmpi.b     #$6, $b8(a6)
0116E8: 67000004         beq.w      $116ee
0116EC: 4e75             rts        
0116EE: 1e3c00aa         move.b     #$aa, d7
0116F2: 4ef900003d7a     jmp        $3d7a.l

; ---- ДАННЫЕ $0116F8..$01170C (20 байт) ----


; ==== sub_01170C ТАБЛИЦА зовут=0 ====
01170C: 537900ff0440     subq.w     #$1, $ff0440.l
011712: 6600008e         bne.w      $117a2
011716: 610000cc         bsr.w      $117e4
01171A: 0c2e000100c8     cmpi.b     #$1, $c8(a6)
011720: 660000fa         bne.w      $1181c
011724: 0c2d000200c8     cmpi.b     #$2, $c8(a5)
01172A: 670000f0         beq.w      $1181c
01172E: 41fa0074         lea.l      $117a4(pc), a0
011732: 102d00c8         move.b     $c8(a5), d0
011736: 12300000         move.b     (a0, d0.w), d1
01173A: 13c100ff0444     move.b     d1, $ff0444.l
011740: 103c001c         move.b     #$1c, d0
011744: 0c010002         cmpi.b     #$2, d1
011748: 67000006         beq.w      $11750
01174C: 103c001d         move.b     #$1d, d0
011750: 1d4000b8         move.b     d0, $b8(a6)
011754: 2f0d             move.l     a5, -(a7)
011756: 4eb90001068c     jsr        $1068c.l
01175C: 2a5f             movea.l    (a7)+, a5
01175E: cd4d             exg.l      a6, a5
011760: 1d7c000a00b8     move.b     #$a, $b8(a6)
011766: 4eb90001068c     jsr        $1068c.l
01176C: 41fa003a         lea.l      $117a8(pc), a0
011770: 0c39000a00ff18b8 cmpi.b     #$a, $ff18b8.l
011778: 66000006         bne.w      $11780
01177C: 41fa0048         lea.l      $117c6(pc), a0
011780: 43f900ff881e     lea.l      $ff881e.l, a1
011786: 303c2300         move.w     #$2300, d0
01178A: 7c02             moveq      #$2, d6
01178C: 7e09             moveq      #$9, d7
01178E: 6100f832         bsr.w      $10fc2
011792: 33fc009000ff0440 move.w     #$90, $ff0440.l
01179A: 33fc002000ff043c move.w     #$20, $ff043c.l
0117A2: 4e75             rts        

; ---- ДАННЫЕ $0117A4..$0117E4 (64 байт) ----


; ==== sub_0117E4 зовут=5 ====
0117E4: 4df900ff1800     lea.l      $ff1800.l, a6
0117EA: 4bf900ff1c00     lea.l      $ff1c00.l, a5
0117F0: 7000             moveq      #$0, d0
0117F2: 102e00c6         move.b     $c6(a6), d0
0117F6: e540             asl.w      #$2, d0
0117F8: d02d00c6         add.b      $c6(a5), d0
0117FC: 41fa000e         lea.l      $1180c(pc), a0
011800: 10300000         move.b     (a0, d0.w), d0
011804: 66000004         bne.w      $1180a
011808: cd4d             exg.l      a6, a5
01180A: 4e75             rts        

; ---- ДАННЫЕ $01180C..$01181C (16 байт) ----

01181C: 427900ff043c     clr.w      $ff043c.l
011822: 4df900ff1800     lea.l      $ff1800.l, a6
011828: 1d7c000c00b8     move.b     #$c, $b8(a6)
01182E: 4eb90001068c     jsr        $1068c.l
011834: 426e004c         clr.w      $4c(a6)
011838: 4df900ff1c00     lea.l      $ff1c00.l, a6
01183E: 1d7c000c00b8     move.b     #$c, $b8(a6)
011844: 4eb90001068c     jsr        $1068c.l
01184A: 426e004c         clr.w      $4c(a6)
01184E: 4e75             rts        

; ==== sub_011850 ТАБЛИЦА зовут=0 ====
011850: 537900ff0440     subq.w     #$1, $ff0440.l
011856: 67000004         beq.w      $1185c
01185A: 4e75             rts        
01185C: 6000f884         bra.w      $110e2

; ==== sub_011860 ТАБЛИЦА зовут=0 ====
011860: 537900ff0440     subq.w     #$1, $ff0440.l
011866: 66000114         bne.w      $1197c
01186A: 4df900ff1800     lea.l      $ff1800.l, a6
011870: 4bf900ff1c00     lea.l      $ff1c00.l, a5
011876: 0c2e000a00b8     cmpi.b     #$a, $b8(a6)
01187C: 66000004         bne.w      $11882
011880: cd4d             exg.l      a6, a5
011882: 49eef800         lea.l      -$800(a6), a4
011886: 0c6c0018004c     cmpi.w     #$18, $4c(a4)
01188C: 6d000004         blt.w      $11892
011890: 4e75             rts        
011892: 49edf800         lea.l      -$800(a5), a4
011896: 0c6c0018004c     cmpi.w     #$18, $4c(a4)
01189C: 6d000004         blt.w      $118a2
0118A0: 4e75             rts        
0118A2: 7000             moveq      #$0, d0
0118A4: 103900ff043e     move.b     $ff043e.l, d0
0118AA: e540             asl.w      #$2, d0
0118AC: 41fa000c         lea.l      $118ba(pc), a0
0118B0: 20700000         movea.l    (a0, d0.w), a0
0118B4: 4e90             jsr        (a0)
0118B6: 6000ff64         bra.w      $1181c

; ---- ДАННЫЕ $0118BA..$0118CA (16 байт) ----


; ==== sub_0118CA ТАБЛИЦА зовут=0 ====
0118CA: 7203             moveq      #$3, d1
0118CC: 4a3900ff0444     tst.b      $ff0444.l
0118D2: 67000030         beq.w      $11904
0118D6: 720a             moveq      #$a, d1
0118D8: 0c39000100ff0444 cmpi.b     #$1, $ff0444.l
0118E0: 67000004         beq.w      $118e6
0118E4: 7214             moveq      #$14, d1
0118E6: 4deef800         lea.l      -$800(a6), a6
0118EA: d36e005a         add.w      d1, $5a(a6)
0118EE: 0c6e001e005a     cmpi.w     #$1e, $5a(a6)
0118F4: 6f000008         ble.w      $118fe
0118F8: 3d7c001e005a     move.w     #$1e, $5a(a6)
0118FE: 4ef90000dfae     jmp        $dfae.l
011904: 4e75             rts        

; ==== sub_011906 ТАБЛИЦА зовут=0 ====
011906: 7206             moveq      #$6, d1
011908: 4a3900ff0444     tst.b      $ff0444.l
01190E: 67f4             beq.b      $11904
011910: 4dedf800         lea.l      -$800(a5), a6
011914: 0c39000100ff0444 cmpi.b     #$1, $ff0444.l
01191C: 6600000a         bne.w      $11928
011920: 08ee00020090     bset.b     #$2, $90(a6)
011926: 4e75             rts        
011928: 08ee00030090     bset.b     #$3, $90(a6)
01192E: 4e75             rts        

; ==== sub_011930 ТАБЛИЦА зовут=0 ====
011930: 7206             moveq      #$6, d1
011932: 4a3900ff0444     tst.b      $ff0444.l
011938: 67ca             beq.b      $11904
01193A: 4deef800         lea.l      -$800(a6), a6
01193E: 1d7c000100c9     move.b     #$1, $c9(a6)
011944: 720a             moveq      #$a, d1
011946: 0c39000200ff0444 cmpi.b     #$2, $ff0444.l
01194E: 679a             beq.b      $118ea
011950: 4e75             rts        

; ==== sub_011952 ТАБЛИЦА зовут=0 ====
011952: 4a3900ff0444     tst.b      $ff0444.l
011958: 67aa             beq.b      $11904
01195A: 41edf800         lea.l      -$800(a5), a0
01195E: 3d7c03c000a0     move.w     #$3c0, $a0(a6)
011964: 0c39000200ff0444 cmpi.b     #$2, $ff0444.l
01196C: 67000008         beq.w      $11976
011970: 3d7c02d000a0     move.w     #$2d0, $a0(a6)
011976: 4ef90000efac     jmp        $efac.l
01197C: 41faf686         lea.l      $11004(pc), a0
011980: 303900ff0440     move.w     $ff0440.l, d0
011986: 02400008         andi.w     #$8, d0
01198A: 66000008         bne.w      $11994
01198E: 7004             moveq      #$4, d0
011990: 6000000a         bra.w      $1199c
011994: 7000             moveq      #$0, d0
011996: 103900ff043e     move.b     $ff043e.l, d0
01199C: e940             asl.w      #$4, d0
01199E: d1c0             adda.l     d0, a0
0119A0: 6000f60e         bra.w      $10fb0

; ==== sub_0119A4 ТАБЛИЦА зовут=0 ====
0119A4: 007c0700         ori.w      #$700, sr
0119A8: 4eb90000064c     jsr        $64c.l
0119AE: 4eb9000004a2     jsr        $4a2.l
0119B4: 4eb900003952     jsr        $3952.l
0119BA: 41f900ffa000     lea.l      $ffa000.l, a0
0119C0: 303c01ff         move.w     #$1ff, d0
0119C4: 4298             clr.l      (a0)+
0119C6: 51c8fffc         dbra       d0, $119c4
0119CA: 41f900044ce0     lea.l      $44ce0.l, a0
0119D0: 43f900ffa800     lea.l      $ffa800.l, a1
0119D6: 4eb9000047aa     jsr        $47aa.l
0119DC: 203c40000000     move.l     #$40000000, d0
0119E2: 223c94089300     move.l     #$94089300, d1
0119E8: 243c96d09500     move.l     #$96d09500, d2
0119EE: 363c977f         move.w     #$977f, d3
0119F2: 4eb900003980     jsr        $3980.l
0119F8: 41f900ffa000     lea.l      $ffa000.l, a0
0119FE: 303c0800         move.w     #$800, d0
011A02: 4298             clr.l      (a0)+
011A04: 51c8fffc         dbra       d0, $11a02
011A08: 203c60000002     move.l     #$60000002, d0
011A0E: 223c94049300     move.l     #$94049300, d1
011A14: 243c96d09500     move.l     #$96d09500, d2
011A1A: 363c977f         move.w     #$977f, d3
011A1E: 4eb900003980     jsr        $3980.l
011A24: 41f900048c8a     lea.l      $48c8a.l, a0
011A2A: 43f900ffa000     lea.l      $ffa000.l, a1
011A30: 4eb9000047aa     jsr        $47aa.l
011A36: 203c60000000     move.l     #$60000000, d0
011A3C: 223c94159300     move.l     #$94159300, d1
011A42: 243c96d09500     move.l     #$96d09500, d2
011A48: 363c977f         move.w     #$977f, d3
011A4C: 4eb900003980     jsr        $3980.l
011A52: 41f90006a8ec     lea.l      $6a8ec.l, a0
011A58: 43f900ffa000     lea.l      $ffa000.l, a1
011A5E: 4eb9000047aa     jsr        $47aa.l
011A64: 7002             moveq      #$2, d0
011A66: 3e3c16a0         move.w     #$16a0, d7
011A6A: 4eb900003d3e     jsr        $3d3e.l
011A70: 203c60000001     move.l     #$60000001, d0
011A76: 223c940b9350     move.l     #$940b9350, d1
011A7C: 243c96d09500     move.l     #$96d09500, d2
011A82: 363c977f         move.w     #$977f, d3
011A86: 4eb900003980     jsr        $3980.l
011A8C: 41f90004a73a     lea.l      $4a73a.l, a0
011A92: 43f900ffa000     lea.l      $ffa000.l, a1
011A98: 4eb9000047aa     jsr        $47aa.l
011A9E: 7e27             moveq      #$27, d7
011AA0: 7c1b             moveq      #$1b, d6
011AA2: 2a3c60000003     move.l     #$60000003, d5
011AA8: 4df900ffa000     lea.l      $ffa000.l, a6
011AAE: 4eb900000622     jsr        $622.l
011AB4: 61000150         bsr.w      $11c06
011AB8: 4dfa0082         lea.l      $11b3c(pc), a6
011ABC: 4eb90000067a     jsr        $67a.l
011AC2: 700b             moveq      #$b, d0
011AC4: 41f900011bbe     lea.l      $11bbe.l, a0
011ACA: 43f900ff0000     lea.l      $ff0000.l, a1
011AD0: 32d8             move.w     (a0)+, (a1)+
011AD2: 3219             move.w     (a1)+, d1
011AD4: 32d8             move.w     (a0)+, (a1)+
011AD6: 32d8             move.w     (a0)+, (a1)+
011AD8: 51c8fff6         dbra       d0, $11ad0
011ADC: 13fc003200ff0500 move.b     #$32, $ff0500.l
011AE4: 423900ff0501     clr.b      $ff0501.l
011AEA: 13fc00c800ff0502 move.b     #$c8, $ff0502.l
011AF2: 423900ff0503     clr.b      $ff0503.l
011AF8: 13fc007800ff0504 move.b     #$78, $ff0504.l
011B00: 423900ff0505     clr.b      $ff0505.l
011B06: 13fc000100ff040d move.b     #$1, $ff040d.l
011B0E: 33fc000400ff0416 move.w     #$4, $ff0416.l
011B16: 4eb900000642     jsr        $642.l
011B1C: 33fc002c00ff0406 move.w     #$2c, $ff0406.l
011B24: 4eb90000392e     jsr        $392e.l
011B2A: 13fc000100ff4107 move.b     #$1, $ff4107.l
011B32: 1e3c0085         move.b     #$85, d7
011B36: 4ef900003d7a     jmp        $3d7a.l

; ---- ДАННЫЕ $011B3C..$011C06 (202 байт) ----


; ==== sub_011C06 зовут=5 ====
011C06: 41f900ff8000     lea.l      $ff8000.l, a0
011C0C: 303c037f         move.w     #$37f, d0
011C10: 4298             clr.l      (a0)+
011C12: 51c8fffc         dbra       d0, $11c10
011C16: 4e75             rts        

; ==== sub_011C18 ТАБЛИЦА зовут=0 ====
011C18: 0839000700ffe00d btst.b     #$7, $ffe00d.l
011C20: 66000020         bne.w      $11c42
011C24: 610000a4         bsr.w      $11cca
011C28: 610000d2         bsr.w      $11cfc
011C2C: 61000120         bsr.w      $11d4e
011C30: 4eb9000038b0     jsr        $38b0.l
011C36: 0c39000900ff0501 cmpi.b     #$9, $ff0501.l
011C3E: 66000078         bne.w      $11cb8
011C42: 61c2             bsr.b      $11c06
011C44: 4eb900003952     jsr        $3952.l
011C4A: 13fc000800ff0501 move.b     #$8, $ff0501.l
011C52: 610000be         bsr.w      $11d12
011C56: 43f900ff0300     lea.l      $ff0300.l, a1
011C5C: 41e90080         lea.l      $80(a1), a0
011C60: 303c001f         move.w     #$1f, d0
011C64: 22d8             move.l     (a0)+, (a1)+
011C66: 51c8fffc         dbra       d0, $11c64
011C6A: 33fc0eee00ff033e move.w     #$eee, $ff033e.l
011C72: 41fa05f2         lea.l      $12266(pc), a0
011C76: 43f900ff8108     lea.l      $ff8108.l, a1
011C7C: 7e1f             moveq      #$1f, d7
011C7E: 7c02             moveq      #$2, d6
011C80: 4eb900010fdc     jsr        $10fdc.l
011C86: 41fa069e         lea.l      $12326(pc), a0
011C8A: 43f900ff0000     lea.l      $ff0000.l, a1
011C90: 7e0c             moveq      #$c, d7
011C92: 32d8             move.w     (a0)+, (a1)+
011C94: 3019             move.w     (a1)+, d0
011C96: 32d8             move.w     (a0)+, (a1)+
011C98: 32d8             move.w     (a0)+, (a1)+
011C9A: 51cffff6         dbra       d7, $11c92
011C9E: 427900ff0500     clr.w      $ff0500.l
011CA4: 33fc003000ff0406 move.w     #$30, $ff0406.l
011CAC: 0839000700ffe00d btst.b     #$7, $ffe00d.l
011CB4: 660006be         bne.w      $12374
011CB8: 13fc000100ff040d move.b     #$1, $ff040d.l
011CC0: 13fc000100ff0400 move.b     #$1, $ff0400.l
011CC8: 4e75             rts        

; ==== sub_011CCA зовут=1 ====
011CCA: 0c7900d800ff0000 cmpi.w     #$d8, $ff0000.l
011CD2: 6c000026         bge.w      $11cfa
011CD6: 533900ff0500     subq.b     #$1, $ff0500.l
011CDC: 6600001c         bne.w      $11cfa
011CE0: 13fc002800ff0500 move.b     #$28, $ff0500.l
011CE8: 700b             moveq      #$b, d0
011CEA: 41f900ff0000     lea.l      $ff0000.l, a0
011CF0: 5250             addq.w     #$1, (a0)
011CF2: 41e80008         lea.l      $8(a0), a0
011CF6: 51c8fff8         dbra       d0, $11cf0
011CFA: 4e75             rts        

; ==== sub_011CFC зовут=1 ====
011CFC: 0c39000900ff0501 cmpi.b     #$9, $ff0501.l
011D04: 67000046         beq.w      $11d4c
011D08: 533900ff0502     subq.b     #$1, $ff0502.l
011D0E: 6600003c         bne.w      $11d4c

; ==== sub_011D12 зовут=1 ====
011D12: 13fc00b400ff0502 move.b     #$b4, $ff0502.l
011D1A: 7000             moveq      #$0, d0
011D1C: 103900ff0501     move.b     $ff0501.l, d0
011D22: eb40             asl.w      #$5, d0
011D24: 41fa00d0         lea.l      $11df6(pc), a0
011D28: 43f900ff0380     lea.l      $ff0380.l, a1
011D2E: d1c0             adda.l     d0, a0
011D30: 45fa01e4         lea.l      $11f16(pc), a2
011D34: 47f900ff03c0     lea.l      $ff03c0.l, a3
011D3A: d5c0             adda.l     d0, a2
011D3C: 7007             moveq      #$7, d0
011D3E: 22d8             move.l     (a0)+, (a1)+
011D40: 26da             move.l     (a2)+, (a3)+
011D42: 51c8fffa         dbra       d0, $11d3e
011D46: 523900ff0501     addq.b     #$1, $ff0501.l
011D4C: 4e75             rts        

; ==== sub_011D4E зовут=1 ====
011D4E: 7000             moveq      #$0, d0
011D50: 103900ff0505     move.b     $ff0505.l, d0
011D56: 41fa0008         lea.l      $11d60(pc), a0
011D5A: 20700000         movea.l    (a0, d0.w), a0
011D5E: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $011D60..$011D68 (8 байт) ----


; ==== sub_011D68 ТАБЛИЦА зовут=0 ====
011D68: 0c39000400ff0503 cmpi.b     #$4, $ff0503.l
011D70: 67000062         beq.w      $11dd4
011D74: 533900ff0504     subq.b     #$1, $ff0504.l
011D7A: 66000058         bne.w      $11dd4
011D7E: 13fc00ff00ff0504 move.b     #$ff, $ff0504.l
011D86: 33fc0eee00ff03be move.w     #$eee, $ff03be.l
011D8E: 13fc000400ff0505 move.b     #$4, $ff0505.l
011D96: 7000             moveq      #$0, d0
011D98: 103900ff0503     move.b     $ff0503.l, d0
011D9E: e540             asl.w      #$2, d0
011DA0: 41fa0294         lea.l      $12036(pc), a0
011DA4: 20700000         movea.l    (a0, d0.w), a0
011DA8: 43f900ff8b06     lea.l      $ff8b06.l, a1
011DAE: 7c01             moveq      #$1, d6
011DB0: 7e21             moveq      #$21, d7
011DB2: 3018             move.w     (a0)+, d0
011DB4: 3280             move.w     d0, (a1)
011DB6: 06400010         addi.w     #$10, d0
011DBA: 33400080         move.w     d0, $80(a1)
011DBE: 43e90002         lea.l      $2(a1), a1
011DC2: 51cfffee         dbra       d7, $11db2
011DC6: 43e900bc         lea.l      $bc(a1), a1
011DCA: 51ceffe4         dbra       d6, $11db0
011DCE: 523900ff0503     addq.b     #$1, $ff0503.l
011DD4: 4e75             rts        

; ==== sub_011DD6 ТАБЛИЦА зовут=0 ====
011DD6: 533900ff0504     subq.b     #$1, $ff0504.l
011DDC: 66f6             bne.b      $11dd4
011DDE: 33fc020000ff03be move.w     #$200, $ff03be.l
011DE6: 423900ff0505     clr.b      $ff0505.l
011DEC: 13fc007800ff0504 move.b     #$78, $ff0504.l
011DF4: 4e75             rts        

; ---- ДАННЫЕ $011DF6..$012046 (592 байт) ----


; ==== sub_012046 ТАБЛИЦА зовут=0 ====
012046: 23642382         move.l     -(a4), $2382(a1)
01204A: 236f23a32300     move.l     $23a3(a7), $2300(a1)
012050: 238d236b23a32300236b move.l     a5, ([$23a3, a1], $2300236b)
01205A: 2300             move.l     d0, -(a1)
01205C: 238d236f236d     move.l     a5, ([$236d, a1])
012062: 238c236f238e     move.l     a4, ([$238e, a1])
012068: 2300             move.l     d0, -(a1)
01206A: 238e238c         move.l     a6, (d2.w * 2)
01206E: 236f236b238d     move.l     $236b(a7), $238d(a1)
012074: 238f238c         move.l     a7, (d2.w * 2)
012078: 236f23002383     move.l     $2300(a7), $2383(a1)
01207E: 238d2300         move.l     a5, (a1, d2.w * 2)
012082: 2385236f238a     move.l     d5, ([$238a, a1])
012088: 238e236e236f     move.l     a6, ([$236f, a1])
01208E: 236f238a230c     move.l     $238a(a7), $230c(a1)
012094: 2300             move.l     d0, -(a1)
012096: 236e236f236f     move.l     $236f(a6), $236f(a1)
01209C: 238a2300         move.l     a2, (a1, d2.w * 2)
0120A0: 23832388         move.l     d3, (d2.w * 2)
0120A4: 238d2383236e236f move.l     a5, ([, d2.w * 2], $236e236f)
0120AC: 2300             move.l     d0, -(a1)
0120AE: 238e2382236f     move.l     a6, ([, d2.w * 2], $236f)
0120B4: 2300             move.l     d0, -(a1)
0120B6: 238a2383238c236b move.l     a2, ([, d2.w * 2], $238c236b)
0120BE: 23872383236e230e move.l     d7, ([, d2.w * 2], $236e230e)
0120C6: 2300             move.l     d0, -(a1)
0120C8: 2300             move.l     d0, -(a1)
0120CA: 2300             move.l     d0, -(a1)
0120CC: 2300             move.l     d0, -(a1)
0120CE: 234d236b         move.l     a5, $236b(a1)
0120D2: 238823a32300236c238c move.l     a0, ([$2300, d2.w * 2], $236c238c)
0120DC: 236b23a0236f     move.l     $23a0(a3), $236f(a1)
0120E2: 2300             move.l     d0, -(a1)
0120E4: 238a236f2389     move.l     a2, ([$2389, a1])
0120EA: 238a2386236f     move.l     a2, ([], d2.w * 2, $236f)
0120F0: 2300             move.l     d0, -(a1)
0120F2: 2382236b23a0236f2300 move.l     d2, ([$23a0, a1], $236f2300)
0120FC: 23812389         move.l     d1, ([, d2.w * 2])
012100: 2388236f2300     move.l     a0, ([$2300, a1])
012106: 23832388         move.l     d3, (d2.w * 2)
01210A: 230c             move.l     a4, -(a1)
01210C: 2300             move.l     d0, -(a1)
01210E: 2300             move.l     d0, -(a1)
012110: 2300             move.l     d0, -(a1)
012112: 236c238f238e     move.l     $238f(a4), $238e(a1)
012118: 2300             move.l     d0, -(a1)
01211A: 23882389         move.l     a0, ([, d2.w * 2])
01211E: 2388236f2300     move.l     a0, ([$2300, a1])
012124: 2382236b23a0236f2300 move.l     d2, ([$23a0, a1], $236f2300)
01212E: 238c236f238e     move.l     a4, ([$238e, a1])
012134: 238f238c         move.l     a7, (d2.w * 2)
012138: 2388236f236e     move.l     a0, ([$236e, a1])
01213E: 230e             move.l     a6, -(a1)
012140: 2300             move.l     d0, -(a1)
012142: 2300             move.l     d0, -(a1)
012144: 2300             move.l     d0, -(a1)
012146: 2300             move.l     d0, -(a1)
012148: 2300             move.l     d0, -(a1)
01214A: 2300             move.l     d0, -(a1)
01214C: 2300             move.l     d0, -(a1)
01214E: 2300             move.l     d0, -(a1)
012150: 2300             move.l     d0, -(a1)
012152: 2300             move.l     d0, -(a1)
012154: 2300             move.l     d0, -(a1)
012156: 23412388         move.l     d1, $2388(a1)
01215A: 236e23002388     move.l     $2300(a6), $2388(a1)
012160: 238923a1230c     move.l     a1, ([$230c, d2.w * 2])
012166: 2300             move.l     d0, -(a1)
012168: 23a32389         move.l     -(a3), ([, d2.w * 2])
01216C: 238f2300         move.l     a7, (a1, d2.w * 2)
012170: 23a1238323862386 move.l     -(a1), ([, d2.w * 2], $23862386)
012178: 2300             move.l     d0, -(a1)
01217A: 236f2388238e     move.l     $2388(a7), $238e(a1)
012180: 236f238c2300     move.l     $238c(a7), $2300(a1)
012186: 238e2382236f     move.l     a6, ([, d2.w * 2], $236f)
01218C: 2300             move.l     d0, -(a1)
01218E: 2300             move.l     d0, -(a1)
012190: 2300             move.l     d0, -(a1)
012192: 2300             move.l     d0, -(a1)
012194: 2300             move.l     d0, -(a1)
012196: 2300             move.l     d0, -(a1)
012198: 2300             move.l     d0, -(a1)
01219A: 238a23a3238c236b2387 move.l     a2, ([$238c, d2.w * 2], $236b2387)
0121A4: 2383236e230e     move.l     d3, ([$230e, a1])
0121AA: 2300             move.l     d0, -(a1)
0121AC: 2300             move.l     d0, -(a1)
0121AE: 2300             move.l     d0, -(a1)
0121B0: 2300             move.l     d0, -(a1)
0121B2: 2300             move.l     d0, -(a1)
0121B4: 2300             move.l     d0, -(a1)
0121B6: 2300             move.l     d0, -(a1)
0121B8: 2300             move.l     d0, -(a1)
0121BA: 2300             move.l     d0, -(a1)
0121BC: 2300             move.l     d0, -(a1)
0121BE: 2300             move.l     d0, -(a1)
0121C0: 2300             move.l     d0, -(a1)
0121C2: 2300             move.l     d0, -(a1)
0121C4: 2300             move.l     d0, -(a1)
0121C6: 2300             move.l     d0, -(a1)
0121C8: 2300             move.l     d0, -(a1)
0121CA: 2300             move.l     d0, -(a1)
0121CC: 2300             move.l     d0, -(a1)
0121CE: 2300             move.l     d0, -(a1)
0121D0: 2300             move.l     d0, -(a1)
0121D2: 2300             move.l     d0, -(a1)
0121D4: 2300             move.l     d0, -(a1)
0121D6: 2300             move.l     d0, -(a1)
0121D8: 2300             move.l     d0, -(a1)
0121DA: 2300             move.l     d0, -(a1)
0121DC: 2300             move.l     d0, -(a1)
0121DE: 23672382         move.l     -(a7), $2382(a1)
0121E2: 23892300         move.l     a1, (a1, d2.w * 2)
0121E6: 23852388         move.l     d5, (d2.w * 2)
0121EA: 238923a1238d     move.l     a1, ([$238d, d2.w * 2])
0121F0: 2300             move.l     d0, -(a1)
0121F2: 23832380         move.l     d3, (d2.w * 2)
0121F6: 2300             move.l     d0, -(a1)
0121F8: 23a32389         move.l     -(a3), ([, d2.w * 2])
0121FC: 238f2300         move.l     a7, (a1, d2.w * 2)
012200: 236d236b2388     move.l     $236b(a5), $2388(a1)
012206: 2300             move.l     d0, -(a1)
012208: 238d238f238c23a0 move.l     a5, ([], d2.w * 2, $238c23a0)
012210: 238323a0236f     move.l     d3, $236f(d2.w * 2)
012216: 2300             move.l     d0, -(a1)
012218: 236b2388236e     move.l     $2388(a3), $236e(a1)
01221E: 2300             move.l     d0, -(a1)
012220: 2300             move.l     d0, -(a1)
012222: 238c236f238e     move.l     a4, ([$238e, a1])
012228: 238f238c         move.l     a7, (d2.w * 2)
01222C: 23882300         move.l     a0, (a1, d2.w * 2)
012230: 23a12383238e2382 move.l     -(a1), ([, d2.w * 2], $238e2382)
012238: 2300             move.l     d0, -(a1)
01223A: 238e2382236f     move.l     a6, ([, d2.w * 2], $236f)
012240: 2300             move.l     d0, -(a1)
012242: 238e238c         move.l     a6, (d2.w * 2)
012246: 236f236b238d     move.l     $236b(a7), $238d(a1)
01224C: 238f238c         move.l     a7, (d2.w * 2)
012250: 236f232f2300     move.l     $232f(a7), $2300(a1)
012256: 2300             move.l     d0, -(a1)
012258: 2300             move.l     d0, -(a1)
01225A: 2300             move.l     d0, -(a1)
01225C: 2300             move.l     d0, -(a1)
01225E: 2300             move.l     d0, -(a1)
012260: 2300             move.l     d0, -(a1)
012262: 2300             move.l     d0, -(a1)
012264: 2300             move.l     d0, -(a1)
012266: 21f021f121f221f321f4 move.l     ([$21f221f3]), $21f4.w
012270: 21f521f621f721f821f9 move.l     ([$21f721f8]), $21f9.w
01227A: 21fa21fb21fc     move.l     $14477(pc), $21fc.w

; ---- ДАННЫЕ $012280..$012374 (244 байт) ----

012374: 41f900ff0000     lea.l      $ff0000.l, a0
01237A: 700c             moveq      #$c, d0
01237C: 5d50             subq.w     #$6, (a0)
01237E: 41e80008         lea.l      $8(a0), a0
012382: 51c8fff8         dbra       d0, $1237c
012386: 0c7900f800ff0000 cmpi.w     #$f8, $ff0000.l
01238E: 66e4             bne.b      $12374
012390: 13fc000100ff040d move.b     #$1, $ff040d.l
012398: 13fc000100ff0400 move.b     #$1, $ff0400.l
0123A0: 423900ff4204     clr.b      $ff4204.l
0123A6: 600001de         bra.w      $12586

; ==== sub_0123AA ТАБЛИЦА зовут=0 ====
0123AA: 303900ff0500     move.w     $ff0500.l, d0
0123B0: 41fa0012         lea.l      $123c4(pc), a0
0123B4: 20700000         movea.l    (a0, d0.w), a0
0123B8: 4e90             jsr        (a0)
0123BA: 13fc000100ff040d move.b     #$1, $ff040d.l
0123C2: 4e75             rts        

; ---- ДАННЫЕ $0123C4..$0123D4 (16 байт) ----


; ==== sub_0123D4 ТАБЛИЦА зовут=0 ====
0123D4: 33fc8b0300ffef8a move.w     #$8b03, $ffef8a.l
0123DC: 427900ff0508     clr.w      $ff0508.l
0123E2: 23fc0000000000ff050c move.l     #$0, $ff050c.l
0123EC: 33fc000800ff0504 move.w     #$8, $ff0504.l
0123F4: 427900ff0506     clr.w      $ff0506.l
0123FA: 3e3c003c         move.w     #$3c, d7
0123FE: 3f07             move.w     d7, -(a7)
012400: 610000d0         bsr.w      $124d2
012404: 4eb900000ee2     jsr        $ee2.l
01240A: 4a3900ff4205     tst.b      $ff4205.l
012410: 66000038         bne.w      $1244a
012414: 103900ffe03e     move.b     $ffe03e.l, d0
01241A: 020000f0         andi.b     #$f0, d0
01241E: 0c0000f0         cmpi.b     #$f0, d0
012422: 66000026         bne.w      $1244a
012426: 103900ffe048     move.b     $ffe048.l, d0
01242C: 020000f0         andi.b     #$f0, d0
012430: 0c0000f0         cmpi.b     #$f0, d0
012434: 66000014         bne.w      $1244a
012438: 13fc000100ff4205 move.b     #$1, $ff4205.l
012440: 1e3c00ab         move.b     #$ab, d7
012444: 4eb900003d7a     jsr        $3d7a.l
01244A: 3e1f             move.w     (a7)+, d7
01244C: 0839000700ffe00d btst.b     #$7, $ffe00d.l
012454: 6600003a         bne.w      $12490
012458: 51cfffa4         dbra       d7, $123fe
01245C: 33fc000100ff0506 move.w     #$1, $ff0506.l
012464: 3e3c003a         move.w     #$3a, d7
012468: 3f07             move.w     d7, -(a7)
01246A: 61000066         bsr.w      $124d2
01246E: 4eb900000ee2     jsr        $ee2.l
012474: 3e1f             move.w     (a7)+, d7
012476: 0839000700ffe00d btst.b     #$7, $ffe00d.l
01247E: 66000010         bne.w      $12490
012482: 51cfffe4         dbra       d7, $12468
012486: 427900ff0506     clr.w      $ff0506.l
01248C: 6000000a         bra.w      $12498
012490: 33fc000100ff0506 move.w     #$1, $ff0506.l
012498: 41f900ff0800     lea.l      $ff0800.l, a0
01249E: 303c00ff         move.w     #$ff, d0
0124A2: 4298             clr.l      (a0)+
0124A4: 51c8fffc         dbra       d0, $124a2
0124A8: 13fc000100ff045c move.b     #$1, $ff045c.l
0124B0: 4eb900000ee2     jsr        $ee2.l
0124B6: 33fc8b0000ffef8a move.w     #$8b00, $ffef8a.l
0124BE: 4a7900ff0506     tst.w      $ff0506.l
0124C4: 6600feae         bne.w      $12374
0124C8: 33fc000400ff0500 move.w     #$4, $ff0500.l
0124D0: 4e75             rts        

; ==== sub_0124D2 зовут=2 ====
0124D2: 41f9000039f4     lea.l      $39f4.l, a0
0124D8: 43f900ff0800     lea.l      $ff0800.l, a1
0124DE: 323900ff0508     move.w     $ff0508.l, d1
0124E4: 383c004f         move.w     #$4f, d4
0124E8: 3401             move.w     d1, d2
0124EA: e342             asl.w      #$1, d2
0124EC: 36302000         move.w     (a0, d2.w), d3
0124F0: 303900ff050c     move.w     $ff050c.l, d0
0124F6: 024000ff         andi.w     #$ff, d0
0124FA: c7c0             muls.w     d0, d3
0124FC: e08b             lsr.l      #$8, d3
0124FE: 0243ffff         andi.w     #$ffff, d3
012502: 32c3             move.w     d3, (a1)+
012504: 4259             clr.w      (a1)+
012506: 06410010         addi.w     #$10, d1
01250A: 024100ff         andi.w     #$ff, d1
01250E: 51ccffd8         dbra       d4, $124e8
012512: 13fc000100ff045c move.b     #$1, $ff045c.l
01251A: 587900ff0508     addq.w     #$4, $ff0508.l
012520: 027900ff00ff0508 andi.w     #$ff, $ff0508.l
012528: 537900ff0504     subq.w     #$1, $ff0504.l
01252E: 6600001e         bne.w      $1254e
012532: 33fc000400ff0504 move.w     #$4, $ff0504.l
01253A: 4a7900ff0506     tst.w      $ff0506.l
012540: 6600000e         bne.w      $12550
012544: 06b90001000000ff050c addi.l     #$10000, $ff050c.l
01254E: 4e75             rts        
012550: 04b90001000000ff050c subi.l     #$10000, $ff050c.l
01255A: 4e75             rts        

; ==== sub_01255C ТАБЛИЦА зовут=0 ====
01255C: 0839000700ffe00c btst.b     #$7, $ffe00c.l
012564: 6600fe0e         bne.w      $12374
012568: 41f900ff0000     lea.l      $ff0000.l, a0
01256E: 700c             moveq      #$c, d0
012570: 5d50             subq.w     #$6, (a0)
012572: 41e80008         lea.l      $8(a0), a0
012576: 51c8fff8         dbra       d0, $12570
01257A: 0c7900f800ff0000 cmpi.w     #$f8, $ff0000.l
012582: 6600008c         bne.w      $12610
012586: 423900ff0409     clr.b      $ff0409.l
01258C: 33fc000c00ff0500 move.w     #$c, $ff0500.l
012594: 13fc000100ff0448 move.b     #$1, $ff0448.l
01259C: 41f900ff0068     lea.l      $ff0068.l, a0
0125A2: 30bc0140         move.w     #$140, (a0)
0125A6: 317c00440004     move.w     #$44, $4(a0)
0125AC: 317c010c0006     move.w     #$10c, $6(a0)
0125B2: 41fa002e         lea.l      $125e2(pc), a0
0125B6: 43f900ff8b14     lea.l      $ff8b14.l, a1
0125BC: 303c2000         move.w     #$2000, d0
0125C0: 7e12             moveq      #$12, d7
0125C2: 7c00             moveq      #$0, d6
0125C4: 4eb900010fc2     jsr        $10fc2.l
0125CA: 41fa002a         lea.l      $125f6(pc), a0
0125CE: 43f900ff8c0e     lea.l      $ff8c0e.l, a1
0125D4: 303c2000         move.w     #$2000, d0
0125D8: 7e19             moveq      #$19, d7
0125DA: 7c00             moveq      #$0, d6
0125DC: 4ef900010fc2     jmp        $10fc2.l

; ---- ДАННЫЕ $0125E2..$012610 (46 байт) ----

012610: 33fc000c00ff0502 move.w     #$c, $ff0502.l
012618: 33fc000800ff0500 move.w     #$8, $ff0500.l
012620: 4e75             rts        

; ==== sub_012622 ТАБЛИЦА зовут=0 ====
012622: 0839000700ffe00c btst.b     #$7, $ffe00c.l
01262A: 6600fd48         bne.w      $12374
01262E: 537900ff0502     subq.w     #$1, $ff0502.l
012634: 66000012         bne.w      $12648
012638: 33fc000c00ff0502 move.w     #$c, $ff0502.l
012640: 33fc000400ff0500 move.w     #$4, $ff0500.l
012648: 4e75             rts        

; ==== sub_01264A ТАБЛИЦА зовут=0 ====
01264A: 103900ffe00d     move.b     $ffe00d.l, d0
012650: 020000e0         andi.b     #$e0, d0
012654: 6600000c         bne.w      $12662
012658: 61000084         bsr.w      $126de
01265C: 610000dc         bsr.w      $1273a
012660: 4e75             rts        
012662: 1e3c00a3         move.b     #$a3, d7
012666: 4eb900003d7a     jsr        $3d7a.l
01266C: 0c39000200ff0448 cmpi.b     #$2, $ff0448.l
012674: 67000026         beq.w      $1269c
012678: 33fc010100ff4000 move.w     #$101, $ff4000.l
012680: 33fc020100ff4002 move.w     #$201, $ff4002.l
012688: 33fc030100ff4004 move.w     #$301, $ff4004.l
012690: 33fc050100ff4006 move.w     #$501, $ff4006.l
012698: 6000000a         bra.w      $126a4
01269C: 33fc010100ff4000 move.w     #$101, $ff4000.l
0126A4: 33fc003400ff0406 move.w     #$34, $ff0406.l
0126AC: 423900ff0449     clr.b      $ff0449.l
0126B2: 4a3900ff0448     tst.b      $ff0448.l
0126B8: 6700001e         beq.w      $126d8
0126BC: 13fc000300ff0449 move.b     #$3, $ff0449.l
0126C4: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
0126CC: 6700000a         beq.w      $126d8
0126D0: 13fc000d00ff0449 move.b     #$d, $ff0449.l
0126D8: 4ef900003940     jmp        $3940.l

; ==== sub_0126DE зовут=1 ====
0126DE: 103900ffe00d     move.b     $ffe00d.l, d0
0126E4: 0200000c         andi.b     #$c, d0
0126E8: 6700000c         beq.w      $126f6
0126EC: 1e3c00b3         move.b     #$b3, d7
0126F0: 4eb900003d7a     jsr        $3d7a.l
0126F6: 0839000200ffe00d btst.b     #$2, $ffe00d.l
0126FE: 67000014         beq.w      $12714
012702: 533900ff0448     subq.b     #$1, $ff0448.l
012708: 6a00000a         bpl.w      $12714
01270C: 13fc000200ff0448 move.b     #$2, $ff0448.l
012714: 0839000300ffe00d btst.b     #$3, $ffe00d.l
01271C: 6700001a         beq.w      $12738
012720: 523900ff0448     addq.b     #$1, $ff0448.l
012726: 0c39000300ff0448 cmpi.b     #$3, $ff0448.l
01272E: 66000008         bne.w      $12738
012732: 423900ff0448     clr.b      $ff0448.l
012738: 4e75             rts        

; ==== sub_01273A зовут=1 ====
01273A: 523900ff0409     addq.b     #$1, $ff0409.l
012740: 0839000400ff0409 btst.b     #$4, $ff0409.l
012748: 6600003c         bne.w      $12786
01274C: 41f900ff0010     lea.l      $ff0010.l, a0
012752: 30bc00f0         move.w     #$f0, (a0)
012756: 317c00f00008     move.w     #$f0, $8(a0)
01275C: 317c00f00010     move.w     #$f0, $10(a0)
012762: 317c00f80018     move.w     #$f8, $18(a0)
012768: 317c00f80028     move.w     #$f8, $28(a0)
01276E: 317c01000030     move.w     #$100, $30(a0)
012774: 317c01000040     move.w     #$100, $40(a0)
01277A: 33fc014000ff0068 move.w     #$140, $ff0068.l
012782: 60000028         bra.w      $127ac
012786: 41f900ff0010     lea.l      $ff0010.l, a0
01278C: 4250             clr.w      (a0)
01278E: 42680008         clr.w      $8(a0)
012792: 42680010         clr.w      $10(a0)
012796: 42680018         clr.w      $18(a0)
01279A: 42680028         clr.w      $28(a0)
01279E: 42680030         clr.w      $30(a0)
0127A2: 42680040         clr.w      $40(a0)
0127A6: 427900ff0068     clr.w      $ff0068.l
0127AC: 7000             moveq      #$0, d0
0127AE: 103900ff0448     move.b     $ff0448.l, d0
0127B4: 3f00             move.w     d0, -(a7)
0127B6: d040             add.w      d0, d0
0127B8: 41fa002e         lea.l      $127e8(pc), a0
0127BC: 30300000         move.w     (a0, d0.w), d0
0127C0: 33c000ff006e     move.w     d0, $ff006e.l
0127C6: 301f             move.w     (a7)+, d0
0127C8: e540             asl.w      #$2, d0
0127CA: 41fa0022         lea.l      $127ee(pc), a0
0127CE: 20700000         movea.l    (a0, d0.w), a0
0127D2: 43f900ff0006     lea.l      $ff0006.l, a1
0127D8: 700c             moveq      #$c, d0
0127DA: 3218             move.w     (a0)+, d1
0127DC: 3281             move.w     d1, (a1)
0127DE: 43e90008         lea.l      $8(a1), a1
0127E2: 51c8fff6         dbra       d0, $127da
0127E6: 4e75             rts        

; ---- ДАННЫЕ $0127E8..$012848 (96 байт) ----


; ==== sub_012848 ТАБЛИЦА зовут=0 ====
012848: 007c0700         ori.w      #$700, sr
01284C: 4eb90000064c     jsr        $64c.l
012852: 4eb9000004a2     jsr        $4a2.l
012858: 4eb900003952     jsr        $3952.l
01285E: 41f90006a8ec     lea.l      $6a8ec.l, a0
012864: 43f900ffa000     lea.l      $ffa000.l, a1
01286A: 4eb9000047aa     jsr        $47aa.l
012870: 7000             moveq      #$0, d0
012872: 3e3c16a0         move.w     #$16a0, d7
012876: 4eb900003d3e     jsr        $3d3e.l
01287C: 203c60000001     move.l     #$60000001, d0
012882: 223c940b9350     move.l     #$940b9350, d1
012888: 243c96d09500     move.l     #$96d09500, d2
01288E: 363c977f         move.w     #$977f, d3
012892: 4eb900003980     jsr        $3980.l
012898: 6100f36c         bsr.w      $11c06
01289C: 41f90004abe2     lea.l      $4abe2.l, a0
0128A2: 43f900ffa000     lea.l      $ffa000.l, a1
0128A8: 4eb9000047aa     jsr        $47aa.l
0128AE: 203c60000000     move.l     #$60000000, d0
0128B4: 223c94069340     move.l     #$94069340, d1
0128BA: 243c96d09500     move.l     #$96d09500, d2
0128C0: 363c977f         move.w     #$977f, d3
0128C4: 4eb900003980     jsr        $3980.l
0128CA: 41f90004b372     lea.l      $4b372.l, a0
0128D0: 43f900ffa000     lea.l      $ffa000.l, a1
0128D6: 4eb9000047aa     jsr        $47aa.l
0128DC: 41f900ff8000     lea.l      $ff8000.l, a0
0128E2: 3e3c037f         move.w     #$37f, d7
0128E6: 20fc01010101     move.l     #$1010101, (a0)+
0128EC: 51cffff8         dbra       d7, $128e6
0128F0: 41f900ffa000     lea.l      $ffa000.l, a0
0128F6: 43f900ff8000     lea.l      $ff8000.l, a1
0128FC: 7c04             moveq      #$4, d6
0128FE: 7e13             moveq      #$13, d7
012900: 22d8             move.l     (a0)+, (a1)+
012902: 51cffffc         dbra       d7, $12900
012906: 43e90030         lea.l      $30(a1), a1
01290A: 51cefff2         dbra       d6, $128fe
01290E: 6100010e         bsr.w      $12a1e
012912: 41f900ffa7d0     lea.l      $ffa7d0.l, a0
012918: 3e3c0077         move.w     #$77, d7
01291C: 3010             move.w     (a0), d0
01291E: 00408000         ori.w      #$8000, d0
012922: 30c0             move.w     d0, (a0)+
012924: 51cffff6         dbra       d7, $1291c
012928: 7e27             moveq      #$27, d7
01292A: 7c02             moveq      #$2, d6
01292C: 2a3c6c800003     move.l     #$6c800003, d5
012932: 4df900ffa7d0     lea.l      $ffa7d0.l, a6
012938: 4eb900000622     jsr        $622.l
01293E: 4dfa007a         lea.l      $129ba(pc), a6
012942: 4eb90000067a     jsr        $67a.l
012948: 4dfa0092         lea.l      $129dc(pc), a6
01294C: 4eb90000067a     jsr        $67a.l
012952: 4eb900013716     jsr        $13716.l
012958: 33fc00a800ff0414 move.w     #$a8, $ff0414.l
012960: 427900ff0500     clr.w      $ff0500.l
012966: 13fc000100ff040d move.b     #$1, $ff040d.l
01296E: 33fc000400ff0416 move.w     #$4, $ff0416.l
012976: 23fc00ffa19000ff0502 move.l     #$ffa190, $ff0502.l
012980: 23fc00ff828000ff0506 move.l     #$ff8280, $ff0506.l
01298A: 4eb900000642     jsr        $642.l
012990: 4eb900000ee2     jsr        $ee2.l
012996: 33fc003800ff0406 move.w     #$38, $ff0406.l
01299E: 08b9000000ff4107 bclr.b     #$0, $ff4107.l
0129A6: 6600000c         bne.w      $129b4
0129AA: 1e3c0085         move.b     #$85, d7
0129AE: 4eb900003d7a     jsr        $3d7a.l
0129B4: 4ef90000392e     jmp        $392e.l

; ---- ДАННЫЕ $0129BA..$012A1E (100 байт) ----


; ==== sub_012A1E зовут=1 ====
012A1E: 41fa0068         lea.l      $12a88(pc), a0
012A22: 43f900ffa4c2     lea.l      $ffa4c2.l, a1
012A28: 61000ea8         bsr.w      $138d2
012A2C: 3e00             move.w     d0, d7
012A2E: 3a00             move.w     d0, d5
012A30: 7c00             moveq      #$0, d6
012A32: 6100000e         bsr.w      $12a42
012A36: 5246             addq.w     #$1, d6
012A38: 41e80001         lea.l      $1(a0), a0
012A3C: 51cffff4         dbra       d7, $12a32
012A40: 4e75             rts        

; ==== sub_012A42 зовут=1 ====
012A42: 1010             move.b     (a0), d0
012A44: 6a000004         bpl.w      $12a4a
012A48: 4e75             rts        
012A4A: 343c0100         move.w     #$100, d2
012A4E: bc05             cmp.b      d5, d6
012A50: 6c000006         bge.w      $12a58
012A54: 343c6100         move.w     #$6100, d2
012A58: 7000             moveq      #$0, d0
012A5A: 1018             move.b     (a0)+, d0
012A5C: 45fa0012         lea.l      $12a70(pc), a2
012A60: e540             asl.w      #$2, d0
012A62: 22320000         move.l     (a2, d0.w), d1
012A66: d3c1             adda.l     d1, a1
012A68: 1018             move.b     (a0)+, d0
012A6A: 8042             or.w       d2, d0
012A6C: 3280             move.w     d0, (a1)
012A6E: 60d2             bra.b      $12a42

; ---- ДАННЫЕ $012A70..$012AEA (122 байт) ----


; ==== sub_012AEA ТАБЛИЦА зовут=0 ====
012AEA: 103900ffe034     move.b     $ffe034.l, d0
012AF0: 02000060         andi.b     #$60, d0
012AF4: 0c000060         cmpi.b     #$60, d0
012AF8: 66000080         bne.w      $12b7a
012AFC: 103900ffe03e     move.b     $ffe03e.l, d0
012B02: 02000090         andi.b     #$90, d0
012B06: 0c000090         cmpi.b     #$90, d0
012B0A: 6600006e         bne.w      $12b7a
012B0E: 523900ff0449     addq.b     #$1, $ff0449.l
012B14: 4a3900ff0448     tst.b      $ff0448.l
012B1A: 6700003e         beq.w      $12b5a
012B1E: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
012B26: 6700001a         beq.w      $12b42
012B2A: 0c39001800ff0449 cmpi.b     #$18, $ff0449.l
012B32: 66000038         bne.w      $12b6c
012B36: 13fc000d00ff0449 move.b     #$d, $ff0449.l
012B3E: 6000002c         bra.w      $12b6c
012B42: 0c39000d00ff0449 cmpi.b     #$d, $ff0449.l
012B4A: 66000020         bne.w      $12b6c
012B4E: 13fc000300ff0449 move.b     #$3, $ff0449.l
012B56: 60000014         bra.w      $12b6c
012B5A: 0c39000300ff0449 cmpi.b     #$3, $ff0449.l
012B62: 66000008         bne.w      $12b6c
012B66: 423900ff0449     clr.b      $ff0449.l
012B6C: 33fc003400ff0406 move.w     #$34, $ff0406.l
012B74: 4ef900003940     jmp        $3940.l
012B7A: 303900ff0500     move.w     $ff0500.l, d0
012B80: 41fa0012         lea.l      $12b94(pc), a0
012B84: 20700000         movea.l    (a0, d0.w), a0
012B88: 4e90             jsr        (a0)
012B8A: 13fc000100ff040d move.b     #$1, $ff040d.l
012B92: 4e75             rts        

; ---- ДАННЫЕ $012B94..$012BAC (24 байт) ----


; ==== sub_012BAC ТАБЛИЦА зовут=0 ====
012BAC: 597900ff0414     subq.w     #$4, $ff0414.l
012BB2: 66000050         bne.w      $12c04
012BB6: 7e27             moveq      #$27, d7
012BB8: 7c1b             moveq      #$1b, d6
012BBA: 2a3c60000003     move.l     #$60000003, d5
012BC0: 4df900ffa000     lea.l      $ffa000.l, a6
012BC6: 4eb900000622     jsr        $622.l
012BCC: 6100f038         bsr.w      $11c06
012BD0: 41f900ff0000     lea.l      $ff0000.l, a0
012BD6: 42680004         clr.w      $4(a0)
012BDA: 61000cf6         bsr.w      $138d2
012BDE: e540             asl.w      #$2, d0
012BE0: 43fa0056         lea.l      $12c38(pc), a1
012BE4: 32310000         move.w     (a1, d0.w), d1
012BE8: 3081             move.w     d1, (a0)
012BEA: 32310002         move.w     $2(a1, d0.w), d1
012BEE: 31410006         move.w     d1, $6(a0)
012BF2: 33fc000400ff0500 move.w     #$4, $ff0500.l
012BFA: 33fc00b400ff0408 move.w     #$b4, $ff0408.l
012C02: 4e75             rts        
012C04: 303900ff0414     move.w     $ff0414.l, d0
012C0A: 02400007         andi.w     #$7, d0
012C0E: 66000026         bne.w      $12c36
012C12: 207900ff0502     movea.l    $ff0502.l, a0
012C18: 227900ff0506     movea.l    $ff0506.l, a1
012C1E: 7013             moveq      #$13, d0
012C20: 22d8             move.l     (a0)+, (a1)+
012C22: 51c8fffc         dbra       d0, $12c20
012C26: 23c800ff0502     move.l     a0, $ff0502.l
012C2C: 43e90030         lea.l      $30(a1), a1
012C30: 23c900ff0506     move.l     a1, $ff0506.l
012C36: 4e75             rts        

; ---- ДАННЫЕ $012C38..$012C64 (44 байт) ----


; ==== sub_012C64 ТАБЛИЦА зовут=0 ====
012C64: 537900ff0408     subq.w     #$1, $ff0408.l
012C6A: 67000014         beq.w      $12c80
012C6E: 103900ffe00d     move.b     $ffe00d.l, d0
012C74: 020000f0         andi.b     #$f0, d0
012C78: 66000006         bne.w      $12c80
012C7C: 6000018a         bra.w      $12e08
012C80: 33fc000800ff0500 move.w     #$8, $ff0500.l
012C88: 61000c48         bsr.w      $138d2
012C8C: e540             asl.w      #$2, d0
012C8E: 41f900039dfc     lea.l      $39dfc.l, a0
012C94: 20300000         move.l     (a0, d0.w), d0
012C98: 23c000ff3008     move.l     d0, $ff3008.l
012C9E: 61000c32         bsr.w      $138d2
012CA2: e540             asl.w      #$2, d0
012CA4: 3200             move.w     d0, d1
012CA6: d040             add.w      d0, d0
012CA8: d041             add.w      d1, d0
012CAA: 45f900012d84     lea.l      $12d84.l, a2
012CB0: 20720000         movea.l    (a2, d0.w), a0
012CB4: 23f2000400ff0504 move.l     $4(a2, d0.w), $ff0504.l
012CBC: 23f2000800ff0508 move.l     $8(a2, d0.w), $ff0508.l
012CC4: 43f900ffa000     lea.l      $ffa000.l, a1
012CCA: 4eb9000047aa     jsr        $47aa.l
012CD0: 203c40000002     move.l     #$40000002, d0
012CD6: 223900ff0508     move.l     $ff0508.l, d1
012CDC: 243c96d09500     move.l     #$96d09500, d2
012CE2: 363c977f         move.w     #$977f, d3
012CE6: 4eb900003980     jsr        $3980.l
012CEC: 207900ff0504     movea.l    $ff0504.l, a0
012CF2: 33fc011800ff3000 move.w     #$118, $ff3000.l
012CFA: 33fc010800ff3004 move.w     #$108, $ff3004.l
012D02: 7000             moveq      #$0, d0
012D04: 4eb900013982     jsr        $13982.l
012D0A: 41f900ffa800     lea.l      $ffa800.l, a0
012D10: 7007             moveq      #$7, d0
012D12: 20fc44444444     move.l     #$44444444, (a0)+
012D18: 51c8fff8         dbra       d0, $12d12
012D1C: 203c40000001     move.l     #$40000001, d0
012D22: 223c94009310     move.l     #$94009310, d1
012D28: 243c96d49500     move.l     #$96d49500, d2
012D2E: 363c977f         move.w     #$977f, d3
012D32: 4eb900003980     jsr        $3980.l
012D38: 41f900ffa000     lea.l      $ffa000.l, a0
012D3E: 303c0008         move.w     #$8, d0
012D42: 4298             clr.l      (a0)+
012D44: 51c8fffc         dbra       d0, $12d42
012D48: 41f900ffa000     lea.l      $ffa000.l, a0
012D4E: 43f900ff89a2     lea.l      $ff89a2.l, a1
012D54: 303c8200         move.w     #$8200, d0
012D58: 7e05             moveq      #$5, d7
012D5A: 7c05             moveq      #$5, d6
012D5C: 4eb900010fc2     jsr        $10fc2.l
012D62: 427900ff0502     clr.w      $ff0502.l
012D68: 33fc004000ff0504 move.w     #$40, $ff0504.l
012D70: 427900ff0408     clr.w      $ff0408.l
012D76: 1e3c00c9         move.b     #$c9, d7
012D7A: 4eb900003d7a     jsr        $3d7a.l
012D80: 60000086         bra.w      $12e08

; ---- ДАННЫЕ $012D84..$012E08 (132 байт) ----

012E08: 303c4156         move.w     #$4156, d0
012E0C: 0839000400ff0409 btst.b     #$4, $ff0409.l
012E14: 67000004         beq.w      $12e1a
012E18: 7000             moveq      #$0, d0
012E1A: 33c000ff0004     move.w     d0, $ff0004.l
012E20: 4e75             rts        

; ==== sub_012E22 ТАБЛИЦА зовут=0 ====
012E22: 41f900ffa800     lea.l      $ffa800.l, a0
012E28: 303900ff0502     move.w     $ff0502.l, d0
012E2E: 0640000d         addi.w     #$d, d0
012E32: 0240003f         andi.w     #$3f, d0
012E36: 33c000ff0502     move.w     d0, $ff0502.l
012E3C: 3200             move.w     d0, d1
012E3E: e249             lsr.w      #$1, d1
012E40: 08000000         btst.b     #$0, d0
012E44: 6600000c         bne.w      $12e52
012E48: 0230000f1000     andi.b     #$f, (a0, d1.w)
012E4E: 60000008         bra.w      $12e58
012E52: 023000f01000     andi.b     #$f0, (a0, d1.w)
012E58: 23fc4000000100ff04a0 move.l     #$40000001, $ff04a0.l
012E62: 23fc9400931000ff04a4 move.l     #$94009310, $ff04a4.l
012E6C: 23fc96d4950000ff04a8 move.l     #$96d49500, $ff04a8.l
012E76: 33fc977f00ff04ac move.w     #$977f, $ff04ac.l
012E7E: 537900ff0504     subq.w     #$1, $ff0504.l
012E84: 66000026         bne.w      $12eac
012E88: 33fc000c00ff0500 move.w     #$c, $ff0500.l
012E90: 41fa001c         lea.l      $12eae(pc), a0
012E94: 23c800ff0502     move.l     a0, $ff0502.l
012E9A: 23fc00ff851200ff0506 move.l     #$ff8512, $ff0506.l
012EA4: 13fc000900ff050a move.b     #$9, $ff050a.l
012EAC: 4e75             rts        

; ---- ДАННЫЕ $012EAE..$012F74 (198 байт) ----


; ==== sub_012F74 ТАБЛИЦА зовут=0 ====
012F74: 207900ff0502     movea.l    $ff0502.l, a0
012F7A: 227900ff0506     movea.l    $ff0506.l, a1
012F80: 303c8100         move.w     #$8100, d0
012F84: 7e15             moveq      #$15, d7
012F86: 7c00             moveq      #$0, d6
012F88: 4eb900010fc2     jsr        $10fc2.l
012F8E: 06b90000001600ff0502 addi.l     #$16, $ff0502.l
012F98: 06b90000008000ff0506 addi.l     #$80, $ff0506.l
012FA2: 533900ff050a     subq.b     #$1, $ff050a.l
012FA8: 66000032         bne.w      $12fdc
012FAC: 33fc001000ff0500 move.w     #$10, $ff0500.l
012FB4: 6100091c         bsr.w      $138d2
012FB8: e540             asl.w      #$2, d0
012FBA: 41fa0022         lea.l      $12fde(pc), a0
012FBE: 23f0000000ff04d0 move.l     (a0, d0.w), $ff04d0.l
012FC6: 423900ff04d8     clr.b      $ff04d8.l
012FCC: 13fc000400ff04d9 move.b     #$4, $ff04d9.l
012FD4: 13fc000400ff04da move.b     #$4, $ff04da.l
012FDC: 4e75             rts        

; ---- ДАННЫЕ $012FDE..$01334E (880 байт) ----


; ==== sub_01334E ТАБЛИЦА зовут=0 ====
01334E: 4a3900ff04d8     tst.b      $ff04d8.l
013354: 66000006         bne.w      $1335c
013358: 6000000c         bra.w      $13366
01335C: 33fc001400ff0500 move.w     #$14, $ff0500.l
013364: 4e75             rts        

; ==== sub_013366 зовут=7 ====
013366: 4a3900ff04db     tst.b      $ff04db.l
01336C: 66000044         bne.w      $133b2
013370: 4a3900ff04dc     tst.b      $ff04dc.l
013376: 66000124         bne.w      $1349c
01337A: 4a7900ff04de     tst.w      $ff04de.l
013380: 6600015a         bne.w      $134dc
013384: 533900ff04d9     subq.b     #$1, $ff04d9.l
01338A: 67000026         beq.w      $133b2
01338E: 4a3900ff4100     tst.b      $ff4100.l
013394: 6600001a         bne.w      $133b0
013398: 0839000700ffe00d btst.b     #$7, $ffe00d.l
0133A0: 6700000e         beq.w      $133b0
0133A4: 13fc000100ff04db move.b     #$1, $ff04db.l
0133AC: 60000004         bra.w      $133b2
0133B0: 4e75             rts        
0133B2: 13f900ff04da00ff04d9 move.b     $ff04da.l, $ff04d9.l
0133BC: 207900ff04d0     movea.l    $ff04d0.l, a0
0133C2: 3018             move.w     (a0)+, d0
0133C4: 0c40ffff         cmpi.w     #$ffff, d0
0133C8: 670000b2         beq.w      $1347c
0133CC: 0c40fffe         cmpi.w     #$fffe, d0
0133D0: 6700009a         beq.w      $1346c
0133D4: 0c40fff5         cmpi.w     #$fff5, d0
0133D8: 670000d8         beq.w      $134b2
0133DC: 0c40fffd         cmpi.w     #$fffd, d0
0133E0: 670000e6         beq.w      $134c8
0133E4: 0c40fffc         cmpi.w     #$fffc, d0
0133E8: 67000100         beq.w      $134ea
0133EC: 0c40fffa         cmpi.w     #$fffa, d0
0133F0: 67000136         beq.w      $13528
0133F4: 0c40fff8         cmpi.w     #$fff8, d0
0133F8: 67000144         beq.w      $1353e
0133FC: 0c40fff6         cmpi.w     #$fff6, d0
013400: 6700017a         beq.w      $1357c
013404: 0c40fffb         cmpi.w     #$fffb, d0
013408: 670001ba         beq.w      $135c4
01340C: 0c40fff9         cmpi.w     #$fff9, d0
013410: 670001ee         beq.w      $13600
013414: 0c40fff7         cmpi.w     #$fff7, d0
013418: 67000222         beq.w      $1363c
01341C: 0c40fff4         cmpi.w     #$fff4, d0
013420: 6700006a         beq.w      $1348c
013424: 0c40fff3         cmpi.w     #$fff3, d0
013428: 67000190         beq.w      $135ba
01342C: 227900ff04d4     movea.l    $ff04d4.l, a1
013432: 3280             move.w     d0, (a1)
013434: 4a3900ff4100     tst.b      $ff4100.l
01343A: 6600000a         bne.w      $13446
01343E: 06400010         addi.w     #$10, d0
013442: 33400080         move.w     d0, $80(a1)
013446: 43e90002         lea.l      $2(a1), a1
01344A: 23c900ff04d4     move.l     a1, $ff04d4.l
013450: 23c800ff04d0     move.l     a0, $ff04d0.l
013456: 13fc000100ff04db move.b     #$1, $ff04db.l
01345E: 6000ff06         bra.w      $13366

; ---- ДАННЫЕ $013462..$01346C (10 байт) ----

01346C: 423900ff04de     clr.b      $ff04de.l
013472: 23d800ff04d4     move.l     (a0)+, $ff04d4.l
013478: 6000ff48         bra.w      $133c2
01347C: 423900ff04db     clr.b      $ff04db.l
013482: 13fc000100ff04d8 move.b     #$1, $ff04d8.l
01348A: 4e75             rts        
01348C: 3e18             move.w     (a0)+, d7
01348E: 4eb900003d7a     jsr        $3d7a.l
013494: 23c800ff04d0     move.l     a0, $ff04d0.l
01349A: 4e75             rts        
01349C: 103900ffe00d     move.b     $ffe00d.l, d0
0134A2: 020000e0         andi.b     #$e0, d0
0134A6: 67000008         beq.w      $134b0
0134AA: 423900ff04dc     clr.b      $ff04dc.l
0134B0: 4e75             rts        
0134B2: 423900ff04db     clr.b      $ff04db.l
0134B8: 13fc000100ff04dc move.b     #$1, $ff04dc.l
0134C0: 23c800ff04d0     move.l     a0, $ff04d0.l
0134C6: 4e75             rts        
0134C8: 423900ff04db     clr.b      $ff04db.l
0134CE: 33d800ff04de     move.w     (a0)+, $ff04de.l
0134D4: 23c800ff04d0     move.l     a0, $ff04d0.l
0134DA: 4e75             rts        
0134DC: 423900ff04db     clr.b      $ff04db.l
0134E2: 537900ff04de     subq.w     #$1, $ff04de.l
0134E8: 4e75             rts        
0134EA: 423900ff04db     clr.b      $ff04db.l
0134F0: 23c800ff04d0     move.l     a0, $ff04d0.l
0134F6: 43f900ff861e     lea.l      $ff861e.l, a1
0134FC: 7013             moveq      #$13, d0
0134FE: 32bc8332         move.w     #$8332, (a1)
013502: 337c83320080     move.w     #$8332, $80(a1)
013508: 337c83320100     move.w     #$8332, $100(a1)
01350E: 337c83320180     move.w     #$8332, $180(a1)
013514: 337c83320200     move.w     #$8332, $200(a1)
01351A: 337c83320280     move.w     #$8332, $280(a1)
013520: 5449             addq.w     #$2, a1
013522: 51c8ffda         dbra       d0, $134fe
013526: 4e75             rts        
013528: 423900ff04db     clr.b      $ff04db.l
01352E: 23c800ff04d0     move.l     a0, $ff04d0.l
013534: 43f900ff861e     lea.l      $ff861e.l, a1
01353A: 7009             moveq      #$9, d0
01353C: 60c0             bra.b      $134fe
01353E: 423900ff04db     clr.b      $ff04db.l
013544: 23c800ff04d0     move.l     a0, $ff04d0.l
01354A: 43f900ff8594     lea.l      $ff8594.l, a1
013550: 7013             moveq      #$13, d0
013552: 32bc815f         move.w     #$815f, (a1)
013556: 337c815f0080     move.w     #$815f, $80(a1)
01355C: 337c815f0100     move.w     #$815f, $100(a1)
013562: 337c815f0180     move.w     #$815f, $180(a1)
013568: 337c815f0200     move.w     #$815f, $200(a1)
01356E: 337c815f0280     move.w     #$815f, $280(a1)
013574: 5449             addq.w     #$2, a1
013576: 51c8ffda         dbra       d0, $13552
01357A: 4e75             rts        
01357C: 423900ff04db     clr.b      $ff04db.l
013582: 23c800ff04d0     move.l     a0, $ff04d0.l
013588: 43f900ff8514     lea.l      $ff8514.l, a1
01358E: 7013             moveq      #$13, d0
013590: 32bc8004         move.w     #$8004, (a1)
013594: 337c80040080     move.w     #$8004, $80(a1)
01359A: 337c80040100     move.w     #$8004, $100(a1)
0135A0: 337c80040180     move.w     #$8004, $180(a1)
0135A6: 337c80040200     move.w     #$8004, $200(a1)
0135AC: 337c80040280     move.w     #$8004, $280(a1)
0135B2: 5449             addq.w     #$2, a1
0135B4: 51c8ffda         dbra       d0, $13590
0135B8: 4e75             rts        
0135BA: 23d800ff04d0     move.l     (a0)+, $ff04d0.l
0135C0: 6000fdfa         bra.w      $133bc
0135C4: 423900ff04db     clr.b      $ff04db.l
0135CA: 2658             movea.l    (a0)+, a3
0135CC: 23d800ff04d0     move.l     (a0)+, $ff04d0.l
0135D2: 7003             moveq      #$3, d0
0135D4: 4eb900003cca     jsr        $3cca.l
0135DA: 203c46000000     move.l     #$46000000, d0
0135E0: 223c94089300     move.l     #$94089300, d1
0135E6: 243c96d09500     move.l     #$96d09500, d2
0135EC: 363c977f         move.w     #$977f, d3
0135F0: 007c0700         ori.w      #$700, sr
0135F4: 4eb900003980     jsr        $3980.l
0135FA: 027cf8ff         andi.w     #$f8ff, sr
0135FE: 4e75             rts        
013600: 423900ff04db     clr.b      $ff04db.l
013606: 2658             movea.l    (a0)+, a3
013608: 23d800ff04d0     move.l     (a0)+, $ff04d0.l
01360E: 7000             moveq      #$0, d0
013610: 4eb900003cca     jsr        $3cca.l
013616: 203c60000001     move.l     #$60000001, d0
01361C: 223c94089300     move.l     #$94089300, d1
013622: 243c96d09500     move.l     #$96d09500, d2
013628: 363c977f         move.w     #$977f, d3
01362C: 007c0700         ori.w      #$700, sr
013630: 4eb900003980     jsr        $3980.l
013636: 027cf8ff         andi.w     #$f8ff, sr
01363A: 4e75             rts        
01363C: 423900ff04db     clr.b      $ff04db.l
013642: 2658             movea.l    (a0)+, a3
013644: 23d800ff04d0     move.l     (a0)+, $ff04d0.l
01364A: 7003             moveq      #$3, d0
01364C: 4eb900003cca     jsr        $3cca.l
013652: 203c46000000     move.l     #$46000000, d0
013658: 223c940d9300     move.l     #$940d9300, d1
01365E: 243c96d09500     move.l     #$96d09500, d2
013664: 363c977f         move.w     #$977f, d3
013668: 007c0700         ori.w      #$700, sr
01366C: 4eb900003980     jsr        $3980.l
013672: 027cf8ff         andi.w     #$f8ff, sr
013676: 4e75             rts        

; ==== sub_013678 ТАБЛИЦА зовут=0 ====
013678: 103900ffe00d     move.b     $ffe00d.l, d0
01367E: 020000f0         andi.b     #$f0, d0
013682: 66000004         bne.w      $13688
013686: 4e75             rts        
013688: 41f900ff0380     lea.l      $ff0380.l, a0
01368E: 43e80040         lea.l      $40(a0), a1
013692: 45e80060         lea.l      $60(a0), a2
013696: 7e07             moveq      #$7, d7
013698: 4298             clr.l      (a0)+
01369A: 4299             clr.l      (a1)+
01369C: 429a             clr.l      (a2)+
01369E: 51cffff8         dbra       d7, $13698
0136A2: 4eb90000383c     jsr        $383c.l
0136A8: 4eb900011c06     jsr        $11c06.l
0136AE: 4eb900000ee2     jsr        $ee2.l
0136B4: 4eb900004b44     jsr        $4b44.l
0136BA: 4eb900013716     jsr        $13716.l
0136C0: 41f900ff03a0     lea.l      $ff03a0.l, a0
0136C6: 43f900ff0320     lea.l      $ff0320.l, a1
0136CC: 7007             moveq      #$7, d0
0136CE: 22d8             move.l     (a0)+, (a1)+
0136D0: 51c8fffc         dbra       d0, $136ce
0136D4: 41f900ff0300     lea.l      $ff0300.l, a0
0136DA: 43e80040         lea.l      $40(a0), a1
0136DE: 45e80060         lea.l      $60(a0), a2
0136E2: 7e07             moveq      #$7, d7
0136E4: 4298             clr.l      (a0)+
0136E6: 4299             clr.l      (a1)+
0136E8: 429a             clr.l      (a2)+
0136EA: 51cffff8         dbra       d7, $136e4
0136EE: 4eb900000ee2     jsr        $ee2.l
0136F4: 41f90000f7ac     lea.l      $f7ac.l, a0
0136FA: 43f900ff03e0     lea.l      $ff03e0.l, a1
013700: 7007             moveq      #$7, d0
013702: 22d8             move.l     (a0)+, (a1)+
013704: 51c8fffc         dbra       d0, $13702
013708: 4eb900013716     jsr        $13716.l
01370E: 4eb90000383c     jsr        $383c.l
013714: 4e75             rts        

; ==== sub_013716 зовут=3 ====
013716: 610001ba         bsr.w      $138d2

; ==== sub_01371A зовут=1 ====
01371A: eb40             asl.w      #$5, d0
01371C: 41fa0014         lea.l      $13732(pc), a0
013720: d1c0             adda.l     d0, a0
013722: 43f900ff03a0     lea.l      $ff03a0.l, a1
013728: 7007             moveq      #$7, d0
01372A: 22d8             move.l     (a0)+, (a1)+
01372C: 51c8fffc         dbra       d0, $1372a
013730: 4e75             rts        

; ---- ДАННЫЕ $013732..$0138D2 (416 байт) ----


; ==== sub_0138D2 зовут=21 ====
0138D2: 7000             moveq      #$0, d0
0138D4: 103900ff0449     move.b     $ff0449.l, d0
0138DA: 4a3900ff0448     tst.b      $ff0448.l
0138E0: 67000018         beq.w      $138fa
0138E4: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
0138EC: 6700000a         beq.w      $138f8
0138F0: 0440000d         subi.w     #$d, d0
0138F4: 60000004         bra.w      $138fa
0138F8: 5740             subq.w     #$3, d0
0138FA: 4e75             rts        
0138FC: 0c79001800ff144c cmpi.w     #$18, $ff144c.l
013904: 6d000006         blt.w      $1390c
013908: 600000a0         bra.w      $139aa
01390C: 207900ff1406     movea.l    $ff1406.l, a0
013912: 41e80020         lea.l      $20(a0), a0
013916: 2018             move.l     (a0)+, d0
013918: 8098             or.l       (a0)+, d0
01391A: 8098             or.l       (a0)+, d0
01391C: 4a7900ff3014     tst.w      $ff3014.l
013922: 66000030         bne.w      $13954
013926: 4a80             tst.l      d0
013928: 66000024         bne.w      $1394e
01392C: 303900ff14f0     move.w     $ff14f0.l, d0
013932: 807900ff14f2     or.w       $ff14f2.l, d0
013938: 807900ff14f4     or.w       $ff14f4.l, d0
01393E: 807900ff14f6     or.w       $ff14f6.l, d0
013944: 807900ff14f8     or.w       $ff14f8.l, d0
01394A: 6700005e         beq.w      $139aa
01394E: 7004             moveq      #$4, d0
013950: 60000030         bra.w      $13982
013954: 4a80             tst.l      d0
013956: 66000052         bne.w      $139aa
01395A: 303900ff14f0     move.w     $ff14f0.l, d0
013960: 807900ff14f2     or.w       $ff14f2.l, d0
013966: 807900ff14f4     or.w       $ff14f4.l, d0
01396C: 807900ff14f6     or.w       $ff14f6.l, d0
013972: 807900ff14f8     or.w       $ff14f8.l, d0
013978: 66000030         bne.w      $139aa
01397C: 7000             moveq      #$0, d0
01397E: 60000002         bra.w      $13982

; ==== sub_013982 зовут=7 ====
013982: 33c000ff3014     move.w     d0, $ff3014.l
013988: 207900ff3008     movea.l    $ff3008.l, a0
01398E: 20300000         move.l     (a0, d0.w), d0
013992: 23c000ff300c     move.l     d0, $ff300c.l
013998: 427900ff3010     clr.w      $ff3010.l
01399E: 33fc001000ff3012 move.w     #$10, $ff3012.l
0139A6: 6000005c         bra.w      $13a04

; ==== sub_0139AA зовут=8 ====
0139AA: 4a3900ff14e2     tst.b      $ff14e2.l
0139B0: 67000038         beq.w      $139ea
0139B4: 533900ff14e2     subq.b     #$1, $ff14e2.l
0139BA: 6600002e         bne.w      $139ea
0139BE: 1e3c00ab         move.b     #$ab, d7
0139C2: 0c39000200ff14e3 cmpi.b     #$2, $ff14e3.l
0139CA: 67000018         beq.w      $139e4
0139CE: 1e3c00dd         move.b     #$dd, d7
0139D2: 4eb9000138d2     jsr        $138d2.l
0139D8: 0c400009         cmpi.w     #$9, d0
0139DC: 6d000006         blt.w      $139e4
0139E0: 1e3c00de         move.b     #$de, d7
0139E4: 4eb900003d7a     jsr        $3d7a.l
0139EA: 537900ff3012     subq.w     #$1, $ff3012.l
0139F0: 67000004         beq.w      $139f6
0139F4: 4e75             rts        
0139F6: 33fc001000ff3012 move.w     #$10, $ff3012.l
0139FE: 587900ff3010     addq.w     #$4, $ff3010.l
013A04: 207900ff300c     movea.l    $ff300c.l, a0
013A0A: 303900ff3010     move.w     $ff3010.l, d0
013A10: 22300000         move.l     (a0, d0.w), d1
013A14: 0c41ffff         cmpi.w     #$ffff, d1
013A18: 6600000e         bne.w      $13a28
013A1C: 427900ff3010     clr.w      $ff3010.l
013A22: 2210             move.l     (a0), d1
013A24: 60000018         bra.w      $13a3e
013A28: 0c41fffe         cmpi.w     #$fffe, d1
013A2C: 66000010         bne.w      $13a3e
013A30: 24300004         move.l     $4(a0, d0.w), d2
013A34: 33c200ff3010     move.w     d2, $ff3010.l
013A3A: 22302000         move.l     (a0, d2.w), d1
013A3E: 2041             movea.l    d1, a0
013A40: 43f900ff0100     lea.l      $ff0100.l, a1
013A46: 7e00             moveq      #$0, d7
013A48: 1e18             move.b     (a0)+, d7
013A4A: 303900ff3000     move.w     $ff3000.l, d0
013A50: 323900ff3004     move.w     $ff3004.l, d1
013A56: 61000016         bsr.w      $13a6e
013A5A: 51cffffa         dbra       d7, $13a56
013A5E: 4a51             tst.w      (a1)
013A60: 6700000a         beq.w      $13a6c
013A64: 4251             clr.w      (a1)
013A66: 43e90008         lea.l      $8(a1), a1
013A6A: 60f2             bra.b      $13a5e
013A6C: 4e75             rts        

; ==== sub_013A6E зовут=1 ====
013A6E: 1418             move.b     (a0)+, d2
013A70: 4882             ext.w      d2
013A72: d440             add.w      d0, d2
013A74: 32c2             move.w     d2, (a1)+
013A76: 1418             move.b     (a0)+, d2
013A78: 12c2             move.b     d2, (a1)+
013A7A: 43e90001         lea.l      $1(a1), a1
013A7E: 12d8             move.b     (a0)+, (a1)+
013A80: 12d8             move.b     (a0)+, (a1)+
013A82: 1418             move.b     (a0)+, d2
013A84: 4882             ext.w      d2
013A86: d441             add.w      d1, d2
013A88: 32c2             move.w     d2, (a1)+
013A8A: 4e75             rts        

; ==== sub_013A8C зовут=1 ====
013A8C: 41fa000e         lea.l      $13a9c(pc), a0
013A90: 303900ff3222     move.w     $ff3222.l, d0
013A96: 20700000         movea.l    (a0, d0.w), a0
013A9A: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $013A9C..$013AE2 (70 байт) ----


; ==== sub_013AE2 ТАБЛИЦА зовут=0 ====
013AE2: 33fc000800ff3222 move.w     #$8, $ff3222.l
013AEA: 13f900ff323200ff3228 move.b     $ff3232.l, $ff3228.l
013AF4: 4a6e00f4         tst.w      $f4(a6)
013AF8: 67000022         beq.w      $13b1c
013AFC: 13f900ff323300ff3228 move.b     $ff3233.l, $ff3228.l
013B06: 4eb9000138d2     jsr        $138d2.l
013B0C: 0c400001         cmpi.w     #$1, d0
013B10: 6600000a         bne.w      $13b1c
013B14: 13fc005a00ff3228 move.b     #$5a, $ff3228.l
013B1C: 533900ff3228     subq.b     #$1, $ff3228.l
013B22: 67000004         beq.w      $13b28
013B26: 4e75             rts        
013B28: 4eb9000138d2     jsr        $138d2.l
013B2E: 0c400001         cmpi.w     #$1, d0
013B32: 66000028         bne.w      $13b5c
013B36: 206e0006         movea.l    $6(a6), a0
013B3A: 41e80040         lea.l      $40(a0), a0
013B3E: 2018             move.l     (a0)+, d0
013B40: 8098             or.l       (a0)+, d0
013B42: 8098             or.l       (a0)+, d0
013B44: 66000016         bne.w      $13b5c
013B48: 33fc001800ff3222 move.w     #$18, $ff3222.l
013B50: 13f900ff323500ff322a move.b     $ff3235.l, $ff322a.l
013B5A: 4e75             rts        
013B5C: 33fc000c00ff3222 move.w     #$c, $ff3222.l
013B64: 13fc00ff00ff322c move.b     #$ff, $ff322c.l
013B6C: 6100006a         bsr.w      $13bd8
013B70: 7000             moveq      #$0, d0
013B72: 323c0004         move.w     #$4, d1
013B76: 103900ff3216     move.b     $ff3216.l, d0
013B7C: b06e0042         cmp.w      $42(a6), d0
013B80: 67000036         beq.w      $13bb8
013B84: 6d000006         blt.w      $13b8c
013B88: 323c0008         move.w     #$8, d1
013B8C: 533900ff322a     subq.b     #$1, $ff322a.l
013B92: 66000022         bne.w      $13bb6
013B96: 61000040         bsr.w      $13bd8
013B9A: 1d410040         move.b     d1, $40(a6)
013B9E: 426e004a         clr.w      $4a(a6)
013BA2: 302e0042         move.w     $42(a6), d0
013BA6: b03900ff322c     cmp.b      $ff322c.l, d0
013BAC: 6700000a         beq.w      $13bb8
013BB0: 13c000ff322c     move.b     d0, $ff322c.l
013BB6: 4e75             rts        
013BB8: 4eb9000138d2     jsr        $138d2.l
013BBE: 0c400002         cmpi.w     #$2, d0
013BC2: 6600004c         bne.w      $13c10
013BC6: 13fc000800ff322b move.b     #$8, $ff322b.l
013BCE: 33fc004000ff3222 move.w     #$40, $ff3222.l
013BD6: 4e75             rts        

; ==== sub_013BD8 зовут=2 ====
013BD8: 13f900ff323500ff322a move.b     $ff3235.l, $ff322a.l
013BE2: 4a6e00f0         tst.w      $f0(a6)
013BE6: 6700000c         beq.w      $13bf4
013BEA: 13f900ff323600ff322a move.b     $ff3236.l, $ff322a.l
013BF4: 302e00f2         move.w     $f2(a6), d0
013BF8: 806e00f4         or.w       $f4(a6), d0
013BFC: 806e00f6         or.w       $f6(a6), d0
013C00: 806e00f8         or.w       $f8(a6), d0
013C04: 67000008         beq.w      $13c0e
013C08: 5a3900ff322a     addq.b     #$5, $ff322a.l
013C0E: 4e75             rts        
013C10: 33fc001000ff3222 move.w     #$10, $ff3222.l
013C18: 13fc000800ff322b move.b     #$8, $ff322b.l
013C20: 4e75             rts        

; ==== sub_013C22 ТАБЛИЦА зовут=0 ====
013C22: 4a3900ff3217     tst.b      $ff3217.l
013C28: 67000022         beq.w      $13c4c
013C2C: 533900ff322b     subq.b     #$1, $ff322b.l
013C32: 66000016         bne.w      $13c4a
013C36: 13fc000800ff322b move.b     #$8, $ff322b.l
013C3E: 1d7c00100041     move.b     #$10, $41(a6)
013C44: 533900ff3217     subq.b     #$1, $ff3217.l
013C4A: 4e75             rts        
013C4C: 33fc001400ff3222 move.w     #$14, $ff3222.l
013C54: 4e75             rts        

; ==== sub_013C56 ТАБЛИЦА зовут=1 ====
013C56: 7000             moveq      #$0, d0
013C58: 103900ff3237     move.b     $ff3237.l, d0
013C5E: 4a6e00f6         tst.w      $f6(a6)
013C62: 67000008         beq.w      $13c6c
013C66: 103900ff3238     move.b     $ff3238.l, d0
013C6C: 322e00f0         move.w     $f0(a6), d1
013C70: 826e00f2         or.w       $f2(a6), d1
013C74: 826e00f4         or.w       $f4(a6), d1
013C78: 826e00f8         or.w       $f8(a6), d1
013C7C: 6700000a         beq.w      $13c88
013C80: 5340             subq.w     #$1, d0
013C82: 6a000004         bpl.w      $13c88
013C86: 7000             moveq      #$0, d0
013C88: e540             asl.w      #$2, d0
013C8A: 41fa0014         lea.l      $13ca0(pc), a0
013C8E: 20300000         move.l     (a0, d0.w), d0
013C92: 23c000ff3224     move.l     d0, $ff3224.l
013C98: 1d7c00020040     move.b     #$2, $40(a6)
013C9E: 4e75             rts        

; ---- ДАННЫЕ $013CA0..$013CE0 (64 байт) ----


; ==== sub_013CE0 ТАБЛИЦА зовут=0 ====
013CE0: 533900ff322a     subq.b     #$1, $ff322a.l
013CE6: 66000030         bne.w      $13d18
013CEA: 13fc000100ff322a move.b     #$1, $ff322a.l
013CF2: 1d7c00080040     move.b     #$8, $40(a6)
013CF8: 426e004a         clr.w      $4a(a6)
013CFC: 0c6e00050042     cmpi.w     #$5, $42(a6)
013D02: 66000014         bne.w      $13d18
013D06: 422e0040         clr.b      $40(a6)
013D0A: 33fc001400ff304e move.w     #$14, $ff304e.l
013D12: 587900ff3222     addq.w     #$4, $ff3222.l
013D18: 4e75             rts        

; ==== sub_013D1A ТАБЛИЦА зовут=0 ====
013D1A: 533900ff322a     subq.b     #$1, $ff322a.l
013D20: 6600003a         bne.w      $13d5c
013D24: 13f900ff323500ff322a move.b     $ff3235.l, $ff322a.l
013D2E: 13fc000100ff322a move.b     #$1, $ff322a.l
013D36: 1d7c00080040     move.b     #$8, $40(a6)
013D3C: 426e004a         clr.w      $4a(a6)
013D40: 0c6e00020042     cmpi.w     #$2, $42(a6)
013D46: 66000014         bne.w      $13d5c
013D4A: 422e0040         clr.b      $40(a6)
013D4E: 13f900ff323500ff322a move.b     $ff3235.l, $ff322a.l
013D58: 6000fe02         bra.w      $13b5c
013D5C: 4e75             rts        

; ==== sub_013D5E ТАБЛИЦА зовут=0 ====
013D5E: 537900ff304e     subq.w     #$1, $ff304e.l
013D64: 66000008         bne.w      $13d6e
013D68: 587900ff3222     addq.w     #$4, $ff3222.l
013D6E: 4e75             rts        

; ==== sub_013D70 ТАБЛИЦА зовут=0 ====
013D70: 533900ff322a     subq.b     #$1, $ff322a.l
013D76: 6600002a         bne.w      $13da2
013D7A: 13fc000100ff322a move.b     #$1, $ff322a.l
013D82: 1d7c00040040     move.b     #$4, $40(a6)
013D88: 426e004a         clr.w      $4a(a6)
013D8C: 4a6e0042         tst.w      $42(a6)
013D90: 66000010         bne.w      $13da2
013D94: 33fc001400ff304e move.w     #$14, $ff304e.l
013D9C: 587900ff3222     addq.w     #$4, $ff3222.l
013DA2: 4e75             rts        

; ==== sub_013DA4 ТАБЛИЦА зовут=0 ====
013DA4: 6100feb0         bsr.w      $13c56
013DA8: 533900ff322b     subq.b     #$1, $ff322b.l
013DAE: 66000034         bne.w      $13de4
013DB2: 13fc000800ff322b move.b     #$8, $ff322b.l
013DBA: 4a6e00f2         tst.w      $f2(a6)
013DBE: 6600001e         bne.w      $13dde
013DC2: 002e00100041     ori.b      #$10, $41(a6)
013DC8: 7000             moveq      #$0, d0
013DCA: 103900ff3217     move.b     $ff3217.l, d0
013DD0: 41fa000e         lea.l      $13de0(pc), a0
013DD4: 10300000         move.b     (a0, d0.w), d0
013DD8: 13c000ff3217     move.b     d0, $ff3217.l
013DDE: 4e75             rts        

; ---- ДАННЫЕ $013DE0..$013DE4 (4 байт) ----

013DE4: 4e75             rts        

; ==== sub_013DE6 зовут=1 ====
013DE6: 4a7900ff0418     tst.w      $ff0418.l
013DEC: 67000004         beq.w      $13df2
013DF0: 4e75             rts        
013DF2: 600007fc         bra.w      $145f0

; ---- ДАННЫЕ $013DF6..$0145F0 (2042 байт) ----

0145F0: bdfc00ff1400     cmpa.l     #$ff1400, a6
0145F6: 67000004         beq.w      $145fc
0145FA: 4e75             rts        
0145FC: 422e0041         clr.b      $41(a6)
014600: 422e0040         clr.b      $40(a6)
014604: 6100f486         bsr.w      $13a8c
014608: 61000db8         bsr.w      $153c2
01460C: 303900ff3210     move.w     $ff3210.l, d0
014612: 41fa0008         lea.l      $1461c(pc), a0
014616: 20700000         movea.l    (a0, d0.w), a0
01461A: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $01461C..$014638 (28 байт) ----


; ==== sub_014638 ТАБЛИЦА зовут=0 ====
014638: 33fcffff00ff3280 move.w     #$ffff, $ff3280.l
014640: 427900ff3212     clr.w      $ff3212.l
014646: 23fc00ff312000ff321e move.l     #$ff3120, $ff321e.l
014650: 41f9000146d0     lea.l      $146d0.l, a0
014656: 43f900ff3120     lea.l      $ff3120.l, a1
01465C: 7000             moveq      #$0, d0
01465E: 7211             moveq      #$11, d1
014660: 1018             move.b     (a0)+, d0
014662: 22c0             move.l     d0, (a1)+
014664: 51c9fffa         dbra       d1, $14660
014668: 41f900ff302e     lea.l      $ff302e.l, a0
01466E: 4290             clr.l      (a0)
014670: 42a80004         clr.l      $4(a0)
014674: 163900ff3230     move.b     $ff3230.l, d3
01467A: 4a6e00f8         tst.w      $f8(a6)
01467E: 67000008         beq.w      $14688
014682: 163900ff3231     move.b     $ff3231.l, d3
014688: 7406             moveq      #$6, d2
01468A: 9403             sub.b      d3, d2
01468C: 67000038         beq.w      $146c6
014690: 4eb900000368     jsr        $368.l
014696: 303900ffef90     move.w     $ffef90.l, d0
01469C: 02400007         andi.w     #$7, d0
0146A0: 66000006         bne.w      $146a8
0146A4: 103c0001         move.b     #$1, d0
0146A8: 41f900ff302e     lea.l      $ff302e.l, a0
0146AE: 0c000006         cmpi.b     #$6, d0
0146B2: 6f000006         ble.w      $146ba
0146B6: 103c0001         move.b     #$1, d0
0146BA: 11bc00010000     move.b     #$1, (a0, d0.w)
0146C0: 5240             addq.w     #$1, d0
0146C2: 5342             subq.w     #$1, d2
0146C4: 66e8             bne.b      $146ae
0146C6: 33fc000400ff3210 move.w     #$4, $ff3210.l
0146CE: 4e75             rts        

; ---- ДАННЫЕ $0146D0..$0146E2 (18 байт) ----


; ==== sub_0146E2 ТАБЛИЦА зовут=0 ====
0146E2: 61000bd6         bsr.w      $152ba
0146E6: 207900ff321e     movea.l    $ff321e.l, a0

; ==== sub_0146EC зовут=1 ====
0146EC: 6100065e         bsr.w      $14d4c

; ==== sub_0146F0 зовут=1 ====
0146F0: 587900ff3210     addq.w     #$4, $ff3210.l
0146F6: 58b900ff321e     addq.l     #$4, $ff321e.l
0146FC: 4e75             rts        

; ==== sub_0146FE ТАБЛИЦА зовут=0 ====
0146FE: 4a6e00f2         tst.w      $f2(a6)
014702: 66ec             bne.b      $146f0
014704: 61000c12         bsr.w      $15318
014708: 207900ff321e     movea.l    $ff321e.l, a0
01470E: 60dc             bra.b      $146ec

; ==== sub_014710 ТАБЛИЦА зовут=0 ====
014710: 4a6e00f2         tst.w      $f2(a6)
014714: 67000008         beq.w      $1471e
014718: 61d6             bsr.b      $146f0
01471A: 6000000e         bra.w      $1472a
01471E: 61000c12         bsr.w      $15332
014722: 207900ff321e     movea.l    $ff321e.l, a0
014728: 61c2             bsr.b      $146ec
01472A: 33fc000400ff3210 move.w     #$4, $ff3210.l
014732: 547900ff3212     addq.w     #$2, $ff3212.l
014738: 0c79000c00ff3212 cmpi.w     #$c, $ff3212.l
014740: 6600000a         bne.w      $1474c
014744: 33fc001000ff3210 move.w     #$10, $ff3210.l
01474C: 4e75             rts        

; ==== sub_01474E ТАБЛИЦА зовут=0 ====
01474E: 4eb9000138d2     jsr        $138d2.l
014754: e540             asl.w      #$2, d0
014756: 41fa0008         lea.l      $14760(pc), a0
01475A: 20700000         movea.l    (a0, d0.w), a0
01475E: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $014760..$01478C (44 байт) ----


; ==== sub_01478C ТАБЛИЦА зовут=0 ====
01478C: 4a3900ff3046     tst.b      $ff3046.l
014792: 670000b0         beq.w      $14844
014796: 41f900ffe200     lea.l      $ffe200.l, a0
01479C: 43f900ff3230     lea.l      $ff3230.l, a1
0147A2: 7017             moveq      #$17, d0
0147A4: e940             asl.w      #$4, d0
0147A6: d1c0             adda.l     d0, a0
0147A8: 7003             moveq      #$3, d0
0147AA: 22d8             move.l     (a0)+, (a1)+
0147AC: 51c8fffc         dbra       d0, $147aa
0147B0: 303900ff3044     move.w     $ff3044.l, d0
0147B6: 41fa0062         lea.l      $1481a(pc), a0
0147BA: 13f0000000ff3216 move.b     (a0, d0.w), $ff3216.l
0147C2: 423900ff3217     clr.b      $ff3217.l
0147C8: 303900ff3210     move.w     $ff3210.l, d0
0147CE: 33fc001400ff3210 move.w     #$14, $ff3210.l
0147D6: 527900ff3044     addq.w     #$1, $ff3044.l
0147DC: 0c79000700ff3044 cmpi.w     #$7, $ff3044.l
0147E4: 66000032         bne.w      $14818
0147E8: 33c000ff3210     move.w     d0, $ff3210.l
0147EE: 423900ff3046     clr.b      $ff3046.l
0147F4: 41f900ffe200     lea.l      $ffe200.l, a0
0147FA: 43f900ff3230     lea.l      $ff3230.l, a1
014800: 7000             moveq      #$0, d0
014802: 103900ff0449     move.b     $ff0449.l, d0
014808: e940             asl.w      #$4, d0
01480A: d1c0             adda.l     d0, a0
01480C: 7003             moveq      #$3, d0
01480E: 22d8             move.l     (a0)+, (a1)+
014810: 51c8fffc         dbra       d0, $1480e
014814: 6000002e         bra.w      $14844
014818: 4e75             rts        

; ---- ДАННЫЕ $01481A..$014820 (6 байт) ----


; ==== sub_014820 ТАБЛИЦА зовут=0 ====
014820: 4a7900ff3048     tst.w      $ff3048.l
014826: 6700001c         beq.w      $14844
01482A: 41f900ff315c     lea.l      $ff315c.l, a0
014830: 4298             clr.l      (a0)+
014832: 4298             clr.l      (a0)+
014834: 4290             clr.l      (a0)
014836: 6000000c         bra.w      $14844

; ==== sub_01483A ТАБЛИЦА зовут=0 ====
01483A: 4a3900ff3042     tst.b      $ff3042.l
014840: 66000bf6         bne.w      $15438

; ==== sub_014844 ТАБЛИЦА зовут=0 ====
014844: 41f900ff3170     lea.l      $ff3170.l, a0
01484A: 61000360         bsr.w      $14bac
01484E: 41f900ff3120     lea.l      $ff3120.l, a0
014854: 43f900ff3170     lea.l      $ff3170.l, a1
01485A: 223c80000000     move.l     #$80000000, d1
014860: 61000330         bsr.w      $14b92
014864: 4a42             tst.w      d2
014866: 66000012         bne.w      $1487a
01486A: 41f900ff3120     lea.l      $ff3120.l, a0
014870: 43f900ff3170     lea.l      $ff3170.l, a1
014876: 6100033e         bsr.w      $14bb6
01487A: 41f900ff31c0     lea.l      $ff31c0.l, a0
014880: 6100032a         bsr.w      $14bac
014884: 41f900ff3170     lea.l      $ff3170.l, a0
01488A: 43f900ff31c0     lea.l      $ff31c0.l, a1
014890: 223c60000000     move.l     #$60000000, d1
014896: 610002fa         bsr.w      $14b92
01489A: 4a42             tst.w      d2
01489C: 6700000c         beq.w      $148aa
0148A0: 41f900ff31c0     lea.l      $ff31c0.l, a0
0148A6: 600000f2         bra.w      $1499a
0148AA: 41f900ff3170     lea.l      $ff3170.l, a0
0148B0: 43f900ff31c0     lea.l      $ff31c0.l, a1
0148B6: 223c0ff00000     move.l     #$ff00000, d1
0148BC: 610002d4         bsr.w      $14b92
0148C0: 4a42             tst.w      d2
0148C2: 6700005e         beq.w      $14922
0148C6: 0c420001         cmpi.w     #$1, d2
0148CA: 6700004c         beq.w      $14918
0148CE: 4eb900000368     jsr        $368.l
0148D4: 303900ffef90     move.w     $ffef90.l, d0
0148DA: 02400007         andi.w     #$7, d0
0148DE: 123900ff3239     move.b     $ff3239.l, d1
0148E4: 0c010008         cmpi.b     #$8, d1
0148E8: 6700002e         beq.w      $14918
0148EC: 4a00             tst.b      d0
0148EE: 67000008         beq.w      $148f8
0148F2: b200             cmp.b      d0, d1
0148F4: 6c000022         bge.w      $14918
0148F8: 303900ffef90     move.w     $ffef90.l, d0
0148FE: 0240000f         andi.w     #$f, d0
014902: e540             asl.w      #$2, d0
014904: 41f900ff31c0     lea.l      $ff31c0.l, a0
01490A: 4ab00000         tst.l      (a0, d0.w)
01490E: 66000004         bne.w      $14914
014912: 7000             moveq      #$0, d0
014914: 001000f0         ori.b      #$f0, (a0)
014918: 41f900ff31c0     lea.l      $ff31c0.l, a0
01491E: 6000007a         bra.w      $1499a
014922: 41f900ff3170     lea.l      $ff3170.l, a0
014928: 43f900ff31c0     lea.l      $ff31c0.l, a1
01492E: 223c000ff000     move.l     #$ff000, d1
014934: 6100025c         bsr.w      $14b92
014938: 41f900ff3170     lea.l      $ff3170.l, a0
01493E: 4a42             tst.w      d2
014940: 67000058         beq.w      $1499a
014944: 41f900ff31c0     lea.l      $ff31c0.l, a0
01494A: 4eb900000368     jsr        $368.l
014950: 303900ffef90     move.w     $ffef90.l, d0
014956: 02400007         andi.w     #$7, d0
01495A: 67000018         beq.w      $14974
01495E: 123900ff323a     move.b     $ff323a.l, d1
014964: 0c010008         cmpi.b     #$8, d1
014968: 67ae             beq.b      $14918
01496A: 4a00             tst.b      d0
01496C: 67000006         beq.w      $14974
014970: b200             cmp.b      d0, d1
014972: 6ca4             bge.b      $14918
014974: 7411             moveq      #$11, d2
014976: 41f900ff3170     lea.l      $ff3170.l, a0
01497C: 2010             move.l     (a0), d0
01497E: 028000000f00     andi.l     #$f00, d0
014984: e940             asl.w      #$4, d0
014986: 02500fff         andi.w     #$fff, (a0)
01498A: 8150             or.w       d0, (a0)
01498C: 41e80004         lea.l      $4(a0), a0
014990: 51caffea         dbra       d2, $1497c
014994: 41f900ff3170     lea.l      $ff3170.l, a0
01499A: 7e11             moveq      #$11, d7
01499C: 7400             moveq      #$0, d2
01499E: 2018             move.l     (a0)+, d0
0149A0: b480             cmp.l      d0, d2
0149A2: 62000004         bhi.w      $149a8
0149A6: 2400             move.l     d0, d2
0149A8: 51cffff4         dbra       d7, $1499e
0149AC: 0282000000ff     andi.l     #$ff, d2
0149B2: 41fa020c         lea.l      $14bc0(pc), a0
0149B6: 13f0200000ff3216 move.b     (a0, d2.w), $ff3216.l
0149BE: 13f0200100ff3217 move.b     $1(a0, d2.w), $ff3217.l
0149C6: 33fc001400ff3210 move.w     #$14, $ff3210.l
0149CE: 0c2e00070101     cmpi.b     #$7, $101(a6)
0149D4: 6700020e         beq.w      $14be4
0149D8: 4e75             rts        

; ==== sub_0149DA ТАБЛИЦА зовут=0 ====
0149DA: 4a6e00f2         tst.w      $f2(a6)
0149DE: 6700000c         beq.w      $149ec
0149E2: 423900ff3217     clr.b      $ff3217.l
0149E8: 60000036         bra.w      $14a20
0149EC: 4a3900ff3217     tst.b      $ff3217.l
0149F2: 6600002c         bne.w      $14a20
0149F6: 4eb9000138d2     jsr        $138d2.l
0149FC: 0c400003         cmpi.w     #$3, d0
014A00: 6700001e         beq.w      $14a20
014A04: 4eb900000368     jsr        $368.l
014A0A: 303900ffef90     move.w     $ffef90.l, d0
014A10: 02400001         andi.w     #$1, d0
014A14: 6700000a         beq.w      $14a20
014A18: 13fc000300ff3217 move.b     #$3, $ff3217.l
014A20: 33fc001800ff3210 move.w     #$18, $ff3210.l
014A28: 4eb9000138d2     jsr        $138d2.l
014A2E: e540             asl.w      #$2, d0
014A30: 41fa0008         lea.l      $14a3a(pc), a0
014A34: 20700000         movea.l    (a0, d0.w), a0
014A38: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $014A3A..$014A66 (44 байт) ----


; ==== sub_014A66 ТАБЛИЦА зовут=0 ====
014A66: 002e00400041     ori.b      #$40, $41(a6)
014A6C: 4e75             rts        

; ==== sub_014A6E ТАБЛИЦА зовут=0 ====
014A6E: 0c6e0003007e     cmpi.w     #$3, $7e(a6)
014A74: 6cf0             bge.b      $14a66
014A76: 0c6e0014005a     cmpi.w     #$14, $5a(a6)
014A7C: 6ce8             bge.b      $14a66
014A7E: 4e75             rts        

; ==== sub_014A80 ТАБЛИЦА зовут=0 ====
014A80: 0c6e0004007e     cmpi.w     #$4, $7e(a6)
014A86: 6cde             bge.b      $14a66
014A88: 0c6e0014005a     cmpi.w     #$14, $5a(a6)
014A8E: 6cd6             bge.b      $14a66
014A90: 4e75             rts        

; ==== sub_014A92 ТАБЛИЦА зовут=0 ====
014A92: 4a2e00cd         tst.b      $cd(a6)
014A96: 67000008         beq.w      $14aa0
014A9A: 532e00cd         subq.b     #$1, $cd(a6)
014A9E: 67c6             beq.b      $14a66
014AA0: 4e75             rts        

; ==== sub_014AA2 ТАБЛИЦА зовут=0 ====
014AA2: 0c6e0005007e     cmpi.w     #$5, $7e(a6)
014AA8: 6cbc             bge.b      $14a66
014AAA: 0c6e001e005a     cmpi.w     #$1e, $5a(a6)
014AB0: 6cb4             bge.b      $14a66
014AB2: 4e75             rts        

; ==== sub_014AB4 ТАБЛИЦА зовут=0 ====
014AB4: 0c6e0014005a     cmpi.w     #$14, $5a(a6)
014ABA: 6caa             bge.b      $14a66
014ABC: 0c6e0005007e     cmpi.w     #$5, $7e(a6)
014AC2: 6ca2             bge.b      $14a66
014AC4: 0c79000800ff107e cmpi.w     #$8, $ff107e.l
014ACC: 6c98             bge.b      $14a66
014ACE: 4e75             rts        

; ==== sub_014AD0 ТАБЛИЦА зовут=0 ====
014AD0: 207900ff1406     movea.l    $ff1406.l, a0
014AD6: 41e80030         lea.l      $30(a0), a0
014ADA: 2018             move.l     (a0)+, d0
014ADC: 2018             move.l     (a0)+, d0
014ADE: 2010             move.l     (a0), d0
014AE0: 6684             bne.b      $14a66
014AE2: 207900ff1006     movea.l    $ff1006.l, a0
014AE8: 41e80030         lea.l      $30(a0), a0
014AEC: 2018             move.l     (a0)+, d0
014AEE: 2018             move.l     (a0)+, d0
014AF0: 2010             move.l     (a0), d0
014AF2: 6600ff72         bne.w      $14a66
014AF6: 0c79000400ff104c cmpi.w     #$4, $ff104c.l
014AFE: 66000070         bne.w      $14b70
014B02: 103900ff1101     move.b     $ff1101.l, d0
014B08: b03900ff1121     cmp.b      $ff1121.l, d0
014B0E: 6600000c         bne.w      $14b1c
014B12: b03900ff1141     cmp.b      $ff1141.l, d0
014B18: 6700ff4c         beq.w      $14a66
014B1C: 0c79000400ff104c cmpi.w     #$4, $ff104c.l
014B24: 6600004a         bne.w      $14b70
014B28: 0c39000700ff1101 cmpi.b     #$7, $ff1101.l
014B30: 6c00ff34         bge.w      $14a66
014B34: 0c39000700ff1121 cmpi.b     #$7, $ff1121.l
014B3C: 6c00ff28         bge.w      $14a66
014B40: 0c39000700ff1141 cmpi.b     #$7, $ff1141.l
014B48: 6c00ff1c         bge.w      $14a66
014B4C: 0839000600ff1100 btst.b     #$6, $ff1100.l
014B54: 6600ff10         bne.w      $14a66
014B58: 0839000600ff1120 btst.b     #$6, $ff1120.l
014B60: 6600ff04         bne.w      $14a66
014B64: 0839000600ff1140 btst.b     #$6, $ff1140.l
014B6C: 6600fef8         bne.w      $14a66
014B70: 0c6e0014005a     cmpi.w     #$14, $5a(a6)
014B76: 6c00feee         bge.w      $14a66
014B7A: 0c6e0005007e     cmpi.w     #$5, $7e(a6)
014B80: 6c00fee4         bge.w      $14a66
014B84: 0c79000800ff107e cmpi.w     #$8, $ff107e.l
014B8C: 6c00fed8         bge.w      $14a66
014B90: 4e75             rts        

; ==== sub_014B92 зовут=4 ====
014B92: 7e11             moveq      #$11, d7
014B94: 7400             moveq      #$0, d2
014B96: 2010             move.l     (a0), d0
014B98: c081             and.l      d1, d0
014B9A: 67000006         beq.w      $14ba2
014B9E: 22d0             move.l     (a0), (a1)+
014BA0: 5242             addq.w     #$1, d2
014BA2: 41e80004         lea.l      $4(a0), a0
014BA6: 51cfffee         dbra       d7, $14b96
014BAA: 4e75             rts        

; ==== sub_014BAC зовут=4 ====
014BAC: 7e11             moveq      #$11, d7
014BAE: 4298             clr.l      (a0)+
014BB0: 51cffffc         dbra       d7, $14bae
014BB4: 4e75             rts        

; ==== sub_014BB6 зовут=1 ====
014BB6: 7e11             moveq      #$11, d7
014BB8: 22d8             move.l     (a0)+, (a1)+
014BBA: 51cffffc         dbra       d7, $14bb8
014BBE: 4e75             rts        

; ---- ДАННЫЕ $014BC0..$014BE4 (36 байт) ----

014BE4: 4eb9000138d2     jsr        $138d2.l
014BEA: e540             asl.w      #$2, d0
014BEC: 41fa0008         lea.l      $14bf6(pc), a0
014BF0: 20700000         movea.l    (a0, d0.w), a0
014BF4: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $014BF6..$014C22 (44 байт) ----


; ==== sub_014C22 ТАБЛИЦА зовут=0 ====
014C22: 423900ff3217     clr.b      $ff3217.l
014C28: 4e75             rts        

; ==== sub_014C2A ТАБЛИЦА зовут=0 ====
014C2A: 13fc000200ff3217 move.b     #$2, $ff3217.l
014C32: 4e75             rts        

; ==== sub_014C34 ТАБЛИЦА зовут=0 ====
014C34: 0c6e0004007e     cmpi.w     #$4, $7e(a6)
014C3A: 6ce6             bge.b      $14c22
014C3C: 6000002c         bra.w      $14c6a

; ==== sub_014C40 ТАБЛИЦА зовут=0 ====
014C40: 0c6e0004007e     cmpi.w     #$4, $7e(a6)
014C46: 6cda             bge.b      $14c22
014C48: 206e0006         movea.l    $6(a6), a0
014C4C: 41e80030         lea.l      $30(a0), a0
014C50: 2018             move.l     (a0)+, d0
014C52: 8098             or.l       (a0)+, d0
014C54: 8098             or.l       (a0)+, d0
014C56: 67d2             beq.b      $14c2a
014C58: 207900ff1006     movea.l    $ff1006.l, a0
014C5E: 41e80030         lea.l      $30(a0), a0
014C62: 2018             move.l     (a0)+, d0
014C64: 2018             move.l     (a0)+, d0
014C66: 2010             move.l     (a0), d0
014C68: 66c0             bne.b      $14c2a
014C6A: 13fc000100ff3217 move.b     #$1, $ff3217.l
014C72: 41f900ff3170     lea.l      $ff3170.l, a0
014C78: 6100ff32         bsr.w      $14bac
014C7C: 41f900ff31c0     lea.l      $ff31c0.l, a0
014C82: 6100ff28         bsr.w      $14bac
014C86: 41ee0260         lea.l      $260(a6), a0
014C8A: 43f900ff3170     lea.l      $ff3170.l, a1
014C90: 7e0c             moveq      #$c, d7
014C92: 7005             moveq      #$5, d0
014C94: 12280001         move.b     $1(a0), d1
014C98: 024100ff         andi.w     #$ff, d1
014C9C: 0c410006         cmpi.w     #$6, d1
014CA0: 6e000006         bgt.w      $14ca8
014CA4: 52311000         addq.b     #$1, (a1, d1.w)
014CA8: 41e80002         lea.l      $2(a0), a0
014CAC: 51c8ffe6         dbra       d0, $14c94
014CB0: 41e80004         lea.l      $4(a0), a0
014CB4: 51cfffdc         dbra       d7, $14c92
014CB8: 41ee0260         lea.l      $260(a6), a0
014CBC: 43f900ff3178     lea.l      $ff3178.l, a1
014CC2: 7e05             moveq      #$5, d7
014CC4: 7200             moveq      #$0, d1
014CC6: 4a58             tst.w      (a0)+
014CC8: 66000004         bne.w      $14cce
014CCC: 7201             moveq      #$1, d1
014CCE: 12c1             move.b     d1, (a1)+
014CD0: 51cffff2         dbra       d7, $14cc4
014CD4: 41f900ff3178     lea.l      $ff3178.l, a0
014CDA: 47f900ff31c0     lea.l      $ff31c0.l, a3
014CE0: 7e05             moveq      #$5, d7
014CE2: 7c00             moveq      #$0, d6
014CE4: 7a00             moveq      #$0, d5
014CE6: 1010             move.b     (a0), d0
014CE8: 67000034         beq.w      $14d1e
014CEC: 43ee0260         lea.l      $260(a6), a1
014CF0: 32316000         move.w     (a1, d6.w), d1
014CF4: 66000008         bne.w      $14cfe
014CF8: 43e90010         lea.l      $10(a1), a1
014CFC: 60f2             bra.b      $14cf0
014CFE: 024100ff         andi.w     #$ff, d1
014D02: 0c410006         cmpi.w     #$6, d1
014D06: 6e000016         bgt.w      $14d1e
014D0A: 45f900ff3170     lea.l      $ff3170.l, a2
014D10: 12321000         move.b     (a2, d1.w), d1
014D14: e941             asl.w      #$4, d1
014D16: 8245             or.w       d5, d1
014D18: 36c1             move.w     d1, (a3)+
014D1A: 60000004         bra.w      $14d20
014D1E: 425b             clr.w      (a3)+
014D20: 5446             addq.w     #$2, d6
014D22: 5245             addq.w     #$1, d5
014D24: 51cfffc0         dbra       d7, $14ce6
014D28: 41f900ff31c0     lea.l      $ff31c0.l, a0
014D2E: 7e05             moveq      #$5, d7
014D30: 7200             moveq      #$0, d1
014D32: 3018             move.w     (a0)+, d0
014D34: b240             cmp.w      d0, d1
014D36: 6c000004         bge.w      $14d3c
014D3A: c141             exg.l      d0, d1
014D3C: 51cffff4         dbra       d7, $14d32
014D40: 0201000f         andi.b     #$f, d1
014D44: 13c100ff3216     move.b     d1, $ff3216.l
014D4A: 4e75             rts        

; ==== sub_014D4C зовут=1 ====
014D4C: 6100051e         bsr.w      $1526c
014D50: 610004d8         bsr.w      $1522a
014D54: 60000002         bra.w      $14d58
014D58: 61000318         bsr.w      $15072
014D5C: 61000256         bsr.w      $14fb4
014D60: 610000fe         bsr.w      $14e60
014D64: 61000004         bsr.w      $14d6a
014D68: 4e75             rts        

; ==== sub_014D6A зовут=1 ====
014D6A: 303900ff3214     move.w     $ff3214.l, d0
014D70: 0c400020         cmpi.w     #$20, d0
014D74: 66000004         bne.w      $14d7a
014D78: 4e75             rts        
014D7A: 3f00             move.w     d0, -(a7)
014D7C: 3e3900ff321c     move.w     $ff321c.l, d7
014D82: 61000048         bsr.w      $14dcc
014D86: 0479001000ff3214 subi.w     #$10, $ff3214.l
014D8E: 0c79002000ff3214 cmpi.w     #$20, $ff3214.l
014D96: 6700002a         beq.w      $14dc2
014D9A: 3e3900ff321a     move.w     $ff321a.l, d7
014DA0: 6100002a         bsr.w      $14dcc
014DA4: 0479001000ff3214 subi.w     #$10, $ff3214.l
014DAC: 0c79002000ff3214 cmpi.w     #$20, $ff3214.l
014DB4: 6700000c         beq.w      $14dc2
014DB8: 3e3900ff3218     move.w     $ff3218.l, d7
014DBE: 6100000c         bsr.w      $14dcc
014DC2: 301f             move.w     (a7)+, d0
014DC4: 33c000ff3214     move.w     d0, $ff3214.l
014DCA: 4e75             rts        

; ==== sub_014DCC зовут=3 ====
014DCC: 303900ff3214     move.w     $ff3214.l, d0
014DD2: 323900ff3212     move.w     $ff3212.l, d1
014DD8: 0c4000f0         cmpi.w     #$f0, d0
014DDC: 67000010         beq.w      $14dee
014DE0: 4a41             tst.w      d1
014DE2: 6700000a         beq.w      $14dee
014DE6: 06400010         addi.w     #$10, d0
014DEA: 5541             subq.w     #$2, d1
014DEC: 60ea             bra.b      $14dd8
014DEE: 7400             moveq      #$0, d2
014DF0: d441             add.w      d1, d2
014DF2: 43f900ff0e30     lea.l      $ff0e30.l, a1
014DF8: d3c2             adda.l     d2, a1
014DFA: 23fcffffffff00ff3282 move.l     #$ffffffff, $ff3282.l
014E04: 23fcffffffff00ff3286 move.l     #$ffffffff, $ff3286.l
014E0E: 7405             moveq      #$5, d2
014E10: 45f900ff3282     lea.l      $ff3282.l, a2
014E16: 7600             moveq      #$0, d3
014E18: 38310000         move.w     (a1, d0.w), d4
014E1C: 6700002c         beq.w      $14e4a
014E20: 0c0400ff         cmpi.b     #$ff, d4
014E24: 6700012c         beq.w      $14f52
014E28: 363c00ff         move.w     #$ff, d3
014E2C: be04             cmp.b      d4, d7
014E2E: 6600001a         bne.w      $14e4a
014E32: 363c0001         move.w     #$1, d3
014E36: 4a3900ff3234     tst.b      $ff3234.l
014E3C: 6700000c         beq.w      $14e4a
014E40: 0804000e         btst.b     #$e, d4
014E44: 67000004         beq.w      $14e4a
014E48: 7602             moveq      #$2, d3
014E4A: 14c3             move.b     d3, (a2)+
014E4C: 43e90002         lea.l      $2(a1), a1
014E50: 04400010         subi.w     #$10, d0
014E54: 6b0000fc         bmi.w      $14f52
014E58: 51caffbc         dbra       d2, $14e16
014E5C: 600000f4         bra.w      $14f52

; ==== sub_014E60 зовут=1 ====
014E60: 303900ff3214     move.w     $ff3214.l, d0
014E66: 0c400020         cmpi.w     #$20, d0
014E6A: 66000004         bne.w      $14e70
014E6E: 4e75             rts        
014E70: 3f00             move.w     d0, -(a7)
014E72: 3e3900ff321c     move.w     $ff321c.l, d7
014E78: 61000048         bsr.w      $14ec2
014E7C: 0479001000ff3214 subi.w     #$10, $ff3214.l
014E84: 0c79002000ff3214 cmpi.w     #$20, $ff3214.l
014E8C: 6700002a         beq.w      $14eb8
014E90: 3e3900ff321a     move.w     $ff321a.l, d7
014E96: 6100002a         bsr.w      $14ec2
014E9A: 0479001000ff3214 subi.w     #$10, $ff3214.l
014EA2: 0c79002000ff3214 cmpi.w     #$20, $ff3214.l
014EAA: 6700000c         beq.w      $14eb8
014EAE: 3e3900ff3218     move.w     $ff3218.l, d7
014EB4: 6100000c         bsr.w      $14ec2
014EB8: 301f             move.w     (a7)+, d0
014EBA: 33c000ff3214     move.w     d0, $ff3214.l
014EC0: 4e75             rts        

; ==== sub_014EC2 зовут=3 ====
014EC2: 303900ff3214     move.w     $ff3214.l, d0
014EC8: 323900ff3212     move.w     $ff3212.l, d1
014ECE: 0c400030         cmpi.w     #$30, d0
014ED2: 67000010         beq.w      $14ee4
014ED6: 4a41             tst.w      d1
014ED8: 6700000a         beq.w      $14ee4
014EDC: 04400010         subi.w     #$10, d0
014EE0: 5541             subq.w     #$2, d1
014EE2: 60ea             bra.b      $14ece
014EE4: 7400             moveq      #$0, d2
014EE6: d440             add.w      d0, d2
014EE8: 43f900ff0e30     lea.l      $ff0e30.l, a1
014EEE: d3c2             adda.l     d2, a1
014EF0: 23fcffffffff00ff3282 move.l     #$ffffffff, $ff3282.l
014EFA: 23fcffffffff00ff3286 move.l     #$ffffffff, $ff3286.l
014F04: 7405             moveq      #$5, d2
014F06: 45f900ff3282     lea.l      $ff3282.l, a2
014F0C: 7600             moveq      #$0, d3
014F0E: 38311000         move.w     (a1, d1.w), d4
014F12: 6700002a         beq.w      $14f3e
014F16: 0c0400ff         cmpi.b     #$ff, d4
014F1A: 67000036         beq.w      $14f52
014F1E: 363c00ff         move.w     #$ff, d3
014F22: be04             cmp.b      d4, d7
014F24: 66000018         bne.w      $14f3e
014F28: 7601             moveq      #$1, d3
014F2A: 4a3900ff3234     tst.b      $ff3234.l
014F30: 6700000c         beq.w      $14f3e
014F34: 0804000e         btst.b     #$e, d4
014F38: 67000004         beq.w      $14f3e
014F3C: 7602             moveq      #$2, d3
014F3E: 14c3             move.b     d3, (a2)+
014F40: 43e90010         lea.l      $10(a1), a1
014F44: 5441             addq.w     #$2, d1
014F46: 0c41000c         cmpi.w     #$c, d1
014F4A: 67000006         beq.w      $14f52
014F4E: 51caffbc         dbra       d2, $14f0c
014F52: 7000             moveq      #$0, d0
014F54: 7205             moveq      #$5, d1
014F56: 43f900ff3282     lea.l      $ff3282.l, a1
014F5C: 7c00             moveq      #$0, d6
014F5E: 1419             move.b     (a1)+, d2
014F60: 0c020001         cmpi.b     #$1, d2
014F64: 6700000c         beq.w      $14f72
014F68: 0c020002         cmpi.b     #$2, d2
014F6C: 6600000a         bne.w      $14f78
014F70: 7c01             moveq      #$1, d6
014F72: 5240             addq.w     #$1, d0
014F74: 6000000e         bra.w      $14f84
014F78: 0c000003         cmpi.b     #$3, d0
014F7C: 6c000012         bge.w      $14f90
014F80: 7000             moveq      #$0, d0
014F82: 7c00             moveq      #$0, d6
014F84: 51c9ffd8         dbra       d1, $14f5e
014F88: 0c000003         cmpi.b     #$3, d0
014F8C: 6d00001c         blt.w      $14faa
014F90: 43f90000e364     lea.l      $e364.l, a1
014F96: 10310000         move.b     (a1, d0.w), d0
014F9A: 5440             addq.w     #$2, d0
014F9C: e940             asl.w      #$4, d0
014F9E: d150             add.w      d0, (a0)
014FA0: 4a46             tst.w      d6
014FA2: 67000006         beq.w      $14faa
014FA6: 00100040         ori.b      #$40, (a0)
014FAA: 243c00003000     move.l     #$3000, d2
014FB0: 600001b0         bra.w      $15162

; ==== sub_014FB4 зовут=1 ====
014FB4: 3e3900ff3218     move.w     $ff3218.l, d7
014FBA: 303900ff3214     move.w     $ff3214.l, d0
014FC0: 7000             moveq      #$0, d0
014FC2: 303900ff3214     move.w     $ff3214.l, d0
014FC8: d07900ff3212     add.w      $ff3212.l, d0
014FCE: 43f900ff0e10     lea.l      $ff0e10.l, a1
014FD4: d3c0             adda.l     d0, a1
014FD6: 45e90010         lea.l      $10(a1), a2
014FDA: 7402             moveq      #$2, d2
014FDC: 7001             moveq      #$1, d0
014FDE: 12290001         move.b     $1(a1), d1
014FE2: 7c00             moveq      #$0, d6
014FE4: b22a0001         cmp.b      $1(a2), d1
014FE8: 66000022         bne.w      $1500c
014FEC: 4a3900ff3234     tst.b      $ff3234.l
014FF2: 67000010         beq.w      $15004
014FF6: 1611             move.b     (a1), d3
014FF8: 8612             or.b       (a2), d3
014FFA: 08030006         btst.b     #$6, d3
014FFE: 67000004         beq.w      $15004
015002: 7c01             moveq      #$1, d6
015004: 5240             addq.w     #$1, d0
015006: 45ea0010         lea.l      $10(a2), a2
01500A: 60d8             bra.b      $14fe4
01500C: 0c400003         cmpi.w     #$3, d0
015010: 6c000014         bge.w      $15026
015014: 7c00             moveq      #$0, d6
015016: 43e90010         lea.l      $10(a1), a1
01501A: 45e90010         lea.l      $10(a1), a2
01501E: 51caffbc         dbra       d2, $14fdc
015022: 6000001a         bra.w      $1503e
015026: 43f90000e364     lea.l      $e364.l, a1
01502C: 10310000         move.b     (a1, d0.w), d0
015030: e940             asl.w      #$4, d0
015032: d150             add.w      d0, (a0)
015034: 4a46             tst.w      d6
015036: 67000006         beq.w      $1503e
01503A: 00100040         ori.b      #$40, (a0)
01503E: 303900ff3218     move.w     $ff3218.l, d0
015044: 323900ff321a     move.w     $ff321a.l, d1
01504A: b200             cmp.b      d0, d1
01504C: 66000022         bne.w      $15070
015050: 243c00001000     move.l     #$1000, d2
015056: d590             add.l      d2, (a0)
015058: 4a3900ff3234     tst.b      $ff3234.l
01505E: 67000010         beq.w      $15070
015062: 8041             or.w       d1, d0
015064: 0800000e         btst.b     #$e, d0
015068: 67000006         beq.w      $15070
01506C: 00100020         ori.b      #$20, (a0)
015070: 4e75             rts        

; ==== sub_015072 зовут=1 ====
015072: 303900ff3214     move.w     $ff3214.l, d0
015078: 3f00             move.w     d0, -(a7)
01507A: 3e3900ff321c     move.w     $ff321c.l, d7
015080: 61000030         bsr.w      $150b2
015084: 0479001000ff3214 subi.w     #$10, $ff3214.l
01508C: 3e3900ff321a     move.w     $ff321a.l, d7
015092: 6100001e         bsr.w      $150b2
015096: 0479001000ff3214 subi.w     #$10, $ff3214.l
01509E: 3e3900ff3218     move.w     $ff3218.l, d7
0150A4: 6100000c         bsr.w      $150b2
0150A8: 301f             move.w     (a7)+, d0
0150AA: 33c000ff3214     move.w     d0, $ff3214.l
0150B0: 4e75             rts        

; ==== sub_0150B2 зовут=3 ====
0150B2: 7000             moveq      #$0, d0
0150B4: 303900ff3214     move.w     $ff3214.l, d0
0150BA: 43f900ff0e30     lea.l      $ff0e30.l, a1
0150C0: d3c0             adda.l     d0, a1
0150C2: 33fcffff00ff3288 move.w     #$ffff, $ff3288.l
0150CA: 7005             moveq      #$5, d0
0150CC: 45f900ff3282     lea.l      $ff3282.l, a2
0150D2: 7400             moveq      #$0, d2
0150D4: 3219             move.w     (a1)+, d1
0150D6: 67000022         beq.w      $150fa
0150DA: 343c00ff         move.w     #$ff, d2
0150DE: be01             cmp.b      d1, d7
0150E0: 66000018         bne.w      $150fa
0150E4: 7401             moveq      #$1, d2
0150E6: 4a3900ff3234     tst.b      $ff3234.l
0150EC: 6700000c         beq.w      $150fa
0150F0: 0801000e         btst.b     #$e, d1
0150F4: 67000004         beq.w      $150fa
0150F8: 7402             moveq      #$2, d2
0150FA: 14c2             move.b     d2, (a2)+
0150FC: 51c8ffd4         dbra       d0, $150d2
015100: 7000             moveq      #$0, d0
015102: 7205             moveq      #$5, d1
015104: 43f900ff3282     lea.l      $ff3282.l, a1
01510A: 7c00             moveq      #$0, d6
01510C: 1419             move.b     (a1)+, d2
01510E: 0c020001         cmpi.b     #$1, d2
015112: 6700000c         beq.w      $15120
015116: 0c020002         cmpi.b     #$2, d2
01511A: 6600000a         bne.w      $15126
01511E: 7c01             moveq      #$1, d6
015120: 5240             addq.w     #$1, d0
015122: 6000000e         bra.w      $15132
015126: 0c000003         cmpi.b     #$3, d0
01512A: 6c000012         bge.w      $1513e
01512E: 7000             moveq      #$0, d0
015130: 7c00             moveq      #$0, d6
015132: 51c9ffd8         dbra       d1, $1510c
015136: 0c000003         cmpi.b     #$3, d0
01513A: 6d00001c         blt.w      $15158
01513E: 43f90000e364     lea.l      $e364.l, a1
015144: 10310000         move.b     (a1, d0.w), d0
015148: 5240             addq.w     #$1, d0
01514A: e940             asl.w      #$4, d0
01514C: d150             add.w      d0, (a0)
01514E: 4a46             tst.w      d6
015150: 67000006         beq.w      $15158
015154: 00100040         ori.b      #$40, (a0)
015158: 243c00002000     move.l     #$2000, d2
01515E: 60000002         bra.w      $15162
015162: 203900ff3282     move.l     $ff3282.l, d0
015168: e088             lsr.l      #$8, d0
01516A: 61000058         bsr.w      $151c4
01516E: 4a40             tst.w      d0
015170: 66000042         bne.w      $151b4
015174: 203900ff3282     move.l     $ff3282.l, d0
01517A: 028000ffffff     andi.l     #$ffffff, d0
015180: 61000042         bsr.w      $151c4
015184: 4a40             tst.w      d0
015186: 6600002c         bne.w      $151b4
01518A: 203900ff3284     move.l     $ff3284.l, d0
015190: e088             lsr.l      #$8, d0
015192: 61000030         bsr.w      $151c4
015196: 4a40             tst.w      d0
015198: 6600001a         bne.w      $151b4
01519C: 203900ff3284     move.l     $ff3284.l, d0
0151A2: 028000ffffff     andi.l     #$ffffff, d0
0151A8: 6100001a         bsr.w      $151c4
0151AC: 4a40             tst.w      d0
0151AE: 66000004         bne.w      $151b4
0151B2: 4e75             rts        
0151B4: 0c400001         cmpi.w     #$1, d0
0151B8: 67000006         beq.w      $151c0
0151BC: 00100020         ori.b      #$20, (a0)
0151C0: d590             add.l      d2, (a0)
0151C2: 4e75             rts        

; ==== sub_0151C4 зовут=4 ====
0151C4: 0c8000010100     cmpi.l     #$10100, d0
0151CA: 6700005a         beq.w      $15226
0151CE: 0c8000010001     cmpi.l     #$10001, d0
0151D4: 67000050         beq.w      $15226
0151D8: 0c8000000101     cmpi.l     #$101, d0
0151DE: 67000046         beq.w      $15226
0151E2: 0c8000020100     cmpi.l     #$20100, d0
0151E8: 67000038         beq.w      $15222
0151EC: 0c8000010200     cmpi.l     #$10200, d0
0151F2: 6700002e         beq.w      $15222
0151F6: 0c8000020001     cmpi.l     #$20001, d0
0151FC: 67000024         beq.w      $15222
015200: 0c8000010002     cmpi.l     #$10002, d0
015206: 6700001a         beq.w      $15222
01520A: 0c8000000201     cmpi.l     #$201, d0
015210: 67000010         beq.w      $15222
015214: 0c8000000102     cmpi.l     #$102, d0
01521A: 67000006         beq.w      $15222
01521E: 7000             moveq      #$0, d0
015220: 4e75             rts        
015222: 7002             moveq      #$2, d0
015224: 4e75             rts        
015226: 7001             moveq      #$1, d0
015228: 4e75             rts        

; ==== sub_01522A зовут=1 ====
01522A: 43ee0230         lea.l      $230(a6), a1
01522E: 45f900ff0e30     lea.l      $ff0e30.l, a2
015234: 303c0043         move.w     #$43, d0
015238: 24d9             move.l     (a1)+, (a2)+
01523A: 51c8fffc         dbra       d0, $15238
01523E: 45f900ff0e30     lea.l      $ff0e30.l, a2
015244: 7000             moveq      #$0, d0
015246: 303900ff3212     move.w     $ff3212.l, d0
01524C: d07900ff3214     add.w      $ff3214.l, d0
015252: 35b900ff321c0000 move.w     $ff321c.l, (a2, d0.w)
01525A: 35b900ff321a00f0 move.w     $ff321a.l, -$10(a2, d0.w)
015262: 35b900ff321800e0 move.w     $ff3218.l, -$20(a2, d0.w)
01526A: 4e75             rts        

; ==== sub_01526C зовут=1 ====
01526C: 7000             moveq      #$0, d0
01526E: 303900ff3212     move.w     $ff3212.l, d0
015274: 7200             moveq      #$0, d1
015276: 7400             moveq      #$0, d2
015278: 43ee0230         lea.l      $230(a6), a1
01527C: d3c0             adda.l     d0, a1
01527E: 4a690010         tst.w      $10(a1)
015282: 66000010         bne.w      $15294
015286: 06410010         addi.w     #$10, d1
01528A: 06420100         addi.w     #$100, d2
01528E: 43e90010         lea.l      $10(a1), a1
015292: 60ea             bra.b      $1527e
015294: 33c100ff3214     move.w     d1, $ff3214.l
01529A: 8590             or.l       d2, (a0)
01529C: 343900ff3212     move.w     $ff3212.l, d2
0152A2: 246e0006         movea.l    $6(a6), a2
0152A6: 45ea0030         lea.l      $30(a2), a2
0152AA: 4a722000         tst.w      (a2, d2.w)
0152AE: 67000004         beq.w      $152b4
0152B2: 4e75             rts        
0152B4: 00100080         ori.b      #$80, (a0)
0152B8: 4e75             rts        

; ==== sub_0152BA зовут=1 ====
0152BA: 33ee010000ff3218 move.w     $100(a6), $ff3218.l
0152C2: 33ee012000ff321a move.w     $120(a6), $ff321a.l
0152CA: 33ee014000ff321c move.w     $140(a6), $ff321c.l
0152D2: 7207             moveq      #$7, d1
0152D4: 41f900ff302e     lea.l      $ff302e.l, a0
0152DA: 103900ff3219     move.b     $ff3219.l, d0
0152E0: 4a300000         tst.b      (a0, d0.w)
0152E4: 67000008         beq.w      $152ee
0152E8: 13c100ff3219     move.b     d1, $ff3219.l
0152EE: 103900ff321b     move.b     $ff321b.l, d0
0152F4: 4a300000         tst.b      (a0, d0.w)
0152F8: 67000008         beq.w      $15302
0152FC: 13c100ff321b     move.b     d1, $ff321b.l
015302: 103900ff321d     move.b     $ff321d.l, d0
015308: 4a300000         tst.b      (a0, d0.w)
01530C: 67000008         beq.w      $15316
015310: 13c100ff321d     move.b     d1, $ff321d.l
015316: 4e75             rts        

; ==== sub_015318 зовут=1 ====
015318: 33ee014000ff3218 move.w     $140(a6), $ff3218.l
015320: 33ee010000ff321a move.w     $100(a6), $ff321a.l
015328: 33ee012000ff321c move.w     $120(a6), $ff321c.l
015330: 60a0             bra.b      $152d2

; ==== sub_015332 зовут=1 ====
015332: 33ee012000ff3218 move.w     $120(a6), $ff3218.l
01533A: 33ee014000ff321a move.w     $140(a6), $ff321a.l
015342: 33ee010000ff321c move.w     $100(a6), $ff321c.l
01534A: 6086             bra.b      $152d2

; ---- ДАННЫЕ $01534C..$01534E (2 байт) ----


; ==== sub_01534E зовут=1 ====
01534E: 4eb9000138d2     jsr        $138d2.l
015354: e540             asl.w      #$2, d0
015356: 41fa0008         lea.l      $15360(pc), a0
01535A: 20700000         movea.l    (a0, d0.w), a0
01535E: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $015360..$0153C2 (98 байт) ----


; ==== sub_0153C2 зовут=1 ====
0153C2: 4eb9000138d2     jsr        $138d2.l
0153C8: 0c400004         cmpi.w     #$4, d0
0153CC: 6700000c         beq.w      $153da
0153D0: 0c400006         cmpi.w     #$6, d0
0153D4: 67000034         beq.w      $1540a
0153D8: 4e75             rts        
0153DA: 4a7900ff3048     tst.w      $ff3048.l
0153E0: 67000026         beq.w      $15408
0153E4: 537900ff3048     subq.w     #$1, $ff3048.l
0153EA: 6600001c         bne.w      $15408
0153EE: 41f900ffe200     lea.l      $ffe200.l, a0
0153F4: 43f900ff3230     lea.l      $ff3230.l, a1
0153FA: 7013             moveq      #$13, d0
0153FC: e940             asl.w      #$4, d0
0153FE: d1c0             adda.l     d0, a0
015400: 7003             moveq      #$3, d0
015402: 22d8             move.l     (a0)+, (a1)+
015404: 51c8fffc         dbra       d0, $15402
015408: 4e75             rts        
01540A: 4a7900ff304a     tst.w      $ff304a.l
015410: 6700000a         beq.w      $1541c
015414: 537900ff304a     subq.w     #$1, $ff304a.l
01541A: 66ec             bne.b      $15408
01541C: 41f900ffe200     lea.l      $ffe200.l, a0
015422: 43f900ff3230     lea.l      $ff3230.l, a1
015428: 700d             moveq      #$d, d0
01542A: e940             asl.w      #$4, d0
01542C: d1c0             adda.l     d0, a0
01542E: 7003             moveq      #$3, d0
015430: 22d8             move.l     (a0)+, (a1)+
015432: 51c8fffc         dbra       d0, $15430
015436: 4e75             rts        
015438: 33f900ff302c00ff302a move.w     $ff302c.l, $ff302a.l
015442: 33f900ff304000ff302c move.w     $ff3040.l, $ff302c.l
01544C: 303900ff3040     move.w     $ff3040.l, d0
015452: e448             lsr.w      #$2, d0
015454: 7200             moveq      #$0, d1
015456: 123900ff3300     move.b     $ff3300.l, d1
01545C: 41f900ff3310     lea.l      $ff3310.l, a0
015462: 11801000         move.b     d0, (a0, d1.w)
015466: 523900ff3300     addq.b     #$1, $ff3300.l
01546C: 33fc001400ff3210 move.w     #$14, $ff3210.l
015474: 303900ff3040     move.w     $ff3040.l, d0
01547A: 41fa0008         lea.l      $15484(pc), a0
01547E: 20700000         movea.l    (a0, d0.w), a0
015482: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $015484..$015510 (140 байт) ----


; ==== sub_015510 ТАБЛИЦА зовут=0 ====
015510: 61001f60         bsr.w      $17472
015514: 41f900ff301b     lea.l      $ff301b.l, a0
01551A: 7e05             moveq      #$5, d7
01551C: 7c01             moveq      #$1, d6
01551E: 1018             move.b     (a0)+, d0
015520: 0c000003         cmpi.b     #$3, d0
015524: 67000014         beq.w      $1553a
015528: 0c000002         cmpi.b     #$2, d0
01552C: 6700001c         beq.w      $1554a
015530: 5246             addq.w     #$1, d6
015532: 51cfffea         dbra       d7, $1551e
015536: 6000025e         bra.w      $15796
01553A: 13fc000200ff3216 move.b     #$2, $ff3216.l
015542: 423900ff3217     clr.b      $ff3217.l
015548: 4e75             rts        
01554A: 13c600ff3016     move.b     d6, $ff3016.l
015550: 41f900ff301b     lea.l      $ff301b.l, a0
015556: 7c01             moveq      #$1, d6
015558: 0c180001         cmpi.b     #$1, (a0)+
01555C: 67000006         beq.w      $15564
015560: 5246             addq.w     #$1, d6
015562: 60f4             bra.b      $15558
015564: 13c600ff3017     move.b     d6, $ff3017.l
01556A: 61001f2e         bsr.w      $1749a
01556E: 41f900ff301a     lea.l      $ff301a.l, a0
015574: 7000             moveq      #$0, d0
015576: 103900ff3016     move.b     $ff3016.l, d0
01557C: 4a300000         tst.b      (a0, d0.w)
015580: 670000f2         beq.w      $15674
015584: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
01558A: 67000030         beq.w      $155bc
01558E: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015594: 6700009a         beq.w      $15630
015598: 6100005e         bsr.w      $155f8
01559C: 13fc000200ff322d move.b     #$2, $ff322d.l
0155A4: 423900ff322e     clr.b      $ff322e.l
0155AA: 33fc000800ff3040 move.w     #$8, $ff3040.l
0155B2: 33fc008800ff3028 move.w     #$88, $ff3028.l
0155BA: 4e75             rts        
0155BC: 6100003a         bsr.w      $155f8
0155C0: 423900ff322d     clr.b      $ff322d.l
0155C6: 42b900ff0500     clr.l      $ff0500.l
0155CC: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
0155D6: 243c000000ff     move.l     #$ff, d2
0155DC: 61001f6a         bsr.w      $17548
0155E0: 13c700ff322e     move.b     d7, $ff322e.l
0155E6: 33fc000800ff3040 move.w     #$8, $ff3040.l
0155EE: 33fc000c00ff3028 move.w     #$c, $ff3028.l
0155F6: 4e75             rts        

; ==== sub_0155F8 зовут=7 ====
0155F8: 423900ff3216     clr.b      $ff3216.l
0155FE: 423900ff0500     clr.b      $ff0500.l
015604: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
01560E: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015618: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015622: 74ff             moveq      #$ff, d2
015624: 61001e9c         bsr.w      $174c2
015628: 13c700ff3217     move.b     d7, $ff3217.l
01562E: 4e75             rts        
015630: 61c6             bsr.b      $155f8
015632: 423900ff322d     clr.b      $ff322d.l
015638: 427900ff0500     clr.w      $ff0500.l
01563E: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015648: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015652: 243c0000ffff     move.l     #$ffff, d2
015658: 61001eee         bsr.w      $17548
01565C: 13c700ff322e     move.b     d7, $ff322e.l
015662: 33fc000800ff3040 move.w     #$8, $ff3040.l
01566A: 33fc000c00ff3028 move.w     #$c, $ff3028.l
015672: 4e75             rts        
015674: 41f900ff301a     lea.l      $ff301a.l, a0
01567A: 7000             moveq      #$0, d0
01567C: 103900ff3017     move.b     $ff3017.l, d0
015682: 4a300000         tst.b      (a0, d0.w)
015686: 670000c8         beq.w      $15750
01568A: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015690: 67000030         beq.w      $156c2
015694: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01569A: 67000064         beq.w      $15700
01569E: 6100ff58         bsr.w      $155f8
0156A2: 13fc000200ff322d move.b     #$2, $ff322d.l
0156AA: 423900ff322e     clr.b      $ff322e.l
0156B0: 33fc000800ff3040 move.w     #$8, $ff3040.l
0156B8: 33fc008800ff3028 move.w     #$88, $ff3028.l
0156C0: 4e75             rts        
0156C2: 6100ff34         bsr.w      $155f8
0156C6: 13fc000100ff322d move.b     #$1, $ff322d.l
0156CE: 42b900ff0500     clr.l      $ff0500.l
0156D4: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
0156DE: 243c0000ff00     move.l     #$ff00, d2
0156E4: 61001e62         bsr.w      $17548
0156E8: 13c700ff322e     move.b     d7, $ff322e.l
0156EE: 33fc000800ff3040 move.w     #$8, $ff3040.l
0156F6: 33fc001c00ff3028 move.w     #$1c, $ff3028.l
0156FE: 4e75             rts        
015700: 6100fef6         bsr.w      $155f8
015704: 423900ff322d     clr.b      $ff322d.l
01570A: 42b900ff0500     clr.l      $ff0500.l
015710: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
01571A: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015724: 243c00ffff00     move.l     #$ffff00, d2
01572A: 61001e1c         bsr.w      $17548
01572E: 13c700ff322e     move.b     d7, $ff322e.l
015734: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
01573E: 33fc000800ff3040 move.w     #$8, $ff3040.l
015746: 33fc003000ff3028 move.w     #$30, $ff3028.l
01574E: 4e75             rts        
015750: 6100fea6         bsr.w      $155f8
015754: 103900ff3216     move.b     $ff3216.l, d0
01575A: 123900ff3217     move.b     $ff3217.l, d1
015760: 3f00             move.w     d0, -(a7)
015762: 3f01             move.w     d1, -(a7)
015764: 61001ef2         bsr.w      $17658
015768: 4a40             tst.w      d0
01576A: 66001cf6         bne.w      $17462
01576E: 13fc000500ff322d move.b     #$5, $ff322d.l
015776: 423900ff3217     clr.b      $ff3217.l
01577C: 321f             move.w     (a7)+, d1
01577E: 301f             move.w     (a7)+, d0
015780: 13c000ff3216     move.b     d0, $ff3216.l
015786: 13c100ff3217     move.b     d1, $ff3217.l
01578C: 33fc008800ff3040 move.w     #$88, $ff3040.l
015794: 4e75             rts        
015796: 61001d02         bsr.w      $1749a
01579A: 41f900ff301b     lea.l      $ff301b.l, a0
0157A0: 7e05             moveq      #$5, d7
0157A2: 7c01             moveq      #$1, d6
0157A4: 1018             move.b     (a0)+, d0
0157A6: 0c000003         cmpi.b     #$3, d0
0157AA: 67000014         beq.w      $157c0
0157AE: 0c000002         cmpi.b     #$2, d0
0157B2: 67000010         beq.w      $157c4
0157B6: 5246             addq.w     #$1, d6
0157B8: 51cfffea         dbra       d7, $157a4
0157BC: 60000d84         bra.w      $16542
0157C0: 60001ca0         bra.w      $17462
0157C4: 13c600ff3016     move.b     d6, $ff3016.l
0157CA: 41f900ff301b     lea.l      $ff301b.l, a0
0157D0: 7c01             moveq      #$1, d6
0157D2: 0c180001         cmpi.b     #$1, (a0)+
0157D6: 67000006         beq.w      $157de
0157DA: 5246             addq.w     #$1, d6
0157DC: 60f4             bra.b      $157d2
0157DE: 13c600ff3017     move.b     d6, $ff3017.l
0157E4: 103900ff3016     move.b     $ff3016.l, d0
0157EA: b02e0101         cmp.b      $101(a6), d0
0157EE: 6700007c         beq.w      $1586c
0157F2: b02e0121         cmp.b      $121(a6), d0
0157F6: 67000074         beq.w      $1586c
0157FA: b02e0141         cmp.b      $141(a6), d0
0157FE: 6700006c         beq.w      $1586c
015802: 6100e0ce         bsr.w      $138d2
015806: 0c400009         cmpi.w     #$9, d0
01580A: 66000006         bne.w      $15812
01580E: 60001c52         bra.w      $17462
015812: 13fc000500ff3216 move.b     #$5, $ff3216.l
01581A: 423900ff3217     clr.b      $ff3217.l
015820: 423900ff322d     clr.b      $ff322d.l
015826: 42b900ff0500     clr.l      $ff0500.l
01582C: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
015836: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015840: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
01584A: 243c00ffffff     move.l     #$ffffff, d2
015850: 61001cf6         bsr.w      $17548
015854: 13c700ff322e     move.b     d7, $ff322e.l
01585A: 33fc000800ff3040 move.w     #$8, $ff3040.l
015862: 33fc008800ff3028 move.w     #$88, $ff3028.l
01586A: 4e75             rts        
01586C: 423900ff3216     clr.b      $ff3216.l
015872: 42b900ff0500     clr.l      $ff0500.l
015878: 13f900ff301600ff0501 move.b     $ff3016.l, $ff0501.l
015882: 243c00ff0000     move.l     #$ff0000, d2
015888: 61001c38         bsr.w      $174c2
01588C: 13c700ff3217     move.b     d7, $ff3217.l
015892: 423900ff322d     clr.b      $ff322d.l
015898: 42b900ff0500     clr.l      $ff0500.l
01589E: 13f900ff301600ff0501 move.b     $ff3016.l, $ff0501.l
0158A8: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
0158B2: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
0158BC: 243c0000ffff     move.l     #$ffff, d2
0158C2: 61001c84         bsr.w      $17548
0158C6: 13c700ff322e     move.b     d7, $ff322e.l
0158CC: 13f900ff301700ff3018 move.b     $ff3017.l, $ff3018.l
0158D6: 33fc000800ff3040 move.w     #$8, $ff3040.l
0158DE: 33fc003000ff3028 move.w     #$30, $ff3028.l
0158E6: 4e75             rts        

; ==== sub_0158E8 ТАБЛИЦА зовут=0 ====
0158E8: 103900ff322d     move.b     $ff322d.l, d0
0158EE: 13c000ff3216     move.b     d0, $ff3216.l
0158F4: 103900ff322e     move.b     $ff322e.l, d0
0158FA: 13c000ff3217     move.b     d0, $ff3217.l
015900: 303900ff3028     move.w     $ff3028.l, d0
015906: 33c000ff3040     move.w     d0, $ff3040.l
01590C: 4e75             rts        

; ==== sub_01590E ТАБЛИЦА зовут=0 ====
01590E: 61001b62         bsr.w      $17472
015912: 41f900ff301a     lea.l      $ff301a.l, a0
015918: 7000             moveq      #$0, d0
01591A: 103900ff3016     move.b     $ff3016.l, d0
015920: 4a300000         tst.b      (a0, d0.w)
015924: 6700008e         beq.w      $159b4
015928: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
01592E: 6700001a         beq.w      $1594a
015932: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015938: 67000040         beq.w      $1597a
01593C: 423900ff3216     clr.b      $ff3216.l
015942: 423900ff3217     clr.b      $ff3217.l
015948: 4e75             rts        
01594A: 423900ff3216     clr.b      $ff3216.l
015950: 42b900ff0500     clr.l      $ff0500.l
015956: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015960: 243c000000ff     move.l     #$ff, d2
015966: 61001b5a         bsr.w      $174c2
01596A: 13c700ff3217     move.b     d7, $ff3217.l
015970: 33fc000c00ff3040 move.w     #$c, $ff3040.l
015978: 4e75             rts        
01597A: 423900ff3216     clr.b      $ff3216.l
015980: 427900ff0500     clr.w      $ff0500.l
015986: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015990: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
01599A: 243c0000ffff     move.l     #$ffff, d2
0159A0: 61001b20         bsr.w      $174c2
0159A4: 13c700ff322e     move.b     d7, $ff322e.l
0159AA: 33fc000c00ff3040 move.w     #$c, $ff3040.l
0159B2: 4e75             rts        
0159B4: 41f900ff301a     lea.l      $ff301a.l, a0
0159BA: 7000             moveq      #$0, d0
0159BC: 103900ff3017     move.b     $ff3017.l, d0
0159C2: 4a300000         tst.b      (a0, d0.w)
0159C6: 67000098         beq.w      $15a60
0159CA: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0159D0: 67000018         beq.w      $159ea
0159D4: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0159DA: 67000040         beq.w      $15a1c
0159DE: 33fc008800ff3040 move.w     #$88, $ff3040.l
0159E6: 6000fb52         bra.w      $1553a
0159EA: 13fc000100ff3216 move.b     #$1, $ff3216.l
0159F2: 42b900ff0500     clr.l      $ff0500.l
0159F8: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015A02: 243c0000ff00     move.l     #$ff00, d2
015A08: 61001ab8         bsr.w      $174c2
015A0C: 13c700ff3217     move.b     d7, $ff3217.l
015A12: 33fc001c00ff3040 move.w     #$1c, $ff3040.l
015A1A: 4e75             rts        
015A1C: 423900ff3216     clr.b      $ff3216.l
015A22: 42b900ff0500     clr.l      $ff0500.l
015A28: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
015A32: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015A3C: 243c00ffff00     move.l     #$ffff00, d2
015A42: 61001a7e         bsr.w      $174c2
015A46: 13c700ff3217     move.b     d7, $ff3217.l
015A4C: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
015A56: 33fc003000ff3040 move.w     #$30, $ff3040.l
015A5E: 4e75             rts        
015A60: 13fc000500ff3216 move.b     #$5, $ff3216.l
015A68: 423900ff3217     clr.b      $ff3217.l
015A6E: 61001be8         bsr.w      $17658
015A72: 4a40             tst.w      d0
015A74: 660019ec         bne.w      $17462
015A78: 33fc008800ff3040 move.w     #$88, $ff3040.l
015A80: 4e75             rts        

; ==== sub_015A82 ТАБЛИЦА зовут=0 ====
015A82: 610019ee         bsr.w      $17472
015A86: 41f900ff301a     lea.l      $ff301a.l, a0
015A8C: 7000             moveq      #$0, d0
015A8E: 103900ff3017     move.b     $ff3017.l, d0
015A94: 4a300000         tst.b      (a0, d0.w)
015A98: 67000098         beq.w      $15b32
015A9C: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015AA2: 67000010         beq.w      $15ab4
015AA6: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015AAC: 67000038         beq.w      $15ae6
015AB0: 60000070         bra.w      $15b22
015AB4: 13fc000100ff3216 move.b     #$1, $ff3216.l
015ABC: 42b900ff0500     clr.l      $ff0500.l
015AC2: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015ACC: 243c0000ff00     move.l     #$ff00, d2
015AD2: 610019ee         bsr.w      $174c2
015AD6: 13c700ff3217     move.b     d7, $ff3217.l
015ADC: 33fc001000ff3040 move.w     #$10, $ff3040.l
015AE4: 4e75             rts        
015AE6: 13fc000100ff3216 move.b     #$1, $ff3216.l
015AEE: 42b900ff0500     clr.l      $ff0500.l
015AF4: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015AFE: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
015B08: 243c0000ffff     move.l     #$ffff, d2
015B0E: 610019b2         bsr.w      $174c2
015B12: 13c700ff3217     move.b     d7, $ff3217.l
015B18: 33fc001000ff3040 move.w     #$10, $ff3040.l
015B20: 4e75             rts        
015B22: 13fc000200ff3216 move.b     #$2, $ff3216.l
015B2A: 423900ff3217     clr.b      $ff3217.l
015B30: 4e75             rts        
015B32: 61001b24         bsr.w      $17658
015B36: 4a40             tst.w      d0
015B38: 66000004         bne.w      $15b3e
015B3C: 4e75             rts        
015B3E: 61001a8e         bsr.w      $175ce
015B42: 4a40             tst.w      d0
015B44: 6600191c         bne.w      $17462
015B48: 4e75             rts        

; ==== sub_015B4A ТАБЛИЦА зовут=0 ====
015B4A: 61001926         bsr.w      $17472
015B4E: 41f900ff301a     lea.l      $ff301a.l, a0
015B54: 7000             moveq      #$0, d0
015B56: 103900ff3017     move.b     $ff3017.l, d0
015B5C: 4a300000         tst.b      (a0, d0.w)
015B60: 670000ac         beq.w      $15c0e
015B64: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015B6A: 67000010         beq.w      $15b7c
015B6E: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015B74: 67000042         beq.w      $15bb8
015B78: 60000084         bra.w      $15bfe
015B7C: 13fc000200ff3216 move.b     #$2, $ff3216.l
015B84: 42b900ff0500     clr.l      $ff0500.l
015B8A: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015B94: 243c0000ff00     move.l     #$ff00, d2
015B9A: 61001926         bsr.w      $174c2
015B9E: 13c700ff3217     move.b     d7, $ff3217.l
015BA4: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
015BAE: 33fc001400ff3040 move.w     #$14, $ff3040.l
015BB6: 4e75             rts        
015BB8: 13fc000200ff3216 move.b     #$2, $ff3216.l
015BC0: 42b900ff0500     clr.l      $ff0500.l
015BC6: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
015BD0: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015BDA: 243c00ffff00     move.l     #$ffff00, d2
015BE0: 610018e0         bsr.w      $174c2
015BE4: 13c700ff3217     move.b     d7, $ff3217.l
015BEA: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
015BF4: 33fc001400ff3040 move.w     #$14, $ff3040.l
015BFC: 4e75             rts        
015BFE: 13fc000300ff3216 move.b     #$3, $ff3216.l
015C06: 423900ff3217     clr.b      $ff3217.l
015C0C: 4e75             rts        
015C0E: 61001a48         bsr.w      $17658
015C12: 4a40             tst.w      d0
015C14: 66000004         bne.w      $15c1a
015C18: 4e75             rts        
015C1A: 610019b2         bsr.w      $175ce
015C1E: 4a40             tst.w      d0
015C20: 66000004         bne.w      $15c26
015C24: 4e75             rts        
015C26: 610019c0         bsr.w      $175e8
015C2A: 4a40             tst.w      d0
015C2C: 66001834         bne.w      $17462
015C30: 4e75             rts        

; ==== sub_015C32 ТАБЛИЦА зовут=0 ====
015C32: 6100183e         bsr.w      $17472
015C36: 41f900ff301a     lea.l      $ff301a.l, a0
015C3C: 7000             moveq      #$0, d0
015C3E: 103900ff3018     move.b     $ff3018.l, d0
015C44: 4a300000         tst.b      (a0, d0.w)
015C48: 67000098         beq.w      $15ce2
015C4C: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015C52: 67000010         beq.w      $15c64
015C56: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015C5C: 67000038         beq.w      $15c96
015C60: 60000070         bra.w      $15cd2
015C64: 13fc000300ff3216 move.b     #$3, $ff3216.l
015C6C: 42b900ff0500     clr.l      $ff0500.l
015C72: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
015C7C: 243c0000ff00     move.l     #$ff00, d2
015C82: 6100183e         bsr.w      $174c2
015C86: 13c700ff3217     move.b     d7, $ff3217.l
015C8C: 33fc001800ff3040 move.w     #$18, $ff3040.l
015C94: 4e75             rts        
015C96: 13fc000300ff3216 move.b     #$3, $ff3216.l
015C9E: 42b900ff0500     clr.l      $ff0500.l
015CA4: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
015CAE: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
015CB8: 243c0000ffff     move.l     #$ffff, d2
015CBE: 61001802         bsr.w      $174c2
015CC2: 13c700ff3217     move.b     d7, $ff3217.l
015CC8: 33fc001800ff3040 move.w     #$18, $ff3040.l
015CD0: 4e75             rts        
015CD2: 13fc000200ff3216 move.b     #$2, $ff3216.l
015CDA: 423900ff3217     clr.b      $ff3217.l
015CE0: 4e75             rts        
015CE2: 61001974         bsr.w      $17658
015CE6: 4a40             tst.w      d0
015CE8: 66000004         bne.w      $15cee
015CEC: 4e75             rts        
015CEE: 610018de         bsr.w      $175ce
015CF2: 4a40             tst.w      d0
015CF4: 66000004         bne.w      $15cfa
015CF8: 4e75             rts        
015CFA: 610018ec         bsr.w      $175e8
015CFE: 4a40             tst.w      d0
015D00: 66000004         bne.w      $15d06
015D04: 4e75             rts        
015D06: 610018fc         bsr.w      $17604
015D0A: 4a40             tst.w      d0
015D0C: 66001754         bne.w      $17462
015D10: 4e75             rts        

; ==== sub_015D12 ТАБЛИЦА зовут=0 ====
015D12: 6100175e         bsr.w      $17472
015D16: 41f900ff301a     lea.l      $ff301a.l, a0
015D1C: 7000             moveq      #$0, d0
015D1E: 103900ff3018     move.b     $ff3018.l, d0
015D24: 4a300000         tst.b      (a0, d0.w)
015D28: 6700008e         beq.w      $15db8
015D2C: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015D32: 67000010         beq.w      $15d44
015D36: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015D3C: 67000032         beq.w      $15d70
015D40: 60000064         bra.w      $15da6
015D44: 13fc000400ff3216 move.b     #$4, $ff3216.l
015D4C: 42b900ff0500     clr.l      $ff0500.l
015D52: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
015D5C: 243c00ff0000     move.l     #$ff0000, d2
015D62: 6100175e         bsr.w      $174c2
015D66: 13c700ff3217     move.b     d7, $ff3217.l
015D6C: 600016fc         bra.w      $1746a
015D70: 13fc000400ff3216 move.b     #$4, $ff3216.l
015D78: 42b900ff0500     clr.l      $ff0500.l
015D7E: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
015D88: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
015D92: 243c00ff00ff     move.l     #$ff00ff, d2
015D98: 61001728         bsr.w      $174c2
015D9C: 13c700ff3217     move.b     d7, $ff3217.l
015DA2: 600016c6         bra.w      $1746a
015DA6: 13fc000400ff3216 move.b     #$4, $ff3216.l
015DAE: 423900ff3217     clr.b      $ff3217.l
015DB4: 600016b4         bra.w      $1746a
015DB8: 6100189e         bsr.w      $17658
015DBC: 4a40             tst.w      d0
015DBE: 66000004         bne.w      $15dc4
015DC2: 4e75             rts        
015DC4: 61001808         bsr.w      $175ce
015DC8: 4a40             tst.w      d0
015DCA: 66000004         bne.w      $15dd0
015DCE: 4e75             rts        
015DD0: 61001816         bsr.w      $175e8
015DD4: 4a40             tst.w      d0
015DD6: 66000004         bne.w      $15ddc
015DDA: 4e75             rts        
015DDC: 61001826         bsr.w      $17604
015DE0: 4a40             tst.w      d0
015DE2: 66000004         bne.w      $15de8
015DE6: 4e75             rts        
015DE8: 61001836         bsr.w      $17620
015DEC: 4a40             tst.w      d0
015DEE: 66001672         bne.w      $17462
015DF2: 4e75             rts        

; ==== sub_015DF4 ТАБЛИЦА зовут=0 ====
015DF4: 6100167c         bsr.w      $17472
015DF8: 41f900ff301a     lea.l      $ff301a.l, a0
015DFE: 7000             moveq      #$0, d0
015E00: 103900ff3016     move.b     $ff3016.l, d0
015E06: 4a300000         tst.b      (a0, d0.w)
015E0A: 67000094         beq.w      $15ea0
015E0E: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015E14: 67000010         beq.w      $15e26
015E18: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015E1E: 67000036         beq.w      $15e56
015E22: 6000006c         bra.w      $15e90
015E26: 423900ff3216     clr.b      $ff3216.l
015E2C: 42b900ff0500     clr.l      $ff0500.l
015E32: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015E3C: 243c000000ff     move.l     #$ff, d2
015E42: 6100167e         bsr.w      $174c2
015E46: 13c700ff3217     move.b     d7, $ff3217.l
015E4C: 33fc001000ff3040 move.w     #$10, $ff3040.l
015E54: 4e75             rts        
015E56: 423900ff3216     clr.b      $ff3216.l
015E5C: 42b900ff0500     clr.l      $ff0500.l
015E62: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015E6C: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015E76: 243c0000ffff     move.l     #$ffff, d2
015E7C: 61001644         bsr.w      $174c2
015E80: 13c700ff3217     move.b     d7, $ff3217.l
015E86: 33fc001000ff3040 move.w     #$10, $ff3040.l
015E8E: 4e75             rts        
015E90: 13fc000200ff3216 move.b     #$2, $ff3216.l
015E98: 423900ff3217     clr.b      $ff3217.l
015E9E: 4e75             rts        
015EA0: 41f900ff301a     lea.l      $ff301a.l, a0
015EA6: 7000             moveq      #$0, d0
015EA8: 103900ff3017     move.b     $ff3017.l, d0
015EAE: 4a300000         tst.b      (a0, d0.w)
015EB2: 670000ac         beq.w      $15f60
015EB6: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015EBC: 67000010         beq.w      $15ece
015EC0: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015EC6: 67000042         beq.w      $15f0a
015ECA: 60000084         bra.w      $15f50
015ECE: 13fc000200ff3216 move.b     #$2, $ff3216.l
015ED6: 42b900ff0500     clr.l      $ff0500.l
015EDC: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015EE6: 243c0000ff00     move.l     #$ff00, d2
015EEC: 610015d4         bsr.w      $174c2
015EF0: 13c700ff3217     move.b     d7, $ff3217.l
015EF6: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
015F00: 33fc002400ff3040 move.w     #$24, $ff3040.l
015F08: 4e75             rts        
015F0A: 13fc000200ff3216 move.b     #$2, $ff3216.l
015F12: 42b900ff0500     clr.l      $ff0500.l
015F18: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
015F22: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
015F2C: 243c00ffff00     move.l     #$ffff00, d2
015F32: 6100158e         bsr.w      $174c2
015F36: 13c700ff3217     move.b     d7, $ff3217.l
015F3C: 13f900ff050700ff3018 move.b     $ff0507.l, $ff3018.l
015F46: 33fc002400ff3040 move.w     #$24, $ff3040.l
015F4E: 4e75             rts        
015F50: 13fc000300ff3216 move.b     #$3, $ff3216.l
015F58: 423900ff3217     clr.b      $ff3217.l
015F5E: 4e75             rts        
015F60: 610016f6         bsr.w      $17658
015F64: 4a40             tst.w      d0
015F66: 66000004         bne.w      $15f6c
015F6A: 4e75             rts        
015F6C: 6100167a         bsr.w      $175e8
015F70: 4a40             tst.w      d0
015F72: 660014ee         bne.w      $17462
015F76: 4e75             rts        

; ==== sub_015F78 ТАБЛИЦА зовут=0 ====
015F78: 610014f8         bsr.w      $17472
015F7C: 41f900ff301a     lea.l      $ff301a.l, a0
015F82: 7000             moveq      #$0, d0
015F84: 103900ff3016     move.b     $ff3016.l, d0
015F8A: 4a300000         tst.b      (a0, d0.w)
015F8E: 67000094         beq.w      $16024
015F92: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
015F98: 67000010         beq.w      $15faa
015F9C: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
015FA2: 67000036         beq.w      $15fda
015FA6: 6000006c         bra.w      $16014
015FAA: 423900ff3216     clr.b      $ff3216.l
015FB0: 42b900ff0500     clr.l      $ff0500.l
015FB6: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015FC0: 243c000000ff     move.l     #$ff, d2
015FC6: 610014fa         bsr.w      $174c2
015FCA: 13c700ff3217     move.b     d7, $ff3217.l
015FD0: 33fc001400ff3040 move.w     #$14, $ff3040.l
015FD8: 4e75             rts        
015FDA: 423900ff3216     clr.b      $ff3216.l
015FE0: 42b900ff0500     clr.l      $ff0500.l
015FE6: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
015FF0: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
015FFA: 243c0000ffff     move.l     #$ffff, d2
016000: 610014c0         bsr.w      $174c2
016004: 13c700ff3217     move.b     d7, $ff3217.l
01600A: 33fc001400ff3040 move.w     #$14, $ff3040.l
016012: 4e75             rts        
016014: 13fc000200ff3216 move.b     #$2, $ff3216.l
01601C: 423900ff3217     clr.b      $ff3217.l
016022: 4e75             rts        
016024: 41f900ff301a     lea.l      $ff301a.l, a0
01602A: 7000             moveq      #$0, d0
01602C: 103900ff3018     move.b     $ff3018.l, d0
016032: 4a300000         tst.b      (a0, d0.w)
016036: 67000098         beq.w      $160d0
01603A: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016040: 67000010         beq.w      $16052
016044: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01604A: 67000038         beq.w      $16084
01604E: 60000070         bra.w      $160c0
016052: 13fc000300ff3216 move.b     #$3, $ff3216.l
01605A: 42b900ff0500     clr.l      $ff0500.l
016060: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
01606A: 243c0000ff00     move.l     #$ff00, d2
016070: 61001450         bsr.w      $174c2
016074: 13c700ff3217     move.b     d7, $ff3217.l
01607A: 33fc002c00ff3040 move.w     #$2c, $ff3040.l
016082: 4e75             rts        
016084: 13fc000300ff3216 move.b     #$3, $ff3216.l
01608C: 42b900ff0500     clr.l      $ff0500.l
016092: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
01609C: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
0160A6: 243c0000ffff     move.l     #$ffff, d2
0160AC: 61001414         bsr.w      $174c2
0160B0: 13c700ff3217     move.b     d7, $ff3217.l
0160B6: 33fc002c00ff3040 move.w     #$2c, $ff3040.l
0160BE: 4e75             rts        
0160C0: 13fc000200ff3216 move.b     #$2, $ff3216.l
0160C8: 423900ff3217     clr.b      $ff3217.l
0160CE: 4e75             rts        
0160D0: 61001586         bsr.w      $17658
0160D4: 4a40             tst.w      d0
0160D6: 66000004         bne.w      $160dc
0160DA: 4e75             rts        
0160DC: 6100150a         bsr.w      $175e8
0160E0: 4a40             tst.w      d0
0160E2: 66000004         bne.w      $160e8
0160E6: 4e75             rts        
0160E8: 6100151a         bsr.w      $17604
0160EC: 4a40             tst.w      d0
0160EE: 66001372         bne.w      $17462
0160F2: 4e75             rts        

; ==== sub_0160F4 ТАБЛИЦА зовут=0 ====
0160F4: 6100137c         bsr.w      $17472
0160F8: 41f900ff301a     lea.l      $ff301a.l, a0
0160FE: 7000             moveq      #$0, d0
016100: 103900ff3016     move.b     $ff3016.l, d0
016106: 4a300000         tst.b      (a0, d0.w)
01610A: 67000094         beq.w      $161a0
01610E: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016114: 67000010         beq.w      $16126
016118: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01611E: 67000036         beq.w      $16156
016122: 6000006c         bra.w      $16190
016126: 423900ff3216     clr.b      $ff3216.l
01612C: 42b900ff0500     clr.l      $ff0500.l
016132: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
01613C: 243c000000ff     move.l     #$ff, d2
016142: 6100137e         bsr.w      $174c2
016146: 13c700ff3217     move.b     d7, $ff3217.l
01614C: 33fc001800ff3040 move.w     #$18, $ff3040.l
016154: 4e75             rts        
016156: 423900ff3216     clr.b      $ff3216.l
01615C: 42b900ff0500     clr.l      $ff0500.l
016162: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
01616C: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
016176: 243c0000ffff     move.l     #$ffff, d2
01617C: 61001344         bsr.w      $174c2
016180: 13c700ff3217     move.b     d7, $ff3217.l
016186: 33fc001800ff3040 move.w     #$18, $ff3040.l
01618E: 4e75             rts        
016190: 13fc000200ff3216 move.b     #$2, $ff3216.l
016198: 423900ff3217     clr.b      $ff3217.l
01619E: 4e75             rts        
0161A0: 610014b6         bsr.w      $17658
0161A4: 4a40             tst.w      d0
0161A6: 66000004         bne.w      $161ac
0161AA: 4e75             rts        
0161AC: 6100143a         bsr.w      $175e8
0161B0: 4a40             tst.w      d0
0161B2: 66000004         bne.w      $161b8
0161B6: 4e75             rts        
0161B8: 6100144a         bsr.w      $17604
0161BC: 4a40             tst.w      d0
0161BE: 66000004         bne.w      $161c4
0161C2: 4e75             rts        
0161C4: 6100145a         bsr.w      $17620
0161C8: 4a40             tst.w      d0
0161CA: 66001296         bne.w      $17462
0161CE: 4e75             rts        

; ==== sub_0161D0 ТАБЛИЦА зовут=0 ====
0161D0: 610012a0         bsr.w      $17472
0161D4: 41f900ff301a     lea.l      $ff301a.l, a0
0161DA: 7000             moveq      #$0, d0
0161DC: 103900ff3018     move.b     $ff3018.l, d0
0161E2: 4a300000         tst.b      (a0, d0.w)
0161E6: 67000098         beq.w      $16280
0161EA: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0161F0: 67000010         beq.w      $16202
0161F4: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0161FA: 67000038         beq.w      $16234
0161FE: 60000070         bra.w      $16270
016202: 13fc000100ff3216 move.b     #$1, $ff3216.l
01620A: 42b900ff0500     clr.l      $ff0500.l
016210: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
01621A: 243c00ff0000     move.l     #$ff0000, d2
016220: 610012a0         bsr.w      $174c2
016224: 13c700ff3217     move.b     d7, $ff3217.l
01622A: 33fc003400ff3040 move.w     #$34, $ff3040.l
016232: 4e75             rts        
016234: 13fc000100ff3216 move.b     #$1, $ff3216.l
01623C: 42b900ff0500     clr.l      $ff0500.l
016242: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
01624C: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016256: 243c00ffff00     move.l     #$ffff00, d2
01625C: 61001264         bsr.w      $174c2
016260: 13c700ff3217     move.b     d7, $ff3217.l
016266: 33fc003400ff3040 move.w     #$34, $ff3040.l
01626E: 4e75             rts        
016270: 13fc000200ff3216 move.b     #$2, $ff3216.l
016278: 423900ff3217     clr.b      $ff3217.l
01627E: 4e75             rts        
016280: 610013d6         bsr.w      $17658
016284: 4a40             tst.w      d0
016286: 66000004         bne.w      $1628c
01628A: 4e75             rts        
01628C: 61001340         bsr.w      $175ce
016290: 4a40             tst.w      d0
016292: 660011ce         bne.w      $17462
016296: 4e75             rts        

; ==== sub_016298 ТАБЛИЦА зовут=0 ====
016298: 610011d8         bsr.w      $17472
01629C: 41f900ff301a     lea.l      $ff301a.l, a0
0162A2: 7000             moveq      #$0, d0
0162A4: 103900ff3018     move.b     $ff3018.l, d0
0162AA: 4a300000         tst.b      (a0, d0.w)
0162AE: 670000ac         beq.w      $1635c
0162B2: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0162B8: 67000010         beq.w      $162ca
0162BC: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0162C2: 67000042         beq.w      $16306
0162C6: 60000084         bra.w      $1634c
0162CA: 13fc000200ff3216 move.b     #$2, $ff3216.l
0162D2: 42b900ff0500     clr.l      $ff0500.l
0162D8: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
0162E2: 243c00ff0000     move.l     #$ff0000, d2
0162E8: 610011d8         bsr.w      $174c2
0162EC: 13c700ff3217     move.b     d7, $ff3217.l
0162F2: 13f900ff050600ff3019 move.b     $ff0506.l, $ff3019.l
0162FC: 33fc003800ff3040 move.w     #$38, $ff3040.l
016304: 4e75             rts        
016306: 13fc000200ff3216 move.b     #$2, $ff3216.l
01630E: 42b900ff0500     clr.l      $ff0500.l
016314: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
01631E: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
016328: 243c00ff00ff     move.l     #$ff00ff, d2
01632E: 61001192         bsr.w      $174c2
016332: 13c700ff3217     move.b     d7, $ff3217.l
016338: 13f900ff050600ff3019 move.b     $ff0506.l, $ff3019.l
016342: 33fc003800ff3040 move.w     #$38, $ff3040.l
01634A: 4e75             rts        
01634C: 13fc000300ff3216 move.b     #$3, $ff3216.l
016354: 423900ff3217     clr.b      $ff3217.l
01635A: 4e75             rts        
01635C: 610012fa         bsr.w      $17658
016360: 4a40             tst.w      d0
016362: 66000004         bne.w      $16368
016366: 4e75             rts        
016368: 61001264         bsr.w      $175ce
01636C: 4a40             tst.w      d0
01636E: 66000004         bne.w      $16374
016372: 4e75             rts        
016374: 61001272         bsr.w      $175e8
016378: 4a40             tst.w      d0
01637A: 660010e6         bne.w      $17462
01637E: 4e75             rts        

; ==== sub_016380 ТАБЛИЦА зовут=0 ====
016380: 610010f0         bsr.w      $17472
016384: 41f900ff301a     lea.l      $ff301a.l, a0
01638A: 7000             moveq      #$0, d0
01638C: 103900ff3019     move.b     $ff3019.l, d0
016392: 4a300000         tst.b      (a0, d0.w)
016396: 67000098         beq.w      $16430
01639A: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0163A0: 67000010         beq.w      $163b2
0163A4: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0163AA: 67000038         beq.w      $163e4
0163AE: 60000070         bra.w      $16420
0163B2: 13fc000300ff3216 move.b     #$3, $ff3216.l
0163BA: 42b900ff0500     clr.l      $ff0500.l
0163C0: 13f900ff301900ff0502 move.b     $ff3019.l, $ff0502.l
0163CA: 243c0000ff00     move.l     #$ff00, d2
0163D0: 610010f0         bsr.w      $174c2
0163D4: 13c700ff3217     move.b     d7, $ff3217.l
0163DA: 33fc003c00ff3040 move.w     #$3c, $ff3040.l
0163E2: 4e75             rts        
0163E4: 13fc000300ff3216 move.b     #$3, $ff3216.l
0163EC: 42b900ff0500     clr.l      $ff0500.l
0163F2: 13f900ff301900ff0501 move.b     $ff3019.l, $ff0501.l
0163FC: 13f900ff301900ff0502 move.b     $ff3019.l, $ff0502.l
016406: 243c00ffff00     move.l     #$ffff00, d2
01640C: 610010b4         bsr.w      $174c2
016410: 13c700ff3217     move.b     d7, $ff3217.l
016416: 33fc003c00ff3040 move.w     #$3c, $ff3040.l
01641E: 4e75             rts        
016420: 13fc000200ff3216 move.b     #$2, $ff3216.l
016428: 423900ff3217     clr.b      $ff3217.l
01642E: 4e75             rts        
016430: 61001226         bsr.w      $17658
016434: 4a40             tst.w      d0
016436: 66000004         bne.w      $1643c
01643A: 4e75             rts        
01643C: 61001190         bsr.w      $175ce
016440: 4a40             tst.w      d0
016442: 66000004         bne.w      $16448
016446: 4e75             rts        
016448: 6100119e         bsr.w      $175e8
01644C: 4a40             tst.w      d0
01644E: 66000004         bne.w      $16454
016452: 4e75             rts        
016454: 610011ae         bsr.w      $17604
016458: 4a40             tst.w      d0
01645A: 66001006         bne.w      $17462
01645E: 4e75             rts        

; ==== sub_016460 ТАБЛИЦА зовут=0 ====
016460: 61001010         bsr.w      $17472
016464: 41f900ff301a     lea.l      $ff301a.l, a0
01646A: 7000             moveq      #$0, d0
01646C: 103900ff3019     move.b     $ff3019.l, d0
016472: 4a300000         tst.b      (a0, d0.w)
016476: 6700008e         beq.w      $16506
01647A: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016480: 67000010         beq.w      $16492
016484: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01648A: 67000032         beq.w      $164be
01648E: 60000064         bra.w      $164f4
016492: 13fc000400ff3216 move.b     #$4, $ff3216.l
01649A: 42b900ff0500     clr.l      $ff0500.l
0164A0: 13f900ff301900ff0502 move.b     $ff3019.l, $ff0502.l
0164AA: 243c0000ff00     move.l     #$ff00, d2
0164B0: 61001010         bsr.w      $174c2
0164B4: 13c700ff3217     move.b     d7, $ff3217.l
0164BA: 60000fae         bra.w      $1746a
0164BE: 13fc000400ff3216 move.b     #$4, $ff3216.l
0164C6: 42b900ff0500     clr.l      $ff0500.l
0164CC: 13f900ff301900ff0502 move.b     $ff3019.l, $ff0502.l
0164D6: 13f900ff301900ff0503 move.b     $ff3019.l, $ff0503.l
0164E0: 243c0000ffff     move.l     #$ffff, d2
0164E6: 61000fda         bsr.w      $174c2
0164EA: 13c700ff3217     move.b     d7, $ff3217.l
0164F0: 60000f78         bra.w      $1746a
0164F4: 13fc000400ff3216 move.b     #$4, $ff3216.l
0164FC: 423900ff3217     clr.b      $ff3217.l
016502: 60000f66         bra.w      $1746a
016506: 61001150         bsr.w      $17658
01650A: 4a40             tst.w      d0
01650C: 66000004         bne.w      $16512
016510: 4e75             rts        
016512: 610010ba         bsr.w      $175ce
016516: 4a40             tst.w      d0
016518: 66000004         bne.w      $1651e
01651C: 4e75             rts        
01651E: 610010c8         bsr.w      $175e8
016522: 4a40             tst.w      d0
016524: 66000004         bne.w      $1652a
016528: 4e75             rts        
01652A: 610010d8         bsr.w      $17604
01652E: 4a40             tst.w      d0
016530: 66000004         bne.w      $16536
016534: 4e75             rts        
016536: 610010e8         bsr.w      $17620
01653A: 4a40             tst.w      d0
01653C: 66000f24         bne.w      $17462
016540: 4e75             rts        
016542: 102e0101         move.b     $101(a6), d0
016546: 6100008e         bsr.w      $165d6
01654A: 4a41             tst.w      d1
01654C: 66000022         bne.w      $16570
016550: 102e0121         move.b     $121(a6), d0
016554: 61000080         bsr.w      $165d6
016558: 4a41             tst.w      d1
01655A: 66000014         bne.w      $16570
01655E: 102e0141         move.b     $141(a6), d0
016562: 61000072         bsr.w      $165d6
016566: 4a41             tst.w      d1
016568: 66000006         bne.w      $16570
01656C: 60000ef4         bra.w      $17462
016570: 13c000ff3016     move.b     d0, $ff3016.l
016576: 423900ff3216     clr.b      $ff3216.l
01657C: 42b900ff0500     clr.l      $ff0500.l
016582: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
01658C: 243c000000ff     move.l     #$ff, d2
016592: 61000f2e         bsr.w      $174c2
016596: 13c700ff3217     move.b     d7, $ff3217.l
01659C: 13fc000100ff322d move.b     #$1, $ff322d.l
0165A4: 42b900ff0500     clr.l      $ff0500.l
0165AA: 13f900ff301600ff0503 move.b     $ff3016.l, $ff0503.l
0165B4: 243c000000ff     move.l     #$ff, d2
0165BA: 61000f8c         bsr.w      $17548
0165BE: 13c700ff322e     move.b     d7, $ff322e.l
0165C4: 33fc000800ff3040 move.w     #$8, $ff3040.l
0165CC: 33fc004400ff3028 move.w     #$44, $ff3028.l
0165D4: 4e75             rts        

; ==== sub_0165D6 зовут=3 ====
0165D6: 7201             moveq      #$1, d1
0165D8: b02e00cf         cmp.b      $cf(a6), d0
0165DC: 67000014         beq.w      $165f2
0165E0: b02e00d1         cmp.b      $d1(a6), d0
0165E4: 6700000c         beq.w      $165f2
0165E8: b02e00d3         cmp.b      $d3(a6), d0
0165EC: 67000004         beq.w      $165f2
0165F0: 7200             moveq      #$0, d1
0165F2: 4e75             rts        

; ==== sub_0165F4 ТАБЛИЦА зовут=0 ====
0165F4: 61000e7c         bsr.w      $17472
0165F8: 41f900ff301a     lea.l      $ff301a.l, a0
0165FE: 7000             moveq      #$0, d0
016600: 103900ff3016     move.b     $ff3016.l, d0
016606: 4a300000         tst.b      (a0, d0.w)
01660A: 670000ac         beq.w      $166b8
01660E: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016614: 67000010         beq.w      $16626
016618: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01661E: 67000042         beq.w      $16662
016622: 60000084         bra.w      $166a8
016626: 13fc000200ff3216 move.b     #$2, $ff3216.l
01662E: 42b900ff0500     clr.l      $ff0500.l
016634: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
01663E: 243c0000ff00     move.l     #$ff00, d2
016644: 61000e7c         bsr.w      $174c2
016648: 13c700ff3217     move.b     d7, $ff3217.l
01664E: 13f900ff050700ff3017 move.b     $ff0507.l, $ff3017.l
016658: 33fc004800ff3040 move.w     #$48, $ff3040.l
016660: 4e75             rts        
016662: 13fc000200ff3216 move.b     #$2, $ff3216.l
01666A: 42b900ff0500     clr.l      $ff0500.l
016670: 13f900ff301600ff0501 move.b     $ff3016.l, $ff0501.l
01667A: 13f900ff301600ff0502 move.b     $ff3016.l, $ff0502.l
016684: 243c00ffff00     move.l     #$ffff00, d2
01668A: 61000e36         bsr.w      $174c2
01668E: 13c700ff3217     move.b     d7, $ff3217.l
016694: 13f900ff050700ff3017 move.b     $ff0507.l, $ff3017.l
01669E: 33fc004800ff3040 move.w     #$48, $ff3040.l
0166A6: 4e75             rts        
0166A8: 13fc000300ff3216 move.b     #$3, $ff3216.l
0166B0: 423900ff3217     clr.b      $ff3217.l
0166B6: 4e75             rts        
0166B8: 6100d218         bsr.w      $138d2
0166BC: 0c400009         cmpi.w     #$9, d0
0166C0: 66000006         bne.w      $166c8
0166C4: 60000d9c         bra.w      $17462
0166C8: 61000f04         bsr.w      $175ce
0166CC: 4a40             tst.w      d0
0166CE: 66000004         bne.w      $166d4
0166D2: 4e75             rts        
0166D4: 61000f12         bsr.w      $175e8
0166D8: 4a40             tst.w      d0
0166DA: 66000d86         bne.w      $17462
0166DE: 4e75             rts        

; ==== sub_0166E0 ТАБЛИЦА зовут=0 ====
0166E0: 61000d90         bsr.w      $17472
0166E4: 41f900ff301a     lea.l      $ff301a.l, a0
0166EA: 7000             moveq      #$0, d0
0166EC: 103900ff3017     move.b     $ff3017.l, d0
0166F2: 4a300000         tst.b      (a0, d0.w)
0166F6: 670005c2         beq.w      $16cba
0166FA: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016700: 67000010         beq.w      $16712
016704: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01670A: 67000038         beq.w      $16744
01670E: 60000070         bra.w      $16780
016712: 13fc000300ff3216 move.b     #$3, $ff3216.l
01671A: 42b900ff0500     clr.l      $ff0500.l
016720: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
01672A: 243c0000ff00     move.l     #$ff00, d2
016730: 61000d90         bsr.w      $174c2
016734: 13c700ff3217     move.b     d7, $ff3217.l
01673A: 33fc004c00ff3040 move.w     #$4c, $ff3040.l
016742: 4e75             rts        
016744: 13fc000300ff3216 move.b     #$3, $ff3216.l
01674C: 42b900ff0500     clr.l      $ff0500.l
016752: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
01675C: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
016766: 243c00ffff00     move.l     #$ffff00, d2
01676C: 61000d54         bsr.w      $174c2
016770: 13c700ff3217     move.b     d7, $ff3217.l
016776: 33fc004c00ff3040 move.w     #$4c, $ff3040.l
01677E: 4e75             rts        
016780: 13fc000200ff3216 move.b     #$2, $ff3216.l
016788: 423900ff3217     clr.b      $ff3217.l
01678E: 4e75             rts        

; ==== sub_016790 ТАБЛИЦА зовут=0 ====
016790: 61000ce0         bsr.w      $17472
016794: 41f900ff301a     lea.l      $ff301a.l, a0
01679A: 7000             moveq      #$0, d0
01679C: 103900ff3017     move.b     $ff3017.l, d0
0167A2: 4a300000         tst.b      (a0, d0.w)
0167A6: 6700001a         beq.w      $167c2
0167AA: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0167B0: 67000054         beq.w      $16806
0167B4: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0167BA: 67000086         beq.w      $16842
0167BE: 600000c8         bra.w      $16888
0167C2: 102e0101         move.b     $101(a6), d0
0167C6: b02e0121         cmp.b      $121(a6), d0
0167CA: 6600001a         bne.w      $167e6
0167CE: b02e0141         cmp.b      $141(a6), d0
0167D2: 66000012         bne.w      $167e6
0167D6: 13fc000500ff3216 move.b     #$5, $ff3216.l
0167DE: 423900ff3217     clr.b      $ff3217.l
0167E4: 4e75             rts        
0167E6: 13ee010100ff3018 move.b     $101(a6), $ff3018.l
0167EE: 13fc000400ff3216 move.b     #$4, $ff3216.l
0167F6: 423900ff3217     clr.b      $ff3217.l
0167FC: 33fc005000ff3040 move.w     #$50, $ff3040.l
016804: 4e75             rts        
016806: 13fc000400ff3216 move.b     #$4, $ff3216.l
01680E: 42b900ff0500     clr.l      $ff0500.l
016814: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
01681E: 243c0000ff00     move.l     #$ff00, d2
016824: 61000c9c         bsr.w      $174c2
016828: 13c700ff3217     move.b     d7, $ff3217.l
01682E: 13f900ff050100ff3018 move.b     $ff0501.l, $ff3018.l
016838: 33fc005000ff3040 move.w     #$50, $ff3040.l
016840: 4e75             rts        
016842: 13fc000400ff3216 move.b     #$4, $ff3216.l
01684A: 42b900ff0500     clr.l      $ff0500.l
016850: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
01685A: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016864: 243c0000ffff     move.l     #$ffff, d2
01686A: 61000c56         bsr.w      $174c2
01686E: 13c700ff3217     move.b     d7, $ff3217.l
016874: 13f900ff050100ff3018 move.b     $ff0501.l, $ff3018.l
01687E: 33fc005000ff3040 move.w     #$50, $ff3040.l
016886: 4e75             rts        
016888: 13fc000200ff3216 move.b     #$2, $ff3216.l
016890: 423900ff3217     clr.b      $ff3217.l
016896: 4e75             rts        

; ==== sub_016898 ТАБЛИЦА зовут=0 ====
016898: 61000bd8         bsr.w      $17472
01689C: 41f900ff301a     lea.l      $ff301a.l, a0
0168A2: 7000             moveq      #$0, d0
0168A4: 103900ff3018     move.b     $ff3018.l, d0
0168AA: 4a300000         tst.b      (a0, d0.w)
0168AE: 67000098         beq.w      $16948
0168B2: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0168B8: 67000010         beq.w      $168ca
0168BC: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0168C2: 67000038         beq.w      $168fc
0168C6: 60000070         bra.w      $16938
0168CA: 13fc000500ff3216 move.b     #$5, $ff3216.l
0168D2: 42b900ff0500     clr.l      $ff0500.l
0168D8: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
0168E2: 243c0000ff00     move.l     #$ff00, d2
0168E8: 61000bd8         bsr.w      $174c2
0168EC: 13c700ff3217     move.b     d7, $ff3217.l
0168F2: 33fc005800ff3040 move.w     #$58, $ff3040.l
0168FA: 4e75             rts        
0168FC: 13fc000500ff3216 move.b     #$5, $ff3216.l
016904: 42b900ff0500     clr.l      $ff0500.l
01690A: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016914: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
01691E: 243c0000ffff     move.l     #$ffff, d2
016924: 61000b9c         bsr.w      $174c2
016928: 13c700ff3217     move.b     d7, $ff3217.l
01692E: 33fc005800ff3040 move.w     #$58, $ff3040.l
016936: 4e75             rts        
016938: 13fc000200ff3216 move.b     #$2, $ff3216.l
016940: 423900ff3217     clr.b      $ff3217.l
016946: 4e75             rts        
016948: 61000b28         bsr.w      $17472
01694C: 41f900ff301a     lea.l      $ff301a.l, a0
016952: 7000             moveq      #$0, d0
016954: 103900ff3017     move.b     $ff3017.l, d0
01695A: 4a300000         tst.b      (a0, d0.w)
01695E: 67000096         beq.w      $169f6
016962: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016968: 67000010         beq.w      $1697a
01696C: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016972: 67000038         beq.w      $169ac
016976: 60000070         bra.w      $169e8
01697A: 13fc000400ff3216 move.b     #$4, $ff3216.l
016982: 42b900ff0500     clr.l      $ff0500.l
016988: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016992: 243c000000ff     move.l     #$ff, d2
016998: 61000b28         bsr.w      $174c2
01699C: 13c700ff3217     move.b     d7, $ff3217.l
0169A2: 33fc006000ff3040 move.w     #$60, $ff3040.l
0169AA: 4e75             rts        
0169AC: 13fc000400ff3216 move.b     #$4, $ff3216.l
0169B4: 42b900ff0500     clr.l      $ff0500.l
0169BA: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
0169C4: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
0169CE: 243c0000ffff     move.l     #$ffff, d2
0169D4: 61000aec         bsr.w      $174c2
0169D8: 13c700ff3217     move.b     d7, $ff3217.l
0169DE: 33fc006000ff3040 move.w     #$60, $ff3040.l
0169E6: 4e75             rts        
0169E8: 423900ff3216     clr.b      $ff3216.l
0169EE: 423900ff3217     clr.b      $ff3217.l
0169F4: 4e75             rts        
0169F6: 61000bd6         bsr.w      $175ce
0169FA: 4a40             tst.w      d0
0169FC: 66000004         bne.w      $16a02
016A00: 4e75             rts        
016A02: 61000be4         bsr.w      $175e8
016A06: 4a40             tst.w      d0
016A08: 66000004         bne.w      $16a0e
016A0C: 4e75             rts        
016A0E: 61000bf4         bsr.w      $17604
016A12: 4a40             tst.w      d0
016A14: 66000a4c         bne.w      $17462
016A18: 4e75             rts        

; ==== sub_016A1A ТАБЛИЦА зовут=0 ====
016A1A: 61000a56         bsr.w      $17472
016A1E: 41f900ff301a     lea.l      $ff301a.l, a0
016A24: 7000             moveq      #$0, d0
016A26: 103900ff3017     move.b     $ff3017.l, d0
016A2C: 4a300000         tst.b      (a0, d0.w)
016A30: 67000096         beq.w      $16ac8
016A34: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016A3A: 67000010         beq.w      $16a4c
016A3E: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016A44: 67000038         beq.w      $16a7e
016A48: 60000070         bra.w      $16aba
016A4C: 13fc000400ff3216 move.b     #$4, $ff3216.l
016A54: 42b900ff0500     clr.l      $ff0500.l
016A5A: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016A64: 243c000000ff     move.l     #$ff, d2
016A6A: 61000a56         bsr.w      $174c2
016A6E: 13c700ff3217     move.b     d7, $ff3217.l
016A74: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016A7C: 4e75             rts        
016A7E: 13fc000400ff3216 move.b     #$4, $ff3216.l
016A86: 42b900ff0500     clr.l      $ff0500.l
016A8C: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
016A96: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016AA0: 243c0000ffff     move.l     #$ffff, d2
016AA6: 61000a1a         bsr.w      $174c2
016AAA: 13c700ff3217     move.b     d7, $ff3217.l
016AB0: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016AB8: 4e75             rts        
016ABA: 423900ff3216     clr.b      $ff3216.l
016AC0: 423900ff3217     clr.b      $ff3217.l
016AC6: 4e75             rts        
016AC8: 61000b04         bsr.w      $175ce
016ACC: 4a40             tst.w      d0
016ACE: 66000004         bne.w      $16ad4
016AD2: 4e75             rts        
016AD4: 61000b12         bsr.w      $175e8
016AD8: 4a40             tst.w      d0
016ADA: 66000004         bne.w      $16ae0
016ADE: 4e75             rts        
016AE0: 61000b22         bsr.w      $17604
016AE4: 4a40             tst.w      d0
016AE6: 66000004         bne.w      $16aec
016AEA: 4e75             rts        
016AEC: 61000b6a         bsr.w      $17658
016AF0: 4a40             tst.w      d0
016AF2: 6600096e         bne.w      $17462
016AF6: 4e75             rts        

; ==== sub_016AF8 ТАБЛИЦА зовут=0 ====
016AF8: 61000978         bsr.w      $17472
016AFC: 41f900ff301a     lea.l      $ff301a.l, a0
016B02: 7000             moveq      #$0, d0
016B04: 103900ff3018     move.b     $ff3018.l, d0
016B0A: 4a300000         tst.b      (a0, d0.w)
016B0E: 6700008e         beq.w      $16b9e
016B12: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016B18: 67000010         beq.w      $16b2a
016B1C: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016B22: 67000032         beq.w      $16b56
016B26: 60000064         bra.w      $16b8c
016B2A: 13fc000300ff3216 move.b     #$3, $ff3216.l
016B32: 42b900ff0500     clr.l      $ff0500.l
016B38: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
016B42: 243c000000ff     move.l     #$ff, d2
016B48: 61000978         bsr.w      $174c2
016B4C: 13c700ff3217     move.b     d7, $ff3217.l
016B52: 60000916         bra.w      $1746a
016B56: 13fc000300ff3216 move.b     #$3, $ff3216.l
016B5E: 42b900ff0500     clr.l      $ff0500.l
016B64: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016B6E: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
016B78: 243c0000ffff     move.l     #$ffff, d2
016B7E: 61000942         bsr.w      $174c2
016B82: 13c700ff3217     move.b     d7, $ff3217.l
016B88: 600008e0         bra.w      $1746a
016B8C: 13fc000300ff3216 move.b     #$3, $ff3216.l
016B94: 423900ff3217     clr.b      $ff3217.l
016B9A: 600008ce         bra.w      $1746a
016B9E: 61000a2e         bsr.w      $175ce
016BA2: 4a40             tst.w      d0
016BA4: 66000004         bne.w      $16baa
016BA8: 4e75             rts        
016BAA: 61000a3c         bsr.w      $175e8
016BAE: 4a40             tst.w      d0
016BB0: 66000004         bne.w      $16bb6
016BB4: 4e75             rts        
016BB6: 61000a4c         bsr.w      $17604
016BBA: 4a40             tst.w      d0
016BBC: 66000004         bne.w      $16bc2
016BC0: 4e75             rts        
016BC2: 61000a94         bsr.w      $17658
016BC6: 4a40             tst.w      d0
016BC8: 66000004         bne.w      $16bce
016BCC: 4e75             rts        
016BCE: 61000a6c         bsr.w      $1763c
016BD2: 4a40             tst.w      d0
016BD4: 6600088c         bne.w      $17462
016BD8: 4e75             rts        

; ==== sub_016BDA ТАБЛИЦА зовут=0 ====
016BDA: 61000896         bsr.w      $17472
016BDE: 41f900ff301a     lea.l      $ff301a.l, a0
016BE4: 7000             moveq      #$0, d0
016BE6: 103900ff3018     move.b     $ff3018.l, d0
016BEC: 4a300000         tst.b      (a0, d0.w)
016BF0: 67000098         beq.w      $16c8a
016BF4: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016BFA: 67000010         beq.w      $16c0c
016BFE: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016C04: 67000038         beq.w      $16c3e
016C08: 60000070         bra.w      $16c7a
016C0C: 13fc000500ff3216 move.b     #$5, $ff3216.l
016C14: 42b900ff0500     clr.l      $ff0500.l
016C1A: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016C24: 243c0000ff00     move.l     #$ff00, d2
016C2A: 61000896         bsr.w      $174c2
016C2E: 13c700ff3217     move.b     d7, $ff3217.l
016C34: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016C3C: 4e75             rts        
016C3E: 13fc000500ff3216 move.b     #$5, $ff3216.l
016C46: 42b900ff0500     clr.l      $ff0500.l
016C4C: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016C56: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
016C60: 243c0000ffff     move.l     #$ffff, d2
016C66: 6100085a         bsr.w      $174c2
016C6A: 13c700ff3217     move.b     d7, $ff3217.l
016C70: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016C78: 4e75             rts        
016C7A: 13fc000200ff3216 move.b     #$2, $ff3216.l
016C82: 423900ff3217     clr.b      $ff3217.l
016C88: 4e75             rts        
016C8A: 61000942         bsr.w      $175ce
016C8E: 4a40             tst.w      d0
016C90: 66000004         bne.w      $16c96
016C94: 4e75             rts        
016C96: 61000950         bsr.w      $175e8
016C9A: 4a40             tst.w      d0
016C9C: 66000004         bne.w      $16ca2
016CA0: 4e75             rts        
016CA2: 61000960         bsr.w      $17604
016CA6: 4a40             tst.w      d0
016CA8: 66000004         bne.w      $16cae
016CAC: 4e75             rts        
016CAE: 6100098c         bsr.w      $1763c
016CB2: 4a40             tst.w      d0
016CB4: 660007ac         bne.w      $17462
016CB8: 4e75             rts        
016CBA: 610007b6         bsr.w      $17472
016CBE: 41f900ff301b     lea.l      $ff301b.l, a0
016CC4: 7e05             moveq      #$5, d7
016CC6: 7c01             moveq      #$1, d6
016CC8: 1018             move.b     (a0)+, d0
016CCA: 0c000003         cmpi.b     #$3, d0
016CCE: 67000014         beq.w      $16ce4
016CD2: 0c000002         cmpi.b     #$2, d0
016CD6: 67000022         beq.w      $16cfa
016CDA: 5246             addq.w     #$1, d6
016CDC: 51cfffea         dbra       d7, $16cc8
016CE0: 6000005a         bra.w      $16d3c
016CE4: 423900ff3216     clr.b      $ff3216.l
016CEA: 423900ff3217     clr.b      $ff3217.l
016CF0: 33fc004800ff3040 move.w     #$48, $ff3040.l
016CF8: 4e75             rts        
016CFA: 13c600ff3019     move.b     d6, $ff3019.l
016D00: 13fc000400ff3216 move.b     #$4, $ff3216.l
016D08: 42b900ff0500     clr.l      $ff0500.l
016D0E: 13f900ff301900ff0502 move.b     $ff3019.l, $ff0502.l
016D18: 243c0000ffff     move.l     #$ffff, d2
016D1E: 610007a2         bsr.w      $174c2
016D22: 13c700ff3217     move.b     d7, $ff3217.l
016D28: 13f900ff050500ff3018 move.b     $ff0505.l, $ff3018.l
016D32: 33fc006800ff3040 move.w     #$68, $ff3040.l
016D3A: 4e75             rts        
016D3C: 102e0101         move.b     $101(a6), d0
016D40: 61000052         bsr.w      $16d94
016D44: 4a41             tst.w      d1
016D46: 66000014         bne.w      $16d5c
016D4A: 102e0121         move.b     $121(a6), d0
016D4E: 61000044         bsr.w      $16d94
016D52: 4a41             tst.w      d1
016D54: 66000006         bne.w      $16d5c
016D58: 102e0141         move.b     $141(a6), d0
016D5C: 13c000ff3018     move.b     d0, $ff3018.l
016D62: 13fc000400ff3216 move.b     #$4, $ff3216.l
016D6A: 42b900ff0500     clr.l      $ff0500.l
016D70: 13f900ff301800ff0501 move.b     $ff3018.l, $ff0501.l
016D7A: 243c00ff0000     move.l     #$ff0000, d2
016D80: 61000740         bsr.w      $174c2
016D84: 13c700ff3217     move.b     d7, $ff3217.l
016D8A: 33fc006800ff3040 move.w     #$68, $ff3040.l
016D92: 4e75             rts        

; ==== sub_016D94 зовут=2 ====
016D94: 7200             moveq      #$0, d1
016D96: b03900ff3016     cmp.b      $ff3016.l, d0
016D9C: 66000004         bne.w      $16da2
016DA0: 4e75             rts        
016DA2: b03900ff3017     cmp.b      $ff3017.l, d0
016DA8: 66000004         bne.w      $16dae
016DAC: 4e75             rts        
016DAE: 7201             moveq      #$1, d1
016DB0: 4e75             rts        

; ==== sub_016DB2 ТАБЛИЦА зовут=0 ====
016DB2: 610006be         bsr.w      $17472
016DB6: 41f900ff301a     lea.l      $ff301a.l, a0
016DBC: 7000             moveq      #$0, d0
016DBE: 103900ff3017     move.b     $ff3017.l, d0
016DC4: 4a300000         tst.b      (a0, d0.w)
016DC8: 6600000e         bne.w      $16dd8
016DCC: 33fc007c00ff3040 move.w     #$7c, $ff3040.l
016DD4: 600003ee         bra.w      $171c4
016DD8: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016DDE: 67000010         beq.w      $16df0
016DE2: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016DE8: 67000038         beq.w      $16e22
016DEC: 60000070         bra.w      $16e5e
016DF0: 13fc000300ff3216 move.b     #$3, $ff3216.l
016DF8: 42b900ff0500     clr.l      $ff0500.l
016DFE: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
016E08: 243c0000ff00     move.l     #$ff00, d2
016E0E: 610006b2         bsr.w      $174c2
016E12: 13c700ff3217     move.b     d7, $ff3217.l
016E18: 33fc006c00ff3040 move.w     #$6c, $ff3040.l
016E20: 4e75             rts        
016E22: 13fc000300ff3216 move.b     #$3, $ff3216.l
016E2A: 42b900ff0500     clr.l      $ff0500.l
016E30: 13f900ff301700ff0501 move.b     $ff3017.l, $ff0501.l
016E3A: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
016E44: 243c00ffff00     move.l     #$ffff00, d2
016E4A: 61000676         bsr.w      $174c2
016E4E: 13c700ff3217     move.b     d7, $ff3217.l
016E54: 33fc006c00ff3040 move.w     #$6c, $ff3040.l
016E5C: 4e75             rts        
016E5E: 423900ff3216     clr.b      $ff3216.l
016E64: 423900ff3217     clr.b      $ff3217.l
016E6A: 4e75             rts        

; ==== sub_016E6C ТАБЛИЦА зовут=0 ====
016E6C: 61000604         bsr.w      $17472
016E70: 41f900ff301a     lea.l      $ff301a.l, a0
016E76: 7000             moveq      #$0, d0
016E78: 103900ff3017     move.b     $ff3017.l, d0
016E7E: 4a300000         tst.b      (a0, d0.w)
016E82: 6600000e         bne.w      $16e92
016E86: 33fc007400ff3040 move.w     #$74, $ff3040.l
016E8E: 60000174         bra.w      $17004
016E92: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016E98: 67000010         beq.w      $16eaa
016E9C: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016EA2: 67000038         beq.w      $16edc
016EA6: 60000070         bra.w      $16f18
016EAA: 13fc000400ff3216 move.b     #$4, $ff3216.l
016EB2: 42b900ff0500     clr.l      $ff0500.l
016EB8: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016EC2: 243c000000ff     move.l     #$ff, d2
016EC8: 610005f8         bsr.w      $174c2
016ECC: 13c700ff3217     move.b     d7, $ff3217.l
016ED2: 33fc007000ff3040 move.w     #$70, $ff3040.l
016EDA: 4e75             rts        
016EDC: 13fc000400ff3216 move.b     #$4, $ff3216.l
016EE4: 42b900ff0500     clr.l      $ff0500.l
016EEA: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
016EF4: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
016EFE: 243c0000ffff     move.l     #$ffff, d2
016F04: 610005bc         bsr.w      $174c2
016F08: 13c700ff3217     move.b     d7, $ff3217.l
016F0E: 33fc007000ff3040 move.w     #$70, $ff3040.l
016F16: 4e75             rts        
016F18: 423900ff3216     clr.b      $ff3216.l
016F1E: 423900ff3217     clr.b      $ff3217.l
016F24: 4e75             rts        

; ==== sub_016F26 ТАБЛИЦА зовут=0 ====
016F26: 6100054a         bsr.w      $17472
016F2A: 41f900ff301a     lea.l      $ff301a.l, a0
016F30: 7000             moveq      #$0, d0
016F32: 103900ff3018     move.b     $ff3018.l, d0
016F38: 4a300000         tst.b      (a0, d0.w)
016F3C: 67000096         beq.w      $16fd4
016F40: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
016F46: 67000010         beq.w      $16f58
016F4A: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
016F50: 67000038         beq.w      $16f8a
016F54: 60000070         bra.w      $16fc6
016F58: 13fc000500ff3216 move.b     #$5, $ff3216.l
016F60: 42b900ff0500     clr.l      $ff0500.l
016F66: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016F70: 243c0000ff00     move.l     #$ff00, d2
016F76: 6100054a         bsr.w      $174c2
016F7A: 13c700ff3217     move.b     d7, $ff3217.l
016F80: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016F88: 4e75             rts        
016F8A: 13fc000500ff3216 move.b     #$5, $ff3216.l
016F92: 42b900ff0500     clr.l      $ff0500.l
016F98: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
016FA2: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
016FAC: 243c0000ffff     move.l     #$ffff, d2
016FB2: 6100050e         bsr.w      $174c2
016FB6: 13c700ff3217     move.b     d7, $ff3217.l
016FBC: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
016FC4: 4e75             rts        
016FC6: 423900ff3216     clr.b      $ff3216.l
016FCC: 423900ff3217     clr.b      $ff3217.l
016FD2: 4e75             rts        
016FD4: 610005f8         bsr.w      $175ce
016FD8: 4a40             tst.w      d0
016FDA: 66000004         bne.w      $16fe0
016FDE: 4e75             rts        
016FE0: 61000606         bsr.w      $175e8
016FE4: 4a40             tst.w      d0
016FE6: 66000004         bne.w      $16fec
016FEA: 4e75             rts        
016FEC: 61000616         bsr.w      $17604
016FF0: 4a40             tst.w      d0
016FF2: 66000004         bne.w      $16ff8
016FF6: 4e75             rts        
016FF8: 61000642         bsr.w      $1763c
016FFC: 4a40             tst.w      d0
016FFE: 66000462         bne.w      $17462
017002: 4e75             rts        
017004: 6100046c         bsr.w      $17472
017008: 41f900ff301a     lea.l      $ff301a.l, a0
01700E: 7000             moveq      #$0, d0
017010: 103900ff3018     move.b     $ff3018.l, d0
017016: 4a300000         tst.b      (a0, d0.w)
01701A: 6700009e         beq.w      $170ba
01701E: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
017024: 67000010         beq.w      $17036
017028: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
01702E: 67000038         beq.w      $17068
017032: 60000070         bra.w      $170a4
017036: 13fc000500ff3216 move.b     #$5, $ff3216.l
01703E: 42b900ff0500     clr.l      $ff0500.l
017044: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
01704E: 243c0000ff00     move.l     #$ff00, d2
017054: 6100046c         bsr.w      $174c2
017058: 13c700ff3217     move.b     d7, $ff3217.l
01705E: 33fc007800ff3040 move.w     #$78, $ff3040.l
017066: 4e75             rts        
017068: 13fc000500ff3216 move.b     #$5, $ff3216.l
017070: 42b900ff0500     clr.l      $ff0500.l
017076: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
017080: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
01708A: 243c0000ffff     move.l     #$ffff, d2
017090: 61000430         bsr.w      $174c2
017094: 13c700ff3217     move.b     d7, $ff3217.l
01709A: 33fc007800ff3040 move.w     #$78, $ff3040.l
0170A2: 4e75             rts        
0170A4: 33fc006c00ff3040 move.w     #$6c, $ff3040.l
0170AC: 423900ff3216     clr.b      $ff3216.l
0170B2: 423900ff3217     clr.b      $ff3217.l
0170B8: 4e75             rts        
0170BA: 33fc006c00ff3040 move.w     #$6c, $ff3040.l
0170C2: 6100050a         bsr.w      $175ce
0170C6: 4a40             tst.w      d0
0170C8: 66000004         bne.w      $170ce
0170CC: 4e75             rts        
0170CE: 61000518         bsr.w      $175e8
0170D2: 4a40             tst.w      d0
0170D4: 66000004         bne.w      $170da
0170D8: 4e75             rts        
0170DA: 61000528         bsr.w      $17604
0170DE: 4a40             tst.w      d0
0170E0: 66000380         bne.w      $17462
0170E4: 4e75             rts        

; ==== sub_0170E6 ТАБЛИЦА зовут=0 ====
0170E6: 6100038a         bsr.w      $17472
0170EA: 41f900ff301a     lea.l      $ff301a.l, a0
0170F0: 7000             moveq      #$0, d0
0170F2: 103900ff3017     move.b     $ff3017.l, d0
0170F8: 4a300000         tst.b      (a0, d0.w)
0170FC: 67000096         beq.w      $17194
017100: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
017106: 67000010         beq.w      $17118
01710A: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
017110: 67000038         beq.w      $1714a
017114: 60000070         bra.w      $17186
017118: 13fc000400ff3216 move.b     #$4, $ff3216.l
017120: 42b900ff0500     clr.l      $ff0500.l
017126: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
017130: 243c000000ff     move.l     #$ff, d2
017136: 6100038a         bsr.w      $174c2
01713A: 13c700ff3217     move.b     d7, $ff3217.l
017140: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
017148: 4e75             rts        
01714A: 13fc000400ff3216 move.b     #$4, $ff3216.l
017152: 42b900ff0500     clr.l      $ff0500.l
017158: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
017162: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
01716C: 243c0000ffff     move.l     #$ffff, d2
017172: 6100034e         bsr.w      $174c2
017176: 13c700ff3217     move.b     d7, $ff3217.l
01717C: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
017184: 4e75             rts        
017186: 423900ff3216     clr.b      $ff3216.l
01718C: 423900ff3217     clr.b      $ff3217.l
017192: 4e75             rts        
017194: 61000438         bsr.w      $175ce
017198: 4a40             tst.w      d0
01719A: 66000004         bne.w      $171a0
01719E: 4e75             rts        
0171A0: 61000446         bsr.w      $175e8
0171A4: 4a40             tst.w      d0
0171A6: 66000004         bne.w      $171ac
0171AA: 4e75             rts        
0171AC: 61000456         bsr.w      $17604
0171B0: 4a40             tst.w      d0
0171B2: 66000004         bne.w      $171b8
0171B6: 4e75             rts        
0171B8: 6100049e         bsr.w      $17658
0171BC: 4a40             tst.w      d0
0171BE: 660002a2         bne.w      $17462
0171C2: 4e75             rts        
0171C4: 610002ac         bsr.w      $17472
0171C8: 41f900ff301a     lea.l      $ff301a.l, a0
0171CE: 7000             moveq      #$0, d0
0171D0: 103900ff3018     move.b     $ff3018.l, d0
0171D6: 4a300000         tst.b      (a0, d0.w)
0171DA: 6700009e         beq.w      $1727a
0171DE: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0171E4: 67000010         beq.w      $171f6
0171E8: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0171EE: 67000038         beq.w      $17228
0171F2: 60000070         bra.w      $17264
0171F6: 13fc000500ff3216 move.b     #$5, $ff3216.l
0171FE: 42b900ff0500     clr.l      $ff0500.l
017204: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
01720E: 243c0000ff00     move.l     #$ff00, d2
017214: 610002ac         bsr.w      $174c2
017218: 13c700ff3217     move.b     d7, $ff3217.l
01721E: 33fc008000ff3040 move.w     #$80, $ff3040.l
017226: 4e75             rts        
017228: 13fc000500ff3216 move.b     #$5, $ff3216.l
017230: 42b900ff0500     clr.l      $ff0500.l
017236: 13f900ff301800ff0502 move.b     $ff3018.l, $ff0502.l
017240: 13f900ff301800ff0503 move.b     $ff3018.l, $ff0503.l
01724A: 243c0000ffff     move.l     #$ffff, d2
017250: 61000270         bsr.w      $174c2
017254: 13c700ff3217     move.b     d7, $ff3217.l
01725A: 33fc008000ff3040 move.w     #$80, $ff3040.l
017262: 4e75             rts        
017264: 33fc006800ff3040 move.w     #$68, $ff3040.l
01726C: 423900ff3216     clr.b      $ff3216.l
017272: 423900ff3217     clr.b      $ff3217.l
017278: 4e75             rts        
01727A: 33fc006800ff3040 move.w     #$68, $ff3040.l
017282: 6100034a         bsr.w      $175ce
017286: 4a40             tst.w      d0
017288: 66000004         bne.w      $1728e
01728C: 4e75             rts        
01728E: 61000358         bsr.w      $175e8
017292: 4a40             tst.w      d0
017294: 66000004         bne.w      $1729a
017298: 4e75             rts        
01729A: 61000368         bsr.w      $17604
01729E: 4a40             tst.w      d0
0172A0: 660001c0         bne.w      $17462
0172A4: 4e75             rts        

; ==== sub_0172A6 ТАБЛИЦА зовут=0 ====
0172A6: 610001ca         bsr.w      $17472
0172AA: 41f900ff301a     lea.l      $ff301a.l, a0
0172B0: 7000             moveq      #$0, d0
0172B2: 103900ff3017     move.b     $ff3017.l, d0
0172B8: 4a300000         tst.b      (a0, d0.w)
0172BC: 67000096         beq.w      $17354
0172C0: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0172C6: 67000010         beq.w      $172d8
0172CA: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0172D0: 67000038         beq.w      $1730a
0172D4: 60000070         bra.w      $17346
0172D8: 13fc000300ff3216 move.b     #$3, $ff3216.l
0172E0: 42b900ff0500     clr.l      $ff0500.l
0172E6: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
0172F0: 243c0000ff00     move.l     #$ff00, d2
0172F6: 610001ca         bsr.w      $174c2
0172FA: 13c700ff3217     move.b     d7, $ff3217.l
017300: 33fc008400ff3040 move.w     #$84, $ff3040.l
017308: 4e75             rts        
01730A: 13fc000300ff3216 move.b     #$3, $ff3216.l
017312: 42b900ff0500     clr.l      $ff0500.l
017318: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
017322: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
01732C: 243c0000ffff     move.l     #$ffff, d2
017332: 6100018e         bsr.w      $174c2
017336: 13c700ff3217     move.b     d7, $ff3217.l
01733C: 33fc008400ff3040 move.w     #$84, $ff3040.l
017344: 4e75             rts        
017346: 423900ff3216     clr.b      $ff3216.l
01734C: 423900ff3217     clr.b      $ff3217.l
017352: 4e75             rts        
017354: 61000278         bsr.w      $175ce
017358: 4a40             tst.w      d0
01735A: 66000004         bne.w      $17360
01735E: 4e75             rts        
017360: 61000286         bsr.w      $175e8
017364: 4a40             tst.w      d0
017366: 66000004         bne.w      $1736c
01736A: 4e75             rts        
01736C: 61000296         bsr.w      $17604
017370: 4a40             tst.w      d0
017372: 66000004         bne.w      $17378
017376: 4e75             rts        
017378: 610002de         bsr.w      $17658
01737C: 4a40             tst.w      d0
01737E: 660000e2         bne.w      $17462
017382: 4e75             rts        

; ==== sub_017384 ТАБЛИЦА зовут=0 ====
017384: 610000ec         bsr.w      $17472
017388: 41f900ff301a     lea.l      $ff301a.l, a0
01738E: 7000             moveq      #$0, d0
017390: 103900ff3017     move.b     $ff3017.l, d0
017396: 4a300000         tst.b      (a0, d0.w)
01739A: 67000096         beq.w      $17432
01739E: 0c3000010000     cmpi.b     #$1, (a0, d0.w)
0173A4: 67000010         beq.w      $173b6
0173A8: 0c3000020000     cmpi.b     #$2, (a0, d0.w)
0173AE: 67000038         beq.w      $173e8
0173B2: 60000070         bra.w      $17424
0173B6: 13fc000400ff3216 move.b     #$4, $ff3216.l
0173BE: 42b900ff0500     clr.l      $ff0500.l
0173C4: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
0173CE: 243c000000ff     move.l     #$ff, d2
0173D4: 610000ec         bsr.w      $174c2
0173D8: 13c700ff3217     move.b     d7, $ff3217.l
0173DE: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
0173E6: 4e75             rts        
0173E8: 13fc000400ff3216 move.b     #$4, $ff3216.l
0173F0: 42b900ff0500     clr.l      $ff0500.l
0173F6: 13f900ff301700ff0502 move.b     $ff3017.l, $ff0502.l
017400: 13f900ff301700ff0503 move.b     $ff3017.l, $ff0503.l
01740A: 243c0000ffff     move.l     #$ffff, d2
017410: 610000b0         bsr.w      $174c2
017414: 13c700ff3217     move.b     d7, $ff3217.l
01741A: 33fc005c00ff3040 move.w     #$5c, $ff3040.l
017422: 4e75             rts        
017424: 423900ff3216     clr.b      $ff3216.l
01742A: 423900ff3217     clr.b      $ff3217.l
017430: 4e75             rts        
017432: 6100019a         bsr.w      $175ce
017436: 4a40             tst.w      d0
017438: 66000004         bne.w      $1743e
01743C: 4e75             rts        
01743E: 610001a8         bsr.w      $175e8
017442: 4a40             tst.w      d0
017444: 66000004         bne.w      $1744a
017448: 4e75             rts        
01744A: 610001b8         bsr.w      $17604
01744E: 4a40             tst.w      d0
017450: 66000004         bne.w      $17456
017454: 4e75             rts        
017456: 61000200         bsr.w      $17658
01745A: 4a40             tst.w      d0
01745C: 66000004         bne.w      $17462
017460: 4e75             rts        
017462: 33fc001000ff3210 move.w     #$10, $ff3210.l
01746A: 423900ff3042     clr.b      $ff3042.l
017470: 4e75             rts        

; ==== sub_017472 зовут=30 ====
017472: 41f900ff301a     lea.l      $ff301a.l, a0
017478: 4290             clr.l      (a0)
01747A: 42a80004         clr.l      $4(a0)
01747E: 7000             moveq      #$0, d0
017480: 102e0101         move.b     $101(a6), d0
017484: 52300000         addq.b     #$1, (a0, d0.w)
017488: 102e0121         move.b     $121(a6), d0
01748C: 52300000         addq.b     #$1, (a0, d0.w)
017490: 102e0141         move.b     $141(a6), d0
017494: 52300000         addq.b     #$1, (a0, d0.w)
017498: 4e75             rts        

; ==== sub_01749A зовут=2 ====
01749A: 41f900ff301a     lea.l      $ff301a.l, a0
0174A0: 4290             clr.l      (a0)
0174A2: 42a80004         clr.l      $4(a0)
0174A6: 7000             moveq      #$0, d0
0174A8: 102e00cf         move.b     $cf(a6), d0
0174AC: 52300000         addq.b     #$1, (a0, d0.w)
0174B0: 102e00d1         move.b     $d1(a6), d0
0174B4: 52300000         addq.b     #$1, (a0, d0.w)
0174B8: 102e00d3         move.b     $d3(a6), d0
0174BC: 52300000         addq.b     #$1, (a0, d0.w)
0174C0: 4e75             rts        

; ==== sub_0174C2 зовут=67 ====
0174C2: 7e00             moveq      #$0, d7
0174C4: 423900ff0504     clr.b      $ff0504.l
0174CA: 13ee010100ff0505 move.b     $101(a6), $ff0505.l
0174D2: 13ee012100ff0506 move.b     $121(a6), $ff0506.l
0174DA: 13ee014100ff0507 move.b     $141(a6), $ff0507.l
0174E2: 203900ff0504     move.l     $ff0504.l, d0
0174E8: c082             and.l      d2, d0
0174EA: 223900ff0500     move.l     $ff0500.l, d1
0174F0: c282             and.l      d2, d1
0174F2: b081             cmp.l      d1, d0
0174F4: 66000004         bne.w      $174fa
0174F8: 4e75             rts        
0174FA: 7e01             moveq      #$1, d7
0174FC: 13ee014100ff0505 move.b     $141(a6), $ff0505.l
017504: 13ee010100ff0506 move.b     $101(a6), $ff0506.l
01750C: 13ee012100ff0507 move.b     $121(a6), $ff0507.l
017514: 203900ff0504     move.l     $ff0504.l, d0
01751A: c082             and.l      d2, d0
01751C: 223900ff0500     move.l     $ff0500.l, d1
017522: c282             and.l      d2, d1
017524: b081             cmp.l      d1, d0
017526: 66000004         bne.w      $1752c
01752A: 4e75             rts        
01752C: 7e02             moveq      #$2, d7
01752E: 13ee012100ff0505 move.b     $121(a6), $ff0505.l
017536: 13ee014100ff0506 move.b     $141(a6), $ff0506.l
01753E: 13ee010100ff0507 move.b     $101(a6), $ff0507.l
017546: 4e75             rts        

; ==== sub_017548 зовут=7 ====
017548: 7e00             moveq      #$0, d7
01754A: 423900ff0504     clr.b      $ff0504.l
017550: 13ee00cf00ff0505 move.b     $cf(a6), $ff0505.l
017558: 13ee00d100ff0506 move.b     $d1(a6), $ff0506.l
017560: 13ee00d300ff0507 move.b     $d3(a6), $ff0507.l
017568: 203900ff0504     move.l     $ff0504.l, d0
01756E: c082             and.l      d2, d0
017570: 223900ff0500     move.l     $ff0500.l, d1
017576: c282             and.l      d2, d1
017578: b081             cmp.l      d1, d0
01757A: 66000004         bne.w      $17580
01757E: 4e75             rts        
017580: 7e01             moveq      #$1, d7
017582: 13ee00d300ff0505 move.b     $d3(a6), $ff0505.l
01758A: 13ee00cf00ff0506 move.b     $cf(a6), $ff0506.l
017592: 13ee00d100ff0507 move.b     $d1(a6), $ff0507.l
01759A: 203900ff0504     move.l     $ff0504.l, d0
0175A0: c082             and.l      d2, d0
0175A2: 223900ff0500     move.l     $ff0500.l, d1
0175A8: c282             and.l      d2, d1
0175AA: b081             cmp.l      d1, d0
0175AC: 66000004         bne.w      $175b2
0175B0: 4e75             rts        
0175B2: 7e02             moveq      #$2, d7
0175B4: 13ee00d100ff0505 move.b     $d1(a6), $ff0505.l
0175BC: 13ee00d300ff0506 move.b     $d3(a6), $ff0506.l
0175C4: 13ee00cf00ff0507 move.b     $cf(a6), $ff0507.l
0175CC: 4e75             rts        

; ==== sub_0175CE зовут=19 ====
0175CE: 7000             moveq      #$0, d0
0175D0: 423900ff3216     clr.b      $ff3216.l
0175D6: 423900ff3217     clr.b      $ff3217.l
0175DC: 4a2e02c1         tst.b      $2c1(a6)
0175E0: 67000004         beq.w      $175e6
0175E4: 7001             moveq      #$1, d0
0175E6: 4e75             rts        

; ==== sub_0175E8 зовут=20 ====
0175E8: 7000             moveq      #$0, d0
0175EA: 13fc000100ff3216 move.b     #$1, $ff3216.l
0175F2: 423900ff3217     clr.b      $ff3217.l
0175F8: 4a2e02c3         tst.b      $2c3(a6)
0175FC: 67000004         beq.w      $17602
017600: 7001             moveq      #$1, d0
017602: 4e75             rts        

; ==== sub_017604 зовут=16 ====
017604: 7000             moveq      #$0, d0
017606: 13fc000200ff3216 move.b     #$2, $ff3216.l
01760E: 423900ff3217     clr.b      $ff3217.l
017614: 4a2e02c5         tst.b      $2c5(a6)
017618: 67000004         beq.w      $1761e
01761C: 7001             moveq      #$1, d0
01761E: 4e75             rts        

; ==== sub_017620 зовут=3 ====
017620: 7000             moveq      #$0, d0
017622: 13fc000300ff3216 move.b     #$3, $ff3216.l
01762A: 423900ff3217     clr.b      $ff3217.l
017630: 4a2e02c7         tst.b      $2c7(a6)
017634: 67000004         beq.w      $1763a
017638: 7001             moveq      #$1, d0
01763A: 4e75             rts        

; ==== sub_01763C зовут=3 ====
01763C: 7000             moveq      #$0, d0
01763E: 13fc000400ff3216 move.b     #$4, $ff3216.l
017646: 423900ff3217     clr.b      $ff3217.l
01764C: 4a2e02c9         tst.b      $2c9(a6)
017650: 67000004         beq.w      $17656
017654: 7001             moveq      #$1, d0
017656: 4e75             rts        

; ==== sub_017658 зовут=18 ====
017658: 7000             moveq      #$0, d0
01765A: 13fc000500ff3216 move.b     #$5, $ff3216.l
017662: 423900ff3217     clr.b      $ff3217.l
017668: 4a2e02cb         tst.b      $2cb(a6)
01766C: 67000004         beq.w      $17672
017670: 7001             moveq      #$1, d0
017672: 4e75             rts        

; ---- ДАННЫЕ $017674..$018E1A (6054 байт) ----


; ==== sub_018E1A ТАБЛИЦА зовут=0 ====
018E1A: 0839000700ffe00d btst.b     #$7, $ffe00d.l
018E22: 67000036         beq.w      $18e5a
018E26: 41f900ff0000     lea.l      $ff0000.l, a0
018E2C: 303c383f         move.w     #$383f, d0
018E30: 4298             clr.l      (a0)+
018E32: 51c8fffc         dbra       d0, $18e30
018E36: 13fc000100ff4100 move.b     #$1, $ff4100.l
018E3E: 4eb900003940     jsr        $3940.l
018E44: 4eb90000079e     jsr        $79e.l
018E4A: 4eb900000ee2     jsr        $ee2.l
018E50: 33fc000800ff0406 move.w     #$8, $ff0406.l
018E58: 4e75             rts        
018E5A: 4eb9000078a6     jsr        $78a6.l
018E60: 13fc000100ff0400 move.b     #$1, $ff0400.l
018E68: 527900ff4104     addq.w     #$1, $ff4104.l
018E6E: 303900ff4102     move.w     $ff4102.l, d0
018E74: 41fa0008         lea.l      $18e7e(pc), a0
018E78: 20700000         movea.l    (a0, d0.w), a0
018E7C: 4ed0             jmp        (a0)

; ---- ДАННЫЕ $018E7E..$018EFE (128 байт) ----


; ==== sub_018EFE ТАБЛИЦА зовут=0 ====
018EFE: 41fa0ce8         lea.l      $19be8(pc), a0
018F02: 43f900ff8a22     lea.l      $ff8a22.l, a1
018F08: 7e05             moveq      #$5, d7
018F0A: 7c06             moveq      #$6, d6
018F0C: 4eb900010fdc     jsr        $10fdc.l
018F12: 33fc000400ff4102 move.w     #$4, $ff4102.l
018F1A: 4e75             rts        

; ==== sub_018F1C ТАБЛИЦА зовут=0 ====
018F1C: 6100086e         bsr.w      $1978c
018F20: 6100090a         bsr.w      $1982c
018F24: 33fc000800ff4102 move.w     #$8, $ff4102.l
018F2C: 41f900017674     lea.l      $17674.l, a0
018F32: 61000c4e         bsr.w      $19b82
018F36: 427900ff0500     clr.w      $ff0500.l
018F3C: 33fc001000ff0502 move.w     #$10, $ff0502.l
018F44: 4e75             rts        

; ==== sub_018F46 ТАБЛИЦА зовут=0 ====
018F46: 4a3900ff04d8     tst.b      $ff04d8.l
018F4C: 66000008         bne.w      $18f56
018F50: 4ef900013366     jmp        $13366.l
018F56: 61000c48         bsr.w      $19ba0
018F5A: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
018F62: 66000014         bne.w      $18f78
018F66: 33fc000c00ff4102 move.w     #$c, $ff4102.l
018F6E: 41f900017764     lea.l      $17764.l, a0
018F74: 61000c0c         bsr.w      $19b82
018F78: 4e75             rts        

; ==== sub_018F7A ТАБЛИЦА зовут=0 ====
018F7A: 4a3900ff04d8     tst.b      $ff04d8.l
018F80: 66000008         bne.w      $18f8a
018F84: 4ef900013366     jmp        $13366.l
018F8A: 61000878         bsr.w      $19804
018F8E: 4df900ff1000     lea.l      $ff1000.l, a6
018F94: 4eb90000dfae     jsr        $dfae.l
018F9A: 4dee0400         lea.l      $400(a6), a6
018F9E: 3d7c001e005a     move.w     #$1e, $5a(a6)
018FA4: 4eb90000dfae     jsr        $dfae.l
018FAA: 610008a8         bsr.w      $19854
018FAE: 33fc001000ff4102 move.w     #$10, $ff4102.l
018FB6: 41f9000177dc     lea.l      $177dc.l, a0
018FBC: 61000bc4         bsr.w      $19b82
018FC0: 4e75             rts        

; ==== sub_018FC2 ТАБЛИЦА зовут=0 ====
018FC2: 6100075a         bsr.w      $1971e
018FC6: 4a3900ff04d8     tst.b      $ff04d8.l
018FCC: 66000008         bne.w      $18fd6
018FD0: 4ef900013366     jmp        $13366.l
018FD6: 61000890         bsr.w      $19868
018FDA: 610007b0         bsr.w      $1978c
018FDE: 6100084c         bsr.w      $1982c
018FE2: 610007d0         bsr.w      $197b4
018FE6: 33fc001400ff4102 move.w     #$14, $ff4102.l
018FEE: 41f9000179e2     lea.l      $179e2.l, a0
018FF4: 61000b8c         bsr.w      $19b82
018FF8: 4e75             rts        

; ==== sub_018FFA ТАБЛИЦА зовут=0 ====
018FFA: 61000808         bsr.w      $19804
018FFE: 6100071e         bsr.w      $1971e
019002: 61000788         bsr.w      $1978c
019006: 4a3900ff04d8     tst.b      $ff04d8.l
01900C: 66000010         bne.w      $1901e
019010: 610007ca         bsr.w      $197dc
019014: 4eb900013366     jsr        $13366.l
01901A: 60000798         bra.w      $197b4
01901E: 610007bc         bsr.w      $197dc
019022: 427900ff0500     clr.w      $ff0500.l
019028: 33fc001000ff0502 move.w     #$10, $ff0502.l
019030: 33fc001800ff4102 move.w     #$18, $ff4102.l
019038: 4e75             rts        

; ==== sub_01903A ТАБЛИЦА зовут=0 ====
01903A: 61000b64         bsr.w      $19ba0
01903E: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
019046: 66000014         bne.w      $1905c
01904A: 33fc001c00ff4102 move.w     #$1c, $ff4102.l
019052: 41f900017b0a     lea.l      $17b0a.l, a0
019058: 61000b28         bsr.w      $19b82
01905C: 4e75             rts        

; ==== sub_01905E ТАБЛИЦА зовут=0 ====
01905E: 4a3900ff04d8     tst.b      $ff04d8.l
019064: 66000008         bne.w      $1906e
019068: 4ef900013366     jmp        $13366.l
01906E: 41f900017b66     lea.l      $17b66.l, a0
019074: 61000b0c         bsr.w      $19b82
019078: 41f900ff0100     lea.l      $ff0100.l, a0
01907E: 30bc00c0         move.w     #$c0, (a0)
019082: 303c0500         move.w     #$500, d0
019086: 32280002         move.w     $2(a0), d1
01908A: 8240             or.w       d0, d1
01908C: 31410002         move.w     d1, $2(a0)
019090: 317c233f0004     move.w     #$233f, $4(a0)
019096: 317c00ec0006     move.w     #$ec, $6(a0)
01909C: 423900ff0500     clr.b      $ff0500.l
0190A2: 33fc002000ff4102 move.w     #$20, $ff4102.l
0190AA: 4e75             rts        

; ==== sub_0190AC ТАБЛИЦА зовут=0 ====
0190AC: 523900ff0500     addq.b     #$1, $ff0500.l
0190B2: 33fc00c000ff0100 move.w     #$c0, $ff0100.l
0190BA: 0839000400ff0500 btst.b     #$4, $ff0500.l
0190C2: 67000008         beq.w      $190cc
0190C6: 427900ff0100     clr.w      $ff0100.l
0190CC: 13fc000100ff040d move.b     #$1, $ff040d.l
0190D4: 4a3900ff04d8     tst.b      $ff04d8.l
0190DA: 66000008         bne.w      $190e4
0190DE: 4ef900013366     jmp        $13366.l
0190E4: 41f900017c0e     lea.l      $17c0e.l, a0
0190EA: 61000a96         bsr.w      $19b82
0190EE: 33fc002400ff4102 move.w     #$24, $ff4102.l
0190F6: 33fc00c000ff0100 move.w     #$c0, $ff0100.l
0190FE: 4e75             rts        

; ==== sub_019100 ТАБЛИЦА зовут=0 ====
019100: 61000702         bsr.w      $19804
019104: 61000618         bsr.w      $1971e
019108: 61000682         bsr.w      $1978c
01910C: 4a3900ff04d8     tst.b      $ff04d8.l
019112: 66000010         bne.w      $19124
019116: 610006c4         bsr.w      $197dc
01911A: 4eb900013366     jsr        $13366.l
019120: 60000692         bra.w      $197b4
019124: 610006b6         bsr.w      $197dc
019128: 41f900017d88     lea.l      $17d88.l, a0
01912E: 61000a52         bsr.w      $19b82
019132: 423900ff0508     clr.b      $ff0508.l
019138: 33fc002800ff4102 move.w     #$28, $ff4102.l
019140: 427900ff0500     clr.w      $ff0500.l
019146: 33fc001000ff0502 move.w     #$10, $ff0502.l
01914E: 4e75             rts        

; ==== sub_019150 ТАБЛИЦА зовут=0 ====
019150: 523900ff0508     addq.b     #$1, $ff0508.l
019156: 33fc00c000ff0100 move.w     #$c0, $ff0100.l
01915E: 0839000400ff0508 btst.b     #$4, $ff0508.l
019166: 67000008         beq.w      $19170
01916A: 427900ff0100     clr.w      $ff0100.l
019170: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
019178: 67000006         beq.w      $19180
01917C: 61000a22         bsr.w      $19ba0
019180: 61000682         bsr.w      $19804
019184: 61000598         bsr.w      $1971e
019188: 61000602         bsr.w      $1978c
01918C: 4a3900ff04d8     tst.b      $ff04d8.l
019192: 66000010         bne.w      $191a4
019196: 61000644         bsr.w      $197dc
01919A: 4eb900013366     jsr        $13366.l
0191A0: 60000612         bra.w      $197b4
0191A4: 427900ff0100     clr.w      $ff0100.l
0191AA: 61000630         bsr.w      $197dc
0191AE: 41f900017dda     lea.l      $17dda.l, a0
0191B4: 610009cc         bsr.w      $19b82
0191B8: 33fc002c00ff4102 move.w     #$2c, $ff4102.l
0191C0: 4e75             rts        

; ==== sub_0191C2 ТАБЛИЦА зовут=0 ====
0191C2: 4a3900ff04d8     tst.b      $ff04d8.l
0191C8: 66000008         bne.w      $191d2
0191CC: 4ef900013366     jmp        $13366.l
0191D2: 61000630         bsr.w      $19804
0191D6: 6100067c         bsr.w      $19854
0191DA: 41f900017e76     lea.l      $17e76.l, a0
0191E0: 610009a0         bsr.w      $19b82
0191E4: 33fc003000ff4102 move.w     #$30, $ff4102.l
0191EC: 4e75             rts        

; ==== sub_0191EE ТАБЛИЦА зовут=0 ====
0191EE: 6100052e         bsr.w      $1971e
0191F2: 4a3900ff04d8     tst.b      $ff04d8.l
0191F8: 66000008         bne.w      $19202
0191FC: 4ef900013366     jmp        $13366.l
019202: 33fc003c00ff0500 move.w     #$3c, $ff0500.l
01920A: 33fc003400ff4102 move.w     #$34, $ff4102.l
019212: 4e75             rts        

; ==== sub_019214 ТАБЛИЦА зовут=0 ====
019214: 537900ff0500     subq.w     #$1, $ff0500.l
01921A: 67000004         beq.w      $19220
01921E: 4e75             rts        
019220: 61000646         bsr.w      $19868
019224: 61000566         bsr.w      $1978c
019228: 61000602         bsr.w      $1982c
01922C: 61000586         bsr.w      $197b4
019230: 41f900017ea6     lea.l      $17ea6.l, a0
019236: 6100094a         bsr.w      $19b82
01923A: 33fc003800ff4102 move.w     #$38, $ff4102.l
019242: 4e75             rts        

; ==== sub_019244 ТАБЛИЦА зовут=0 ====
019244: 4a3900ff04d8     tst.b      $ff04d8.l
01924A: 66000008         bne.w      $19254
01924E: 4ef900013366     jmp        $13366.l
019254: 41f900017f06     lea.l      $17f06.l, a0
01925A: 61000926         bsr.w      $19b82
01925E: 41f900ff0100     lea.l      $ff0100.l, a0
019264: 30bc0148         move.w     #$148, (a0)
019268: 317c01400006     move.w     #$140, $6(a0)
01926E: 423900ff0508     clr.b      $ff0508.l
019274: 13fc000100ff040d move.b     #$1, $ff040d.l
01927C: 33fc003c00ff4102 move.w     #$3c, $ff4102.l
019284: 4e75             rts        

; ==== sub_019286 ТАБЛИЦА зовут=0 ====
019286: 13fc000100ff040d move.b     #$1, $ff040d.l
01928E: 523900ff0508     addq.b     #$1, $ff0508.l
019294: 33fc014800ff0100 move.w     #$148, $ff0100.l
01929C: 0839000400ff0508 btst.b     #$4, $ff0508.l
0192A4: 67000008         beq.w      $192ae
0192A8: 427900ff0100     clr.w      $ff0100.l
0192AE: 4a3900ff04d8     tst.b      $ff04d8.l
0192B4: 66000008         bne.w      $192be
0192B8: 4ef900013366     jmp        $13366.l
0192BE: 41f900018056     lea.l      $18056.l, a0
0192C4: 610008bc         bsr.w      $19b82
0192C8: 427900ff0100     clr.w      $ff0100.l
0192CE: 33fc004000ff4102 move.w     #$40, $ff4102.l
0192D6: 4e75             rts        

; ==== sub_0192D8 ТАБЛИЦА зовут=0 ====
0192D8: 4a3900ff04d8     tst.b      $ff04d8.l
0192DE: 66000008         bne.w      $192e8
0192E2: 4ef900013366     jmp        $13366.l
0192E8: 427900ff0500     clr.w      $ff0500.l
0192EE: 33fc001000ff0502 move.w     #$10, $ff0502.l
0192F6: 33fc004400ff4102 move.w     #$44, $ff4102.l
0192FE: 4e75             rts        

; ==== sub_019300 ТАБЛИЦА зовут=0 ====
019300: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
019308: 67000006         beq.w      $19310
01930C: 60000892         bra.w      $19ba0
019310: 41f90001822a     lea.l      $1822a.l, a0
019316: 6100086a         bsr.w      $19b82
01931A: 33fc004800ff4102 move.w     #$48, $ff4102.l
019322: 4e75             rts        

; ==== sub_019324 ТАБЛИЦА зовут=0 ====
019324: 4a3900ff04d8     tst.b      $ff04d8.l
01932A: 66000008         bne.w      $19334
01932E: 4ef900013366     jmp        $13366.l
019334: 6100047e         bsr.w      $197b4
019338: 33fc004c00ff4102 move.w     #$4c, $ff4102.l
019340: 33fc00f000ff0508 move.w     #$f0, $ff0508.l
019348: 41f900018328     lea.l      $18328.l, a0
01934E: 61000832         bsr.w      $19b82
019352: 4e75             rts        

; ==== sub_019354 ТАБЛИЦА зовут=0 ====
019354: 610004ae         bsr.w      $19804
019358: 610003c4         bsr.w      $1971e
01935C: 6100042e         bsr.w      $1978c
019360: 6100047a         bsr.w      $197dc
019364: 4a3900ff04d8     tst.b      $ff04d8.l
01936A: 66000006         bne.w      $19372
01936E: 61009ff6         bsr.w      $13366
019372: 61000440         bsr.w      $197b4
019376: 537900ff0508     subq.w     #$1, $ff0508.l
01937C: 67000004         beq.w      $19382
019380: 4e75             rts        
019382: 41f900ff0100     lea.l      $ff0100.l, a0
019388: 30bc00c0         move.w     #$c0, (a0)
01938C: 317c00ec0006     move.w     #$ec, $6(a0)
019392: 423900ff0508     clr.b      $ff0508.l
019398: 41f900018366     lea.l      $18366.l, a0
01939E: 4eb900019b82     jsr        $19b82.l
0193A4: 33fc005000ff4102 move.w     #$50, $ff4102.l
0193AC: 4e75             rts        

; ==== sub_0193AE ТАБЛИЦА зовут=0 ====
0193AE: 13fc000100ff040d move.b     #$1, $ff040d.l
0193B6: 523900ff0508     addq.b     #$1, $ff0508.l
0193BC: 33fc00c000ff0100 move.w     #$c0, $ff0100.l
0193C4: 0839000400ff0508 btst.b     #$4, $ff0508.l
0193CC: 67000008         beq.w      $193d6
0193D0: 427900ff0100     clr.w      $ff0100.l
0193D6: 4a3900ff04d8     tst.b      $ff04d8.l
0193DC: 66000008         bne.w      $193e6
0193E0: 4ef900013366     jmp        $13366.l
0193E6: 610003cc         bsr.w      $197b4
0193EA: 33fc002600ff0508 move.w     #$26, $ff0508.l
0193F2: 33fc005400ff4102 move.w     #$54, $ff4102.l
0193FA: 4e75             rts        

; ==== sub_0193FC ТАБЛИЦА зовут=0 ====
0193FC: 61000406         bsr.w      $19804
019400: 6100031c         bsr.w      $1971e
019404: 61000386         bsr.w      $1978c
019408: 610003d2         bsr.w      $197dc
01940C: 610003a6         bsr.w      $197b4
019410: 537900ff0508     subq.w     #$1, $ff0508.l
019416: 67000004         beq.w      $1941c
01941A: 4e75             rts        
01941C: 41f9000183d0     lea.l      $183d0.l, a0
019422: 4eb900019b82     jsr        $19b82.l
019428: 423900ff0508     clr.b      $ff0508.l
01942E: 33fc009800ff0100 move.w     #$98, $ff0100.l
019436: 13fc000100ff040d move.b     #$1, $ff040d.l
01943E: 33fc005800ff4102 move.w     #$58, $ff4102.l
019446: 4e75             rts        

; ==== sub_019448 ТАБЛИЦА зовут=0 ====
019448: 13fc000100ff040d move.b     #$1, $ff040d.l
019450: 523900ff0508     addq.b     #$1, $ff0508.l
019456: 33fc009800ff0100 move.w     #$98, $ff0100.l
01945E: 0839000400ff0508 btst.b     #$4, $ff0508.l
019466: 67000008         beq.w      $19470
01946A: 427900ff0100     clr.w      $ff0100.l
019470: 4a3900ff04d8     tst.b      $ff04d8.l
019476: 6600003c         bne.w      $194b4
01947A: 4eb900013366     jsr        $13366.l
019480: 4df900ff1000     lea.l      $ff1000.l, a6
019486: 522e0093         addq.b     #$1, $93(a6)
01948A: 0c2e00060093     cmpi.b     #$6, $93(a6)
019490: 66000010         bne.w      $194a2
019494: 422e0093         clr.b      $93(a6)
019498: 522e0092         addq.b     #$1, $92(a6)
01949C: 022e00070092     andi.b     #$7, $92(a6)
0194A2: 4eb90000e62c     jsr        $e62c.l
0194A8: 4df900ff1400     lea.l      $ff1400.l, a6
0194AE: 4ef90000e62c     jmp        $e62c.l
0194B4: 610002fe         bsr.w      $197b4
0194B8: 427900ff0100     clr.w      $ff0100.l
0194BE: 33fc005c00ff4102 move.w     #$5c, $ff4102.l
0194C6: 33fc010000ff0508 move.w     #$100, $ff0508.l
0194CE: 4e75             rts        

; ==== sub_0194D0 ТАБЛИЦА зовут=0 ====
0194D0: 61000332         bsr.w      $19804
0194D4: 61000248         bsr.w      $1971e
0194D8: 610002b2         bsr.w      $1978c
0194DC: 610002fe         bsr.w      $197dc
0194E0: 610002d2         bsr.w      $197b4
0194E4: 537900ff0508     subq.w     #$1, $ff0508.l
0194EA: 6600001a         bne.w      $19506
0194EE: 41f9000184ec     lea.l      $184ec.l, a0
0194F4: 4eb900019b82     jsr        $19b82.l
0194FA: 33fc006000ff4102 move.w     #$60, $ff4102.l
019502: 610002d8         bsr.w      $197dc
019506: 4e75             rts        

; ==== sub_019508 ТАБЛИЦА зовут=0 ====
019508: 4a3900ff04d8     tst.b      $ff04d8.l
01950E: 66000008         bne.w      $19518
019512: 4ef900013366     jmp        $13366.l
019518: 6100029a         bsr.w      $197b4
01951C: 33fc016000ff0508 move.w     #$160, $ff0508.l
019524: 33fc006400ff4102 move.w     #$64, $ff4102.l
01952C: 4e75             rts        

; ==== sub_01952E ТАБЛИЦА зовут=0 ====
01952E: 610002d4         bsr.w      $19804
019532: 610001ea         bsr.w      $1971e
019536: 61000254         bsr.w      $1978c
01953A: 610002a0         bsr.w      $197dc
01953E: 61000274         bsr.w      $197b4
019542: 537900ff0508     subq.w     #$1, $ff0508.l
019548: 67000004         beq.w      $1954e
01954C: 4e75             rts        
01954E: 41f900018682     lea.l      $18682.l, a0
019554: 6100062c         bsr.w      $19b82
019558: 33fc006800ff4102 move.w     #$68, $ff4102.l
019560: 4e75             rts        

; ==== sub_019562 ТАБЛИЦА зовут=0 ====
019562: 4a3900ff04d8     tst.b      $ff04d8.l
019568: 66000008         bne.w      $19572
01956C: 4ef900013366     jmp        $13366.l
019572: 61000240         bsr.w      $197b4
019576: 41f90001885a     lea.l      $1885a.l, a0
01957C: 61000604         bsr.w      $19b82
019580: 33fc006c00ff4102 move.w     #$6c, $ff4102.l
019588: 4e75             rts        

; ==== sub_01958A ТАБЛИЦА зовут=0 ====
01958A: 4a3900ff04d8     tst.b      $ff04d8.l
019590: 6600001c         bne.w      $195ae
019594: 6100026e         bsr.w      $19804
019598: 61000184         bsr.w      $1971e
01959C: 610001ee         bsr.w      $1978c
0195A0: 6100023a         bsr.w      $197dc
0195A4: 61009dc0         bsr.w      $13366
0195A8: 6100020a         bsr.w      $197b4
0195AC: 4e75             rts        
0195AE: 61000204         bsr.w      $197b4
0195B2: 33fc007000ff4102 move.w     #$70, $ff4102.l
0195BA: 427900ff0500     clr.w      $ff0500.l
0195C0: 33fc001000ff0502 move.w     #$10, $ff0502.l
0195C8: 4e75             rts        

; ==== sub_0195CA ТАБЛИЦА зовут=0 ====
0195CA: 0c79000300ff0500 cmpi.w     #$3, $ff0500.l
0195D2: 67000006         beq.w      $195da
0195D6: 600005c8         bra.w      $19ba0
0195DA: 41f900018b70     lea.l      $18b70.l, a0
0195E0: 610005a0         bsr.w      $19b82
0195E4: 33fc007400ff4102 move.w     #$74, $ff4102.l
0195EC: 4e75             rts        

; ==== sub_0195EE ТАБЛИЦА зовут=0 ====
0195EE: 4a3900ff04d8     tst.b      $ff04d8.l
0195F4: 66000008         bne.w      $195fe
0195F8: 4ef900013366     jmp        $13366.l
0195FE: 610001b4         bsr.w      $197b4
019602: 33fc007800ff4102 move.w     #$78, $ff4102.l
01960A: 33fc00a400ff0508 move.w     #$a4, $ff0508.l
019612: 4e75             rts        

; ==== sub_019614 ТАБЛИЦА зовут=0 ====
019614: 610001ee         bsr.w      $19804
019618: 61000104         bsr.w      $1971e
01961C: 6100016e         bsr.w      $1978c
019620: 610001ba         bsr.w      $197dc
019624: 6100018e         bsr.w      $197b4
019628: 537900ff0508     subq.w     #$1, $ff0508.l
01962E: 67000004         beq.w      $19634
019632: 4e75             rts        
019634: 6100017e         bsr.w      $197b4
019638: 13fc000200ff10a6 move.b     #$2, $ff10a6.l
019640: 33fc000500ff10a4 move.w     #$5, $ff10a4.l
019648: 08f9000500ff132a bset.b     #$5, $ff132a.l
019650: 13fc00b100ff0530 move.b     #$b1, $ff0530.l
019658: 41f900018bd8     lea.l      $18bd8.l, a0
01965E: 61000522         bsr.w      $19b82
019662: 33fc007c00ff4102 move.w     #$7c, $ff4102.l
01966A: 33fc014800ff0100 move.w     #$148, $ff0100.l
019672: 0079080000ff0104 ori.w      #$800, $ff0104.l
01967A: 33fc00f000ff0106 move.w     #$f0, $ff0106.l
019682: 423900ff0508     clr.b      $ff0508.l
019688: 4e75             rts        

; ==== sub_01968A ТАБЛИЦА зовут=0 ====
01968A: 523900ff0508     addq.b     #$1, $ff0508.l
019690: 33fc014800ff0100 move.w     #$148, $ff0100.l
019698: 0839000400ff0508 btst.b     #$4, $ff0508.l
0196A0: 67000008         beq.w      $196aa
0196A4: 427900ff0100     clr.w      $ff0100.l
0196AA: 4df900ff1000     lea.l      $ff1000.l, a6
0196B0: 522e0093         addq.b     #$1, $93(a6)
0196B4: 0c2e00060093     cmpi.b     #$6, $93(a6)
0196BA: 66000010         bne.w      $196cc
0196BE: 422e0093         clr.b      $93(a6)
0196C2: 522e0092         addq.b     #$1, $92(a6)
0196C6: 022e00070092     andi.b     #$7, $92(a6)
0196CC: 4a3900ff04d8     tst.b      $ff04d8.l
0196D2: 6600001c         bne.w      $196f0
0196D6: 6100012c         bsr.w      $19804
0196DA: 61000042         bsr.w      $1971e
0196DE: 610000ac         bsr.w      $1978c
0196E2: 610000f8         bsr.w      $197dc
0196E6: 4eb900013366     jsr        $13366.l
0196EC: 600000c6         bra.w      $197b4
0196F0: 4eb900003940     jsr        $3940.l
0196F6: 4eb90000079e     jsr        $79e.l
0196FC: 4eb900000ee2     jsr        $ee2.l
019702: 423900ff4100     clr.b      $ff4100.l
019708: 4eb90000079e     jsr        $79e.l
01970E: 007c0700         ori.w      #$700, sr
019712: 4ff900ffef00     lea.l      $ffef00.l, a7
019718: 4ef900000e3a     jmp        $e3a.l

; ==== sub_01971E зовут=12 ====
01971E: 41f900045ffa     lea.l      $45ffa.l, a0
019724: 303900ff4200     move.w     $ff4200.l, d0
01972A: 12300000         move.b     (a0, d0.w), d1
01972E: 143900ff4202     move.b     $ff4202.l, d2
019734: 13c100ff4202     move.b     d1, $ff4202.l
01973A: 13c100ff1040     move.b     d1, $ff1040.l
019740: b302             eor.b      d1, d2
019742: c202             and.b      d2, d1
019744: 13c100ff1041     move.b     d1, $ff1041.l
01974A: 41f900046ffc     lea.l      $46ffc.l, a0
019750: 12300000         move.b     (a0, d0.w), d1
019754: 12300000         move.b     (a0, d0.w), d1
019758: 143900ff4203     move.b     $ff4203.l, d2
01975E: 13c100ff4203     move.b     d1, $ff4203.l
019764: 13c100ff1440     move.b     d1, $ff1440.l
01976A: b302             eor.b      d1, d2
01976C: c202             and.b      d2, d1
01976E: 13c100ff1441     move.b     d1, $ff1441.l
019774: 0c79100000ff4200 cmpi.w     #$1000, $ff4200.l
01977C: 6c000008         bge.w      $19786
019780: 527900ff4200     addq.w     #$1, $ff4200.l
019786: 4ef9000058ac     jmp        $58ac.l

; ==== sub_01978C зовут=13 ====
01978C: 41f900ff859c     lea.l      $ff859c.l, a0
019792: 43f900ff9000     lea.l      $ff9000.l, a1
019798: 3c3c0007         move.w     #$7, d6
01979C: 3e3c0015         move.w     #$15, d7
0197A0: 32d8             move.w     (a0)+, (a1)+
0197A2: 51cffffc         dbra       d7, $197a0
0197A6: 41e80054         lea.l      $54(a0), a0
0197AA: 43e90054         lea.l      $54(a1), a1
0197AE: 51ceffec         dbra       d6, $1979c
0197B2: 4e75             rts        

; ==== sub_0197B4 зовут=16 ====
0197B4: 41f900ff859c     lea.l      $ff859c.l, a0
0197BA: 43f900ff9800     lea.l      $ff9800.l, a1
0197C0: 3c3c0007         move.w     #$7, d6
0197C4: 3e3c0015         move.w     #$15, d7
0197C8: 32d8             move.w     (a0)+, (a1)+
0197CA: 51cffffc         dbra       d7, $197c8
0197CE: 41e80054         lea.l      $54(a0), a0
0197D2: 43e90054         lea.l      $54(a1), a1
0197D6: 51ceffec         dbra       d6, $197c4
0197DA: 4e75             rts        

; ==== sub_0197DC зовут=14 ====
0197DC: 43f900ff859c     lea.l      $ff859c.l, a1
0197E2: 41f900ff9800     lea.l      $ff9800.l, a0
0197E8: 3c3c0007         move.w     #$7, d6
0197EC: 3e3c0015         move.w     #$15, d7
0197F0: 32d8             move.w     (a0)+, (a1)+
0197F2: 51cffffc         dbra       d7, $197f0
0197F6: 41e80054         lea.l      $54(a0), a0
0197FA: 43e90054         lea.l      $54(a1), a1
0197FE: 51ceffec         dbra       d6, $197ec
019802: 4e75             rts        

; ==== sub_019804 зовут=12 ====
019804: 43f900ff859c     lea.l      $ff859c.l, a1
01980A: 41f900ff9000     lea.l      $ff9000.l, a0
019810: 3c3c0007         move.w     #$7, d6
019814: 3e3c0015         move.w     #$15, d7
019818: 32d8             move.w     (a0)+, (a1)+
01981A: 51cffffc         dbra       d7, $19818
01981E: 41e80054         lea.l      $54(a0), a0
019822: 43e90054         lea.l      $54(a1), a1
019826: 51ceffec         dbra       d6, $19814
01982A: 4e75             rts        

; ==== sub_01982C зовут=3 ====
01982C: 41fa0040         lea.l      $1986e(pc), a0
019830: 43f900ff859c     lea.l      $ff859c.l, a1
019836: 7e15             moveq      #$15, d7
019838: 7c07             moveq      #$7, d6
01983A: 4eb900010fdc     jsr        $10fdc.l
019840: 41fa018c         lea.l      $199ce(pc), a0
019844: 43f900ff89a6     lea.l      $ff89a6.l, a1
01984A: 7e01             moveq      #$1, d7
01984C: 7c00             moveq      #$0, d6
01984E: 4ef900010fdc     jmp        $10fdc.l

; ==== sub_019854 зовут=2 ====
019854: 41fa017c         lea.l      $199d2(pc), a0
019858: 43f900ff859c     lea.l      $ff859c.l, a1
01985E: 7e0b             moveq      #$b, d7
019860: 7c08             moveq      #$8, d6
019862: 4ef900010fdc     jmp        $10fdc.l

; ==== sub_019868 зовут=2 ====
019868: 41fa0240         lea.l      $19aaa(pc), a0
01986C: 60ea             bra.b      $19858

; ---- ДАННЫЕ $01986E..$019B82 (788 байт) ----


; ==== sub_019B82 зовут=22 ====
019B82: 23c800ff04d0     move.l     a0, $ff04d0.l
019B88: 423900ff04d8     clr.b      $ff04d8.l
019B8E: 13fc000400ff04d9 move.b     #$4, $ff04d9.l
019B96: 13fc000400ff04da move.b     #$4, $ff04da.l
019B9E: 4e75             rts        

; ==== sub_019BA0 зовут=3 ====
019BA0: 537900ff0502     subq.w     #$1, $ff0502.l
019BA6: 66000010         bne.w      $19bb8
019BAA: 33fc001800ff0502 move.w     #$18, $ff0502.l
019BB2: 527900ff0500     addq.w     #$1, $ff0500.l
019BB8: 41fa001e         lea.l      $19bd8(pc), a0
019BBC: 303900ff0500     move.w     $ff0500.l, d0
019BC2: e540             asl.w      #$2, d0
019BC4: 20700000         movea.l    (a0, d0.w), a0
019BC8: 43f900ff8a22     lea.l      $ff8a22.l, a1
019BCE: 7e05             moveq      #$5, d7
019BD0: 7c06             moveq      #$6, d6
019BD2: 4ef900010fdc     jmp        $10fdc.l

; ---- ДАННЫЕ $019BD8..$019CE4 (268 байт) ----


; ==== sub_019CE4 ТАБЛИЦА зовут=0 ====
019CE4: 007c0700         ori.w      #$700, sr
019CE8: 4eb90000064c     jsr        $64c.l
019CEE: 4eb9000004a2     jsr        $4a2.l
019CF4: 4eb900003952     jsr        $3952.l
019CFA: 427900ff0300     clr.w      $ff0300.l
019D00: 4df90001a2c4     lea.l      $1a2c4.l, a6
019D06: 4eb90000067a     jsr        $67a.l
019D0C: 41f900020060     lea.l      $20060.l, a0
019D12: 43f900ffa000     lea.l      $ffa000.l, a1
019D18: 4eb9000047aa     jsr        $47aa.l
019D1E: 41f900047ffe     lea.l      $47ffe.l, a0
019D24: 43f900ffa800     lea.l      $ffa800.l, a1
019D2A: 4eb9000047aa     jsr        $47aa.l
019D30: 203c40000000     move.l     #$40000000, d0
019D36: 223c94109300     move.l     #$94109300, d1
019D3C: 243c96d09500     move.l     #$96d09500, d2
019D42: 363c977f         move.w     #$977f, d3
019D46: 4eb900003980     jsr        $3980.l
019D4C: 4a3900a10001     tst.b      $a10001.l
019D52: 6a00001e         bpl.w      $19d72
019D56: 203c41600000     move.l     #$41600000, d0
019D5C: 223c94009320     move.l     #$94009320, d1
019D62: 243c96d395e0     move.l     #$96d395e0, d2
019D68: 363c977f         move.w     #$977f, d3
019D6C: 4eb900003980     jsr        $3980.l
019D72: 41f9000308ea     lea.l      $308ea.l, a0
019D78: 7002             moveq      #$2, d0
019D7A: 7e20             moveq      #$20, d7
019D7C: 4eb900003c74     jsr        $3c74.l
019D82: 203c60000000     move.l     #$60000000, d0
019D88: 223c94089340     move.l     #$94089340, d1
019D8E: 243c96d09500     move.l     #$96d09500, d2
019D94: 363c977f         move.w     #$977f, d3
019D98: 4eb900003980     jsr        $3980.l
019D9E: 41f900048992     lea.l      $48992.l, a0
019DA4: 43f900ffa000     lea.l      $ffa000.l, a1
019DAA: 4eb9000047aa     jsr        $47aa.l
019DB0: 7e27             moveq      #$27, d7
019DB2: 7c1b             moveq      #$1b, d6
019DB4: 4df900ffa000     lea.l      $ffa000.l, a6
019DBA: 2a3c60000003     move.l     #$60000003, d5
019DC0: 4eb900000622     jsr        $622.l
019DC6: 33fcffe000ff0412 move.w     #$ffe0, $ff0412.l
019DCE: 41f90001a346     lea.l      $1a346.l, a0
019DD4: 43f900ff8000     lea.l      $ff8000.l, a1
019DDA: 7e27             moveq      #$27, d7
019DDC: 7c01             moveq      #$1, d6
019DDE: 4eb900010fdc     jsr        $10fdc.l
019DE4: 33fc001300ff0500 move.w     #$13, $ff0500.l
019DEC: 6100041c         bsr.w      $1a20a
019DF0: 6100042a         bsr.w      $1a21c
019DF4: 423900ff050f     clr.b      $ff050f.l
019DFA: 23fc0001a56600ff0510 move.l     #$1a566, $ff0510.l
019E04: 23fc0001a6e600ff0514 move.l     #$1a6e6, $ff0514.l
019E0E: 33fc002800ff040a move.w     #$28, $ff040a.l
019E16: 13fc000a00ff040c move.b     #$a, $ff040c.l
019E1E: 4eb900000642     jsr        $642.l
019E24: 4eb900000ee2     jsr        $ee2.l
019E2A: 4eb90000392e     jsr        $392e.l
019E30: 1e3c009a         move.b     #$9a, d7
019E34: 0c39000100ff0448 cmpi.b     #$1, $ff0448.l
019E3C: 67000006         beq.w      $19e44
019E40: 1e3c0094         move.b     #$94, d7
019E44: 4eb900003d7a     jsr        $3d7a.l
019E4A: 4eb900003952     jsr        $3952.l
019E50: 0c39000c00ff050f cmpi.b     #$c, $ff050f.l
019E58: 6c0000a8         bge.w      $19f02
019E5C: 207900ff0510     movea.l    $ff0510.l, a0
019E62: 43f900ffb000     lea.l      $ffb000.l, a1
019E68: 303c6000         move.w     #$6000, d0
019E6C: 7e1f             moveq      #$1f, d7
019E6E: 1018             move.b     (a0)+, d0
019E70: 32c0             move.w     d0, (a1)+
019E72: 51cffffa         dbra       d7, $19e6e
019E76: 23c800ff0510     move.l     a0, $ff0510.l
019E7C: 7e0f             moveq      #$f, d7
019E7E: 7c01             moveq      #$1, d6
019E80: 4df900ffb000     lea.l      $ffb000.l, a6
019E86: 2a3c68180003     move.l     #$68180003, d5
019E8C: 007c0700         ori.w      #$700, sr
019E90: 4eb900000622     jsr        $622.l
019E96: 027cf8ff         andi.w     #$f8ff, sr
019E9A: 207900ff0514     movea.l    $ff0514.l, a0
019EA0: 43f900ffb000     lea.l      $ffb000.l, a1
019EA6: 303c6100         move.w     #$6100, d0
019EAA: 7e63             moveq      #$63, d7
019EAC: 1018             move.b     (a0)+, d0
019EAE: 32c0             move.w     d0, (a1)+
019EB0: 51cffffa         dbra       d7, $19eac
019EB4: 23c800ff0514     move.l     a0, $ff0514.l
019EBA: 7e13             moveq      #$13, d7
019EBC: 7c04             moveq      #$4, d6
019EBE: 4df900ffb000     lea.l      $ffb000.l, a6
019EC4: 2a3c69940003     move.l     #$69940003, d5
019ECA: 007c0700         ori.w      #$700, sr
019ECE: 4eb900000622     jsr        $622.l
019ED4: 027cf8ff         andi.w     #$f8ff, sr
019ED8: 0c39000b00ff050f cmpi.b     #$b, $ff050f.l
019EE0: 66000020         bne.w      $19f02
019EE4: 7e0b             moveq      #$b, d7
019EE6: 7c08             moveq      #$8, d6
019EE8: 4df90001ab96     lea.l      $1ab96.l, a6
019EEE: 2a3c669c0003     move.l     #$669c0003, d5
019EF4: 007c0700         ori.w      #$700, sr
019EF8: 4eb900000622     jsr        $622.l
019EFE: 027cf8ff         andi.w     #$f8ff, sr
019F02: 0c39000c00ff050f cmpi.b     #$c, $ff050f.l
019F0A: 6c000020         bge.w      $19f2c
019F0E: 7000             moveq      #$0, d0
019F10: 103900ff050f     move.b     $ff050f.l, d0
019F16: eb40             asl.w      #$5, d0
019F18: 41fa04cc         lea.l      $1a3e6(pc), a0
019F1C: d1c0             adda.l     d0, a0
019F1E: 43f900ff0300     lea.l      $ff0300.l, a1
019F24: 7007             moveq      #$7, d0
019F26: 22d8             move.l     (a0)+, (a1)+
019F28: 51c8fffc         dbra       d0, $19f26
019F2C: 0c39000b00ff050f cmpi.b     #$b, $ff050f.l
019F34: 6c00015e         bge.w      $1a094
019F38: 7000             moveq      #$0, d0
019F3A: 103900ff050f     move.b     $ff050f.l, d0
019F40: 4a3900ff4205     tst.b      $ff4205.l
019F46: 67000026         beq.w      $19f6e
019F4A: 0c39000900ff050f cmpi.b     #$9, $ff050f.l
019F52: 67000016         beq.w      $19f6a
019F56: 0c39000a00ff050f cmpi.b     #$a, $ff050f.l
019F5E: 6600000e         bne.w      $19f6e
019F62: 103c000c         move.b     #$c, d0
019F66: 60000006         bra.w      $19f6e
019F6A: 103c000b         move.b     #$b, d0
019F6E: 4eb90001371a     jsr        $1371a.l
019F74: 41f900ff03a0     lea.l      $ff03a0.l, a0
019F7A: 43f900ff0320     lea.l      $ff0320.l, a1
019F80: 7007             moveq      #$7, d0
019F82: 22d8             move.l     (a0)+, (a1)+
019F84: 51c8fffc         dbra       d0, $19f82
019F88: 4a3900ff4205     tst.b      $ff4205.l
019F8E: 67000072         beq.w      $1a002
019F92: 0c39000900ff050f cmpi.b     #$9, $ff050f.l
019F9A: 67000012         beq.w      $19fae
019F9E: 0c39000a00ff050f cmpi.b     #$a, $ff050f.l
019FA6: 67000030         beq.w      $19fd8
019FAA: 60000056         bra.w      $1a002
019FAE: 23fc0003de6600ff3008 move.l     #$3de66, $ff3008.l
019FB8: 41f900039422     lea.l      $39422.l, a0
019FBE: 43f900ffa000     lea.l      $ffa000.l, a1
019FC4: 4eb9000047aa     jsr        $47aa.l
019FCA: 23fc9402930000ff0508 move.l     #$94029300, $ff0508.l
019FD4: 6000007c         bra.w      $1a052
019FD8: 23fc0003deda00ff3008 move.l     #$3deda, $ff3008.l
019FE2: 41f9000396b2     lea.l      $396b2.l, a0
019FE8: 43f900ffa000     lea.l      $ffa000.l, a1
019FEE: 4eb9000047aa     jsr        $47aa.l
019FF4: 23fc9402935000ff0508 move.l     #$94029350, $ff0508.l
019FFE: 60000052         bra.w      $1a052
01A002: 7000             moveq      #$0, d0
01A004: 103900ff050f     move.b     $ff050f.l, d0
01A00A: e540             asl.w      #$2, d0
01A00C: 41f900039dfc     lea.l      $39dfc.l, a0
01A012: 20300000         move.l     (a0, d0.w), d0
01A016: 23c000ff3008     move.l     d0, $ff3008.l
01A01C: 7000             moveq      #$0, d0
01A01E: 103900ff050f     move.b     $ff050f.l, d0
01A024: e540             asl.w      #$2, d0
01A026: 3200             move.w     d0, d1
01A028: d040             add.w      d0, d0
01A02A: d041             add.w      d1, d0
01A02C: 45f900012d84     lea.l      $12d84.l, a2
01A032: 20720000         movea.l    (a2, d0.w), a0
01A036: 23f2000400ff0504 move.l     $4(a2, d0.w), $ff0504.l
01A03E: 23f2000800ff0508 move.l     $8(a2, d0.w), $ff0508.l
01A046: 43f900ffa000     lea.l      $ffa000.l, a1
01A04C: 4eb9000047aa     jsr        $47aa.l
01A052: 203c40000002     move.l     #$40000002, d0
01A058: 223900ff0508     move.l     $ff0508.l, d1
01A05E: 243c96d09500     move.l     #$96d09500, d2
01A064: 363c977f         move.w     #$977f, d3
01A068: 007c0700         ori.w      #$700, sr
01A06C: 4eb900003980     jsr        $3980.l
01A072: 027cf8ff         andi.w     #$f8ff, sr
01A076: 207900ff0504     movea.l    $ff0504.l, a0
01A07C: 33fc00c800ff3000 move.w     #$c8, $ff3000.l
01A084: 33fc010800ff3004 move.w     #$108, $ff3004.l
01A08C: 7010             moveq      #$10, d0
01A08E: 4eb900013982     jsr        $13982.l
01A094: 6100005a         bsr.w      $1a0f0
01A098: 33fc01a400ff0502 move.w     #$1a4, $ff0502.l
01A0A0: 0c39000b00ff050f cmpi.b     #$b, $ff050f.l
01A0A8: 66000006         bne.w      $1a0b0
01A0AC: 61000192         bsr.w      $1a240
01A0B0: 4eb90001a1e2     jsr        $1a1e2.l
01A0B6: 537900ff0502     subq.w     #$1, $ff0502.l
01A0BC: 66e2             bne.b      $1a0a0
01A0BE: 0c39000b00ff050f cmpi.b     #$b, $ff050f.l
01A0C6: 670000e4         beq.w      $1a1ac
01A0CA: 6100008a         bsr.w      $1a156
01A0CE: 33fc003c00ff0502 move.w     #$3c, $ff0502.l
01A0D6: 4eb90001a1e2     jsr        $1a1e2.l
01A0DC: 537900ff0502     subq.w     #$1, $ff0502.l
01A0E2: 66f2             bne.b      $1a0d6
01A0E4: 523900ff050f     addq.b     #$1, $ff050f.l
01A0EA: 6000fd5e         bra.w      $19e4a

; ---- ДАННЫЕ $01A0EE..$01A0F0 (2 байт) ----


; ==== sub_01A0F0 зовут=1 ====
01A0F0: 33fc001300ff0500 move.w     #$13, $ff0500.l
01A0F8: 61000110         bsr.w      $1a20a
01A0FC: 6100011e         bsr.w      $1a21c
01A100: 597900ff0412     subq.w     #$4, $ff0412.l
01A106: 303900ff0412     move.w     $ff0412.l, d0
01A10C: 02400007         andi.w     #$7, d0
01A110: 66000008         bne.w      $1a11a
01A114: 537900ff0500     subq.w     #$1, $ff0500.l
01A11A: 610000ee         bsr.w      $1a20a
01A11E: 610000fc         bsr.w      $1a21c
01A122: 4eb90001a1e2     jsr        $1a1e2.l
01A128: 0c79000100ff0500 cmpi.w     #$1, $ff0500.l
01A130: 66ce             bne.b      $1a100
01A132: 33fc000600ff0502 move.w     #$6, $ff0502.l
01A13A: 597900ff0412     subq.w     #$4, $ff0412.l
01A140: 303900ff0412     move.w     $ff0412.l, d0
01A146: 4eb90001a1e2     jsr        $1a1e2.l
01A14C: 537900ff0502     subq.w     #$1, $ff0502.l
01A152: 66e6             bne.b      $1a13a
01A154: 4e75             rts        

; ==== sub_01A156 зовут=1 ====
01A156: 33fc000500ff0502 move.w     #$5, $ff0502.l
01A15E: 587900ff0412     addq.w     #$4, $ff0412.l
01A164: 303900ff0412     move.w     $ff0412.l, d0
01A16A: 4eb90001a1e2     jsr        $1a1e2.l
01A170: 537900ff0502     subq.w     #$1, $ff0502.l
01A176: 66e6             bne.b      $1a15e
01A178: 587900ff0412     addq.w     #$4, $ff0412.l
01A17E: 303900ff0412     move.w     $ff0412.l, d0
01A184: 02400007         andi.w     #$7, d0
01A188: 66000008         bne.w      $1a192
01A18C: 527900ff0500     addq.w     #$1, $ff0500.l
01A192: 61000076         bsr.w      $1a20a
01A196: 61000084         bsr.w      $1a21c
01A19A: 4eb90001a1e2     jsr        $1a1e2.l
01A1A0: 0c79001400ff0500 cmpi.w     #$14, $ff0500.l
01A1A8: 66ce             bne.b      $1a178
01A1AA: 4e75             rts        
01A1AC: 61000092         bsr.w      $1a240
01A1B0: 103900ffe00c     move.b     $ffe00c.l, d0
01A1B6: 020000e0         andi.b     #$e0, d0
01A1BA: 6600000a         bne.w      $1a1c6
01A1BE: 4eb90001a1e2     jsr        $1a1e2.l
01A1C4: 60e6             bra.b      $1a1ac
01A1C6: 4eb900003940     jsr        $3940.l
01A1CC: 4eb90000079e     jsr        $79e.l
01A1D2: 007c0700         ori.w      #$700, sr
01A1D6: 4ff900ffef00     lea.l      $ffef00.l, a7
01A1DC: 4ef900000e3a     jmp        $e3a.l

; ==== sub_01A1E2 зовут=7 ====
01A1E2: 0c39000b00ff050f cmpi.b     #$b, $ff050f.l
01A1EA: 6c000008         bge.w      $1a1f4
01A1EE: 4eb9000139aa     jsr        $139aa.l
01A1F4: 13fc000100ff0400 move.b     #$1, $ff0400.l
01A1FC: 13fc000100ff040d move.b     #$1, $ff040d.l
01A204: 4ef900000ee2     jmp        $ee2.l

; ==== sub_01A20A зовут=4 ====
01A20A: 41f900ff8100     lea.l      $ff8100.l, a0
01A210: 303c03bf         move.w     #$3bf, d0
01A214: 4298             clr.l      (a0)+
01A216: 51c8fffc         dbra       d0, $1a214
01A21A: 4e75             rts        

; ==== sub_01A21C зовут=4 ====
01A21C: 41f900ff8100     lea.l      $ff8100.l, a0
01A222: 303ce041         move.w     #$e041, d0
01A226: 3e3900ff0500     move.w     $ff0500.l, d7
01A22C: 5347             subq.w     #$1, d7
01A22E: 7c27             moveq      #$27, d6
01A230: 30c0             move.w     d0, (a0)+
01A232: 51cefffc         dbra       d6, $1a230
01A236: 41e80030         lea.l      $30(a0), a0
01A23A: 51cffff2         dbra       d7, $1a22e
01A23E: 4e75             rts        

; ==== sub_01A240 зовут=2 ====
01A240: 08f9000000ff0400 bset.b     #$0, $ff0400.l
01A248: 533900ff040c     subq.b     #$1, $ff040c.l
01A24E: 6a000034         bpl.w      $1a284
01A252: 13fc000100ff040c move.b     #$1, $ff040c.l
01A25A: 303900ff040a     move.w     $ff040a.l, d0
01A260: 6a00000a         bpl.w      $1a26c
01A264: 33fc002800ff040a move.w     #$28, $ff040a.l
01A26C: 557900ff040a     subq.w     #$2, $ff040a.l
01A272: 41fb0012         lea.l      $1a286(pc, d0.w), a0
01A276: 43f900ff0344     lea.l      $ff0344.l, a1
01A27C: 700a             moveq      #$a, d0
01A27E: 32d8             move.w     (a0)+, (a1)+
01A280: 51c8fffc         dbra       d0, $1a27e
01A284: 4e75             rts        

; ---- ДАННЫЕ $01A286..$03DFFC (146806 байт) ----


; ==== sub_03DFFC ТАБЛИЦА зовут=0 ====
03DFFC: e328             lsl.b      d1, d0
03DFFE: e328             lsl.b      d1, d0
03E000: e328             lsl.b      d1, d0
03E002: e328             lsl.b      d1, d0
03E004: e328             lsl.b      d1, d0
03E006: e328             lsl.b      d1, d0
03E008: e328             lsl.b      d1, d0
03E00A: e328             lsl.b      d1, d0
03E00C: e328             lsl.b      d1, d0
03E00E: e328             lsl.b      d1, d0
03E010: e328             lsl.b      d1, d0
03E012: e300             asl.b      #$1, d0
03E014: e327             asl.b      d1, d7
03E016: e328             lsl.b      d1, d0
03E018: e328             lsl.b      d1, d0
03E01A: e328             lsl.b      d1, d0
03E01C: e328             lsl.b      d1, d0
03E01E: e328             lsl.b      d1, d0
03E020: e328             lsl.b      d1, d0
03E022: e328             lsl.b      d1, d0
03E024: e328             lsl.b      d1, d0
03E026: e328             lsl.b      d1, d0
03E028: e328             lsl.b      d1, d0
03E02A: e328             lsl.b      d1, d0
03E02C: e328             lsl.b      d1, d0
03E02E: e328             lsl.b      d1, d0
03E030: e328             lsl.b      d1, d0
03E032: e328             lsl.b      d1, d0
03E034: e328             lsl.b      d1, d0
03E036: e328             lsl.b      d1, d0
03E038: e328             lsl.b      d1, d0
03E03A: e328             lsl.b      d1, d0
03E03C: e328             lsl.b      d1, d0
03E03E: e328             lsl.b      d1, d0
03E040: e328             lsl.b      d1, d0
03E042: e310             roxl.b     #$1, d0
03E044: e337             roxl.b     d1, d7
03E046: e328             lsl.b      d1, d0
03E048: e328             lsl.b      d1, d0
03E04A: e328             lsl.b      d1, d0
03E04C: e328             lsl.b      d1, d0
03E04E: e328             lsl.b      d1, d0
03E050: e328             lsl.b      d1, d0
03E052: e328             lsl.b      d1, d0
03E054: e328             lsl.b      d1, d0
03E056: e328             lsl.b      d1, d0
03E058: e328             lsl.b      d1, d0
03E05A: e328             lsl.b      d1, d0
03E05C: e328             lsl.b      d1, d0
03E05E: e328             lsl.b      d1, d0
03E060: e328             lsl.b      d1, d0
03E062: e328             lsl.b      d1, d0
03E064: e328             lsl.b      d1, d0
03E066: e328             lsl.b      d1, d0
03E068: e328             lsl.b      d1, d0
03E06A: e328             lsl.b      d1, d0
03E06C: e328             lsl.b      d1, d0
03E06E: e328             lsl.b      d1, d0
03E070: e300             asl.b      #$1, d0
03E072: e30b             lsl.b      #$1, d3
03E074: e30c             lsl.b      #$1, d4
03E076: e327             asl.b      d1, d7
03E078: e328             lsl.b      d1, d0
03E07A: e328             lsl.b      d1, d0
03E07C: e328             lsl.b      d1, d0
03E07E: e328             lsl.b      d1, d0
03E080: e328             lsl.b      d1, d0
03E082: e328             lsl.b      d1, d0
03E084: e328             lsl.b      d1, d0
03E086: e328             lsl.b      d1, d0
03E088: e328             lsl.b      d1, d0
03E08A: e328             lsl.b      d1, d0
03E08C: e328             lsl.b      d1, d0
03E08E: e328             lsl.b      d1, d0
03E090: e328             lsl.b      d1, d0
03E092: e328             lsl.b      d1, d0
03E094: e328             lsl.b      d1, d0
03E096: e328             lsl.b      d1, d0
03E098: e328             lsl.b      d1, d0
03E09A: e328             lsl.b      d1, d0
03E09C: e328             lsl.b      d1, d0
03E09E: e328             lsl.b      d1, d0
03E0A0: e310             roxl.b     #$1, d0
03E0A2: e31b             rol.b      #$1, d3
03E0A4: e31c             rol.b      #$1, d4
03E0A6: e337             roxl.b     d1, d7
03E0A8: e328             lsl.b      d1, d0
03E0AA: e328             lsl.b      d1, d0
03E0AC: e328             lsl.b      d1, d0
03E0AE: e328             lsl.b      d1, d0
03E0B0: e328             lsl.b      d1, d0
03E0B2: e328             lsl.b      d1, d0
03E0B4: e328             lsl.b      d1, d0
03E0B6: e328             lsl.b      d1, d0
03E0B8: e328             lsl.b      d1, d0
03E0BA: e328             lsl.b      d1, d0
03E0BC: e328             lsl.b      d1, d0
03E0BE: e328             lsl.b      d1, d0
03E0C0: e328             lsl.b      d1, d0
03E0C2: e328             lsl.b      d1, d0
03E0C4: e328             lsl.b      d1, d0
03E0C6: e328             lsl.b      d1, d0
03E0C8: e328             lsl.b      d1, d0
03E0CA: e328             lsl.b      d1, d0
03E0CC: e328             lsl.b      d1, d0
03E0CE: e300             asl.b      #$1, d0
03E0D0: e30a             lsl.b      #$1, d2
03E0D2: e30b             lsl.b      #$1, d3
03E0D4: e30c             lsl.b      #$1, d4
03E0D6: e30d             lsl.b      #$1, d5
03E0D8: e327             asl.b      d1, d7
03E0DA: e328             lsl.b      d1, d0
03E0DC: e328             lsl.b      d1, d0
03E0DE: e328             lsl.b      d1, d0
03E0E0: e328             lsl.b      d1, d0
03E0E2: e328             lsl.b      d1, d0
03E0E4: e328             lsl.b      d1, d0
03E0E6: e328             lsl.b      d1, d0
03E0E8: e328             lsl.b      d1, d0
03E0EA: e328             lsl.b      d1, d0
03E0EC: e328             lsl.b      d1, d0
03E0EE: e328             lsl.b      d1, d0
03E0F0: e328             lsl.b      d1, d0
03E0F2: e328             lsl.b      d1, d0
03E0F4: e328             lsl.b      d1, d0
03E0F6: e328             lsl.b      d1, d0
03E0F8: e328             lsl.b      d1, d0
03E0FA: e328             lsl.b      d1, d0
03E0FC: e328             lsl.b      d1, d0
03E0FE: e310             roxl.b     #$1, d0
03E100: e31a             rol.b      #$1, d2
03E102: e31b             rol.b      #$1, d3
03E104: e31c             rol.b      #$1, d4
03E106: e31d             rol.b      #$1, d5
03E108: e337             roxl.b     d1, d7
03E10A: e328             lsl.b      d1, d0
03E10C: e328             lsl.b      d1, d0
03E10E: e328             lsl.b      d1, d0
03E110: e328             lsl.b      d1, d0
03E112: e328             lsl.b      d1, d0
03E114: e328             lsl.b      d1, d0
03E116: e328             lsl.b      d1, d0
03E118: e328             lsl.b      d1, d0
03E11A: e328             lsl.b      d1, d0
03E11C: e328             lsl.b      d1, d0
03E11E: e328             lsl.b      d1, d0
03E120: e328             lsl.b      d1, d0
03E122: e328             lsl.b      d1, d0
03E124: e328             lsl.b      d1, d0
03E126: e328             lsl.b      d1, d0
03E128: e328             lsl.b      d1, d0
03E12A: e328             lsl.b      d1, d0
03E12C: e300             asl.b      #$1, d0
03E12E: e309             lsl.b      #$1, d1
03E130: e30a             lsl.b      #$1, d2
03E132: e30b             lsl.b      #$1, d3
03E134: e30c             lsl.b      #$1, d4
03E136: e30d             lsl.b      #$1, d5
03E138: e30e             lsl.b      #$1, d6
03E13A: e327             asl.b      d1, d7
03E13C: e328             lsl.b      d1, d0
03E13E: e328             lsl.b      d1, d0
03E140: e328             lsl.b      d1, d0
03E142: e328             lsl.b      d1, d0
03E144: e328             lsl.b      d1, d0
03E146: e328             lsl.b      d1, d0
03E148: e328             lsl.b      d1, d0
03E14A: e328             lsl.b      d1, d0
03E14C: e328             lsl.b      d1, d0
03E14E: e328             lsl.b      d1, d0
03E150: e328             lsl.b      d1, d0
03E152: e328             lsl.b      d1, d0
03E154: e328             lsl.b      d1, d0
03E156: e328             lsl.b      d1, d0
03E158: e328             lsl.b      d1, d0
03E15A: e328             lsl.b      d1, d0
03E15C: e310             roxl.b     #$1, d0
03E15E: e319             rol.b      #$1, d1
03E160: e31a             rol.b      #$1, d2
03E162: e31b             rol.b      #$1, d3
03E164: e31c             rol.b      #$1, d4
03E166: e31d             rol.b      #$1, d5
03E168: e31e             rol.b      #$1, d6
03E16A: e337             roxl.b     d1, d7
03E16C: e328             lsl.b      d1, d0
03E16E: e328             lsl.b      d1, d0
03E170: e328             lsl.b      d1, d0
03E172: e328             lsl.b      d1, d0
03E174: e328             lsl.b      d1, d0
03E176: e328             lsl.b      d1, d0
03E178: e328             lsl.b      d1, d0
03E17A: e328             lsl.b      d1, d0
03E17C: e328             lsl.b      d1, d0
03E17E: e328             lsl.b      d1, d0
03E180: e328             lsl.b      d1, d0
03E182: e328             lsl.b      d1, d0
03E184: e328             lsl.b      d1, d0
03E186: e328             lsl.b      d1, d0
03E188: e328             lsl.b      d1, d0
03E18A: e300             asl.b      #$1, d0
03E18C: e308             lsl.b      #$1, d0
03E18E: e309             lsl.b      #$1, d1
03E190: e30a             lsl.b      #$1, d2
03E192: e30b             lsl.b      #$1, d3
03E194: e30c             lsl.b      #$1, d4
03E196: e30d             lsl.b      #$1, d5
03E198: e30e             lsl.b      #$1, d6
03E19A: e30f             lsl.b      #$1, d7
03E19C: e327             asl.b      d1, d7
03E19E: e328             lsl.b      d1, d0
03E1A0: e328             lsl.b      d1, d0
03E1A2: e328             lsl.b      d1, d0
03E1A4: e328             lsl.b      d1, d0
03E1A6: e328             lsl.b      d1, d0
03E1A8: e328             lsl.b      d1, d0
03E1AA: e328             lsl.b      d1, d0
03E1AC: e328             lsl.b      d1, d0
03E1AE: e328             lsl.b      d1, d0
03E1B0: e328             lsl.b      d1, d0
03E1B2: e328             lsl.b      d1, d0
03E1B4: e328             lsl.b      d1, d0
03E1B6: e328             lsl.b      d1, d0
03E1B8: e328             lsl.b      d1, d0
03E1BA: e310             roxl.b     #$1, d0
03E1BC: e318             rol.b      #$1, d0
03E1BE: e319             rol.b      #$1, d1
03E1C0: e31a             rol.b      #$1, d2
03E1C2: e31b             rol.b      #$1, d3
03E1C4: e31c             rol.b      #$1, d4
03E1C6: e31d             rol.b      #$1, d5
03E1C8: e31e             rol.b      #$1, d6
03E1CA: e31f             rol.b      #$1, d7
03E1CC: e337             roxl.b     d1, d7
03E1CE: e328             lsl.b      d1, d0
03E1D0: e328             lsl.b      d1, d0
03E1D2: e328             lsl.b      d1, d0
03E1D4: e328             lsl.b      d1, d0
03E1D6: e328             lsl.b      d1, d0
03E1D8: e328             lsl.b      d1, d0
03E1DA: e328             lsl.b      d1, d0
03E1DC: e328             lsl.b      d1, d0
03E1DE: e328             lsl.b      d1, d0
03E1E0: e328             lsl.b      d1, d0
03E1E2: e328             lsl.b      d1, d0
03E1E4: e328             lsl.b      d1, d0
03E1E6: e328             lsl.b      d1, d0
03E1E8: e300             asl.b      #$1, d0
03E1EA: e307             asl.b      #$1, d7
03E1EC: e308             lsl.b      #$1, d0
03E1EE: e309             lsl.b      #$1, d1
03E1F0: e30a             lsl.b      #$1, d2
03E1F2: e30b             lsl.b      #$1, d3
03E1F4: e30c             lsl.b      #$1, d4
03E1F6: e30d             lsl.b      #$1, d5
03E1F8: e30e             lsl.b      #$1, d6
03E1FA: e30f             lsl.b      #$1, d7
03E1FC: e320             asl.b      d1, d0
03E1FE: e327             asl.b      d1, d7
03E200: e328             lsl.b      d1, d0
03E202: e328             lsl.b      d1, d0
03E204: e328             lsl.b      d1, d0
03E206: e328             lsl.b      d1, d0
03E208: e328             lsl.b      d1, d0
03E20A: e328             lsl.b      d1, d0
03E20C: e328             lsl.b      d1, d0
03E20E: e328             lsl.b      d1, d0
03E210: e328             lsl.b      d1, d0
03E212: e328             lsl.b      d1, d0
03E214: e328             lsl.b      d1, d0
03E216: e328             lsl.b      d1, d0
03E218: e310             roxl.b     #$1, d0
03E21A: e317             roxl.b     #$1, d7
03E21C: e318             rol.b      #$1, d0
03E21E: e319             rol.b      #$1, d1
03E220: e31a             rol.b      #$1, d2
03E222: e31b             rol.b      #$1, d3
03E224: e31c             rol.b      #$1, d4
03E226: e31d             rol.b      #$1, d5
03E228: e31e             rol.b      #$1, d6
03E22A: e31f             rol.b      #$1, d7
03E22C: e330             roxl.b     d1, d0
03E22E: e337             roxl.b     d1, d7
03E230: e328             lsl.b      d1, d0
03E232: e328             lsl.b      d1, d0
03E234: e328             lsl.b      d1, d0
03E236: e328             lsl.b      d1, d0
03E238: e328             lsl.b      d1, d0
03E23A: e328             lsl.b      d1, d0
03E23C: e328             lsl.b      d1, d0
03E23E: e328             lsl.b      d1, d0
03E240: e328             lsl.b      d1, d0
03E242: e328             lsl.b      d1, d0
03E244: e328             lsl.b      d1, d0
03E246: e300             asl.b      #$1, d0
03E248: e306             asl.b      #$1, d6
03E24A: e307             asl.b      #$1, d7
03E24C: e308             lsl.b      #$1, d0
03E24E: e309             lsl.b      #$1, d1
03E250: e30a             lsl.b      #$1, d2
03E252: e30b             lsl.b      #$1, d3
03E254: e30c             lsl.b      #$1, d4
03E256: e30d             lsl.b      #$1, d5
03E258: e30e             lsl.b      #$1, d6
03E25A: e30f             lsl.b      #$1, d7
03E25C: e320             asl.b      d1, d0
03E25E: e321             asl.b      d1, d1
03E260: e327             asl.b      d1, d7
03E262: e328             lsl.b      d1, d0
03E264: e328             lsl.b      d1, d0
03E266: e328             lsl.b      d1, d0
03E268: e328             lsl.b      d1, d0
03E26A: e328             lsl.b      d1, d0
03E26C: e328             lsl.b      d1, d0
03E26E: e328             lsl.b      d1, d0
03E270: e328             lsl.b      d1, d0
03E272: e328             lsl.b      d1, d0
03E274: e328             lsl.b      d1, d0
03E276: e310             roxl.b     #$1, d0
03E278: e316             roxl.b     #$1, d6
03E27A: e317             roxl.b     #$1, d7
03E27C: e318             rol.b      #$1, d0
03E27E: e319             rol.b      #$1, d1
03E280: e31a             rol.b      #$1, d2
03E282: e31b             rol.b      #$1, d3
03E284: e31c             rol.b      #$1, d4
03E286: e31d             rol.b      #$1, d5
03E288: e31e             rol.b      #$1, d6
03E28A: e31f             rol.b      #$1, d7
03E28C: e330             roxl.b     d1, d0
03E28E: e331             roxl.b     d1, d1
03E290: e337             roxl.b     d1, d7
03E292: e328             lsl.b      d1, d0
03E294: e328             lsl.b      d1, d0
03E296: e328             lsl.b      d1, d0
03E298: e328             lsl.b      d1, d0
03E29A: e328             lsl.b      d1, d0
03E29C: e328             lsl.b      d1, d0
03E29E: e328             lsl.b      d1, d0
03E2A0: e328             lsl.b      d1, d0
03E2A2: e328             lsl.b      d1, d0
03E2A4: e300             asl.b      #$1, d0
03E2A6: e305             asl.b      #$1, d5
03E2A8: e306             asl.b      #$1, d6
03E2AA: e307             asl.b      #$1, d7
03E2AC: e308             lsl.b      #$1, d0
03E2AE: e309             lsl.b      #$1, d1
03E2B0: e30a             lsl.b      #$1, d2
03E2B2: e30b             lsl.b      #$1, d3
03E2B4: e30c             lsl.b      #$1, d4
03E2B6: e30d             lsl.b      #$1, d5
03E2B8: e30e             lsl.b      #$1, d6
03E2BA: e30f             lsl.b      #$1, d7
03E2BC: e320             asl.b      d1, d0
03E2BE: e321             asl.b      d1, d1
03E2C0: e322             asl.b      d1, d2
03E2C2: e327             asl.b      d1, d7
03E2C4: e328             lsl.b      d1, d0
03E2C6: e328             lsl.b      d1, d0
03E2C8: e328             lsl.b      d1, d0
03E2CA: e328             lsl.b      d1, d0
03E2CC: e328             lsl.b      d1, d0
03E2CE: e328             lsl.b      d1, d0
03E2D0: e328             lsl.b      d1, d0
03E2D2: e328             lsl.b      d1, d0
03E2D4: e310             roxl.b     #$1, d0
03E2D6: e315             roxl.b     #$1, d5
03E2D8: e316             roxl.b     #$1, d6
03E2DA: e317             roxl.b     #$1, d7
03E2DC: e318             rol.b      #$1, d0
03E2DE: e319             rol.b      #$1, d1
03E2E0: e31a             rol.b      #$1, d2
03E2E2: e31b             rol.b      #$1, d3
03E2E4: e31c             rol.b      #$1, d4
03E2E6: e31d             rol.b      #$1, d5
03E2E8: e31e             rol.b      #$1, d6
03E2EA: e31f             rol.b      #$1, d7
03E2EC: e330             roxl.b     d1, d0
03E2EE: e331             roxl.b     d1, d1
03E2F0: e332             roxl.b     d1, d2
03E2F2: e337             roxl.b     d1, d7
03E2F4: e328             lsl.b      d1, d0
03E2F6: e328             lsl.b      d1, d0
03E2F8: e328             lsl.b      d1, d0
03E2FA: e328             lsl.b      d1, d0
03E2FC: e328             lsl.b      d1, d0
03E2FE: e328             lsl.b      d1, d0
03E300: e328             lsl.b      d1, d0
03E302: e300             asl.b      #$1, d0
03E304: e304             asl.b      #$1, d4
03E306: e305             asl.b      #$1, d5
03E308: e306             asl.b      #$1, d6
03E30A: e307             asl.b      #$1, d7
03E30C: e308             lsl.b      #$1, d0
03E30E: e309             lsl.b      #$1, d1
03E310: e30a             lsl.b      #$1, d2
03E312: e30b             lsl.b      #$1, d3
03E314: e30c             lsl.b      #$1, d4
03E316: e30d             lsl.b      #$1, d5
03E318: e30e             lsl.b      #$1, d6
03E31A: e30f             lsl.b      #$1, d7
03E31C: e320             asl.b      d1, d0
03E31E: e321             asl.b      d1, d1
03E320: e322             asl.b      d1, d2
03E322: e323             asl.b      d1, d3
03E324: e327             asl.b      d1, d7
03E326: e328             lsl.b      d1, d0
03E328: e328             lsl.b      d1, d0
03E32A: e328             lsl.b      d1, d0
03E32C: e328             lsl.b      d1, d0
03E32E: e328             lsl.b      d1, d0
03E330: e328             lsl.b      d1, d0
03E332: e310             roxl.b     #$1, d0
03E334: e314             roxl.b     #$1, d4
03E336: e315             roxl.b     #$1, d5
03E338: e316             roxl.b     #$1, d6
03E33A: e317             roxl.b     #$1, d7
03E33C: e318             rol.b      #$1, d0
03E33E: e319             rol.b      #$1, d1
03E340: e31a             rol.b      #$1, d2
03E342: e31b             rol.b      #$1, d3
03E344: e31c             rol.b      #$1, d4
03E346: e31d             rol.b      #$1, d5
03E348: e31e             rol.b      #$1, d6
03E34A: e31f             rol.b      #$1, d7
03E34C: e330             roxl.b     d1, d0
03E34E: e331             roxl.b     d1, d1
03E350: e332             roxl.b     d1, d2
03E352: e333             roxl.b     d1, d3
03E354: e337             roxl.b     d1, d7
03E356: e328             lsl.b      d1, d0
03E358: e328             lsl.b      d1, d0
03E35A: e328             lsl.b      d1, d0
03E35C: e328             lsl.b      d1, d0
03E35E: e328             lsl.b      d1, d0
03E360: e300             asl.b      #$1, d0
03E362: e303             asl.b      #$1, d3
03E364: e304             asl.b      #$1, d4
03E366: e305             asl.b      #$1, d5
03E368: e306             asl.b      #$1, d6
03E36A: e307             asl.b      #$1, d7
03E36C: e308             lsl.b      #$1, d0
03E36E: e309             lsl.b      #$1, d1
03E370: e30a             lsl.b      #$1, d2
03E372: e30b             lsl.b      #$1, d3
03E374: e30c             lsl.b      #$1, d4
03E376: e30d             lsl.b      #$1, d5
03E378: e30e             lsl.b      #$1, d6
03E37A: e30f             lsl.b      #$1, d7
03E37C: e320             asl.b      d1, d0
03E37E: e321             asl.b      d1, d1
03E380: e322             asl.b      d1, d2
03E382: e323             asl.b      d1, d3
03E384: e324             asl.b      d1, d4
03E386: e327             asl.b      d1, d7
03E388: e328             lsl.b      d1, d0
03E38A: e328             lsl.b      d1, d0
03E38C: e328             lsl.b      d1, d0
03E38E: e328             lsl.b      d1, d0
03E390: e310             roxl.b     #$1, d0
03E392: e313             roxl.b     #$1, d3
03E394: e314             roxl.b     #$1, d4
03E396: e315             roxl.b     #$1, d5
03E398: e316             roxl.b     #$1, d6
03E39A: e317             roxl.b     #$1, d7
03E39C: e318             rol.b      #$1, d0
03E39E: e319             rol.b      #$1, d1
03E3A0: e31a             rol.b      #$1, d2
03E3A2: e31b             rol.b      #$1, d3
03E3A4: e31c             rol.b      #$1, d4
03E3A6: e31d             rol.b      #$1, d5
03E3A8: e31e             rol.b      #$1, d6
03E3AA: e31f             rol.b      #$1, d7
03E3AC: e330             roxl.b     d1, d0
03E3AE: e331             roxl.b     d1, d1
03E3B0: e332             roxl.b     d1, d2
03E3B2: e333             roxl.b     d1, d3
03E3B4: e334             roxl.b     d1, d4
03E3B6: e337             roxl.b     d1, d7
03E3B8: e328             lsl.b      d1, d0
03E3BA: e328             lsl.b      d1, d0
03E3BC: e328             lsl.b      d1, d0
03E3BE: e300             asl.b      #$1, d0
03E3C0: e302             asl.b      #$1, d2
03E3C2: e303             asl.b      #$1, d3
03E3C4: e304             asl.b      #$1, d4
03E3C6: e305             asl.b      #$1, d5
03E3C8: e306             asl.b      #$1, d6
03E3CA: e307             asl.b      #$1, d7
03E3CC: e308             lsl.b      #$1, d0
03E3CE: e309             lsl.b      #$1, d1
03E3D0: e30a             lsl.b      #$1, d2
03E3D2: e30b             lsl.b      #$1, d3
03E3D4: e30c             lsl.b      #$1, d4
03E3D6: e30d             lsl.b      #$1, d5
03E3D8: e30e             lsl.b      #$1, d6
03E3DA: e30f             lsl.b      #$1, d7
03E3DC: e320             asl.b      d1, d0
03E3DE: e321             asl.b      d1, d1
03E3E0: e322             asl.b      d1, d2
03E3E2: e323             asl.b      d1, d3
03E3E4: e324             asl.b      d1, d4
03E3E6: e325             asl.b      d1, d5
03E3E8: e327             asl.b      d1, d7
03E3EA: e328             lsl.b      d1, d0
03E3EC: e328             lsl.b      d1, d0
03E3EE: e310             roxl.b     #$1, d0
03E3F0: e312             roxl.b     #$1, d2
03E3F2: e313             roxl.b     #$1, d3
03E3F4: e314             roxl.b     #$1, d4
03E3F6: e315             roxl.b     #$1, d5
03E3F8: e316             roxl.b     #$1, d6
03E3FA: e317             roxl.b     #$1, d7
03E3FC: e318             rol.b      #$1, d0
03E3FE: e319             rol.b      #$1, d1
03E400: e31a             rol.b      #$1, d2
03E402: e31b             rol.b      #$1, d3
03E404: e31c             rol.b      #$1, d4
03E406: e31d             rol.b      #$1, d5
03E408: e31e             rol.b      #$1, d6
03E40A: e31f             rol.b      #$1, d7
03E40C: e330             roxl.b     d1, d0
03E40E: e331             roxl.b     d1, d1
03E410: e332             roxl.b     d1, d2
03E412: e333             roxl.b     d1, d3
03E414: e334             roxl.b     d1, d4
03E416: e335             roxl.b     d1, d5
03E418: e337             roxl.b     d1, d7
03E41A: e328             lsl.b      d1, d0
03E41C: e300             asl.b      #$1, d0
03E41E: e301             asl.b      #$1, d1
03E420: e302             asl.b      #$1, d2
03E422: e303             asl.b      #$1, d3
03E424: e304             asl.b      #$1, d4
03E426: e305             asl.b      #$1, d5
03E428: e306             asl.b      #$1, d6
03E42A: e307             asl.b      #$1, d7
03E42C: e308             lsl.b      #$1, d0
03E42E: e309             lsl.b      #$1, d1
03E430: e30a             lsl.b      #$1, d2
03E432: e30b             lsl.b      #$1, d3
03E434: e30c             lsl.b      #$1, d4
03E436: e30d             lsl.b      #$1, d5
03E438: e30e             lsl.b      #$1, d6
03E43A: e30f             lsl.b      #$1, d7
03E43C: e320             asl.b      d1, d0
03E43E: e321             asl.b      d1, d1
03E440: e322             asl.b      d1, d2
03E442: e323             asl.b      d1, d3
03E444: e324             asl.b      d1, d4
03E446: e325             asl.b      d1, d5
03E448: e326             asl.b      d1, d6
03E44A: e327             asl.b      d1, d7
03E44C: e310             roxl.b     #$1, d0
03E44E: e311             roxl.b     #$1, d1
03E450: e312             roxl.b     #$1, d2
03E452: e313             roxl.b     #$1, d3
03E454: e314             roxl.b     #$1, d4
03E456: e315             roxl.b     #$1, d5
03E458: e316             roxl.b     #$1, d6
03E45A: e317             roxl.b     #$1, d7
03E45C: e318             rol.b      #$1, d0
03E45E: e319             rol.b      #$1, d1
03E460: e31a             rol.b      #$1, d2
03E462: e31b             rol.b      #$1, d3
03E464: e31c             rol.b      #$1, d4
03E466: e31d             rol.b      #$1, d5
03E468: e31e             rol.b      #$1, d6
03E46A: e31f             rol.b      #$1, d7
03E46C: e330             roxl.b     d1, d0
03E46E: e331             roxl.b     d1, d1
03E470: e332             roxl.b     d1, d2
03E472: e333             roxl.b     d1, d3
03E474: e334             roxl.b     d1, d4
03E476: e335             roxl.b     d1, d5
03E478: e336             roxl.b     d1, d6
03E47A: e337             roxl.b     d1, d7
03E47C: e34b             lsl.w      #$1, d3
03E47E: e34d             lsl.w      #$1, d5
03E480: e340             asl.w      #$1, d0
03E482: e34e             lsl.w      #$1, d6
03E484: e34e             lsl.w      #$1, d6
03E486: e328             lsl.b      d1, d0
03E488: e34e             lsl.w      #$1, d6
03E48A: e34f             lsl.w      #$1, d7
03E48C: e33c             rol.b      d1, d4
03E48E: e34d             lsl.w      #$1, d5
03E490: e34f             lsl.w      #$1, d7
03E492: e328             lsl.b      d1, d0
03E494: e33d             rol.b      d1, d5
03E496: e350             roxl.w     #$1, d0
03E498: e34f             lsl.w      #$1, d7
03E49A: e34f             lsl.w      #$1, d7
03E49C: e34a             lsl.w      #$1, d2
03E49E: e349             lsl.w      #$1, d1
03E4A0: 00000000         ori.b      #$0, d0
03E4A4: 00000000         ori.b      #$0, d0
03E4A8: 00000000         ori.b      #$0, d0
03E4AC: 00000000         ori.b      #$0, d0
03E4B0: 00000000         ori.b      #$0, d0
03E4B4: 00000000         ori.b      #$0, d0
03E4B8: 00000000         ori.b      #$0, d0
03E4BC: 00000000         ori.b      #$0, d0
03E4C0: 00000000         ori.b      #$0, d0
03E4C4: e328             lsl.b      d1, d0
03E4C6: e328             lsl.b      d1, d0
03E4C8: e328             lsl.b      d1, d0
03E4CA: e328             lsl.b      d1, d0
03E4CC: e328             lsl.b      d1, d0
03E4CE: e328             lsl.b      d1, d0
03E4D0: e328             lsl.b      d1, d0
03E4D2: e328             lsl.b      d1, d0
03E4D4: e328             lsl.b      d1, d0
03E4D6: e328             lsl.b      d1, d0
03E4D8: e33b             rol.b      d1, d3
03E4DA: e32a             lsl.b      d1, d2
03E4DC: e33a             rol.b      d1, d2
03E4DE: e33a             rol.b      d1, d2
03E4E0: e32c             lsl.b      d1, d4
03E4E2: e328             lsl.b      d1, d0
03E4E4: e328             lsl.b      d1, d0
03E4E6: e34e             lsl.w      #$1, d6
03E4E8: e340             asl.w      #$1, d0
03E4EA: e342             asl.w      #$1, d2
03E4EC: e33c             rol.b      d1, d4
03E4EE: e328             lsl.b      d1, d0
03E4F0: e328             lsl.b      d1, d0
03E4F2: e328             lsl.b      d1, d0
03E4F4: e328             lsl.b      d1, d0
03E4F6: e328             lsl.b      d1, d0
03E4F8: e328             lsl.b      d1, d0
03E4FA: e328             lsl.b      d1, d0
03E4FC: e328             lsl.b      d1, d0
03E4FE: e328             lsl.b      d1, d0
03E500: e328             lsl.b      d1, d0
03E502: e328             lsl.b      d1, d0
03E504: e328             lsl.b      d1, d0
03E506: e328             lsl.b      d1, d0
03E508: e328             lsl.b      d1, d0
03E50A: e328             lsl.b      d1, d0
03E50C: e328             lsl.b      d1, d0
03E50E: e328             lsl.b      d1, d0
03E510: e328             lsl.b      d1, d0
03E512: e328             lsl.b      d1, d0
03E514: e328             lsl.b      d1, d0
03E516: e32a             lsl.b      d1, d2
03E518: e33a             rol.b      d1, d2
03E51A: e33a             rol.b      d1, d2
03E51C: e32d             lsl.b      d1, d5
03E51E: e328             lsl.b      d1, d0
03E520: e328             lsl.b      d1, d0
03E522: e351             roxl.w     #$1, d1
03E524: e344             asl.w      #$1, d4
03E526: e33e             rol.b      d1, d6
03E528: e328             lsl.b      d1, d0
03E52A: e34f             lsl.w      #$1, d7
03E52C: e34a             lsl.w      #$1, d2
03E52E: e346             asl.w      #$1, d6
03E530: e33c             rol.b      d1, d4
03E532: e344             asl.w      #$1, d4
03E534: e328             lsl.b      d1, d0
03E536: e328             lsl.b      d1, d0
03E538: e328             lsl.b      d1, d0
03E53A: e328             lsl.b      d1, d0
03E53C: e328             lsl.b      d1, d0
03E53E: e328             lsl.b      d1, d0
03E540: e328             lsl.b      d1, d0
03E542: e328             lsl.b      d1, d0
03E544: e328             lsl.b      d1, d0
03E546: e328             lsl.b      d1, d0
03E548: e347             asl.w      #$1, d7
03E54A: e344             asl.w      #$1, d4
03E54C: e33e             rol.b      d1, d6
03E54E: e340             asl.w      #$1, d0
03E550: e349             lsl.w      #$1, d1
03E552: e34e             lsl.w      #$1, d6
03E554: e340             asl.w      #$1, d0
03E556: e33f             rol.b      d1, d7
03E558: e328             lsl.b      d1, d0
03E55A: e33d             rol.b      d1, d5
03E55C: e354             roxl.w     #$1, d4
03E55E: e328             lsl.b      d1, d0
03E560: e34e             lsl.w      #$1, d6
03E562: e340             asl.w      #$1, d0
03E564: e342             asl.w      #$1, d2
03E566: e33c             rol.b      d1, d4
03E568: e328             lsl.b      d1, d0
03E56A: e340             asl.w      #$1, d0
03E56C: e349             lsl.w      #$1, d1
03E56E: e34f             lsl.w      #$1, d7
03E570: e340             asl.w      #$1, d0
03E572: e34d             lsl.w      #$1, d5
03E574: e34b             lsl.w      #$1, d3
03E576: e34d             lsl.w      #$1, d5
03E578: e344             asl.w      #$1, d4
03E57A: e34e             lsl.w      #$1, d6
03E57C: e340             asl.w      #$1, d0
03E57E: e34e             lsl.w      #$1, d6
03E580: e357             roxl.w     #$1, d7
03E582: e347             asl.w      #$1, d7
03E584: e34f             lsl.w      #$1, d7
03E586: e33f             rol.b      d1, d7
03E588: e356             roxl.w     #$1, d6
03E58A: 11a101d325000000 move.b     -(a1), ([], $25000000)
