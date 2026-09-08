0000: f3           di
0001: f3           di
0002: ed56         im 1
0004: 1862         jr $0068
0006: 00           nop
0007: 00           nop
0008: 2a021c       ld hl,($1c02)
000B: 0600         ld b,$00
000D: 09           add hl,bc
000E: 08           ex af,af'
000F: 7e           ld a,(hl)
0010: 23           inc hl
0011: 66           ld h,(hl)
0012: 6f           ld l,a
0013: 08           ex af,af'
0014: c9           ret
0015: 00           nop
0016: 00           nop
0017: 00           nop
0018: 4f           ld c,a
0019: 0600         ld b,$00
001B: 09           add hl,bc
001C: 09           add hl,bc
001D: 00           nop
001E: 00           nop
001F: 00           nop
0020: 7e           ld a,(hl)
0021: 23           inc hl
0022: 66           ld h,(hl)
0023: 6f           ld l,a
0024: c9           ret
0025: 00           nop
0026: 00           nop
0027: 00           nop
0028: 00           nop
0029: 00           nop
002A: 00           nop
002B: 00           nop
002C: 00           nop
002D: 00           nop
002E: 00           nop
002F: 00           nop
0030: 00           nop
0031: 00           nop
0032: 00           nop
0033: 00           nop
0034: 00           nop
0035: 00           nop
0036: 00           nop
0037: 00           nop
0038: f3           di
0039: f5           push af
003A: fde5         push iy
003C: d9           exx
003D: 210060       ld hl,$6000
0040: af           xor a
0041: 1e01         ld e,$01
0043: 77           ld (hl),a
0044: 73           ld (hl),e
0045: 73           ld (hl),e
0046: 73           ld (hl),e
0047: 77           ld (hl),a
0048: 77           ld (hl),a
0049: 77           ld (hl),a
004A: 77           ld (hl),a
004B: 77           ld (hl),a
004C: cdb707       call $07b7
004F: cda800       call $00a8
0052: 210060       ld hl,$6000
0055: af           xor a
0056: 1e01         ld e,$01
0058: 73           ld (hl),e
0059: 73           ld (hl),e
005A: 73           ld (hl),e
005B: 73           ld (hl),e
005C: 77           ld (hl),a
005D: 77           ld (hl),a
005E: 77           ld (hl),a
005F: 77           ld (hl),a
0060: 77           ld (hl),a
0061: d9           exx
0062: fde1         pop iy
0064: f1           pop af
0065: 0601         ld b,$01
0067: c9           ret
0068: 310020       ld sp,$2000
006B: cd1a07       call $071a
006E: 210060       ld hl,$6000
0071: af           xor a
0072: 1e01         ld e,$01
0074: 73           ld (hl),e
0075: 73           ld (hl),e
0076: 73           ld (hl),e
0077: 73           ld (hl),e
0078: 77           ld (hl),a
0079: 77           ld (hl),a
007A: 77           ld (hl),a
007B: 77           ld (hl),a
007C: 77           ld (hl),a
007D: fb           ei
007E: c3e10e       jp $0ee1
0081: ddcb017e     bit 7,(ix+1)
0085: c0           ret nz
0086: ddcb0056     bit 2,(ix+0)
008A: c0           ret nz
008B: dd8601       add a,(ix+1)
008E: ddcb0156     bit 2,(ix+1)
0092: 2009         jr nz,$009d
0094: 320040       ld ($4000),a
0097: 00           nop
0098: 79           ld a,c
0099: 320140       ld ($4001),a
009C: c9           ret
009D: d604         sub $04
009F: 320240       ld ($4002),a
00A2: 00           nop
00A3: 79           ld a,c
00A4: 320340       ld ($4003),a
00A7: c9           ret
00A8: cd4f06       call $064f
00AB: cda107       call $07a1
00AE: cdcc06       call $06cc
00B1: cd6504       call $0465
00B4: cdce00       call $00ce
00B7: af           xor a
00B8: 32191c       ld ($1c19),a
00BB: dd21401c     ld ix,$1c40
00BF: ddcb007e     bit 7,(ix+0)
00C3: c4c808       call nz,$08c8
00C6: 0609         ld b,$09
00C8: dd21701c     ld ix,$1c70
00CC: 180b         jr $00d9
00CE: 3e01         ld a,$01
00D0: 32191c       ld ($1c19),a
00D3: dd21201e     ld ix,$1e20
00D7: 0607         ld b,$07
00D9: c5           push bc
00DA: ddcb007e     bit 7,(ix+0)
00DE: c4ea00       call nz,$00ea
00E1: 113000       ld de,$0030
00E4: dd19         add ix,de
00E6: c1           pop bc
00E7: 10f0         djnz $00d9
00E9: c9           ret
00EA: ddcb017e     bit 7,(ix+1)
00EE: c21b0e       jp nz,$0e1b
00F1: cd5c02       call $025c
00F4: 2017         jr nz,$010d
00F6: cd8a01       call $018a
00F9: ddcb0066     bit 4,(ix+0)
00FD: c0           ret nz
00FE: cdef02       call $02ef
0101: cdc003       call $03c0
0104: cd1a03       call $031a
0107: cd2c01       call $012c
010A: c36402       jp $0264
010D: cdd902       call $02d9
0110: ddcb0066     bit 4,(ix+0)
0114: c0           ret nz
0115: dd7e1e       ld a,(ix+30)
0118: b7           or a
0119: 2806         jr z,$0121
011B: dd351e       dec (ix+30)
011E: ca7d02       jp z,$027d
0121: cdc003       call $03c0
0124: ddcb0076     bit 6,(ix+0)
0128: c0           ret nz
0129: cd1a03       call $031a
012C: ddcb0056     bit 2,(ix+0)
0130: c0           ret nz
0131: ddcb0046     bit 0,(ix+0)
0135: c24501       jp nz,$0145
0138: 3ea4         ld a,$a4
013A: 4c           ld c,h
013B: cd8100       call $0081
013E: 3ea0         ld a,$a0
0140: 4d           ld c,l
0141: cd8100       call $0081
0144: c9           ret
0145: dd7e01       ld a,(ix+1)
0148: fe02         cp $02
014A: 20ec         jr nz,$0138
014C: cd7a01       call $017a
014F: 0604         ld b,$04
0151: 217601       ld hl,$0176
0154: c5           push bc
0155: 7e           ld a,(hl)
0156: 23           inc hl
0157: e5           push hl
0158: eb           ex de,hl
0159: 4e           ld c,(hl)
015A: 23           inc hl
015B: 46           ld b,(hl)
015C: 23           inc hl
015D: eb           ex de,hl
015E: dd6e0d       ld ixl,(ix+13)
0161: dd660e       ld ixh,(ix+14)
0164: 09           add hl,bc
0165: f5           push af
0166: 4c           ld c,h
0167: cd9400       call $0094
016A: f1           pop af
016B: d604         sub $04
016D: 4d           ld c,l
016E: cd9400       call $0094
0171: e1           pop hl
0172: c1           pop bc
0173: 10df         djnz $0154
0175: c9           ret
0176: ad           xor l
0177: ae           xor (hl)
0178: ac           xor h
0179: a6           and (hl)
017A: 112a1c       ld de,$1c2a
017D: 3a191c       ld a,($1c19)
0180: b7           or a
0181: c8           ret z
0182: 111a1c       ld de,$1c1a
0185: f0           ret p
0186: 11221c       ld de,$1c22
0189: c9           ret
018A: dd5e03       ld e,(ix+3)
018D: dd5604       ld d,(ix+4)
0190: ddcb008e     res 1,(ix+0)
0194: ddcb00a6     res 4,(ix+0)
0198: 1a           ld a,(de)
0199: 13           inc de
019A: fee0         cp $e0
019C: d2ab0a       jp nc,$0aab
019F: 08           ex af,af'
01A0: cd7d02       call $027d
01A3: cd8f02       call $028f
01A6: 08           ex af,af'
01A7: ddcb005e     bit 3,(ix+0)
01AB: c20402       jp nz,$0204
01AE: b7           or a
01AF: f22a02       jp p,$022a
01B2: d681         sub $81
01B4: f2bc01       jp p,$01bc
01B7: cdc30e       call $0ec3
01BA: 182e         jr $01ea
01BC: dd8605       add a,(ix+5)
01BF: 210808       ld hl,$0808
01C2: f5           push af
01C3: df           rst $18
01C4: f1           pop af
01C5: ddcb017e     bit 7,(ix+1)
01C9: 2019         jr nz,$01e4
01CB: d5           push de
01CC: 1608         ld d,$08
01CE: 1e0c         ld e,$0c
01D0: 08           ex af,af'
01D1: af           xor a
01D2: 08           ex af,af'
01D3: 93           sub e
01D4: 3805         jr c,$01db
01D6: 08           ex af,af'
01D7: 82           add a,d
01D8: 18f8         jr $01d2
01DA: 08           ex af,af'
01DB: 83           add a,e
01DC: 21b008       ld hl,$08b0
01DF: df           rst $18
01E0: 08           ex af,af'
01E1: b4           or h
01E2: 67           ld h,a
01E3: d1           pop de
01E4: dd750d       ld (ix+13),ixl
01E7: dd740e       ld (ix+14),ixh
01EA: ddcb006e     bit 5,(ix+0)
01EE: 200d         jr nz,$01fd
01F0: 1a           ld a,(de)
01F1: b7           or a
01F2: f22902       jp p,$0229
01F5: dd7e0c       ld a,(ix+12)
01F8: dd770b       ld (ix+11),a
01FB: 1833         jr $0230
01FD: 1a           ld a,(de)
01FE: 13           inc de
01FF: dd7710       ld (ix+16),a
0202: 1824         jr $0228
0204: 67           ld h,a
0205: 1a           ld a,(de)
0206: 13           inc de
0207: 6f           ld l,a
0208: b4           or h
0209: 280c         jr z,$0217
020B: dd7e05       ld a,(ix+5)
020E: 0600         ld b,$00
0210: b7           or a
0211: f21502       jp p,$0215
0214: 05           dec b
0215: 4f           ld c,a
0216: 09           add hl,bc
0217: dd750d       ld (ix+13),ixl
021A: dd740e       ld (ix+14),ixh
021D: ddcb006e     bit 5,(ix+0)
0221: 2805         jr z,$0228
0223: 1a           ld a,(de)
0224: 13           inc de
0225: dd7710       ld (ix+16),a
0228: 1a           ld a,(de)
0229: 13           inc de
022A: cd5202       call $0252
022D: dd770c       ld (ix+12),a
0230: dd7303       ld (ix+3),e
0233: dd7204       ld (ix+4),d
0236: dd7e0c       ld a,(ix+12)
0239: dd770b       ld (ix+11),a
023C: ddcb004e     bit 1,(ix+0)
0240: c0           ret nz
0241: af           xor a
0242: dd7725       ld (ix+37),a
0245: dd7722       ld (ix+34),a
0248: dd7717       ld (ix+23),a
024B: dd7e1f       ld a,(ix+31)
024E: dd771e       ld (ix+30),a
0251: c9           ret
0252: dd4602       ld b,(ix+2)
0255: 05           dec b
0256: c8           ret z
0257: 4f           ld c,a
0258: 81           add a,c
0259: 10fd         djnz $0258
025B: c9           ret
025C: dd7e0b       ld a,(ix+11)
025F: 3d           dec a
0260: dd770b       ld (ix+11),a
0263: c9           ret
0264: dd7e0d       ld a,(ix+13)
0267: ddb60e       or (ix+14)
026A: c8           ret z
026B: dd7e00       ld a,(ix+0)
026E: e606         and $06
0270: c0           ret nz
0271: dd7e01       ld a,(ix+1)
0274: f6f0         or $f0
0276: 4f           ld c,a
0277: 3e28         ld a,$28
0279: cd9400       call $0094
027C: c9           ret
027D: dd7e00       ld a,(ix+0)
0280: e606         and $06
0282: c0           ret nz
0283: dd4e01       ld c,(ix+1)
0286: cb79         bit 7,c
0288: c0           ret nz
0289: 3e28         ld a,$28
028B: cd9400       call $0094
028E: c9           ret
028F: dd7e11       ld a,(ix+17)
0292: 3d           dec a
0293: f8           ret m
0294: 203f         jr nz,$02d5
0296: ddcb004e     bit 1,(ix+0)
029A: c0           ret nz
029B: dd3516       dec (ix+22)
029E: c0           ret nz
029F: c5           push bc
02A0: d5           push de
02A1: e5           push hl
02A2: dd7e15       ld a,(ix+21)
02A5: dd7716       ld (ix+22),a
02A8: dd7e12       ld a,(ix+18)
02AB: 21e102       ld hl,$02e1
02AE: df           rst $18
02AF: dd5e13       ld e,(ix+19)
02B2: dd3413       inc (ix+19)
02B5: dd7e14       ld a,(ix+20)
02B8: 3d           dec a
02B9: bb           cp e
02BA: 200e         jr nz,$02ca
02BC: dd3513       dec (ix+19)
02BF: dd7e11       ld a,(ix+17)
02C2: fe02         cp $02
02C4: 2804         jr z,$02ca
02C6: dd361300     ld (ix+19),$00
02CA: 1600         ld d,$00
02CC: 19           add hl,de
02CD: eb           ex de,hl
02CE: cd0d0b       call $0b0d
02D1: e1           pop hl
02D2: d1           pop de
02D3: c1           pop bc
02D4: c9           ret
02D5: af           xor a
02D6: dd7713       ld (ix+19),a
02D9: dd7e11       ld a,(ix+17)
02DC: d602         sub $02
02DE: f8           ret m
02DF: 18ba         jr $029b
02E1: e9           jp (hl)
02E2: 02           ld (bc),a
02E3: ea02eb       jp pe,$eb02
02E6: 02           ld (bc),a
02E7: ec0240       call pe,$4002
02EA: 80           add a,b
02EB: c0           ret nz
02EC: 40           ld b,b
02ED: c0           ret nz
02EE: 80           add a,b
02EF: ddcb077e     bit 7,(ix+7)
02F3: c8           ret z
02F4: ddcb004e     bit 1,(ix+0)
02F8: c0           ret nz
02F9: dd5e20       ld e,(ix+32)
02FC: dd5621       ld d,(ix+33)
02FF: dde5         push ix
0301: e1           pop hl
0302: 0600         ld b,$00
0304: 0e24         ld c,$24
0306: 09           add hl,bc
0307: eb           ex de,hl
0308: eda0         ldi
030A: eda0         ldi
030C: eda0         ldi
030E: 7e           ld a,(hl)
030F: cb3f         srl a
0311: 12           ld (de),a
0312: af           xor a
0313: dd7722       ld (ix+34),a
0316: dd7723       ld (ix+35),a
0319: c9           ret
031A: dd7e07       ld a,(ix+7)
031D: b7           or a
031E: c8           ret z
031F: fe80         cp $80
0321: 2048         jr nz,$036b
0323: dd3524       dec (ix+36)
0326: c0           ret nz
0327: dd3424       inc (ix+36)
032A: e5           push hl
032B: dd6e22       ld ixl,(ix+34)
032E: dd6623       ld ixh,(ix+35)
0331: dd3525       dec (ix+37)
0334: 2020         jr nz,$0356
0336: dd5e20       ld e,(ix+32)
0339: dd5621       ld d,(ix+33)
033C: d5           push de
033D: fde1         pop iy
033F: fd7e01       ld a,(iy+1)
0342: dd7725       ld (ix+37),a
0345: dd7e26       ld a,(ix+38)
0348: 4f           ld c,a
0349: e680         and $80
034B: 07           rlca
034C: ed44         neg
034E: 47           ld b,a
034F: 09           add hl,bc
0350: dd7522       ld (ix+34),ixl
0353: dd7423       ld (ix+35),ixh
0356: c1           pop bc
0357: 09           add hl,bc
0358: dd3527       dec (ix+39)
035B: c0           ret nz
035C: fd7e03       ld a,(iy+3)
035F: dd7727       ld (ix+39),a
0362: dd7e26       ld a,(ix+38)
0365: ed44         neg
0367: dd7726       ld (ix+38),a
036A: c9           ret
036B: 3d           dec a
036C: eb           ex de,hl
036D: 0e08         ld c,$08
036F: cf           rst $08
0370: df           rst $18
0371: 1803         jr $0376
0373: dd7725       ld (ix+37),a
0376: e5           push hl
0377: dd4e25       ld c,(ix+37)
037A: 0600         ld b,$00
037C: 09           add hl,bc
037D: 7e           ld a,(hl)
037E: e1           pop hl
037F: cb7f         bit 7,a
0381: cab103       jp z,$03b1
0384: fe82         cp $82
0386: 2812         jr z,$039a
0388: fe80         cp $80
038A: 2812         jr z,$039e
038C: fe84         cp $84
038E: 2811         jr z,$03a1
0390: 26ff         ld h,$ff
0392: 301f         jr nc,$03b3
0394: ddcb00f6     set 6,(ix+0)
0398: e1           pop hl
0399: c9           ret
039A: 03           inc bc
039B: 0a           ld a,(bc)
039C: 18d5         jr $0373
039E: af           xor a
039F: 18d2         jr $0373
03A1: 03           inc bc
03A2: 0a           ld a,(bc)
03A3: dd8622       add a,(ix+34)
03A6: dd7722       ld (ix+34),a
03A9: dd3425       inc (ix+37)
03AC: dd3425       inc (ix+37)
03AF: 18c5         jr $0376
03B1: 2600         ld h,$00
03B3: 6f           ld l,a
03B4: dd4622       ld b,(ix+34)
03B7: 04           inc b
03B8: eb           ex de,hl
03B9: 19           add hl,de
03BA: 10fd         djnz $03b9
03BC: dd3425       inc (ix+37)
03BF: c9           ret
03C0: 0600         ld b,$00
03C2: dd7e10       ld a,(ix+16)
03C5: b7           or a
03C6: f2ca03       jp p,$03ca
03C9: 05           dec b
03CA: dd660e       ld ixh,(ix+14)
03CD: dd6e0d       ld ixl,(ix+13)
03D0: 4f           ld c,a
03D1: 09           add hl,bc
03D2: ddcb017e     bit 7,(ix+1)
03D6: 2022         jr nz,$03fa
03D8: eb           ex de,hl
03D9: 3e07         ld a,$07
03DB: a2           and d
03DC: 47           ld b,a
03DD: 4b           ld c,e
03DE: b7           or a
03DF: 218302       ld hl,$0283
03E2: ed42         sbc hl,bc
03E4: 3806         jr c,$03ec
03E6: 2185fa       ld hl,$fa85
03E9: 19           add hl,de
03EA: 180e         jr $03fa
03EC: b7           or a
03ED: 210805       ld hl,$0508
03F0: ed42         sbc hl,bc
03F2: 3005         jr nc,$03f9
03F4: 217c05       ld hl,$057c
03F7: 19           add hl,de
03F8: eb           ex de,hl
03F9: eb           ex de,hl
03FA: ddcb006e     bit 5,(ix+0)
03FE: c8           ret z
03FF: dd740e       ld (ix+14),ixh
0402: dd750d       ld (ix+13),ixl
0405: c9           ret
0406: 2a371c       ld hl,($1c37)
0409: 3a191c       ld a,($1c19)
040C: b7           or a
040D: 2806         jr z,$0415
040F: dd6e2a       ld ixl,(ix+42)
0412: dd662b       ld ixh,(ix+43)
0415: af           xor a
0416: b0           or b
0417: c8           ret z
0418: 111900       ld de,$0019
041B: 19           add hl,de
041C: 10fd         djnz $041b
041E: c9           ret
041F: b0           or b
0420: 3038         jr nc,$045a
0422: 34           inc (hl)
0423: 3c           inc a
0424: 50           ld d,b
0425: 58           ld e,b
0426: 54           ld d,h
0427: 5c           ld e,h
0428: 60           ld h,b
0429: 68           ld l,b
042A: 64           ld h,h
042B: 6c           ld l,h
042C: 70           ld (hl),b
042D: 78           ld a,b
042E: 74           ld (hl),h
042F: 7c           ld a,h
0430: 80           add a,b
0431: 88           adc a,b
0432: 84           add a,h
0433: 8c           adc a,h
0434: 40           ld b,b
0435: 48           ld c,b
0436: 44           ld b,h
0437: 4c           ld c,h
0438: 90           sub b
0439: 98           sbc a,b
043A: 94           sub h
043B: 9c           sbc a,h
043C: 111f04       ld de,$041f
043F: dd4e0a       ld c,(ix+10)
0442: 3eb4         ld a,$b4
0444: cd8100       call $0081
0447: cd5d04       call $045d
044A: dd771b       ld (ix+27),a
044D: 0614         ld b,$14
044F: cd5d04       call $045d
0452: 10fb         djnz $044f
0454: dd751c       ld (ix+28),ixl
0457: dd741d       ld (ix+29),ixh
045A: c35f0b       jp $0b5f
045D: 1a           ld a,(de)
045E: 13           inc de
045F: 4e           ld c,(hl)
0460: 23           inc hl
0461: cd8100       call $0081
0464: c9           ret
0465: 3a091c       ld a,($1c09)
0468: cb7f         bit 7,a
046A: ca1a07       jp z,$071a
046D: fea0         cp $a0
046F: dab504       jp c,$04b5
0472: fedf         cp $df
0474: da5605       jp c,$0556
0477: fee0         cp $e0
0479: da1a07       jp c,$071a
047C: fef9         cp $f9
047E: d21a07       jp nc,$071a
0481: d6e0         sub $e0
0483: 218c04       ld hl,$048c
0486: df           rst $18
0487: af           xor a
0488: 32181c       ld ($1c18),a
048B: e9           jp (hl)
048C: ac           xor h
048D: 061a         ld b,$1a
048F: 07           rlca
0490: 91           sub c
0491: 07           rlca
0492: 94           sub h
0493: 04           inc b
0494: dd21701f     ld ix,$1f70
0498: 0602         ld b,$02
049A: 3e80         ld a,$80
049C: 32191c       ld ($1c19),a
049F: c5           push bc
04A0: ddcb007e     bit 7,(ix+0)
04A4: c4b004       call nz,$04b0
04A7: 113000       ld de,$0030
04AA: dd19         add ix,de
04AC: c1           pop bc
04AD: 10f0         djnz $049f
04AF: c9           ret
04B0: e5           push hl
04B1: e5           push hl
04B2: c3280c       jp $0c28
04B5: d681         sub $81
04B7: f8           ret m
04B8: f5           push af
04B9: cd1a07       call $071a
04BC: f1           pop af
04BD: 0e04         ld c,$04
04BF: cf           rst $08
04C0: df           rst $18
04C1: e5           push hl
04C2: e5           push hl
04C3: e7           rst $20
04C4: 22371c       ld ($1c37),hl
04C7: e1           pop hl
04C8: fde1         pop iy
04CA: fd7e05       ld a,(iy+5)
04CD: 32131c       ld ($1c13),a
04D0: 32141c       ld ($1c14),a
04D3: 110600       ld de,$0006
04D6: 19           add hl,de
04D7: 22331c       ld ($1c33),hl
04DA: 214205       ld hl,$0542
04DD: 22351c       ld ($1c35),hl
04E0: 11401c       ld de,$1c40
04E3: fd4602       ld b,(iy+2)
04E6: fd7e04       ld a,(iy+4)
04E9: c5           push bc
04EA: 2a351c       ld hl,($1c35)
04ED: eda0         ldi
04EF: eda0         ldi
04F1: 12           ld (de),a
04F2: 13           inc de
04F3: 22351c       ld ($1c35),hl
04F6: 2a331c       ld hl,($1c33)
04F9: eda0         ldi
04FB: eda0         ldi
04FD: eda0         ldi
04FF: eda0         ldi
0501: 22331c       ld ($1c33),hl
0504: cd1506       call $0615
0507: c1           pop bc
0508: 10df         djnz $04e9
050A: fd7e03       ld a,(iy+3)
050D: b7           or a
050E: ca3c05       jp z,$053c
0511: 47           ld b,a
0512: 215005       ld hl,$0550
0515: 22351c       ld ($1c35),hl
0518: 11901d       ld de,$1d90
051B: fd7e04       ld a,(iy+4)
051E: c5           push bc
051F: 2a351c       ld hl,($1c35)
0522: eda0         ldi
0524: eda0         ldi
0526: 12           ld (de),a
0527: 13           inc de
0528: 22351c       ld ($1c35),hl
052B: 2a331c       ld hl,($1c33)
052E: 010600       ld bc,$0006
0531: edb0         ldir
0533: 22331c       ld ($1c33),hl
0536: cd1c06       call $061c
0539: c1           pop bc
053A: 10e2         djnz $051e
053C: 3e80         ld a,$80
053E: 32091c       ld ($1c09),a
0541: c9           ret
0542: 80           add a,b
0543: 0680         ld b,$80
0545: 00           nop
0546: 80           add a,b
0547: 018002       ld bc,$0280
054A: 80           add a,b
054B: 04           inc b
054C: 80           add a,b
054D: 05           dec b
054E: 80           add a,b
054F: 0680         ld b,$80
0551: 80           add a,b
0552: 80           add a,b
0553: a0           and b
0554: 80           add a,b
0555: c0           ret nz
0556: d6a0         sub $a0
0558: 08           ex af,af'
0559: af           xor a
055A: 0e06         ld c,$06
055C: 32191c       ld ($1c19),a
055F: 08           ex af,af'
0560: cf           rst $08
0561: df           rst $18
0562: e5           push hl
0563: e7           rst $20
0564: 22391c       ld ($1c39),hl
0567: af           xor a
0568: 32151c       ld ($1c15),a
056B: e1           pop hl
056C: e5           push hl
056D: fde1         pop iy
056F: fd7e02       ld a,(iy+2)
0572: 323b1c       ld ($1c3b),a
0575: 110400       ld de,$0004
0578: 19           add hl,de
0579: fd4603       ld b,(iy+3)
057C: c5           push bc
057D: e5           push hl
057E: 23           inc hl
057F: 4e           ld c,(hl)
0580: cddf05       call $05df
0583: cbd6         set 2,(hl)
0585: dde5         push ix
0587: 3a191c       ld a,($1c19)
058A: b7           or a
058B: 2803         jr z,$0590
058D: e1           pop hl
058E: fde5         push iy
0590: d1           pop de
0591: e1           pop hl
0592: eda0         ldi
0594: 1a           ld a,(de)
0595: fe02         cp $02
0597: cc4e07       call z,$074e
059A: eda0         ldi
059C: 3a3b1c       ld a,($1c3b)
059F: 12           ld (de),a
05A0: 13           inc de
05A1: eda0         ldi
05A3: eda0         ldi
05A5: eda0         ldi
05A7: eda0         ldi
05A9: cd1506       call $0615
05AC: ddcb007e     bit 7,(ix+0)
05B0: 280c         jr z,$05be
05B2: dd7e01       ld a,(ix+1)
05B5: fdbe01       cp (iy+1)
05B8: 2004         jr nz,$05be
05BA: fdcb00d6     set 2,(iy+0)
05BE: e5           push hl
05BF: 2a391c       ld hl,($1c39)
05C2: 3a191c       ld a,($1c19)
05C5: b7           or a
05C6: 2804         jr z,$05cc
05C8: fde5         push iy
05CA: dde1         pop ix
05CC: dd752a       ld (ix+42),ixl
05CF: dd742b       ld (ix+43),ixh
05D2: cd7d02       call $027d
05D5: cd5b07       call $075b
05D8: e1           pop hl
05D9: c1           pop bc
05DA: 10a0         djnz $057c
05DC: c33c05       jp $053c
05DF: cb79         bit 7,c
05E1: 2008         jr nz,$05eb
05E3: 79           ld a,c
05E4: cb57         bit 2,a
05E6: 281a         jr z,$0602
05E8: 3d           dec a
05E9: 1817         jr $0602
05EB: 3e1f         ld a,$1f
05ED: cdcc0e       call $0ecc
05F0: 3eff         ld a,$ff
05F2: 32117f       ld ($7f11),a
05F5: 79           ld a,c
05F6: cb3f         srl a
05F8: cb3f         srl a
05FA: cb3f         srl a
05FC: cb3f         srl a
05FE: cb3f         srl a
0600: c602         add a,$02
0602: d602         sub $02
0604: 32321c       ld ($1c32),a
0607: f5           push af
0608: 212f06       ld hl,$062f
060B: df           rst $18
060C: e5           push hl
060D: dde1         pop ix
060F: f1           pop af
0610: 213f06       ld hl,$063f
0613: df           rst $18
0614: c9           ret
0615: 08           ex af,af'
0616: af           xor a
0617: 12           ld (de),a
0618: 13           inc de
0619: 12           ld (de),a
061A: 13           inc de
061B: 08           ex af,af'
061C: eb           ex de,hl
061D: 3630         ld (hl),$30
061F: 23           inc hl
0620: 36c0         ld (hl),$c0
0622: 23           inc hl
0623: 3601         ld (hl),$01
0625: 0624         ld b,$24
0627: 23           inc hl
0628: 3600         ld (hl),$00
062A: 10fb         djnz $0627
062C: 23           inc hl
062D: eb           ex de,hl
062E: c9           ret
062F: 201e         jr nz,$064f
0631: 50           ld d,b
0632: 1e80         ld e,$80
0634: 1eb0         ld e,$b0
0636: 1ee0         ld e,$e0
0638: 1e10         ld e,$10
063A: 1f           rra
063B: 40           ld b,b
063C: 1f           rra
063D: 40           ld b,b
063E: 1f           rra
063F: d0           ret nc
0640: 1c           inc e
0641: 00           nop
0642: 1d           dec e
0643: 301d         jr nc,$0662
0645: 60           ld h,b
0646: 1d           dec e
0647: 90           sub b
0648: 1d           dec e
0649: c0           ret nz
064A: 1d           dec e
064B: f0           ret p
064C: 1d           dec e
064D: f0           ret p
064E: 1d           dec e
064F: 21101c       ld hl,$1c10
0652: 7e           ld a,(hl)
0653: b7           or a
0654: c8           ret z
0655: fa6006       jp m,$0660
0658: d1           pop de
0659: 3d           dec a
065A: c0           ret nz
065B: 3602         ld (hl),$02
065D: c36207       jp $0762
0660: af           xor a
0661: 77           ld (hl),a
0662: 3a0d1c       ld a,($1c0d)
0665: b7           or a
0666: c21a07       jp nz,$071a
0669: dd21701c     ld ix,$1c70
066D: 0606         ld b,$06
066F: 3a111c       ld a,($1c11)
0672: b7           or a
0673: 2006         jr nz,$067b
0675: ddcb007e     bit 7,(ix+0)
0679: 2808         jr z,$0683
067B: dd4e0a       ld c,(ix+10)
067E: 3eb4         ld a,$b4
0680: cd8100       call $0081
0683: 113000       ld de,$0030
0686: dd19         add ix,de
0688: 10e5         djnz $066f
068A: dd21701f     ld ix,$1f70
068E: 0607         ld b,$07
0690: ddcb007e     bit 7,(ix+0)
0694: 280e         jr z,$06a4
0696: ddcb017e     bit 7,(ix+1)
069A: 2008         jr nz,$06a4
069C: dd4e0a       ld c,(ix+10)
069F: 3eb4         ld a,$b4
06A1: cd8100       call $0081
06A4: 113000       ld de,$0030
06A7: dd19         add ix,de
06A9: 10e5         djnz $0690
06AB: c9           ret
06AC: 3e28         ld a,$28
06AE: 320d1c       ld ($1c0d),a
06B1: 3e06         ld a,$06
06B3: 320f1c       ld ($1c0f),a
06B6: 320e1c       ld ($1c0e),a
06B9: af           xor a
06BA: 32401c       ld ($1c40),a
06BD: 32601d       ld ($1d60),a
06C0: 32f01d       ld ($1df0),a
06C3: 32901d       ld ($1d90),a
06C6: 32c01d       ld ($1dc0),a
06C9: c39107       jp $0791
06CC: 210d1c       ld hl,$1c0d
06CF: 7e           ld a,(hl)
06D0: b7           or a
06D1: c8           ret z
06D2: fcb906       call m,$06b9
06D5: cbbe         res 7,(hl)
06D7: 3a0f1c       ld a,($1c0f)
06DA: 3d           dec a
06DB: 2804         jr z,$06e1
06DD: 320f1c       ld ($1c0f),a
06E0: c9           ret
06E1: 3a0e1c       ld a,($1c0e)
06E4: 320f1c       ld ($1c0f),a
06E7: 3a0d1c       ld a,($1c0d)
06EA: 3d           dec a
06EB: 320d1c       ld ($1c0d),a
06EE: 282a         jr z,$071a
06F0: dd21401c     ld ix,$1c40
06F4: 0606         ld b,$06
06F6: dd3406       inc (ix+6)
06F9: f20107       jp p,$0701
06FC: dd3506       dec (ix+6)
06FF: 1811         jr $0712
0701: ddcb007e     bit 7,(ix+0)
0705: 280b         jr z,$0712
0707: ddcb0056     bit 2,(ix+0)
070B: 2005         jr nz,$0712
070D: c5           push bc
070E: cd5f0b       call $0b5f
0711: c1           pop bc
0712: 113000       ld de,$0030
0715: dd19         add ix,de
0717: 10dd         djnz $06f6
0719: c9           ret
071A: 21091c       ld hl,$1c09
071D: 110a1c       ld de,$1c0a
0720: 016603       ld bc,$0366
0723: 3600         ld (hl),$00
0725: edb0         ldir
0727: dd214205     ld ix,$0542
072B: 0606         ld b,$06
072D: c5           push bc
072E: cde807       call $07e8
0731: cd5b07       call $075b
0734: dd23         inc ix
0736: dd23         inc ix
0738: c1           pop bc
0739: 10f2         djnz $072d
073B: 0607         ld b,$07
073D: af           xor a
073E: 323c1c       ld ($1c3c),a
0741: 320d1c       ld ($1c0d),a
0744: cd9107       call $0791
0747: 0e00         ld c,$00
0749: 3e2b         ld a,$2b
074B: cd9400       call $0094
074E: af           xor a
074F: 32121c       ld ($1c12),a
0752: 4f           ld c,a
0753: 3e27         ld a,$27
0755: cd9400       call $0094
0758: c33c05       jp $053c
075B: 3e90         ld a,$90
075D: 0e00         ld c,$00
075F: c3fc07       jp $07fc
0762: cd9107       call $0791
0765: c5           push bc
0766: f5           push af
0767: 0603         ld b,$03
0769: 3eb4         ld a,$b4
076B: 0e00         ld c,$00
076D: f5           push af
076E: cd9400       call $0094
0771: f1           pop af
0772: 3c           inc a
0773: 10f8         djnz $076d
0775: 0603         ld b,$03
0777: 3eb4         ld a,$b4
0779: f5           push af
077A: cd9f00       call $009f
077D: f1           pop af
077E: 3c           inc a
077F: 10f8         djnz $0779
0781: 0e00         ld c,$00
0783: 0607         ld b,$07
0785: 3e28         ld a,$28
0787: f5           push af
0788: cd9400       call $0094
078B: 0c           inc c
078C: f1           pop af
078D: 10f8         djnz $0787
078F: f1           pop af
0790: c1           pop bc
0791: c5           push bc
0792: 0604         ld b,$04
0794: 3e9f         ld a,$9f
0796: 32117f       ld ($7f11),a
0799: c620         add a,$20
079B: 10f9         djnz $0796
079D: c1           pop bc
079E: c33c05       jp $053c
07A1: 3a141c       ld a,($1c14)
07A4: 21131c       ld hl,$1c13
07A7: 86           add a,(hl)
07A8: 77           ld (hl),a
07A9: d0           ret nc
07AA: 214b1c       ld hl,$1c4b
07AD: 113000       ld de,$0030
07B0: 060a         ld b,$0a
07B2: 34           inc (hl)
07B3: 19           add hl,de
07B4: 10fc         djnz $07b2
07B6: c9           ret
07B7: ed5f         ld a,r
07B9: 32171c       ld ($1c17),a
07BC: 110a1c       ld de,$1c0a
07BF: cdc507       call $07c5
07C2: cdc507       call $07c5
07C5: 1a           ld a,(de)
07C6: cb7f         bit 7,a
07C8: c8           ret z
07C9: d681         sub $81
07CB: 0e00         ld c,$00
07CD: cf           rst $08
07CE: 4f           ld c,a
07CF: 0600         ld b,$00
07D1: 09           add hl,bc
07D2: 3a181c       ld a,($1c18)
07D5: be           cp (hl)
07D6: 2802         jr z,$07da
07D8: 300a         jr nc,$07e4
07DA: 1a           ld a,(de)
07DB: 32091c       ld ($1c09),a
07DE: 7e           ld a,(hl)
07DF: e67f         and $7f
07E1: 32181c       ld ($1c18),a
07E4: af           xor a
07E5: 12           ld (de),a
07E6: 13           inc de
07E7: c9           ret
07E8: cdf807       call $07f8
07EB: 3e40         ld a,$40
07ED: 0e7f         ld c,$7f
07EF: cdfc07       call $07fc
07F2: dd4e01       ld c,(ix+1)
07F5: c38902       jp $0289
07F8: 3e80         ld a,$80
07FA: 0eff         ld c,$ff
07FC: 0604         ld b,$04
07FE: f5           push af
07FF: cd8100       call $0081
0802: f1           pop af
0803: c604         add a,$04
0805: 10f7         djnz $07fe
0807: c9           ret
0808: ff           rst $38
0809: 03           inc bc
080A: ff           rst $38
080B: 03           inc bc
080C: ff           rst $38
080D: 03           inc bc
080E: ff           rst $38
080F: 03           inc bc
0810: ff           rst $38
0811: 03           inc bc
0812: ff           rst $38
0813: 03           inc bc
0814: ff           rst $38
0815: 03           inc bc
0816: ff           rst $38
0817: 03           inc bc
0818: ff           rst $38
0819: 03           inc bc
081A: f7           rst $30
081B: 03           inc bc
081C: be           cp (hl)
081D: 03           inc bc
081E: 88           adc a,b
081F: 03           inc bc
0820: 56           ld d,(hl)
0821: 03           inc bc
0822: 2603         ld h,$03
0824: f9           ld sp,hl
0825: 02           ld (bc),a
0826: ce02         adc a,$02
0828: a5           and l
0829: 02           ld (bc),a
082A: 80           add a,b
082B: 02           ld (bc),a
082C: 5c           ld e,h
082D: 02           ld (bc),a
082E: 3a021a       ld a,($1a02)
0831: 02           ld (bc),a
0832: fb           ei
0833: 01df01       ld bc,$01df
0836: c401ab       call nz,$ab01
0839: 019301       ld bc,$0193
083C: 7d           ld a,l
083D: 016701       ld bc,$0167
0840: 53           ld d,e
0841: 014001       ld bc,$0140
0844: 2e01         ld l,$01
0846: 1d           dec e
0847: 010d01       ld bc,$010d
084A: fe00         cp $00
084C: ef           rst $28
084D: 00           nop
084E: e200d6       jp po,$d600
0851: 00           nop
0852: c9           ret
0853: 00           nop
0854: be           cp (hl)
0855: 00           nop
0856: b4           or h
0857: 00           nop
0858: a9           xor c
0859: 00           nop
085A: a0           and b
085B: 00           nop
085C: 97           sub a
085D: 00           nop
085E: 8f           adc a,a
085F: 00           nop
0860: 87           add a,a
0861: 00           nop
0862: 7f           ld a,a
0863: 00           nop
0864: 78           ld a,b
0865: 00           nop
0866: 71           ld (hl),c
0867: 00           nop
0868: 6b           ld l,e
0869: 00           nop
086A: 65           ld h,l
086B: 00           nop
086C: 5f           ld e,a
086D: 00           nop
086E: 5a           ld e,d
086F: 00           nop
0870: 55           ld d,l
0871: 00           nop
0872: 50           ld d,b
0873: 00           nop
0874: 4b           ld c,e
0875: 00           nop
0876: 47           ld b,a
0877: 00           nop
0878: 43           ld b,e
0879: 00           nop
087A: 40           ld b,b
087B: 00           nop
087C: 3c           inc a
087D: 00           nop
087E: 39           add hl,sp
087F: 00           nop
0880: 3600         ld (hl),$00
0882: 33           inc sp
0883: 00           nop
0884: 3000         jr nc,$0886
0886: 2d           dec l
0887: 00           nop
0888: 2b           dec hl
0889: 00           nop
088A: 2800         jr z,$088c
088C: 2600         ld h,$00
088E: 24           inc h
088F: 00           nop
0890: 220020       ld ($2000),hl
0893: 00           nop
0894: 1f           rra
0895: 00           nop
0896: 1d           dec e
0897: 00           nop
0898: 1b           dec de
0899: 00           nop
089A: 1a           ld a,(de)
089B: 00           nop
089C: 1800         jr $089e
089E: 17           rla
089F: 00           nop
08A0: 1600         ld d,$00
08A2: 15           dec d
08A3: 00           nop
08A4: 13           inc de
08A5: 00           nop
08A6: 12           ld (de),a
08A7: 00           nop
08A8: 110010       ld de,$1000
08AB: 00           nop
08AC: 00           nop
08AD: 00           nop
08AE: 00           nop
08AF: 00           nop
08B0: 84           add a,h
08B1: 02           ld (bc),a
08B2: ab           xor e
08B3: 02           ld (bc),a
08B4: d302         out ($02),a
08B6: fe02         cp $02
08B8: 2d           dec l
08B9: 03           inc bc
08BA: 5c           ld e,h
08BB: 03           inc bc
08BC: 8f           adc a,a
08BD: 03           inc bc
08BE: c5           push bc
08BF: 03           inc bc
08C0: ff           rst $38
08C1: 03           inc bc
08C2: 3c           inc a
08C3: 04           inc b
08C4: 7c           ld a,h
08C5: 04           inc b
08C6: c0           ret nz
08C7: 04           inc b
08C8: cd5c02       call $025c
08CB: cccf08       call z,$08cf
08CE: c9           ret
08CF: dd5e03       ld e,(ix+3)
08D2: dd5604       ld d,(ix+4)
08D5: 1a           ld a,(de)
08D6: 13           inc de
08D7: fee0         cp $e0
08D9: d27c09       jp nc,$097c
08DC: b7           or a
08DD: fae408       jp m,$08e4
08E0: 1b           dec de
08E1: dd7e0d       ld a,(ix+13)
08E4: dd770d       ld (ix+13),a
08E7: fe80         cp $80
08E9: ca6609       jp z,$0966
08EC: d5           push de
08ED: 21601d       ld hl,$1d60
08F0: cb56         bit 2,(hl)
08F2: 2044         jr nz,$0938
08F4: e60f         and $0f
08F6: 2840         jr z,$0938
08F8: 08           ex af,af'
08F9: cd7d02       call $027d
08FC: 08           ex af,af'
08FD: 117609       ld de,$0976
0900: eb           ex de,hl
0901: eda0         ldi
0903: eda0         ldi
0905: eda0         ldi
0907: 3d           dec a
0908: 21a009       ld hl,$09a0
090B: df           rst $18
090C: 010600       ld bc,$0006
090F: edb0         ldir
0911: cd1c06       call $061c
0914: 21651d       ld hl,$1d65
0917: dd7e05       ld a,(ix+5)
091A: 86           add a,(hl)
091B: 77           ld (hl),a
091C: 3a681d       ld a,($1d68)
091F: 21b209       ld hl,$09b2
0922: df           rst $18
0923: 3a661d       ld a,($1d66)
0926: dd5e06       ld e,(ix+6)
0929: d5           push de
092A: 83           add a,e
092B: dd7706       ld (ix+6),a
092E: cd3c04       call $043c
0931: d1           pop de
0932: dd7306       ld (ix+6),e
0935: cd4e07       call $074e
0938: 21f01d       ld hl,$1df0
093B: cb56         bit 2,(hl)
093D: 2026         jr nz,$0965
093F: dd7e0d       ld a,(ix+13)
0942: e670         and $70
0944: 281f         jr z,$0965
0946: 117909       ld de,$0979
0949: eb           ex de,hl
094A: eda0         ldi
094C: eda0         ldi
094E: eda0         ldi
0950: cb3f         srl a
0952: cb3f         srl a
0954: cb3f         srl a
0956: cb3f         srl a
0958: 3d           dec a
0959: 218609       ld hl,$0986
095C: df           rst $18
095D: 010600       ld bc,$0006
0960: edb0         ldir
0962: cd1c06       call $061c
0965: d1           pop de
0966: 1a           ld a,(de)
0967: 13           inc de
0968: b7           or a
0969: f22a02       jp p,$022a
096C: 1b           dec de
096D: dd7e0c       ld a,(ix+12)
0970: dd770b       ld (ix+11),a
0973: c33002       jp $0230
0976: 80           add a,b
0977: 0601         ld b,$01
0979: 80           add a,b
097A: c0           ret nz
097B: 012182       ld bc,$8221
097E: 09           add hl,bc
097F: c3ae0a       jp $0aae
0982: 13           inc de
0983: c3d508       jp $08d5
0986: 8a           adc a,d
0987: 09           add hl,bc
0988: 95           sub l
0989: 09           add hl,bc
098A: 90           sub b
098B: 09           add hl,bc
098C: 00           nop
098D: 04           inc b
098E: 00           nop
098F: 01f3e7       ld bc,$e7f3
0992: c208f2       jp nz,$f208
0995: 9b           sbc a,e
0996: 09           add hl,bc
0997: 00           nop
0998: 0600         ld b,$00
099A: 02           ld (bc),a
099B: f3           di
099C: e7           rst $20
099D: c5           push bc
099E: 08           ex af,af'
099F: f2be09       jp p,$09be
09A2: 02           ld (bc),a
09A3: 0a           ld a,(bc)
09A4: 0d           dec c
09A5: 0a           ld a,(bc)
09A6: 160a         ld d,$0a
09A8: 210a45       ld hl,$450a
09AB: 0a           ld a,(bc)
09AC: e0           ret po
09AD: 09           add hl,bc
09AE: 67           ld h,a
09AF: 0a           ld a,(bc)
09B0: 89           adc a,c
09B1: 0a           ld a,(bc)
09B2: c7           rst $00
09B3: 09           add hl,bc
09B4: 4e           ld c,(hl)
09B5: 0a           ld a,(bc)
09B6: e9           jp (hl)
09B7: 09           add hl,bc
09B8: 2c           inc l
09B9: 0a           ld a,(bc)
09BA: 70           ld (hl),b
09BB: 0a           ld a,(bc)
09BC: 92           sub d
09BD: 0a           ld a,(bc)
09BE: c40900       call nz,$0009
09C1: 03           inc bc
09C2: 00           nop
09C3: 00           nop
09C4: 8c           adc a,h
09C5: 10f2         djnz $09b9
09C7: 3c           inc a
09C8: 05           dec b
09C9: 07           rlca
09CA: 01001f       ld bc,$1f00
09CD: 1f           rra
09CE: 1f           rra
09CF: 1f           rra
09D0: 00           nop
09D1: 12           ld (de),a
09D2: 19           add hl,de
09D3: 110010       ld de,$1000
09D6: 00           nop
09D7: 110f7f       ld de,$7f0f
09DA: 2f           cpl
09DB: bf           cp a
09DC: 0d           dec c
09DD: 80           add a,b
09DE: 00           nop
09DF: 80           add a,b
09E0: e609         and $09
09E2: 00           nop
09E3: 03           inc bc
09E4: 00           nop
09E5: 02           ld (bc),a
09E6: 90           sub b
09E7: 12           ld (de),a
09E8: f23c0f       jp p,$0f3c
09EB: 00           nop
09EC: 00           nop
09ED: 00           nop
09EE: 1f           rra
09EF: 1a           ld a,(de)
09F0: 181c         jr $0a0e
09F2: 17           rla
09F3: 111a0e       ld de,$0e1a
09F6: 00           nop
09F7: 0f           rrca
09F8: 14           inc d
09F9: 101f         djnz $0a1a
09FB: ecffff       call pe,$ffff
09FE: 07           rlca
09FF: 80           add a,b
0A00: 1680         ld d,$80
0A02: 08           ex af,af'
0A03: 0a           ld a,(bc)
0A04: 00           nop
0A05: 0601         ld b,$01
0A07: 03           inc bc
0A08: e0           ret po
0A09: 40           ld b,b
0A0A: b2           or d
0A0B: 12           ld (de),a
0A0C: f2130a       jp p,$0a13
0A0F: 00           nop
0A10: 0601         ld b,$01
0A12: 03           inc bc
0A13: af           xor a
0A14: 12           ld (de),a
0A15: f21c0a       jp p,$0a1c
0A18: 00           nop
0A19: 0601         ld b,$01
0A1B: 03           inc bc
0A1C: e0           ret po
0A1D: 80           add a,b
0A1E: a9           xor c
0A1F: 12           ld (de),a
0A20: f2270a       jp p,$0a27
0A23: 00           nop
0A24: 0601         ld b,$01
0A26: 03           inc bc
0A27: e0           ret po
0A28: 80           add a,b
0A29: 9e           sbc a,(hl)
0A2A: 12           ld (de),a
0A2B: f23e61       jp p,$613e
0A2E: 3030         jr nc,$0a60
0A30: 301f         jr nc,$0a51
0A32: 1f           rra
0A33: 1f           rra
0A34: 1f           rra
0A35: 0f           rrca
0A36: 100e         djnz $0a46
0A38: 0e00         ld c,$00
0A3A: 0e02         ld c,$02
0A3C: 02           ld (bc),a
0A3D: 3f           ccf
0A3E: 5f           ld e,a
0A3F: af           xor a
0A40: 8f           adc a,a
0A41: 00           nop
0A42: 84           add a,h
0A43: 83           add a,e
0A44: 80           add a,b
0A45: 4b           ld c,e
0A46: 0a           ld a,(bc)
0A47: 00           nop
0A48: 010101       ld bc,$0101
0A4B: 81           add a,c
0A4C: 08           ex af,af'
0A4D: f23c01       jp p,$013c
0A50: 010101       ld bc,$0101
0A53: 1f           rra
0A54: 1f           rra
0A55: 1f           rra
0A56: 1f           rra
0A57: 15           dec d
0A58: 13           inc de
0A59: 13           inc de
0A5A: 1010         djnz $0a6c
0A5C: 12           ld (de),a
0A5D: 0a           ld a,(bc)
0A5E: 05           dec b
0A5F: 9f           sbc a,a
0A60: 3f           ccf
0A61: af           xor a
0A62: 1f           rra
0A63: 0d           dec c
0A64: 80           add a,b
0A65: 0b           dec bc
0A66: 80           add a,b
0A67: 6d           ld l,l
0A68: 0a           ld a,(bc)
0A69: 00           nop
0A6A: 09           add hl,bc
0A6B: 00           nop
0A6C: 04           inc b
0A6D: 9c           sbc a,h
0A6E: 0a           ld a,(bc)
0A6F: f23d00       jp p,$003d
0A72: 0f           rrca
0A73: 0f           rrca
0A74: 0f           rrca
0A75: 1f           rra
0A76: 9f           sbc a,a
0A77: 9f           sbc a,a
0A78: 9f           sbc a,a
0A79: 1f           rra
0A7A: 1f           rra
0A7B: 1f           rra
0A7C: 1f           rra
0A7D: 00           nop
0A7E: 0e10         ld c,$10
0A80: 0f           rrca
0A81: 0f           rrca
0A82: 4f           ld c,a
0A83: 4f           ld c,a
0A84: 4f           ld c,a
0A85: 00           nop
0A86: 90           sub b
0A87: 90           sub b
0A88: 85           add a,l
0A89: 8f           adc a,a
0A8A: 0a           ld a,(bc)
0A8B: 00           nop
0A8C: 09           add hl,bc
0A8D: 00           nop
0A8E: 05           dec b
0A8F: 9c           sbc a,h
0A90: 0a           ld a,(bc)
0A91: f23d00       jp p,$003d
0A94: 0f           rrca
0A95: 0f           rrca
0A96: 0f           rrca
0A97: 1f           rra
0A98: 9f           sbc a,a
0A99: 9f           sbc a,a
0A9A: 9f           sbc a,a
0A9B: 1f           rra
0A9C: 1f           rra
0A9D: 1f           rra
0A9E: 1f           rra
0A9F: 00           nop
0AA0: 0e10         ld c,$10
0AA2: 0f           rrca
0AA3: 0f           rrca
0AA4: 4f           ld c,a
0AA5: 4f           ld c,a
0AA6: 4f           ld c,a
0AA7: 00           nop
0AA8: 90           sub b
0AA9: 90           sub b
0AAA: 85           add a,l
0AAB: 21b70a       ld hl,$0ab7
0AAE: e5           push hl
0AAF: d6e0         sub $e0
0AB1: 21bb0a       ld hl,$0abb
0AB4: df           rst $18
0AB5: 1a           ld a,(de)
0AB6: e9           jp (hl)
0AB7: 13           inc de
0AB8: c39801       jp $0198
0ABB: 0d           dec c
0ABC: 0b           dec bc
0ABD: 2b           dec hl
0ABE: 0b           dec bc
0ABF: 2f           cpl
0AC0: 0b           dec bc
0AC1: 33           inc sp
0AC2: 0b           dec bc
0AC3: 39           add hl,sp
0AC4: 0b           dec bc
0AC5: 4c           ld c,h
0AC6: 0b           dec bc
0AC7: 54           ld d,h
0AC8: 0b           dec bc
0AC9: 80           add a,b
0ACA: 0b           dec bc
0ACB: 86           add a,(hl)
0ACC: 0b           dec bc
0ACD: 200b         jr nz,$0ada
0ACF: 09           add hl,bc
0AD0: 0b           dec bc
0AD1: 90           sub b
0AD2: 0b           dec bc
0AD3: a6           and (hl)
0AD4: 0b           dec bc
0AD5: c0           ret nz
0AD6: 0b           dec bc
0AD7: c7           rst $00
0AD8: 0b           dec bc
0AD9: d40b0e       call nc,$0e0b
0ADC: 0c           inc c
0ADD: 1c           inc e
0ADE: 0c           inc c
0ADF: 280c         jr z,$0aed
0AE1: aa           xor d
0AE2: 0c           inc c
0AE3: 24           inc h
0AE4: 0c           inc c
0AE5: c9           ret
0AE6: 0c           inc c
0AE7: d20cd8       jp nc,$d80c
0AEA: 0c           inc c
0AEB: ef           rst $28
0AEC: 0c           inc c
0AED: 09           add hl,bc
0AEE: 0d           dec c
0AEF: 1c           inc e
0AF0: 0d           dec c
0AF1: 200d         jr nz,$0b00
0AF3: 27           daa
0AF4: 0d           dec c
0AF5: 3d           dec a
0AF6: 0d           dec c
0AF7: 4b           ld c,e
0AF8: 0d           dec c
0AF9: 92           sub d
0AFA: 0d           dec c
0AFB: 99           sbc a,c
0AFC: 0d           dec c
0AFD: a0           and b
0AFE: 0d           dec c
0AFF: a8           xor b
0B00: 0d           dec c
0B01: e3           ex (sp),hl
0B02: 0d           dec c
0B03: f1           pop af
0B04: 0d           dec c
0B05: 00           nop
0B06: 0e1b         ld c,$1b
0B08: 0e32         ld c,$32
0B0A: 3c           inc a
0B0B: 1c           inc e
0B0C: c9           ret
0B0D: 0e3f         ld c,$3f
0B0F: dd7e0a       ld a,(ix+10)
0B12: a1           and c
0B13: eb           ex de,hl
0B14: b6           or (hl)
0B15: dd770a       ld (ix+10),a
0B18: 4f           ld c,a
0B19: 3eb4         ld a,$b4
0B1B: cd8100       call $0081
0B1E: eb           ex de,hl
0B1F: c9           ret
0B20: 4f           ld c,a
0B21: 3e22         ld a,$22
0B23: cd9400       call $0094
0B26: 13           inc de
0B27: 0ec0         ld c,$c0
0B29: 18e4         jr $0b0f
0B2B: dd7710       ld (ix+16),a
0B2E: c9           ret
0B2F: 32161c       ld ($1c16),a
0B32: c9           ret
0B33: cde807       call $07e8
0B36: c3280c       jp $0c28
0B39: dde5         push ix
0B3B: e1           pop hl
0B3C: 011100       ld bc,$0011
0B3F: 09           add hl,bc
0B40: eb           ex de,hl
0B41: 010500       ld bc,$0005
0B44: edb0         ldir
0B46: 3e01         ld a,$01
0B48: 12           ld (de),a
0B49: eb           ex de,hl
0B4A: 1b           dec de
0B4B: c9           ret
0B4C: 13           inc de
0B4D: dd8606       add a,(ix+6)
0B50: dd7706       ld (ix+6),a
0B53: 1a           ld a,(de)
0B54: ddcb017e     bit 7,(ix+1)
0B58: c0           ret nz
0B59: dd8606       add a,(ix+6)
0B5C: dd7706       ld (ix+6),a
0B5F: d5           push de
0B60: 113404       ld de,$0434
0B63: dd6e1c       ld ixl,(ix+28)
0B66: dd661d       ld ixh,(ix+29)
0B69: 0604         ld b,$04
0B6B: 7e           ld a,(hl)
0B6C: b7           or a
0B6D: f2730b       jp p,$0b73
0B70: dd8606       add a,(ix+6)
0B73: e67f         and $7f
0B75: 4f           ld c,a
0B76: 1a           ld a,(de)
0B77: cd8100       call $0081
0B7A: 13           inc de
0B7B: 23           inc hl
0B7C: 10ed         djnz $0b6b
0B7E: d1           pop de
0B7F: c9           ret
0B80: ddcb00ce     set 1,(ix+0)
0B84: 1b           dec de
0B85: c9           ret
0B86: cd5202       call $0252
0B89: dd771e       ld (ix+30),a
0B8C: dd771f       ld (ix+31),a
0B8F: c9           ret
0B90: 13           inc de
0B91: c628         add a,$28
0B93: 4f           ld c,a
0B94: 0600         ld b,$00
0B96: dde5         push ix
0B98: e1           pop hl
0B99: 09           add hl,bc
0B9A: 7e           ld a,(hl)
0B9B: 3d           dec a
0B9C: caa10b       jp z,$0ba1
0B9F: 13           inc de
0BA0: c9           ret
0BA1: af           xor a
0BA2: 77           ld (hl),a
0BA3: c3d20c       jp $0cd2
0BA6: ddcb017e     bit 7,(ix+1)
0BAA: c8           ret z
0BAB: ddcb00a6     res 4,(ix+0)
0BAF: dd3517       dec (ix+23)
0BB2: dd8606       add a,(ix+6)
0BB5: fe0f         cp $0f
0BB7: dabc0b       jp c,$0bbc
0BBA: 3e0f         ld a,$0f
0BBC: dd7706       ld (ix+6),a
0BBF: c9           ret
0BC0: cdce0b       call $0bce
0BC3: cd8100       call $0081
0BC6: c9           ret
0BC7: cdce0b       call $0bce
0BCA: cd9400       call $0094
0BCD: c9           ret
0BCE: eb           ex de,hl
0BCF: 7e           ld a,(hl)
0BD0: 23           inc hl
0BD1: 4e           ld c,(hl)
0BD2: eb           ex de,hl
0BD3: c9           ret
0BD4: ddcb017e     bit 7,(ix+1)
0BD8: 2030         jr nz,$0c0a
0BDA: cdf807       call $07f8
0BDD: 1a           ld a,(de)
0BDE: dd7708       ld (ix+8),a
0BE1: b7           or a
0BE2: f2000c       jp p,$0c00
0BE5: 13           inc de
0BE6: 1a           ld a,(de)
0BE7: dd770f       ld (ix+15),a
0BEA: d5           push de
0BEB: dd7e0f       ld a,(ix+15)
0BEE: d681         sub $81
0BF0: 0e04         ld c,$04
0BF2: cf           rst $08
0BF3: df           rst $18
0BF4: e7           rst $20
0BF5: dd7e08       ld a,(ix+8)
0BF8: e67f         and $7f
0BFA: 47           ld b,a
0BFB: cd1504       call $0415
0BFE: 1805         jr $0c05
0C00: d5           push de
0C01: 47           ld b,a
0C02: cd0604       call $0406
0C05: cd3c04       call $043c
0C08: d1           pop de
0C09: c9           ret
0C0A: b7           or a
0C0B: f0           ret p
0C0C: 13           inc de
0C0D: c9           ret
0C0E: dd7320       ld (ix+32),e
0C11: dd7221       ld (ix+33),d
0C14: dd360780     ld (ix+7),$80
0C18: 13           inc de
0C19: 13           inc de
0C1A: 13           inc de
0C1B: c9           ret
0C1C: 13           inc de
0C1D: ddcb017e     bit 7,(ix+1)
0C21: 2001         jr nz,$0c24
0C23: 1a           ld a,(de)
0C24: dd7707       ld (ix+7),a
0C27: c9           ret
0C28: ddcb00be     res 7,(ix+0)
0C2C: 3e1f         ld a,$1f
0C2E: 32151c       ld ($1c15),a
0C31: cd7d02       call $027d
0C34: dd4e01       ld c,(ix+1)
0C37: dde5         push ix
0C39: cddf05       call $05df
0C3C: 3a191c       ld a,($1c19)
0C3F: b7           or a
0C40: 2851         jr z,$0c93
0C42: af           xor a
0C43: 32181c       ld ($1c18),a
0C46: e5           push hl
0C47: 2a371c       ld hl,($1c37)
0C4A: dde1         pop ix
0C4C: ddcb0096     res 2,(ix+0)
0C50: ddcb017e     bit 7,(ix+1)
0C54: 2042         jr nz,$0c98
0C56: ddcb007e     bit 7,(ix+0)
0C5A: 2837         jr z,$0c93
0C5C: 3e02         ld a,$02
0C5E: ddbe01       cp (ix+1)
0C61: 200d         jr nz,$0c70
0C63: 3e4f         ld a,$4f
0C65: ddcb0046     bit 0,(ix+0)
0C69: 2002         jr nz,$0c6d
0C6B: e60f         and $0f
0C6D: cd740d       call $0d74
0C70: dd7e08       ld a,(ix+8)
0C73: b7           or a
0C74: f27c0c       jp p,$0c7c
0C77: cdea0b       call $0bea
0C7A: 1814         jr $0c90
0C7C: 47           ld b,a
0C7D: cd1504       call $0415
0C80: cd3c04       call $043c
0C83: dd7e18       ld a,(ix+24)
0C86: b7           or a
0C87: f2930c       jp p,$0c93
0C8A: dd5e19       ld e,(ix+25)
0C8D: dd561a       ld d,(ix+26)
0C90: cd0a0e       call $0e0a
0C93: dde1         pop ix
0C95: e1           pop hl
0C96: e1           pop hl
0C97: c9           ret
0C98: ddcb0046     bit 0,(ix+0)
0C9C: 28f5         jr z,$0c93
0C9E: dd7e1a       ld a,(ix+26)
0CA1: b7           or a
0CA2: f2a80c       jp p,$0ca8
0CA5: 32117f       ld ($7f11),a
0CA8: 18e9         jr $0c93
0CAA: ddcb0156     bit 2,(ix+1)
0CAE: c0           ret nz
0CAF: 3edf         ld a,$df
0CB1: 32117f       ld ($7f11),a
0CB4: 1a           ld a,(de)
0CB5: dd771a       ld (ix+26),a
0CB8: ddcb00c6     set 0,(ix+0)
0CBC: b7           or a
0CBD: 2006         jr nz,$0cc5
0CBF: ddcb0086     res 0,(ix+0)
0CC3: 3eff         ld a,$ff
0CC5: 32117f       ld ($7f11),a
0CC8: c9           ret
0CC9: ddcb017e     bit 7,(ix+1)
0CCD: c8           ret z
0CCE: dd7708       ld (ix+8),a
0CD1: c9           ret
0CD2: eb           ex de,hl
0CD3: 5e           ld e,(hl)
0CD4: 23           inc hl
0CD5: 56           ld d,(hl)
0CD6: 1b           dec de
0CD7: c9           ret
0CD8: 13           inc de
0CD9: c628         add a,$28
0CDB: 4f           ld c,a
0CDC: 0600         ld b,$00
0CDE: dde5         push ix
0CE0: e1           pop hl
0CE1: 09           add hl,bc
0CE2: 7e           ld a,(hl)
0CE3: b7           or a
0CE4: 2002         jr nz,$0ce8
0CE6: 1a           ld a,(de)
0CE7: 77           ld (hl),a
0CE8: 13           inc de
0CE9: 35           dec (hl)
0CEA: c2d20c       jp nz,$0cd2
0CED: 13           inc de
0CEE: c9           ret
0CEF: 4f           ld c,a
0CF0: 13           inc de
0CF1: 1a           ld a,(de)
0CF2: 47           ld b,a
0CF3: c5           push bc
0CF4: dde5         push ix
0CF6: e1           pop hl
0CF7: dd3509       dec (ix+9)
0CFA: dd4e09       ld c,(ix+9)
0CFD: dd3509       dec (ix+9)
0D00: 0600         ld b,$00
0D02: 09           add hl,bc
0D03: 72           ld (hl),d
0D04: 2b           dec hl
0D05: 73           ld (hl),e
0D06: d1           pop de
0D07: 1b           dec de
0D08: c9           ret
0D09: dde5         push ix
0D0B: e1           pop hl
0D0C: dd4e09       ld c,(ix+9)
0D0F: 0600         ld b,$00
0D11: 09           add hl,bc
0D12: 5e           ld e,(hl)
0D13: 23           inc hl
0D14: 56           ld d,(hl)
0D15: dd3409       inc (ix+9)
0D18: dd3409       inc (ix+9)
0D1B: c9           ret
0D1C: dd7702       ld (ix+2),a
0D1F: c9           ret
0D20: dd8605       add a,(ix+5)
0D23: dd7705       ld (ix+5),a
0D26: c9           ret
0D27: fe01         cp $01
0D29: 2005         jr nz,$0d30
0D2B: ddcb00ee     set 5,(ix+0)
0D2F: c9           ret
0D30: ddcb008e     res 1,(ix+0)
0D34: ddcb00ae     res 5,(ix+0)
0D38: af           xor a
0D39: dd7710       ld (ix+16),a
0D3C: c9           ret
0D3D: fe01         cp $01
0D3F: 2005         jr nz,$0d46
0D41: ddcb00de     set 3,(ix+0)
0D45: c9           ret
0D46: ddcb009e     res 3,(ix+0)
0D4A: c9           ret
0D4B: dd7e01       ld a,(ix+1)
0D4E: fe02         cp $02
0D50: 202c         jr nz,$0d7e
0D52: ddcb00c6     set 0,(ix+0)
0D56: eb           ex de,hl
0D57: cd7a01       call $017a
0D5A: 0604         ld b,$04
0D5C: c5           push bc
0D5D: 7e           ld a,(hl)
0D5E: 23           inc hl
0D5F: e5           push hl
0D60: 21820d       ld hl,$0d82
0D63: 87           add a,a
0D64: 4f           ld c,a
0D65: 0600         ld b,$00
0D67: 09           add hl,bc
0D68: eda0         ldi
0D6A: eda0         ldi
0D6C: e1           pop hl
0D6D: c1           pop bc
0D6E: 10ec         djnz $0d5c
0D70: eb           ex de,hl
0D71: 1b           dec de
0D72: 3e4f         ld a,$4f
0D74: 32121c       ld ($1c12),a
0D77: 4f           ld c,a
0D78: 3e27         ld a,$27
0D7A: cd9400       call $0094
0D7D: c9           ret
0D7E: 13           inc de
0D7F: 13           inc de
0D80: 13           inc de
0D81: c9           ret
0D82: 00           nop
0D83: 00           nop
0D84: 32018e       ld ($8e01),a
0D87: 01e401       ld bc,$01e4
0D8A: 34           inc (hl)
0D8B: 02           ld (bc),a
0D8C: 7e           ld a,(hl)
0D8D: 02           ld (bc),a
0D8E: c202f0       jp nz,$f002
0D91: 02           ld (bc),a
0D92: 21fb0a       ld hl,$0afb
0D95: df           rst $18
0D96: 13           inc de
0D97: 1a           ld a,(de)
0D98: e9           jp (hl)
0D99: 32141c       ld ($1c14),a
0D9C: 32131c       ld ($1c13),a
0D9F: c9           ret
0DA0: dde5         push ix
0DA2: cd6804       call $0468
0DA5: dde1         pop ix
0DA7: c9           ret
0DA8: 32111c       ld ($1c11),a
0DAB: b7           or a
0DAC: 281d         jr z,$0dcb
0DAE: dde5         push ix
0DB0: d5           push de
0DB1: dd21401c     ld ix,$1c40
0DB5: 060a         ld b,$0a
0DB7: 113000       ld de,$0030
0DBA: ddcb00be     res 7,(ix+0)
0DBE: cd8302       call $0283
0DC1: dd19         add ix,de
0DC3: 10f5         djnz $0dba
0DC5: d1           pop de
0DC6: dde1         pop ix
0DC8: c39107       jp $0791
0DCB: dde5         push ix
0DCD: d5           push de
0DCE: dd21401c     ld ix,$1c40
0DD2: 060a         ld b,$0a
0DD4: 113000       ld de,$0030
0DD7: ddcb00fe     set 7,(ix+0)
0DDB: dd19         add ix,de
0DDD: 10f8         djnz $0dd7
0DDF: d1           pop de
0DE0: dde1         pop ix
0DE2: c9           ret
0DE3: eb           ex de,hl
0DE4: 5e           ld e,(hl)
0DE5: 23           inc hl
0DE6: 56           ld d,(hl)
0DE7: 23           inc hl
0DE8: 4e           ld c,(hl)
0DE9: 0600         ld b,$00
0DEB: 23           inc hl
0DEC: eb           ex de,hl
0DED: edb0         ldir
0DEF: 1b           dec de
0DF0: c9           ret
0DF1: 060a         ld b,$0a
0DF3: 21421c       ld hl,$1c42
0DF6: c5           push bc
0DF7: 013000       ld bc,$0030
0DFA: 77           ld (hl),a
0DFB: 09           add hl,bc
0DFC: c1           pop bc
0DFD: 10f7         djnz $0df6
0DFF: c9           ret
0E00: dd361880     ld (ix+24),$80
0E04: dd7319       ld (ix+25),e
0E07: dd721a       ld (ix+26),d
0E0A: 213804       ld hl,$0438
0E0D: 0604         ld b,$04
0E0F: 1a           ld a,(de)
0E10: 13           inc de
0E11: 4f           ld c,a
0E12: 7e           ld a,(hl)
0E13: 23           inc hl
0E14: cd8100       call $0081
0E17: 10f6         djnz $0e0f
0E19: 1b           dec de
0E1A: c9           ret
0E1B: cd5c02       call $025c
0E1E: 200d         jr nz,$0e2d
0E20: cd8a01       call $018a
0E23: ddcb0066     bit 4,(ix+0)
0E27: c0           ret nz
0E28: cdef02       call $02ef
0E2B: 180c         jr $0e39
0E2D: dd7e1e       ld a,(ix+30)
0E30: b7           or a
0E31: 2806         jr z,$0e39
0E33: dd351e       dec (ix+30)
0E36: cac30e       jp z,$0ec3
0E39: cdc003       call $03c0
0E3C: cd1a03       call $031a
0E3F: ddcb0056     bit 2,(ix+0)
0E43: c0           ret nz
0E44: dd4e01       ld c,(ix+1)
0E47: 7d           ld a,l
0E48: e60f         and $0f
0E4A: b1           or c
0E4B: 32117f       ld ($7f11),a
0E4E: 7d           ld a,l
0E4F: e6f0         and $f0
0E51: b4           or h
0E52: 0f           rrca
0E53: 0f           rrca
0E54: 0f           rrca
0E55: 0f           rrca
0E56: 32117f       ld ($7f11),a
0E59: dd7e08       ld a,(ix+8)
0E5C: b7           or a
0E5D: 0e00         ld c,$00
0E5F: 2809         jr z,$0e6a
0E61: 3d           dec a
0E62: 0e0a         ld c,$0a
0E64: cf           rst $08
0E65: df           rst $18
0E66: cd910e       call $0e91
0E69: 4f           ld c,a
0E6A: ddcb0066     bit 4,(ix+0)
0E6E: c0           ret nz
0E6F: dd7e06       ld a,(ix+6)
0E72: 81           add a,c
0E73: cb67         bit 4,a
0E75: 2802         jr z,$0e79
0E77: 3e0f         ld a,$0f
0E79: ddb601       or (ix+1)
0E7C: c610         add a,$10
0E7E: ddcb0046     bit 0,(ix+0)
0E82: 2004         jr nz,$0e88
0E84: 32117f       ld ($7f11),a
0E87: c9           ret
0E88: c620         add a,$20
0E8A: 32117f       ld ($7f11),a
0E8D: c9           ret
0E8E: dd7717       ld (ix+23),a
0E91: e5           push hl
0E92: dd4e17       ld c,(ix+23)
0E95: 0600         ld b,$00
0E97: 09           add hl,bc
0E98: 7e           ld a,(hl)
0E99: e1           pop hl
0E9A: cb7f         bit 7,a
0E9C: 2821         jr z,$0ebf
0E9E: fe83         cp $83
0EA0: 280c         jr z,$0eae
0EA2: fe81         cp $81
0EA4: 2813         jr z,$0eb9
0EA6: fe80         cp $80
0EA8: 280c         jr z,$0eb6
0EAA: 03           inc bc
0EAB: 0a           ld a,(bc)
0EAC: 18e0         jr $0e8e
0EAE: ddcb00e6     set 4,(ix+0)
0EB2: e1           pop hl
0EB3: c3c30e       jp $0ec3
0EB6: af           xor a
0EB7: 18d5         jr $0e8e
0EB9: e1           pop hl
0EBA: ddcb00e6     set 4,(ix+0)
0EBE: c9           ret
0EBF: dd3417       inc (ix+23)
0EC2: c9           ret
0EC3: ddcb00e6     set 4,(ix+0)
0EC7: ddcb0056     bit 2,(ix+0)
0ECB: c0           ret nz
0ECC: 3e1f         ld a,$1f
0ECE: dd8601       add a,(ix+1)
0ED1: b7           or a
0ED2: f0           ret p
0ED3: 32117f       ld ($7f11),a
0ED6: ddcb0046     bit 0,(ix+0)
0EDA: c8           ret z
0EDB: 3eff         ld a,$ff
0EDD: 32117f       ld ($7f11),a
0EE0: c9           ret
0EE1: 3e2b         ld a,$2b
0EE3: 0e00         ld c,$00
0EE5: cd9400       call $0094
0EE8: fb           ei
0EE9: 3a3c1c       ld a,($1c3c)
0EEC: b7           or a
0EED: 28f9         jr z,$0ee8
0EEF: f3           di
0EF0: 3e2b         ld a,$2b
0EF2: 0e80         ld c,$80
0EF4: cd9400       call $0094
0EF7: 21660f       ld hl,$0f66
0EFA: e5           push hl
0EFB: fde1         pop iy
0EFD: 213c1c       ld hl,$1c3c
0F00: 7e           ld a,(hl)
0F01: 3d           dec a
0F02: cbfe         set 7,(hl)
0F04: 210080       ld hl,$8000
0F07: df           rst $18
0F08: 0e80         ld c,$80
0F0A: 7e           ld a,(hl)
0F0B: 321b0f       ld ($0f1b),a
0F0E: 32380f       ld ($0f38),a
0F11: 23           inc hl
0F12: 5e           ld e,(hl)
0F13: 23           inc hl
0F14: 56           ld d,(hl)
0F15: 23           inc hl
0F16: 7e           ld a,(hl)
0F17: 23           inc hl
0F18: 66           ld h,(hl)
0F19: 6f           ld l,a
0F1A: 060a         ld b,$0a
0F1C: fb           ei
0F1D: 10fe         djnz $0f1d
0F1F: f3           di
0F20: 3e2a         ld a,$2a
0F22: 320040       ld ($4000),a
0F25: 7e           ld a,(hl)
0F26: 07           rlca
0F27: 07           rlca
0F28: 07           rlca
0F29: 07           rlca
0F2A: e60f         and $0f
0F2C: 32320f       ld ($0f32),a
0F2F: 79           ld a,c
0F30: fd8600       add a,(iy+0)
0F33: 320140       ld ($4001),a
0F36: 4f           ld c,a
0F37: 060a         ld b,$0a
0F39: fb           ei
0F3A: 10fe         djnz $0f3a
0F3C: f3           di
0F3D: 3e2a         ld a,$2a
0F3F: 320040       ld ($4000),a
0F42: 7e           ld a,(hl)
0F43: e60f         and $0f
0F45: 324b0f       ld ($0f4b),a
0F48: 79           ld a,c
0F49: fd8600       add a,(iy+0)
0F4C: 320140       ld ($4001),a
0F4F: 4f           ld c,a
0F50: 3a3c1c       ld a,($1c3c)
0F53: b7           or a
0F54: f2e80e       jp p,$0ee8
0F57: 23           inc hl
0F58: 1b           dec de
0F59: 7a           ld a,d
0F5A: b3           or e
0F5B: c21a0f       jp nz,$0f1a
0F5E: af           xor a
0F5F: 323c1c       ld ($1c3c),a
0F62: fb           ei
0F63: c3e10e       jp $0ee1
0F66: 00           nop
0F67: 010204       ld bc,$0402
0F6A: 08           ex af,af'
0F6B: 1020         djnz $0f8d
0F6D: 40           ld b,b
0F6E: 80           add a,b
0F6F: ff           rst $38
0F70: fefc         cp $fc
0F72: f8           ret m
0F73: f0           ret p
0F74: e0           ret po
0F75: c0           ret nz
